# LaundroTrack — Backend Changes: Google Sign-In Authentication

This document describes all backend changes needed to replace username/password authentication with Google Sign-In.

---

## Summary

Replace the current username/password login flow with Google Sign-In:

1. Users are pre-registered by the admin with their **Google email** (instead of username/password).
2. On the app, users sign in with Google and receive a **Google ID token**.
3. The app sends the ID token to a new backend endpoint.
4. The backend **verifies** the token with Google, extracts the email, looks up the user in the DB, and returns an app JWT (same format as today).

---

## Change 1: Users Table Schema

### Current Schema

```
users
├── id           UUID (PK)
├── username     VARCHAR UNIQUE NOT NULL
├── hashed_password  VARCHAR NOT NULL
├── role         VARCHAR NOT NULL (SUPER_ADMIN | HOTEL_ADMIN | SERVICE_AGENT)
├── phone        VARCHAR NULL
├── hotel_id     UUID NULL (FK → hotels)
├── is_active    BOOLEAN DEFAULT TRUE
├── created_at   TIMESTAMP
└── updated_at   TIMESTAMP
```

### New Schema

```
users
├── id           UUID (PK)
├── google_email VARCHAR UNIQUE NOT NULL   ← replaces username
├── role         VARCHAR NOT NULL (SUPER_ADMIN | HOTEL_ADMIN | SERVICE_AGENT)
├── phone        VARCHAR NULL
├── hotel_id     UUID NULL (FK → hotels)
├── is_active    BOOLEAN DEFAULT TRUE
├── created_at   TIMESTAMP
└── updated_at   TIMESTAMP
```

**Dropped columns:** `username`, `hashed_password`
**New column:** `google_email` (unique, indexed, stores the user's Google account email)

### Alembic Migration

```python
def upgrade():
    op.add_column('users', sa.Column('google_email', sa.String(), nullable=True))
    
    # Migrate existing usernames to google_email if they look like emails,
    # otherwise you'll need to manually update these
    op.execute("UPDATE users SET google_email = username WHERE username LIKE '%@%'")
    
    # Make google_email non-nullable after backfill
    op.alter_column('users', 'google_email', nullable=False)
    op.create_unique_constraint('uq_users_google_email', 'users', ['google_email'])
    op.create_index('ix_users_google_email', 'users', ['google_email'])
    
    # Drop old columns
    op.drop_constraint('uq_users_username', 'users', type_='unique')
    op.drop_index('ix_users_username', table_name='users')
    op.drop_column('users', 'username')
    op.drop_column('users', 'hashed_password')


def downgrade():
    op.add_column('users', sa.Column('username', sa.String(), nullable=True))
    op.add_column('users', sa.Column('hashed_password', sa.String(), nullable=True))
    op.execute("UPDATE users SET username = google_email")
    op.alter_column('users', 'username', nullable=False)
    op.create_unique_constraint('uq_users_username', 'users', ['username'])
    op.drop_index('ix_users_google_email', table_name='users')
    op.drop_constraint('uq_users_google_email', 'users', type_='unique')
    op.drop_column('users', 'google_email')
```

---

## Change 2: SQLAlchemy Model

### File: `app/models/user.py`

```python
class User(Base):
    __tablename__ = "users"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    google_email = Column(String, unique=True, nullable=False, index=True)
    role = Column(String, nullable=False)
    phone = Column(String, nullable=True)
    hotel_id = Column(UUID(as_uuid=True), ForeignKey("hotels.id"), nullable=True)
    is_active = Column(Boolean, default=True, nullable=False)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
```

**Removed:** `username`, `hashed_password` columns.

---

## Change 3: Pydantic Schemas

### File: `app/schemas/auth.py` (new or updated)

```python
class GoogleLoginRequest(BaseModel):
    id_token: str  # Google ID token from the frontend

class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
```

### File: `app/schemas/user.py` (updated)

```python
class UserCreate(BaseModel):
    google_email: EmailStr
    role: UserRole
    phone: str | None = None
    hotel_id: uuid.UUID | None = None

class UserResponse(BaseModel):
    id: uuid.UUID
    google_email: str
    role: UserRole
    phone: str | None
    hotel_id: uuid.UUID | None
    is_active: bool
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
```

**Removed:** `username`, `password` fields.

---

## Change 4: New Auth Endpoint

### File: `app/api/v1/auth.py`

**New endpoint:** `POST /api/v1/auth/google`

```python
from google.oauth2 import id_token as google_id_token
from google.auth.transport import requests as google_requests

GOOGLE_CLIENT_ID = settings.GOOGLE_CLIENT_ID  # Add to app config

@router.post("/google", response_model=TokenResponse)
async def google_login(
    request: GoogleLoginRequest,
    db: AsyncSession = Depends(get_db),
):
    # 1. Verify the Google ID token
    try:
        idinfo = google_id_token.verify_oauth2_token(
            request.id_token,
            google_requests.Request(),
            GOOGLE_CLIENT_ID,
        )
    except ValueError:
        raise HTTPException(status_code=401, detail="Invalid Google token")

    # 2. Extract email from verified token
    email = idinfo.get("email")
    if not email or not idinfo.get("email_verified"):
        raise HTTPException(status_code=401, detail="Email not verified by Google")

    # 3. Look up user by google_email
    result = await db.execute(
        select(User).where(User.google_email == email.lower())
    )
    user = result.scalar_one_or_none()

    if user is None:
        raise HTTPException(status_code=404, detail="User not found")

    if not user.is_active:
        raise HTTPException(status_code=401, detail="Account is inactive")

    # 4. Create app JWT (same logic as current login)
    token_data = {
        "sub": str(user.id),
        "role": user.role,
        "hotel_id": str(user.hotel_id) if user.hotel_id else None,
        "exp": datetime.utcnow() + timedelta(hours=24),
    }
    access_token = create_access_token(token_data)

    return TokenResponse(access_token=access_token)
```

### Remove old endpoint

Delete or deprecate `POST /api/v1/auth/login` (username/password).

---

## Change 5: New Dependency

### File: `requirements.txt` / `pyproject.toml`

Add:
```
google-auth>=2.28.0
```

This provides `google.oauth2.id_token.verify_oauth2_token()` which:
- Fetches Google's public keys (cached)
- Verifies the JWT signature
- Checks `aud` (audience) matches your client ID
- Checks `iss` (issuer) is `accounts.google.com`
- Returns the decoded token payload

---

## Change 6: App Configuration

### File: `app/core/config.py` (or equivalent)

Add a new config value:

```python
class Settings(BaseSettings):
    # ... existing settings ...
    GOOGLE_CLIENT_ID: str  # e.g., "123456789.apps.googleusercontent.com"
```

### Environment Variable

Add to `.env`:
```
GOOGLE_CLIENT_ID=<your-google-oauth-client-id>
```

This is the **Web** client ID from Google Cloud Console (used for token verification). You may also need separate client IDs for iOS and Android if using platform-specific Google Sign-In configurations — in that case, pass all valid client IDs during verification:

```python
# If you have multiple client IDs (web, iOS, Android)
VALID_CLIENT_IDS = [
    settings.GOOGLE_CLIENT_ID_WEB,
    settings.GOOGLE_CLIENT_ID_IOS,
    settings.GOOGLE_CLIENT_ID_ANDROID,
]

# Then verify with audience check:
idinfo = google_id_token.verify_oauth2_token(
    request.id_token,
    google_requests.Request(),
    audience=None,  # Skip audience check in verify call
)
if idinfo.get("aud") not in VALID_CLIENT_IDS:
    raise HTTPException(status_code=401, detail="Invalid token audience")
```

---

## Change 7: Update User Creation (Admin Endpoint)

### File: `app/api/v1/admin.py`

Update `POST /api/v1/admin/users`:

```python
@router.post("/users", response_model=UserResponse)
async def create_user(
    user_data: UserCreate,  # Now has google_email instead of username/password
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(require_super_admin),
):
    # Check for duplicate google_email
    existing = await db.execute(
        select(User).where(User.google_email == user_data.google_email.lower())
    )
    if existing.scalar_one_or_none():
        raise HTTPException(status_code=409, detail="User with this email already exists")

    user = User(
        google_email=user_data.google_email.lower(),
        role=user_data.role.value,
        phone=user_data.phone,
        hotel_id=user_data.hotel_id,
    )
    db.add(user)
    await db.commit()
    await db.refresh(user)
    return user
```

**Removed:** Password hashing logic (`bcrypt`). No longer needed.

---

## Change 8: Remove Password Dependencies

### Remove from `requirements.txt`:
```
bcrypt
passlib
```

These are no longer needed since we don't hash/verify passwords.

### Remove from codebase:
- Any `verify_password()`, `get_password_hash()` utility functions
- The `passlib` context/scheme configuration

---

## Change 9: Update Tests

### Auth tests

```python
# Old test
def test_login_success():
    response = client.post("/api/v1/auth/login", json={
        "username": "admin", "password": "secret"
    })
    assert response.status_code == 200

# New test (mock Google token verification)
@patch("app.api.v1.auth.google_id_token.verify_oauth2_token")
def test_google_login_success(mock_verify):
    mock_verify.return_value = {
        "email": "admin@gmail.com",
        "email_verified": True,
        "aud": GOOGLE_CLIENT_ID,
    }
    response = client.post("/api/v1/auth/google", json={
        "id_token": "fake-google-token"
    })
    assert response.status_code == 200
    assert "access_token" in response.json()

@patch("app.api.v1.auth.google_id_token.verify_oauth2_token")
def test_google_login_user_not_found(mock_verify):
    mock_verify.return_value = {
        "email": "unknown@gmail.com",
        "email_verified": True,
        "aud": GOOGLE_CLIENT_ID,
    }
    response = client.post("/api/v1/auth/google", json={
        "id_token": "fake-google-token"
    })
    assert response.status_code == 404
    assert response.json()["detail"] == "User not found"

@patch("app.api.v1.auth.google_id_token.verify_oauth2_token")
def test_google_login_inactive_user(mock_verify):
    mock_verify.return_value = {
        "email": "inactive@gmail.com",
        "email_verified": True,
        "aud": GOOGLE_CLIENT_ID,
    }
    response = client.post("/api/v1/auth/google", json={
        "id_token": "fake-google-token"
    })
    assert response.status_code == 401
    assert response.json()["detail"] == "Account is inactive"

@patch("app.api.v1.auth.google_id_token.verify_oauth2_token")
def test_google_login_invalid_token(mock_verify):
    mock_verify.side_effect = ValueError("Invalid token")
    response = client.post("/api/v1/auth/google", json={
        "id_token": "bad-token"
    })
    assert response.status_code == 401
```

### User creation tests

```python
# Old test
def test_create_user():
    response = client.post("/api/v1/admin/users", json={
        "username": "newuser", "password": "secret123", "role": "SERVICE_AGENT"
    })

# New test
def test_create_user():
    response = client.post("/api/v1/admin/users", json={
        "google_email": "newagent@gmail.com", "role": "SERVICE_AGENT"
    })
    assert response.status_code == 200
    assert response.json()["google_email"] == "newagent@gmail.com"
```

---

## Migration Checklist

- [ ] Create Alembic migration to alter `users` table (add `google_email`, drop `username`/`hashed_password`)
- [ ] Backfill `google_email` for existing users (manual step — admin must provide Google emails)
- [ ] Update `User` SQLAlchemy model
- [ ] Update `UserCreate` and `UserResponse` Pydantic schemas
- [ ] Create `GoogleLoginRequest` schema
- [ ] Add `google-auth` to dependencies
- [ ] Add `GOOGLE_CLIENT_ID` to config/env
- [ ] Create `POST /api/v1/auth/google` endpoint
- [ ] Remove/deprecate `POST /api/v1/auth/login` endpoint
- [ ] Remove `bcrypt`/`passlib` dependencies and utility functions
- [ ] Update all auth-related tests to mock Google token verification
- [ ] Update user creation tests to use `google_email`
- [ ] Update all test fixtures that create users (replace `username`/`password` with `google_email`)
- [ ] Set up Google Cloud OAuth 2.0 Client ID (Web, iOS, Android)
- [ ] Update `.env.example` with `GOOGLE_CLIENT_ID`

---

## Google Cloud Setup (For Reference)

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create or select a project
3. Navigate to **APIs & Services** → **Credentials**
4. Create **OAuth 2.0 Client IDs** for:
   - **Web application** (for Flutter web)
   - **iOS** (for Flutter iOS — needs the iOS bundle ID)
   - **Android** (for Flutter Android — needs the package name and SHA-1 fingerprint)
5. The **Web client ID** is used for backend token verification
6. All three client IDs are configured in the Flutter app

---

## Security Notes

- The Google ID token is a signed JWT from Google. The backend verifies the signature using Google's public keys, so it **cannot be forged**.
- Email is extracted from the verified token, not from user input. This prevents email spoofing.
- The `email_verified` claim must be `true` — we reject unverified emails.
- All emails are stored and compared in **lowercase** to prevent case-sensitivity issues.
- The app JWT issued by our backend remains unchanged in structure — only the authentication method changes.
