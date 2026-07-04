# LaundroTrack ERP — Flutter App

A single Flutter codebase powering three role-based experiences for the LaundroTrack commercial laundry management system:

- **Service Agent** (mobile, offline-capable) — pickup & delivery challan entry in the field
- **Hotel Admin** (tablet/mobile) — live inventory, challan history, damage & billing dashboards
- **Super Admin** (web/desktop) — full management console with CRUD, analytics, and billing reports

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.19+ / Dart 3.3+ |
| Platforms | Android, iOS, Web |
| State Management | Riverpod (flutter_riverpod, manual providers) |
| Routing | GoRouter |
| HTTP Client | Dio |
| Local DB (offline) | Drift (SQLite) |
| Secure Storage | flutter_secure_storage |
| Connectivity | internet_connection_checker_plus |
| Models / Codegen | Freezed + json_serializable |
| Environment Config | Envied |
| Responsive UI | flutter_screenutil |
| Charts | fl_chart |
| Authentication | google_sign_in (Google OAuth) |
| Camera / Images | image_picker |
| Testing | flutter_test, mockito, integration_test |
| CI/CD | GitHub Actions + Fastlane |

---

## Backend API Summary

The backend exposes 22+ business endpoints under `/api/v1/`. Key concepts:

- **Authentication:** Google Sign-In. Users are pre-registered by the admin with their Google email. The app sends a Google ID token to `POST /api/v1/auth/google`, the backend verifies it with Google, looks up the user by email, and returns an app JWT.
- **Roles:** `SUPER_ADMIN`, `HOTEL_ADMIN`, `SERVICE_AGENT`
- **Tenant scoping:** Hotel admins see only their own hotel's data. Agents see only hotels they are mapped to. Super admins see everything.
- **Challan types:** `PICKUP` (linen goes hotel → laundry) and `DELIVERY` (linen returns laundry → hotel) are separate endpoints and separate forms.
- **Challan numbers:** User-supplied strings that link a pickup to its delivery. A delivery must reference an existing pickup challan number.
- **Ledger math:** Pickup adds `qty_in_laundry`. Delivery subtracts it. Over-delivery (delivering more than what's in laundry) is blocked with a 400 error — the entire request is rejected atomically.
- **Damage attribution:** `damage_delta = max(0, delivery_damaged - cumulative_pickup_damaged)`. Only the excess is blamed on the laundry. Cumulative across all pickups for that `(hotel, dept, item)`.
- **Multi-department challans:** A single challan can cover multiple departments (e.g., one pickup slip for Housekeeping + Restaurant). Items are grouped by department within the challan.
- **Billing modes:** WEIGHT departments support three weighing methods — `SOILED` (actual scale weight at pickup), `CALCULATED` (sum of `item_qty × calculated_weight_per_item`), and `FRESH` (actual scale weight at delivery). The billing API always returns all three values; `weight_source` on the department (or `weight_mode` query param) determines which one becomes the `subtotal`.
- **Challan editing:** Any challan can be edited. Agents/hotel admins have a 24-hour window; super admins can edit anytime. Edits fully reverse old ledger impact, then reapply new values.
- **Image upload:** Two-step flow — get a presigned S3 URL, upload the image, then confirm the upload to attach it to the challan.

---

## Directory Structure

```text
lib/
├── core/
│   ├── network/
│   │   ├── dio_client.dart             # Singleton Dio, base URL from env
│   │   ├── auth_interceptor.dart       # Injects Authorization: Bearer <token>
│   │   ├── error_interceptor.dart      # Maps HTTP codes to typed AppExceptions
│   │   ├── logging_interceptor.dart    # Debug-only request/response logging
│   │   └── api_result.dart             # Sealed class: Success<T> / Failure
│   ├── routing/
│   │   ├── app_router.dart             # GoRouter config with role-based redirect
│   │   └── route_guards.dart           # Auth + role guards, refreshListenable
│   ├── theme/
│   │   ├── app_theme.dart              # Light + dark ThemeData
│   │   ├── app_colors.dart
│   │   ├── app_typography.dart
│   │   └── app_spacing.dart
│   ├── storage/
│   │   ├── secure_storage.dart         # flutter_secure_storage wrapper for JWT
│   │   ├── app_database.dart           # Drift DB: PendingChallans + CachedFormSchemas tables
│   │   └── storage_service.dart        # Abstraction over secure storage + Drift DB
│   ├── constants/
│   │   ├── api_endpoints.dart          # All 21 endpoint paths
│   │   └── enums.dart                  # UserRole, BillingType, WeightSource, ChallanType
│   └── utils/
│       ├── responsive_builder.dart     # isMobile / isTablet / isDesktop breakpoints
│       ├── adaptive_scaffold.dart      # BottomNav / NavigationRail / Sidebar
│       ├── formatters.dart             # Currency, date, weight, decimal formatters
│       └── jwt_decoder.dart            # Extract sub, role, hotel_id, exp from JWT
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   └── auth_repository.dart          # POST /auth/google (Google Sign-In)
│   │   ├── domain/
│   │   │   └── auth_state.dart               # Authenticated / Unauthenticated / Loading
│   │   └── presentation/
│   │       ├── login_screen.dart
│   │       └── auth_providers.dart           # authStateProvider, currentUserProvider
│   ├── challan/
│   │   ├── data/
│   │   │   ├── challan_repository.dart       # pickup, delivery, edit, history, pending-deliveries
│   │   │   ├── image_upload_repository.dart  # upload-url + confirm-upload
│   │   │   └── pending_challan_dao.dart      # Drift CRUD for offline queue
│   │   ├── domain/
│   │   │   ├── challan_models.dart           # Challan, ChallanItem, PaginatedChallans
│   │   │   └── sync_service.dart             # Offline sync engine
│   │   └── presentation/
│   │       ├── agent_home_screen.dart        # Assigned hotels + pending deliveries count
│   │       ├── hotel_select_screen.dart      # Select hotel from assigned list
│   │       ├── department_select_screen.dart # Select dept, shows PIECE/WEIGHT badge (info only)
│   │       ├── pickup_form_screen.dart       # Pickup challan: CN, multi-dept sections, items with search
│   │       ├── delivery_form_screen.dart     # Delivery challan: select pending pickup CN, deliver-all, items with search
│   │       ├── challan_detail_screen.dart    # View challan receipt
│   │       ├── challan_edit_screen.dart      # Edit challan (within 24h or super admin)
│   │       ├── challan_history_screen.dart   # Paginated list with filters
│   │       ├── pending_deliveries_screen.dart # Pickups awaiting delivery
│   │       ├── pending_sync_screen.dart      # Offline queue with status badges
│   │       └── image_capture_sheet.dart      # Camera/gallery picker + S3 upload
│   ├── tracking/
│   │   ├── data/
│   │   │   └── tracking_repository.dart      # GET /live-tracking/hotel/{id}
│   │   ├── domain/
│   │   │   └── inventory_models.dart
│   │   └── presentation/
│   │       └── live_inventory_screen.dart     # Grouped by dept, damage indicators
│   ├── dashboard/
│   │   ├── data/
│   │   │   └── dashboard_repository.dart     # GET /dashboards/super-admin
│   │   ├── domain/
│   │   │   └── dashboard_models.dart
│   │   └── presentation/
│   │       ├── super_admin_dashboard.dart    # Global stats + recent challans
│   │       └── hotel_admin_dashboard.dart    # Hotel-scoped overview
│   ├── quality/
│   │   ├── data/
│   │   │   └── quality_repository.dart       # GET /quality-control/damages
│   │   ├── domain/
│   │   │   └── damage_models.dart
│   │   └── presentation/
│   │       └── damage_report_screen.dart     # Per-item damage + all-time totals
│   ├── billing/
│   │   ├── data/
│   │   │   └── billing_repository.dart       # GET /reports/billing
│   │   ├── domain/
│   │   │   └── billing_models.dart           # BillingResponse, HotelBilling, DeptBilling, PieceLineItem
│   │   └── presentation/
│   │       └── billing_report_screen.dart    # Weight mode toggle, dept expansion, grand total
│   ├── master_data/
│   │   ├── data/
│   │   │   ├── admin_repository.dart         # Users, hotels, mappings CRUD
│   │   │   └── setup_repository.dart         # Departments, items, dept-item links, form-schema
│   │   ├── domain/
│   │   │   └── master_models.dart            # Hotel, User, Department, Item, DeptItemConfig, FormSchema
│   │   └── presentation/
│   │       ├── hotels_crud_screen.dart
│   │       ├── hotel_detail_screen.dart      # Departments + agents for a hotel
│   │       ├── departments_crud_screen.dart  # Billing type, price/kg, weight source
│   │       ├── items_crud_screen.dart        # Items master + dept-item linking
│   │       ├── agent_mapping_screen.dart
│   │       └── users_crud_screen.dart
│   └── config_cache/
│       ├── data/
│       │   └── config_cache_dao.dart         # Drift: CachedFormSchemas table access
│       └── domain/
│           └── config_sync_service.dart      # Fetch form-schema per hotel, store in Drift
├── shared/
│   ├── widgets/
│   │   ├── stat_card.dart
│   │   ├── damage_indicator.dart             # Green/yellow/red based on damage count
│   │   ├── billing_type_badge.dart           # PIECE / WEIGHT chip
│   │   ├── challan_type_badge.dart           # PICKUP / DELIVERY chip
│   │   ├── weight_source_badge.dart          # SOILED / CALCULATED / FRESH chip
│   │   ├── item_search_bar.dart             # Searchable item filter for challan forms
│   │   ├── loading_overlay.dart
│   │   ├── empty_state.dart
│   │   ├── error_retry_widget.dart
│   │   ├── paginated_list.dart               # Handles page/page_size/total
│   │   ├── date_range_picker.dart
│   │   └── network_status_banner.dart        # Offline/online indicator
│   └── models/                               # Freezed models (shared across features)
│       ├── user.dart                         # id, google_email, role, phone, hotel_id, is_active
│       ├── hotel.dart                        # id, name, address, contact_number
│       ├── department.dart                   # id, hotel_id, name, billing_type, price_per_kg, weight_source
│       ├── item.dart                         # id, name
│       ├── dept_item_config.dart             # id, dept_id, item_id, price_per_piece, calculated_weight
│       ├── agent_hotel_mapping.dart          # id, agent_id, hotel_id
│       ├── challan.dart                      # id, challan_type, challan_number, hotel_id, agent_id, image_key, entry_timestamp, last_edited_at, edited_by, departments[]
│       ├── challan_department.dart           # id, dept_id, soiled_weight?, fresh_weight?, items[]
│       ├── challan_item.dart                 # id, item_id, qty, damaged_qty
│       ├── paginated_response.dart           # total, page, page_size, items[]
│       ├── form_schema.dart                  # hotel_id, departments[]{dept_id, name, billing_type, price_per_kg, weight_source, items[]{item_id, name, price_per_piece, calculated_weight}}
│       ├── billing_report.dart               # period, hotels[]{hotel_name, departments[], damage_liability, grand_total}
│       ├── department_billing.dart           # dept_name, billing_type, total_weight_kg, rate_per_kg, soiled_weight_kg, soiled_subtotal, calculated_weight_kg, calculated_subtotal, fresh_weight_kg, fresh_subtotal, items[], subtotal
│       ├── piece_line_item.dart              # item_name, quantity, rate, subtotal
│       ├── damage_report.dart                # challan_damage_summary[], all_time_totals[]
│       ├── detailed_billing.dart              # period, hotels[]{hotel_name, challans[]{cn, date, departments[], challan_total}, grand_total}
│       └── dashboard_summary.dart            # total_items_in_laundry, total_weight_in_laundry_kg, total_hotels, recent_challans[]
└── main.dart                                 # Entry point, ScreenUtil init, ProviderScope
```

---

## Implementation Roadmap

### Phase 0 — Environment & Project Scaffolding

**Sub-tasks:**

1. Run `flutter create laundry_app --platforms=android,ios,web` inside the workspace.
2. Set minimum SDK constraints (`sdk: '>=3.3.0 <4.0.0'`, Flutter `3.19+`).
3. Add all core dependencies to `pubspec.yaml`:
   - `flutter_riverpod`, `riverpod_annotation`, `go_router`
   - `dio`, `flutter_secure_storage`, `internet_connection_checker_plus`
   - `drift`, `drift_flutter`
   - `json_annotation`, `freezed_annotation`, `flutter_screenutil`
   - `envied`, `fl_chart`, `image_picker`
4. Add dev dependencies: `build_runner`, `freezed`, `json_serializable`, `drift_dev`, `envied_generator`, `flutter_lints`.
5. Create `.env.dev` and `.env.prod` with `BASE_API_URL` placeholder.
6. Create the feature-first directory scaffold under `lib/` (see Directory Structure above).

**Acceptance:** `flutter run -d chrome` and `flutter run -d <emulator>` both launch a blank app with no errors.

---

### Phase 1 — Core Infrastructure Layer

#### 1A: Theme System

- Create `AppTheme` class with light and dark `ThemeData`.
- Define `AppColors`, `AppTypography`, `AppSpacing` constants.
- Set up `flutter_screenutil` initialization in `main.dart`.

#### 1B: Dio Network Client

- Create a singleton `DioClient` class in `core/network/`.
- Add an `AuthInterceptor` that reads the JWT from secure storage and injects `Authorization: Bearer <token>` header on every request.
- Add an `ErrorInterceptor` that maps HTTP status codes to typed `AppException` classes:
  - `401` → `UnauthorizedException` (invalid/expired token → clear session, redirect to login).
  - `403` → `ForbiddenException` (wrong role or tenant isolation violation).
  - `400` → `ValidationException` (with `detail` message — e.g., over-delivery error).
  - `404` → `NotFoundException`.
  - `409` → `ConflictException` (duplicate google_email, duplicate mapping, etc.).
  - `500` → `ServerException`.
  - `SocketException` / `TimeoutException` → `NetworkException`.
- Add a `LoggingInterceptor` for debug builds.
- Create a base `ApiResult<T>` sealed class (Success / Failure) for uniform error handling.

#### 1C: Local Storage Setup

- Initialize `flutter_secure_storage` wrapper for JWT tokens.
- Initialize Drift (SQLite) database with `PendingChallans` and `CachedFormSchemas` tables.
- Create a `StorageService` abstraction combining secure storage + Drift DB.

#### 1D: Responsive Layout Helpers

- Create `ResponsiveBuilder` widget that exposes `isMobile`, `isTablet`, `isDesktop` breakpoints.
- Create `AdaptiveScaffold` widget that switches between `BottomNavigationBar` (mobile), `NavigationRail` (tablet), and `Sidebar` (desktop/web).

#### 1E: Enums & Constants

- Define `UserRole` enum: `SUPER_ADMIN`, `HOTEL_ADMIN`, `SERVICE_AGENT`.
- Define `BillingType` enum: `WEIGHT`, `PIECE`.
- Define `WeightSource` enum: `SOILED`, `CALCULATED`, `FRESH`.
- Define `ChallanType` enum: `PICKUP`, `DELIVERY`.
- Define all 21 API endpoint paths as constants.

**Acceptance:** Dio client can make a test request to `/health`; theme toggles work; responsive scaffold adapts on resize; all enums serialize/deserialize correctly.

---

### Phase 2 — Authentication & Role-Based Routing

> **Authentication uses Google Sign-In.** Users are pre-registered by the admin with their Google email. On the app, users sign in with Google, the app obtains a Google ID token, sends it to the backend for verification, and receives an app JWT with the user's role.

#### 2A: Auth Data Layer

- Add `google_sign_in` package to `pubspec.yaml`.
- Create `GoogleAuthService` that wraps the `google_sign_in` package:
  - `signIn()` → triggers Google OAuth flow → returns `GoogleSignInAccount` with `idToken`.
  - `signOut()` → clears Google session.
  - `silentSignIn()` → attempts silent re-auth on app restart.
- Create `AuthRepository` with `loginWithGoogle(googleIdToken)` calling `POST /api/v1/auth/google`.
  - Request body: `{"id_token": "<google-id-token>"}`.
  - Response: `{"access_token": "...", "token_type": "bearer"}`.
  - The backend verifies the Google ID token, extracts the email, looks up the user by `google_email`, and returns an app JWT.
- Store `access_token` in `flutter_secure_storage`.
- `JwtDecoder` utility (already created in Phase 1) decodes the JWT payload to extract:
  - `sub` (user UUID)
  - `role` (string → `UserRole` enum)
  - `hotel_id` (UUID string or null — present for `HOTEL_ADMIN`)
  - `exp` (Unix timestamp for expiry check)

#### 2B: Auth State (Riverpod)

- Create `authStateProvider` (AsyncNotifier) holding `AuthState`:
  - `Authenticated(userId, role, hotelId, token, displayName, email)`
  - `Unauthenticated`
  - `Loading`
- On app start: check secure storage for existing token → if found and not expired, decode and set `Authenticated`. Also attempt `silentSignIn()` to keep Google session warm.
- `signInWithGoogle()` action: call GoogleAuthService.signIn() → get ID token → call repository → store app JWT → decode → set `Authenticated`.
- `logout()` action: call GoogleAuthService.signOut() + clear secure storage + Drift cache → set `Unauthenticated`.
- Expose `currentUserProvider` that derives `userId`, `role`, `hotelId`, `email` from `authStateProvider`.
- Handle backend errors:
  - `401 "Account is inactive"` → "Your account has been deactivated. Contact your administrator."
  - `404 "User not found"` → "No account found for this Google email. Contact your administrator to get access."

#### 2C: Login Screen UI

- Clean, centered layout with LaundroTrack logo.
- **"Sign in with Google" button** — uses the standard Google branding (Google logo + text).
  - Mobile: full-width button.
  - Web: centered card with the Google Identity Services (GIS) SDK-rendered button (required by `google_sign_in` v7 web flow).
- Loading state: button disabled with spinner while authenticating.
- Error display below the button:
  - "No account found for this email" — for unregistered Google accounts.
  - "Your account has been deactivated" — for inactive accounts.
  - "Unable to connect" — for network errors.
  - "Google sign-in was cancelled" — if user cancels the OAuth flow.
- On success: navigate to role-appropriate home.
- No username/password fields — the entire login is a single Google Sign-In tap.

#### 2D: GoRouter Configuration

Route tree:

```
/login

/agent/home                              # Hotel selection + pending overview
/agent/hotel/:hotelId/departments        # Department list for selected hotel
/agent/challan/pickup/:hotelId            # Pickup form (multi-department)
/agent/challan/delivery/:hotelId          # Delivery form (multi-department, deliver-all)
/agent/challan/:challanId                # Challan detail / receipt
/agent/challan/:challanId/edit           # Edit challan
/agent/history                           # Agent's challan history
/agent/pending-sync                      # Offline queue

/hotel/dashboard                         # Hotel admin home — stats + recent activity
/hotel/inventory                         # Live tracking
/hotel/challans                          # Challan history for hotel
/hotel/challan/:challanId                # Challan detail
/hotel/challan/:challanId/edit           # Edit challan (within 24h)
/hotel/quality                           # Damage reports
/hotel/billing                           # Billing report

/admin/dashboard                         # Super admin home — global stats
/admin/hotels                            # Hotels CRUD
/admin/hotels/:hotelId                   # Hotel detail (depts + agents)
/admin/hotels/:hotelId/departments       # Departments for hotel
/admin/departments/:deptId/items         # Items linked to department
/admin/items                             # Items master
/admin/users                             # Users CRUD
/admin/agents                            # Agent-hotel mappings
/admin/quality                           # Global damage report
/admin/reports                           # Billing reports (all hotels)
/admin/challan/:challanId                # Challan detail
/admin/challan/:challanId/edit           # Edit challan (no time limit)
```

- Implement `redirect` guard: unauthenticated → `/login`; authenticated → role home.
- Implement `refreshListenable` tied to `authStateProvider` so route guards re-evaluate on login/logout.
- Super admin routes reject non-SUPER_ADMIN. Hotel admin routes reject agents. Agent routes reject hotel admins.

**Acceptance:** Google Sign-In works end-to-end; each role lands on its correct shell; unauthorized routes redirect to login; unregistered Google email shows "no account found"; inactive account shows correct error; silent re-auth works on app restart.

---

### Phase 3 — Shared Models & Code Generation

> Start alongside Phase 1. Must complete before Phases 4–6 consume the models.

Define all API response/request models using `freezed` + `json_serializable`. Every model must match the backend Pydantic schemas exactly.

#### 3A: Auth Models

```dart
@freezed class GoogleLoginRequest  // id_token (Google ID token string)
@freezed class TokenResponse       // access_token, token_type
```

#### 3B: Admin Models

```dart
@freezed class UserCreateRequest  // google_email, role(UserRole), phone?, hotel_id?
@freezed class UserResponse       // id, google_email, role, phone?, hotel_id?, is_active, created_at
@freezed class HotelCreateRequest // name, address?, contact_number?
@freezed class HotelResponse      // id, name, address?, contact_number?, created_at
@freezed class MappingCreateRequest // agent_id, hotel_id
@freezed class MappingResponse    // id, agent_id, hotel_id, created_at
```

#### 3C: Setup Models

```dart
@freezed class DepartmentCreateRequest  // name, billing_type(BillingType), price_per_kg?, weight_source?(WeightSource)
@freezed class DepartmentResponse       // id, hotel_id, name, billing_type, price_per_kg?, weight_source?, created_at
@freezed class ItemCreateRequest        // name
@freezed class ItemResponse             // id, name, created_at
@freezed class DeptItemLinkRequest      // item_id, price_per_piece?, calculated_weight?
@freezed class DeptItemLinkResponse     // id, dept_id, item_id, price_per_piece?, calculated_weight?, created_at
@freezed class FormSchemaResponse       // hotel_id, departments: List<FormSchemaDepartment>
@freezed class FormSchemaDepartment     // dept_id, name, billing_type, price_per_kg?, weight_source?, items: List<FormSchemaItem>
@freezed class FormSchemaItem           // item_id, name, price_per_piece?, calculated_weight?
```

#### 3D: Challan Models (Multi-Department Structure)

```dart
@freezed class ChallanItemPayload        // item_id, qty, damaged_qty(default 0)
@freezed class ChallanDeptPayload        // dept_id, soiled_weight?(pickup), fresh_weight?(delivery), items: List<ChallanItemPayload>
@freezed class PickupSubmitRequest       // challan_number, hotel_id, departments: List<ChallanDeptPayload>
@freezed class DeliverySubmitRequest     // challan_number, hotel_id, departments: List<ChallanDeptPayload>
@freezed class ChallanEditRequest        // departments?: List<ChallanDeptPayload>
@freezed class ChallanItemResponse       // id, item_id, qty, damaged_qty
@freezed class ChallanDeptResponse       // id, dept_id, soiled_weight?, fresh_weight?, items: List<ChallanItemResponse>
@freezed class ChallanResponse           // id, challan_type, challan_number, hotel_id, agent_id, image_key?, entry_timestamp, last_edited_at?, edited_by?, departments: List<ChallanDeptResponse>
@freezed class PaginatedChallanResponse  // total, page, page_size, items: List<ChallanResponse>
@freezed class PresignedUploadResponse   // upload_url, s3_key
@freezed class ConfirmUploadRequest      // s3_key
```

#### 3E: Report Models (Summary + Detailed Billing)

```dart
@freezed class BillingPeriod      // start(date), end(date)
@freezed class PieceLineItem      // item_name, quantity, rate, subtotal
@freezed class DepartmentBilling  // dept_name, billing_type, total_weight_kg?, rate_per_kg?, soiled_weight_kg?, soiled_subtotal?, calculated_weight_kg?, calculated_subtotal?, fresh_weight_kg?, fresh_subtotal?, items?: List<PieceLineItem>, subtotal
@freezed class HotelBilling       // hotel_name, departments: List<DepartmentBilling>, damage_liability, grand_total
@freezed class BillingResponse    // period: BillingPeriod, hotels: List<HotelBilling>

// Detailed (challan-wise) billing
@freezed class DetailedChallanDeptBilling  // dept_name, billing_type, soiled_weight_kg?, fresh_weight_kg?, calculated_weight_kg?, rate_per_kg?, items?: List<PieceLineItem>, subtotal
@freezed class DetailedChallanBilling      // challan_number, challan_type, entry_timestamp, agent_name?, departments: List<DetailedChallanDeptBilling>, challan_total
@freezed class DetailedHotelBilling        // hotel_name, challans: List<DetailedChallanBilling>, damage_liability, grand_total
@freezed class DetailedBillingResponse     // period: BillingPeriod, hotels: List<DetailedHotelBilling>
```

#### 3F: Dashboard & Quality Models

```dart
@freezed class DashboardSummary   // total_items_in_laundry, total_weight_in_laundry_kg, total_hotels, recent_challans: List<RecentChallan>
@freezed class RecentChallan      // challan_id, hotel_name, agent_name, entry_timestamp
@freezed class DamageReport       // challan_damage_summary: List<DamageSummaryItem>, all_time_totals: List<AllTimeDamageItem>
@freezed class DamageSummaryItem  // hotel_id, hotel_name, item_id, item_name, net_damage
@freezed class AllTimeDamageItem  // hotel_id, hotel_name, item_id, item_name, total_damaged_by_laundry
```

#### 3G: Drift Tables (for offline)

> Already created in Phase 1C (`app_database.dart`). Tables are:

```dart
class PendingChallans extends Table    // id, challan_type, payload_json, created_at, retry_count, status(pending/failed), error_message?
class CachedFormSchemas extends Table  // hotel_id (PK), json_blob (serialized FormSchemaResponse), updated_at
```

**Run:** `dart run build_runner build --delete-conflicting-outputs`

**Acceptance:** All models serialize/deserialize correctly. Unit tests pass for JSON parsing of every model, including the deeply nested `BillingResponse`.

---

### Phase 4 — Service Agent Flow (Mobile, Offline-First)

> Phases 4, 5, and 6 can be developed **in parallel** once Phases 2 and 3 are complete.

#### 4A: Config Caching on Login

- On successful agent login, the JWT contains `hotel_id` but agents may be mapped to multiple hotels.
- Call `GET /api/v1/admin/hotels` is not available to agents. Instead, the agent's assigned hotels are discovered via the form-schema endpoint. The app should store a list of known hotel IDs for the agent (from mappings — may need a separate mechanism or the hotels can be fetched via history/pending-deliveries).
- For each assigned hotel, call `GET /api/v1/setup/hotels/{id}/form-schema`.
- Store the full `FormSchemaResponse` per hotel in Drift `CachedFormSchemas` table.
- Show a progress indicator on first sync.
- On subsequent launches: use cached data immediately; refresh silently in background.

#### 4B: Agent Home Screen

- List of assigned hotels (from cache).
- Each hotel card shows:
  - Hotel name and address.
  - Badge with count of **pending deliveries** (from `GET /api/v1/challans/hotel/{id}/pending-deliveries`).
- Quick action buttons: "New Pickup" and "View Pending Deliveries".
- Navigation to pending sync queue (offline challans).
- Network status banner at top when offline.

#### 4C: Department Selection Screen (Informational)

> With multi-department challans, this screen is no longer a mandatory step. Agents go directly from hotel → pickup/delivery form. This screen serves as a reference view of the hotel's department configuration.

- On hotel tap → navigate directly to pickup or delivery form (based on user intent).
- Department selection screen is accessible from a "View Departments" action for reference.
- Each department shows:
  - Department name.
  - `BillingType` badge: `PIECE` (green) or `WEIGHT` (blue).
  - `WeightSource` badge for WEIGHT depts: `SOILED`, `CALCULATED`, or `FRESH`.
- Fully functional offline (reads from Drift cache).

#### 4D: Pickup Form Screen (Multi-Department with Item Search)

The form for recording linen picked up from a hotel and taken to the laundry. A single challan can now cover multiple departments.

- **Header fields:**
  - `challan_number` — required text field (user-supplied, e.g., "CN-001").
- **Department sections** — expandable/collapsible sections, one per department added to the challan:
  - **"Add Department" button** — dropdown of hotel departments from cached form schema. Agent can add as many as needed. Each department can only appear once per challan.
  - Per department section:
    - Department name header with `BillingType` badge and remove button.
    - `soiled_weight` — optional decimal field with "kg" suffix, shown only for WEIGHT departments.
    - **Item search bar** — type-ahead filter that searches items by name within the department's item list. Essential for departments with many items.
    - **Item rows** (from `FormSchemaItem` list, filtered by search):
      - Each row: **Item Name** (read-only label) + **Qty** field + **Damaged Qty** field.
      - Use +/- stepper buttons for quick input on mobile.
- **Summary footer:**
  - Per department: total pieces, total damaged.
  - Grand total: total pieces across all departments, total damaged.
- **Validation:**
  - `challan_number` required.
  - At least one department with at least one item having `qty > 0`.
  - All quantities must be `>= 0`.
  - `damaged_qty <= qty` per item.
- **Image capture button** — optional photo of the challan slip (triggers Phase 4G flow).
- **Submit** button → calls `POST /api/v1/challans/pickup`.
- **On success:** show success dialog with challan summary, navigate to detail screen.
- **On 409 (duplicate CN + type + hotel):** show error "A pickup with this challan number already exists for this hotel."

**Request payload (multi-department):**
```json
{
  "challan_number": "CN-001",
  "hotel_id": "uuid",
  "departments": [
    {
      "dept_id": "uuid-housekeeping",
      "soiled_weight": 25.50,
      "items": [
        {"item_id": "uuid", "qty": 50, "damaged_qty": 2},
        {"item_id": "uuid", "qty": 30, "damaged_qty": 0}
      ]
    },
    {
      "dept_id": "uuid-restaurant",
      "items": [
        {"item_id": "uuid", "qty": 500, "damaged_qty": 0}
      ]
    }
  ]
}
```

#### 4E: Delivery Form Screen (Multi-Department with Deliver-All & Item Search)

The form for recording linen returned from the laundry to the hotel. Supports multi-department deliveries and a "Deliver All" shortcut.

- **Challan number selection:** Dropdown of **pending pickup challan numbers** from `GET /api/v1/challans/hotel/{hotel_id}/pending-deliveries`. Only pickups without a matching delivery appear here.
- **On CN selection:** Auto-populate the department sections and items from the selected pickup challan's data (departments and items are included in the pending-deliveries response).
- **"Deliver All" button** — one-tap action that copies all quantities from the pickup challan into the delivery form. Agent can then adjust individual items before submitting. This covers the common case where everything picked up is delivered back.
- **Department sections** (auto-populated from the selected pickup):
  - Per department section:
    - Department name header with `BillingType` badge.
    - `fresh_weight` — optional decimal field with "kg" suffix, shown only for WEIGHT departments. Label: "Fresh Weight (kg)" — this is the scale weight of clean linen being returned.
    - **Item search bar** — type-ahead filter for quickly finding items within the department (same as pickup form).
    - **Item rows:**
      - **Item Name** (read-only) + **"Picked: N"** label (from pickup, read-only) + **Deliver Qty** field + **Damaged Qty** field.
      - Use +/- stepper buttons for quantity input.
- **Summary footer:**
  - Per department: total delivering, total damaged.
  - Grand total across all departments.
- **Validation:**
  - `challan_number` required (must be selected from pending list).
  - At least one item must have `qty > 0`.
  - Over-delivery is caught by the backend; inline error displayed in the relevant department section.
- **Submit** → calls `POST /api/v1/challans/delivery`.
- **Error handling:**
  - `400 "No pickup challan found..."` — should not happen with dropdown, but handle gracefully.
  - `400 "Cannot deliver X of item Y; only Z in laundry"` — show inline error on the specific item row, highlight in red.
  - The entire request is rejected atomically — no partial deliveries.
- **On success:** show success dialog confirming the delivery challan number was recorded, then navigate back. Invalidates the pending deliveries provider for the hotel.

**Request payload (multi-department with fresh weight):**
```json
{
  "challan_number": "CN-001",
  "hotel_id": "uuid",
  "departments": [
    {
      "dept_id": "uuid-housekeeping",
      "fresh_weight": 24.00,
      "items": [
        {"item_id": "uuid", "qty": 45, "damaged_qty": 5},
        {"item_id": "uuid", "qty": 25, "damaged_qty": 0}
      ]
    },
    {
      "dept_id": "uuid-restaurant",
      "items": [
        {"item_id": "uuid", "qty": 480, "damaged_qty": 20}
      ]
    }
  ]
}
```

#### 4F: Offline Sync Engine

**Submit logic (for both pickup and delivery):**
1. Build the challan JSON payload.
2. Check connectivity via `internet_connection_checker_plus`.
3. If online: attempt POST. On success → navigate to detail. On 4xx → show error inline.
4. If offline (or `SocketException` / `TimeoutException`):
   - Save to Drift `PendingChallans` table with fields: `challan_type`, `payload_json`, `created_at`, `retry_count = 0`, `status = pending`.
   - Show snackbar: "Saved offline. Will sync when connected."

**Background sync service:**
- Listen to `internet_connection_checker_plus` connectivity stream.
- On connectivity restored: query all `PendingChallan` where `status == pending`, ordered by `created_at` ASC.
- POST each sequentially (order matters — a delivery must follow its pickup).
- On success: delete from Drift.
- On `4xx` (validation fail, e.g., over-delivery or duplicate CN): mark `status = failed`, store `error_message` from response `detail` field.
- On `5xx` / network error: increment `retry_count`, keep `status = pending`, retry with exponential backoff (max 5 retries, then mark `failed`).

**Pending Sync Screen:**
- Accessible from agent home.
- List of pending/failed challans with:
  - Challan number, type (PICKUP/DELIVERY), hotel name, created timestamp.
  - Status badge: `pending` (yellow), `syncing` (blue spinner), `failed` (red).
  - For failed: show error message and "Retry" button.
  - "Delete" button to discard a failed challan.
- Count badge on agent home showing total pending items.

#### 4G: Image Capture & Upload

- After a challan is submitted successfully, offer the option to attach a photo.
- **Flow:**
  1. Open `image_picker` — camera or gallery.
  2. Call `GET /api/v1/challans/{challan_id}/upload-url?extension=jpg` to get presigned S3 URL.
  3. Upload image directly to S3 using the presigned URL (PUT request via Dio, bypassing auth interceptor).
  4. Call `PATCH /api/v1/challans/{challan_id}/confirm-upload` with `{"s3_key": "..."}`.
  5. On success: update local challan record to show image thumbnail.
- Show upload progress indicator.
- Handle failures gracefully — challan is already saved, image is optional.

#### 4H: Challan Detail & Edit

**Challan Detail Screen:**
- Full challan info: challan number, type badge (PICKUP/DELIVERY), hotel, agent, timestamp.
- If `last_edited_at` is set: show "Edited" badge with edit timestamp and editor.
- If `image_key` is set: show image thumbnail (construct URL from S3 bucket + key).
- **Department sections** — one collapsible section per department in the challan:
  - Department name + billing type badge.
  - For PICKUP + WEIGHT dept: show soiled weight.
  - For DELIVERY + WEIGHT dept: show fresh weight.
  - Line items table: Item Name, Qty, Damaged Qty.
  - Department subtotal (pieces).
- Grand total across all departments.
- "Edit" button — visible based on edit rules (see below).

**Challan Edit Screen:**
- Pre-populate form with existing challan data (multi-department structure).
- Agent/Hotel Admin: show "Edit" button only if `entry_timestamp` is within 24 hours. After 24h, show disabled button with tooltip "Can only edit within 24 hours."
- Super Admin: always show "Edit" button.
- On submit: `PATCH /api/v1/challans/{challan_id}` with `ChallanEditRequest`.
- Handle `403 "Challan can only be edited within 24 hours"` error.
- Handle `400` over-delivery errors (same as delivery form).
- On success: show confirmation, navigate back to detail screen.

**Edit request payload (multi-department):**
```json
{
  "departments": [
    {
      "dept_id": "uuid",
      "soiled_weight": 26.00,
      "items": [
        {"item_id": "uuid", "qty": 80, "damaged_qty": 3}
      ]
    }
  ]
}
```

#### 4I: Challan History Screen

- Paginated list of challans via `GET /api/v1/challans/hotel/{hotel_id}`.
- **Filters** (all optional, as query params):
  - `dept_id` — dropdown of departments.
  - `challan_type` — PICKUP / DELIVERY / All.
  - `start_date`, `end_date` — date range picker.
- **Pagination:** `page` (default 1), `page_size` (default 20, max 100).
- Response: `PaginatedChallanResponse` with `total`, `page`, `page_size`, `items[]`.
- Each list item shows: challan number, type badge, department, timestamp, total qty.
- Tap to navigate to challan detail.
- Infinite scroll or "Load more" button.

#### 4J: Pending Deliveries Screen

- `GET /api/v1/challans/hotel/{hotel_id}/pending-deliveries`.
- Returns pickup challans whose `challan_number` has no matching delivery for the same hotel.
- List shows: challan number, departments (comma-separated), agent, timestamp, total item count across all departments.
- Tap to view pickup detail.
- **"Deliver All" button** → navigates to delivery form with CN pre-selected AND all quantities auto-populated from the pickup challan. Agent reviews and adjusts before submitting.
- "Create Delivery" button → navigates to delivery form with CN pre-selected but empty quantities for manual entry.

**Acceptance:**
1. Agent can submit a **multi-department** pickup challan with items and soiled weight per WEIGHT dept.
2. Agent can submit a **multi-department** delivery with fresh weight per WEIGHT dept, referencing an existing pickup CN.
3. **"Deliver All"** auto-fills delivery quantities from the pickup challan; agent can adjust before submitting.
4. **Item search** filters items by name in both pickup and delivery forms.
5. Over-delivery attempt shows error, ledger unchanged.
6. Pending deliveries screen shows undelivered pickups with "Deliver All" option.
7. Challan can be edited within 24h; after 24h agent is blocked.
8. Image can be captured and uploaded after submission.
9. Offline: challan saved locally → auto-syncs when online → failed challans surface with error messages.
10. History screen supports pagination and all filters.

---

### Phase 5 — Hotel Admin Flow

#### 5A: Adaptive Shell

- Mobile: `BottomNavigationBar` with tabs: Dashboard, Inventory, Challans, Quality, Billing.
- Tablet: `NavigationRail` on the left.
- All data auto-scoped to the admin's `hotel_id` (from JWT).

#### 5B: Hotel Admin Dashboard

- **Stat cards** (derived from live tracking + challan history):
  - **Total weight in laundry** — `SUM(qty_in_laundry × calculated_weight)` from live tracking, displayed in kg. This replaces item count as the primary metric since billing is weight-based.
  - Total items currently in laundry (secondary, shown smaller below weight).
  - Total damage count (sum of `total_damaged_by_laundry`).
- **Recent challans** — last 10 challans for this hotel via `GET /api/v1/challans/hotel/{id}?page_size=10`.
  - Timeline widget: date, agent name (from `agent_id`), department, type badge, total pieces.
  - Tap to view challan detail.
- Pull-to-refresh.

#### 5C: Live Inventory Screen

- `GET /api/v1/live-tracking/hotel/{id}`.
- Response grouped by department, each with items where `qty_in_laundry > 0`.
- Display:
  - Tablet: `DataTable` with columns — Item Name, Department, Qty in Laundry, Damaged by Laundry.
  - Mobile: Collapsible `ExpansionTile` per department, `Card` per item.
- Color-coded `DamageIndicator`:
  - Green: no damage.
  - Yellow: `total_damaged_by_laundry` > 0 but < threshold.
  - Red: above threshold.
- Search/filter bar at top.
- Pull-to-refresh + auto-refresh every 30 seconds.

#### 5D: Challan History (Hotel-Scoped)

- Same as Phase 4I but auto-scoped to hotel admin's `hotel_id`.
- Filters: department, challan type, date range.
- Tap to view detail.
- "Edit" button on challans within 24h.

#### 5E: Damage Report Screen

- `GET /api/v1/quality-control/damages?hotel_id={id}`.
- Two sections:
  1. **Challan-based damage summary** (`challan_damage_summary`): per-item `net_damage` (damage delta attributed to laundry) within a date range. Show date range picker.
  2. **All-time totals** (`all_time_totals`): per-item `total_damaged_by_laundry` from the live ledger. Not affected by date filter.
- Display as sortable table or card list.
- Highlight items with high damage in red.

#### 5F: Billing Report Screen

- `GET /api/v1/reports/billing?hotel_id={id}&start_date=...&end_date=...`.
- **View toggle:** **Summary** (default) vs **Detailed** (challan-wise) — maps to `&view=summary|detailed` query param.
- **Date range picker** at top (default: current month).
- **Weight mode toggle** for WEIGHT departments: SOILED / CALCULATED / FRESH radio buttons (maps to `&weight_mode=SOILED|CALCULATED|FRESH` query param). Default follows department's `weight_source` setting.

**Summary View** (default):
- **Department breakdown** using `ExpansionTile` per department:
  - **WEIGHT departments** show:
    - Soiled weight and soiled subtotal.
    - Calculated weight and calculated subtotal.
    - Fresh weight and fresh subtotal.
    - Active subtotal highlighted based on current weight mode.
    - Rate per kg.
  - **PIECE departments** show:
    - Item-level breakdown: item name, quantity, rate per piece, subtotal.
    - Department total.
- **Damage liability** card showing deduction amount.
- **Grand total** card at the bottom.

**Detailed View** (challan-wise billing):
- Challans listed in date-sorted order (newest first by default, togglable).
- Each challan card shows:
  - Challan number, type badge, date/time, agent name.
  - Department breakdown within the challan (same weight/piece layout as summary).
  - Challan total.
- Department-wise subtotals aggregated at the bottom of the challan list.
- **Grand total** card at the bottom.

- Export/download button (future: PDF generation).

**Acceptance:** All screens render on mobile and tablet; dashboard shows total weight as primary metric; live tracking auto-refreshes; billing correctly toggles between soiled, calculated, and fresh; detailed billing view shows challan-wise breakdown; damage report shows both time-filtered and all-time data.

---

### Phase 6 — Super Admin Console (Web/Desktop)

#### 6A: Admin Shell Layout

- Persistent left sidebar with sections: Dashboard, Hotels, Items, Users, Agent Mappings, Quality, Reports.
- Breadcrumb bar at top.
- Content area uses full width with responsive padding.

#### 6B: Super Admin Dashboard

- `GET /api/v1/dashboards/super-admin`.
- **Stat cards (4 cards):**
  - `total_weight_in_laundry_kg` — total weight across all hotels (PRIMARY metric, visually larger card with accent treatment).
  - `total_items_in_laundry` — sum across all hotels (secondary metric).
  - `total_hotels` — count of all hotels.
  - `challans_today` — count of challans created today.
- **Recent challans table** — last 10 globally with columns: Time, CN, Hotel, Departments (comma-separated for multi-dept challans), Agent, Type (PICKUP/DELIVERY badges), Pieces, Weight. Each is a clickable row → navigate to challan detail.
- **Challan volume chart** (fl_chart): challans per day for the last 7 days as bar chart (derived from challan history with date filtering).
- **Damage red flags table**: `GET /api/v1/quality-control/damages` → sort by `total_damaged_by_laundry` desc. Highlight rows exceeding threshold in red.

#### 6C: Hotels CRUD

- `GET /api/v1/admin/hotels` — `DataTable` with columns: Name, Address, Contact Number, Created At, Actions.
- "Add Hotel" button → dialog form with fields: `name` (required), `address`, `contact_number`.
- `POST /api/v1/admin/hotels` on submit.
- Row actions: View detail (navigate to hotel detail screen).
- Ordered by `created_at` DESC.

#### 6D: Hotel Detail Screen

- Shows hotel info + two sub-sections:
  1. **Departments** for this hotel (from form-schema or dedicated queries).
  2. **Assigned agents** for this hotel (from mappings).
- "Add Department" button.
- "Assign Agent" button.

#### 6E: Departments CRUD

- `POST /api/v1/setup/hotels/{hotel_id}/departments`.
- Form fields:
  - `name` (required).
  - `billing_type` — dropdown: WEIGHT or PIECE.
  - `price_per_kg` — shown only when WEIGHT selected.
  - `weight_source` — shown only when WEIGHT selected: SOILED, CALCULATED, or FRESH.
- After creating department → navigate to item linking screen.

#### 6F: Items Master & Department-Item Linking

- **Items Master:**
  - `GET /api/v1/setup/items` — table of all items, ordered by name.
  - "Add Item" → `POST /api/v1/setup/items` with `{name}`.
  - Handle `409 "Item already exists"`.
- **Link Item to Department:**
  - `POST /api/v1/setup/departments/{dept_id}/items`.
  - Form: select item from master list, set `price_per_piece` (for PIECE depts) or `calculated_weight` (for WEIGHT depts).
  - Handle `409 "Item already linked"`.

#### 6G: Users CRUD

- `POST /api/v1/admin/users` — create user form:
  - `google_email` (required, unique, validated as email format). This is the user's Google account email they will use to sign in.
  - `role` — dropdown: SUPER_ADMIN, HOTEL_ADMIN, SERVICE_AGENT.
  - `phone` (optional).
  - `hotel_id` — shown only when HOTEL_ADMIN selected. Dropdown of hotels.
- Handle `409 "User with this email already exists"`.
- Display users list (no dedicated list endpoint in current backend — may need to add, or manage locally).

#### 6H: Agent-Hotel Mapping

- `POST /api/v1/admin/mappings` — assign agent to hotel.
- Form: select agent (dropdown of SERVICE_AGENT users), select hotel.
- Display current mappings in a table with agent name, hotel name, created at.
- Handle `409 "Mapping already exists"`, `404 "Agent/Hotel not found"`.

#### 6I: Super Admin Billing Reports

- Same as Phase 5F but without hotel scoping — shows all hotels.
- Additional hotel filter dropdown.
- `GET /api/v1/reports/billing?start_date=...&end_date=...&hotel_id=...&weight_mode=...&view=summary|detailed`.
- **Summary view:** hotel-level summary with department breakdowns (same as hotel admin but for all hotels).
- **Detailed view:** challan-wise billing per hotel, date-sorted. Useful for auditing individual transactions.
- Weight mode toggle supports all three modes: SOILED / CALCULATED / FRESH.
- Hotel leaderboard: hotels ranked by `grand_total` descending.

#### 6J: Super Admin Quality Reports

- `GET /api/v1/quality-control/damages` (no hotel filter = all hotels).
- Optional hotel filter dropdown.
- Date range filter for `challan_damage_summary`.
- All-time totals across all hotels.

#### 6K: Challan Management

- Super admin can view and edit any challan from any hotel.
- Access via dashboard recent challans, hotel detail, or reports drill-down.
- Edit has no 24h restriction for super admin.

**Acceptance:** All CRUD operations work; analytics widgets render with live data; sidebar navigation is smooth; tenant-scoped data is correctly filtered; duplicate/conflict errors are handled gracefully.

---

### Phase 7 — Testing

#### 7A: Unit Tests — Models

- JSON round-trip tests for every Freezed model.
- Special attention to:
  - `BillingResponse` — deeply nested with optional fields that differ between WEIGHT and PIECE depts.
  - `ChallanResponse` — `challan_type` as string, nullable fields (`soiled_weight`, `image_key`, `last_edited_at`, `edited_by`).
  - `DamageReport` — two separate arrays with different shapes.
  - Enum serialization: `UserRole`, `BillingType`, `WeightSource`, `ChallanType`.

#### 7B: Unit Tests — Repositories

- Mock Dio, verify correct endpoints, headers, and request bodies.
- Test `AuthRepository.login` → correct POST body, token extraction.
- Test `ChallanRepository.submitPickup` → correct payload shape.
- Test `ChallanRepository.submitDelivery` → correct payload shape.
- Test `ChallanRepository.editChallan` → correct PATCH call.
- Test `BillingRepository.getBilling` → correct query params including `weight_mode`.
- Test error mapping: 400 → `ValidationException`, 401 → `UnauthorizedException`, etc.

#### 7C: Unit Tests — Offline Sync Engine

- Mock network failure → verify `PendingChallan` written to Drift.
- Mock reconnection → verify pending challans POSTed in order.
- Mock 4xx response → verify challan marked as `failed` with error message.
- Mock 5xx → verify retry count incremented, exponential backoff.
- Verify max 5 retries then `failed`.

#### 7D: Widget Tests

- Login form: validation errors shown when fields empty, loading state on submit.
- Pickup form: renders correct number of item rows from form schema, soiled weight field shown for WEIGHT depts.
- Delivery form: CN dropdown populated from pending deliveries.
- Responsive scaffold: switches layout at breakpoints.
- Billing report: WEIGHT dept shows both weight values, PIECE dept shows item table.

#### 7E: Integration Tests

- **Full agent pickup flow:** login as agent → select hotel → select dept → fill pickup form → submit → verify on detail screen.
- **Full delivery flow:** create pickup → go to pending deliveries → create delivery → verify ledger via live tracking.
- **Over-delivery rejection:** create pickup with 30 items → attempt delivery of 50 → verify error shown, ledger unchanged.
- **Edit flow:** create pickup → edit within 24h → verify updated values.
- **Cross-role isolation:** login as hotel admin → attempt to access another hotel's data → verify redirect/error.

---

### Phase 8 — Polish & Production Readiness

#### 8A: Offline UX

- `NetworkStatusBanner` widget at top of all screens: green "Online" / red "Offline".
- Optimistic UI updates where possible.
- Graceful degradation: show cached data when offline, disable write operations that can't be queued.

#### 8B: Error Handling UX

- Global error handler for unhandled exceptions.
- Consistent error display: `ErrorRetryWidget` with retry callback.
- Specific error messages for known backend errors:
  - "Cannot deliver X of item Y; only Z in laundry" → highlight the specific item row.
  - "A pickup with this challan number already exists" → highlight CN field.
  - "Account is inactive" → "Your account has been deactivated. Contact your administrator."
  - "Challan can only be edited within 24 hours" → show age of challan.

#### 8C: UI Polish

- Skeleton loaders for all list/detail screens.
- Pull-to-refresh on all data screens.
- Smooth page transitions.
- Empty states for all lists ("No challans yet", "No hotels configured", etc.).
- Dark mode support.
- Haptic feedback on form submission (mobile).

#### 8D: Push Notifications (Future)

- Hotel Admin: "New challan submitted for [Hotel]".
- Super Admin: "Damage threshold exceeded at [Hotel]".

---

### Phase 9 — Build & Deployment

#### 9A: Build Scripts

```bash
# Android
flutter build apk --split-per-abi --release --dart-define-from-file=.env.prod

# iOS
flutter build ios --release --dart-define-from-file=.env.prod

# Web
flutter build web --web-renderer canvaskit --release --dart-define-from-file=.env.prod
```

#### 9B: CI/CD (GitHub Actions)

- **On PR:** `flutter analyze` + `flutter test` + `dart run build_runner build` (verify codegen).
- **On merge to main:** build web → deploy to Firebase Hosting / Vercel.
- **On tag:** build APK → upload to Play Store (via Fastlane); build IPA → upload to TestFlight.

#### 9C: Environment Configuration

- Use `--dart-define-from-file=.env.dev` for dev builds.
- Use `--dart-define-from-file=.env.prod` for production builds.
- AWS S3 bucket URL for challan images (read from env).

---

## Post-Phase Incremental Updates

These are changes made after the core 9 phases were implemented, driven by backend API additions, UX improvements, and ongoing refinements.

### Update 1 — Google Sign-In Auth Flow (2026-03-24)

Replaced username/password login with Google Sign-In (`google_sign_in` package). Login screen redesigned to single "Sign in with Google" button. Auth models updated (`GoogleLoginRequest` replaces `LoginRequest`). API endpoint changed from `/auth/login` to `/auth/google`. Created `BACKEND_CHANGES_GOOGLE_AUTH.md` with full backend migration prompt.

### Update 2 — Backend Sync: Filtered Users, Enriched Mappings, Aggregated Dashboard (2026-04-04)

Integrated 5 backend changes:
1. `GET /admin/users` with `?role=` and `?is_active=` filters
2. `GET /admin/mappings` enriched with `agent_email`, `agent_name`, `hotel_name`
3. `display_name` nullable field on User model
4. `GET /dashboards/hotel-admin/{hotel_id}` — single aggregated call replacing 3 separate requests
5. `?min_damage=` filter on damage report endpoint

### Update 3 — Haptic Feedback on Form Submissions (2026-04-04)

Added `HapticFeedback.mediumImpact()` on all form submit buttons (9 actions across 8 files): Google Sign-In, Submit Pickup, Submit Delivery, Deliver All, Create Hotel, Create Department, Create Item, Create User, Assign Agent.

### Update 4 — New PATCH Endpoints, Single Challan Fetch, Pagination (2026-04-04)

**New endpoints integrated:**
1. **`PATCH /admin/users/{user_id}`** — Partial update (display_name, phone, role, hotel_id, is_active). New `UserUpdateRequest` Freezed model with `includeIfNull: false`. Edit User dialog added to `AdminUsersScreen` with role dropdown, hotel picker, active toggle (SwitchListTile).
2. **`PATCH /admin/hotels/{hotel_id}`** — Partial update (name, address, contact_number). New `HotelUpdateRequest` model. Edit Hotel dialog added to `AdminHotelsScreen`.
3. **`GET /challans/{challan_id}`** — Single challan fetch by ID. `AgentRepository.getChallanById()` + `challanByIdProvider`. All 3 challan detail screens (agent, hotel admin, super admin) now fetch directly instead of requiring navigation with `extra` data — enables deep linking and screen refresh.

**Pagination on list endpoints:**
All list endpoints (`/admin/users`, `/admin/hotels`, `/admin/mappings`, `/setup/items`) now send `?page=` and `?page_size=` params. Defaults (page=1, page_size=50) preserve backward compatibility.

**UI changes:**
- Users DataTable gains Actions column with edit icon per row
- Hotels DataTable gains edit icon alongside existing detail navigation

### Update 5 — Dev Login User Picker + Fresh Start (2026-05-09)

Dev login now keeps exactly one fixed Super Admin profile and fetches active `HOTEL_ADMIN` / `SERVICE_AGENT` users from the backend at login-time, so newly created users can be selected directly in debug mode on both web and mobile. Added a **Fresh Start** debug action that clears secure storage + local Drift cache to reset local app state without touching backend data.

### Update 6 — Web Drift DB Bootstrap Fix (2026-05-09)

Fixed Flutter web startup by configuring Drift with `DriftWebOptions` and adding required `web/drift_worker.js` + `web/sqlite3.wasm` assets. This unblocks web login/logout and admin flows that depend on auth provider initialization.

### Update 7 — Stable GoRouter Lifecycle on Web (2026-05-09)

Adjusted router wiring to keep a single `GoRouter` instance and refresh redirects from auth-state changes, instead of recreating the router on every auth update. This avoids duplicate navigator key issues on web and stabilizes admin dialogs/forms (including user creation flow).

---

## Dependency Graph

```
Phase 0: Scaffolding
    └──▶ Phase 1: Core Infrastructure
              ├──▶ Phase 3: Shared Models (can start alongside Phase 1)
              │         └──▶ Phase 2: Auth & Routing
              │                   ├──▶ Phase 4: Agent Flow      ┐
              │                   ├──▶ Phase 5: Hotel Admin     ├─ parallel
              │                   └──▶ Phase 6: Super Admin     ┘
              │                             └──▶ Phase 7: Testing
              │                                       └──▶ Phase 8: Polish
              │                                                 └──▶ Phase 9: Deployment
              └──▶ Phase 2 (also depends on Phase 1 directly)
```

Phases 4, 5, and 6 can be developed **in parallel** by different developers once Phases 2 and 3 are complete.

---

## Complete API Integration Map

| # | App Feature | Backend Endpoint | Method | Auth | Tenant Scoped |
|---|---|---|---|---|---|
| 1 | Health check | `/health` | GET | None | No |
| 2 | Google Sign-In | `/api/v1/auth/google` | POST | None | No |
| 3 | List users | `/api/v1/admin/users` | GET | SUPER_ADMIN | No |
| 4 | Create user | `/api/v1/admin/users` | POST | SUPER_ADMIN | No |
| 5 | Update user | `/api/v1/admin/users/{id}` | PATCH | SUPER_ADMIN | No |
| 6 | List hotels | `/api/v1/admin/hotels` | GET | SUPER_ADMIN | No |
| 7 | Create hotel | `/api/v1/admin/hotels` | POST | SUPER_ADMIN | No |
| 8 | Update hotel | `/api/v1/admin/hotels/{id}` | PATCH | SUPER_ADMIN | No |
| 9 | List mappings | `/api/v1/admin/mappings` | GET | SUPER_ADMIN | No |
| 10 | Create agent-hotel mapping | `/api/v1/admin/mappings` | POST | SUPER_ADMIN | No |
| 11 | Create department | `/api/v1/setup/hotels/{id}/departments` | POST | HOTEL_ADMIN+ | Yes |
| 12 | Create item | `/api/v1/setup/items` | POST | HOTEL_ADMIN+ | No |
| 13 | List items | `/api/v1/setup/items` | GET | HOTEL_ADMIN+ | No |
| 14 | Link item to department | `/api/v1/setup/departments/{id}/items` | POST | HOTEL_ADMIN+ | No |
| 15 | Get form schema | `/api/v1/setup/hotels/{id}/form-schema` | GET | HOTEL_ADMIN+ | Yes |
| 16 | Submit pickup | `/api/v1/challans/pickup` | POST | AGENT+ | No |
| 17 | Submit delivery | `/api/v1/challans/delivery` | POST | AGENT+ | No |
| 18 | Get single challan | `/api/v1/challans/{id}` | GET | Any authed | No |
| 19 | Edit challan | `/api/v1/challans/{id}` | PATCH | Any authed | No |
| 20 | Challan history | `/api/v1/challans/hotel/{id}` | GET | Any authed | Yes |
| 21 | Pending deliveries | `/api/v1/challans/hotel/{id}/pending-deliveries` | GET | Any authed | Yes |
| 22 | Get upload URL | `/api/v1/challans/{id}/upload-url` | GET | AGENT+ | No |
| 23 | Confirm image upload | `/api/v1/challans/{id}/confirm-upload` | PATCH | AGENT+ | No |
| 24 | Live inventory tracking | `/api/v1/live-tracking/hotel/{id}` | GET | Any authed | Yes |
| 25 | Super admin dashboard | `/api/v1/dashboards/super-admin` | GET | SUPER_ADMIN | No |
| 26 | Hotel admin dashboard | `/api/v1/dashboards/hotel-admin/{id}` | GET | HOTEL_ADMIN+ | Yes |
| 27 | Damage / quality report | `/api/v1/quality-control/damages` | GET | AGENT+ | No |
| 28 | Billing report (summary) | `/api/v1/reports/billing` | GET | AGENT+ | No |
| 29 | Billing report (detailed) | `/api/v1/reports/billing?view=detailed` | GET | AGENT+ | No |

**Legend:** `HOTEL_ADMIN+` = HOTEL_ADMIN or SUPER_ADMIN. `AGENT+` = any authenticated role.

**Pagination:** List endpoints (#3, #6, #9, #13, #20) support `?page=` and `?page_size=` (default 50, max 200).
**Filters:** #3 supports `?role=` and `?is_active=`. #27 supports `?min_damage=`.

---

## Screens Overview

| Screen | Role | Route | Key API Calls |
|---|---|---|---|
| Login | All | `/login` | Google Sign-In → `POST /auth/google` |
| Agent Home | Agent | `/agent/home` | pending-deliveries (count) |
| Department Selection | Agent | `/agent/hotel/:id/departments` | form-schema (cached) |
| Pickup Form | Agent | `/agent/challan/pickup/:hotelId` | `POST /challans/pickup` (multi-dept) |
| Delivery Form | Agent | `/agent/challan/delivery/:hotelId` | `GET pending-deliveries` + `POST /challans/delivery` (multi-dept, deliver-all) |
| Challan Detail | All | `*/challan/:challanId` | `GET /challans/{id}` (direct fetch or from list data) |
| Challan Edit | All | `*/challan/:challanId/edit` | `PATCH /challans/{id}` |
| Challan History | All | `*/history` or `*/challans` | `GET /challans/hotel/{id}` (paginated) |
| Pending Deliveries | Agent/Hotel | `*/pending-deliveries` | `GET /challans/hotel/{id}/pending-deliveries` |
| Pending Sync (Offline) | Agent | `/agent/pending-sync` | (local Drift DB) |
| Hotel Dashboard | Hotel Admin | `/hotel/dashboard` | `GET /dashboards/hotel-admin/{id}` (aggregated) |
| Live Inventory | Hotel Admin | `/hotel/inventory` | `GET /live-tracking/hotel/{id}` |
| Damage Report | Hotel/Super | `*/quality` | `GET /quality-control/damages` (`?min_damage=`) |
| Billing Report | Hotel/Super | `*/billing` or `*/reports` | `GET /reports/billing?view=summary\|detailed` |
| Super Dashboard | Super Admin | `/admin/dashboard` | `GET /dashboards/super-admin` |
| Hotels CRUD | Super Admin | `/admin/hotels` | `GET/POST/PATCH /admin/hotels` |
| Hotel Detail | Super Admin | `/admin/hotels/:id` | form-schema + mappings |
| Departments CRUD | Super Admin | `/admin/hotels/:id/departments` | `POST /setup/hotels/{id}/departments` |
| Items CRUD | Super Admin | `/admin/items` | `GET/POST /setup/items` + `POST /setup/departments/{id}/items` |
| Users CRUD | Super Admin | `/admin/users` | `GET/POST/PATCH /admin/users` (`?role=`, `?is_active=`) |
| Agent Mapping | Super Admin | `/admin/agents` | `GET/POST /admin/mappings` (enriched with names) |

---

## Key Business Rules the Frontend Must Enforce

| Rule | Backend Behavior | Frontend UX |
|---|---|---|
| Delivery requires pickup | 400 if no matching pickup CN exists | Show dropdown of pending pickup CNs only |
| Over-delivery blocked | 400 "Cannot deliver X; only Y in laundry" — full rejection | Show `qty_in_laundry` as max hint; highlight violating rows on error |
| Duplicate challan number | 409 Conflict on unique (challan_number, type, hotel) | Show error on CN field with backend message |
| 24h edit window | 403 for agents/hotel admins after 24h | Disable edit button after 24h; show tooltip |
| Super admin edit bypass | 200 always | Always show edit button for super admins |
| Tenant isolation | 403 for cross-hotel access | Never show other hotel's data in UI; handle 403 gracefully |
| Google Sign-In auth | Frontend sends Google ID token; backend verifies + maps email to user | Single "Sign in with Google" button; no username/password fields |
| Unregistered email | 404 "User not found" from backend | Show "No account found for this email. Contact your administrator." |
| Inactive account | 401 "Account is inactive" | Show specific message: "Your account has been deactivated" |
| Damage is cumulative | `max(0, delivery_dmg - ALL_pickup_dmg)` | Show informational note: damage delta, not absolute |
| Multi-dept challan | One challan spans multiple departments | Show department sections in forms; each dept has own items and weight |
| Deliver All | Auto-fill delivery from pickup quantities | "Deliver All" button copies pickup qtys; agent adjusts before submitting |
| Fresh weight | Delivery challans record fresh (clean) weight | Show "Fresh Weight" field on WEIGHT depts in delivery form |
| Billing weight modes | Dept `weight_source` is default; 3 modes: SOILED/CALCULATED/FRESH | Show 3-way toggle; default to dept setting; always show all three values |
| Detailed billing | Challan-wise billing breakdown | "Detailed" view toggle on billing screen; challans sorted by date |
| Dashboard weight | Dashboard shows total weight, not just item count | Primary stat card shows total kg; item count shown as secondary |
| Image upload is two-step | Get presigned URL → upload to S3 → confirm | Show progress; handle partial failure |
| Partial updates (PATCH) | Only send changed fields; `includeIfNull: false` | Edit dialogs compare against original values; skip unchanged fields |
| Pagination on lists | `?page=` + `?page_size=` (default 50, max 200) | Frontend sends defaults; supports "Load More" pattern |
| Deep linking challans | `GET /challans/{id}` returns full challan; 404 if not found | Challan detail screens fetch directly when opened via URL/link |
| User deactivation | `PATCH /admin/users/{id}` with `is_active: false` | SwitchListTile in edit dialog; deactivated users cannot log in |

---

## Development Setup

### Prerequisites

- Flutter SDK 3.19+ ([install guide](https://docs.flutter.dev/get-started/install))
- Dart SDK >= 3.3.0
- Android Studio (for Android emulator) or Xcode (for iOS simulator)
- Chrome (for web builds)
- Backend running at `http://localhost:8000` (see `laundry-backend-service/README.md`)

### Quick Start

```bash
# Install dependencies
flutter pub get

# Run code generation (Freezed, json_serializable, Drift, Envied)
dart run build_runner build --delete-conflicting-outputs

# Run on Chrome (web)
flutter run -d chrome --dart-define-from-file=.env.dev

# Run on Android emulator
flutter run -d <emulator-id> --dart-define-from-file=.env.dev

# Run on iOS simulator
flutter run -d <simulator-id> --dart-define-from-file=.env.dev
```

### Environment Config

Create `.env.dev`:

```env
BASE_API_URL=http://localhost:8000
GOOGLE_WEB_CLIENT_ID=842773680982-rsastn80pmm97a17k75a9n3t7hn56s8t.apps.googleusercontent.com
```

Create `.env.prod`:

```env
BASE_API_URL=/api
AWS_S3_BUCKET=laundrotrack-challans
AWS_REGION=ap-south-1
GOOGLE_WEB_CLIENT_ID=842773680982-rsastn80pmm97a17k75a9n3t7hn56s8t.apps.googleusercontent.com
```

For same-server deployments (frontend + backend behind one Nginx host), keep `BASE_API_URL=/api` and proxy `/api/*` to the backend service (for example `127.0.0.1:8000`).

### Running Tests

```bash
# All tests
flutter test

# With coverage
flutter test --coverage

# Integration tests
flutter test integration_test/

# Static analysis
flutter analyze
```

---

## Changelog

| Date | Change |
|---|---|
| 2026-03-01 | Initial project plan and README created |
| 2026-03-15 | Updated plan based on backend analysis — expanded from 8 to 9 phases |
| 2026-03-24 | Major feature update — multi-dept challans, item search, "Deliver All", fresh weight, weight dashboards, detailed billing. See `BACKEND_CHANGES.md` |
| 2026-03-24 | **Phase 0+1 implemented** — project scaffolded, core infra complete |
| 2026-03-24 | **Update 1** — Auth flow changed to Google Sign-In (see Incremental Updates) |
| 2026-03-24 | **Phase 2 implemented** — Authentication & Role-Based Routing |
| 2026-04-04 | **Phase 3 implemented** — Shared Models & Code Generation (all Freezed models for backend schemas) |
| 2026-04-04 | **Phase 4 implemented** — Service Agent Flow (8 screens, full data layer, tested against live backend) |
| 2026-04-04 | **Phase 5 implemented** — Hotel Admin Flow (5-tab shell, 7 screens, live tracking, billing, damage reports) |
| 2026-04-04 | **Update 2** — Backend sync: filtered users, enriched mappings, aggregated dashboard, min_damage (see Incremental Updates) |
| 2026-04-04 | **Phase 6 implemented** — Super Admin Console (7-tab navigation, 9 screens, all CRUD + reports) |
| 2026-04-04 | **Phase 7 implemented** — Testing (121 tests: models, repos, offline sync, widgets, integration) |
| 2026-04-04 | **Phase 8 implemented** — Polish & Production Readiness (offline banner, error UX, skeletons, dark mode) |
| 2026-04-04 | **Update 3** — Haptic feedback on all form submit buttons (see Incremental Updates) |
| 2026-04-04 | **Update 4** — PATCH users/hotels, GET single challan, pagination on list endpoints (see Incremental Updates) |
| 2026-05-09 | **Update 5** — Dev login role-based user picker + Fresh Start local DB reset |
| 2026-05-09 | **Update 6** — Web Drift DB bootstrap fix (worker + wasm assets) |
| 2026-05-09 | **Update 7** — Stable GoRouter lifecycle for web auth refresh |
| 2026-05-09 | **Update 8** — Agent flow route mapping fixed (Departments/Pending Sync/Delivery) + debug fallback for form-schema fetch when agent token is blocked |
| 2026-05-09 | **Update 9** — Removed final phase placeholders by implementing Edit Challan runtime flow and wiring both agent/hotel edit routes |
| 2026-05-09 | **Update 10** — Pickup/Delivery forms improved for dark-theme readability and manual numeric quantity entry (besides +/- steppers) |
| 2026-05-09 | **Update 11** — Delivery form button clarity: renamed challan-scoped auto-fill and added inventory-based auto-fill option while keeping challan-number submission |
