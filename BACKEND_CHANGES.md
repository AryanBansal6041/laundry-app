# LaundroTrack — Backend Changes Required

This document describes all backend schema, endpoint, and logic changes needed to support the 6 new frontend features. Each section includes the exact changes, new/modified models, endpoint contracts, and test scenarios.

---

## Summary of Changes

| # | Feature | Backend Impact |
|---|---|---|
| 1 | Item search in forms | None (frontend-only) |
| 2 | Multi-department in one challan | **Major** — new DB table, restructured endpoints and payloads |
| 3 | "Deliver All" auto-fill | Minor — pending-deliveries response needs item details |
| 4 | Three weight types (Soiled, Fresh, Calculated) | Medium — new enum value, new field, billing logic update |
| 5 | Dashboard shows weight not item count | Small — dashboard endpoint response change |
| 6 | Detailed challan-wise billing | Medium — new billing view/endpoint |

---

## Change 1: Multi-Department Challans (Major Restructure)

### Problem

Currently, each `Challan` row has a single `dept_id`. A real-world challan slip often covers multiple departments in one visit (e.g., picking up linen from Housekeeping AND Restaurant in one trip). The current design forces agents to create a separate challan per department, which is slow and doesn't match the physical challan slip.

### New Database Schema

#### New Table: `challan_departments`

| Column | Type | Constraints | Notes |
|---|---|---|---|
| `id` | UUID | PK, default uuid4 | |
| `challan_id` | UUID (FK) | NOT NULL, references `challans.id` | |
| `dept_id` | UUID (FK) | NOT NULL, references `departments.id` | |
| `soiled_weight` | Numeric(10,2) | Nullable | Pickup: scale weight of soiled linen |
| `fresh_weight` | Numeric(10,2) | Nullable | Delivery: scale weight of clean linen |
| `created_at` | DateTime(tz) | server_default=now() | |

**Unique constraint:** `(challan_id, dept_id)` — a challan cannot have the same department twice.

#### Modified Table: `challans`

- **Remove:** `dept_id` column
- **Remove:** `soiled_weight` column
- **Keep everything else** (`id`, `challan_type`, `challan_number`, `hotel_id`, `agent_id`, `image_key`, `entry_timestamp`, `last_edited_at`, `edited_by`)
- **Update unique constraint:** `(challan_number, challan_type, hotel_id)` stays the same
- **Add relationship:** `departments: Mapped[list["ChallanDepartment"]]` with `lazy="selectin"`

#### Modified Table: `challan_items`

- **Remove:** `challan_id` column
- **Add:** `challan_dept_id` UUID (FK) referencing `challan_departments.id`, NOT NULL
- **Keep everything else** (`id`, `item_id`, `qty`, `damaged_qty`, `applied_damage_delta`)
- **Update relationship:** `challan_department: Mapped["ChallanDepartment"]` back_populates `items`

#### Relationship Chain

```
Challan (1) --> (many) ChallanDepartment (1) --> (many) ChallanItem
```

### Migration

```
alembic revision --autogenerate -m "multi_dept_challans_and_fresh_weight"
```

This is a **destructive migration** if there is existing data. The migration should:
1. Create `challan_departments` table.
2. For each existing `Challan` row: insert a `ChallanDepartment` row with `challan_id`, `dept_id` (from challan), `soiled_weight` (from challan).
3. For each existing `ChallanItem` row: set `challan_dept_id` to the newly created `ChallanDepartment.id` (matched by `challan_id`).
4. Drop `dept_id` and `soiled_weight` from `challans`.
5. Drop `challan_id` from `challan_items`, add `challan_dept_id`.

### Modified Pydantic Schemas

#### `app/schemas/challan.py`

```python
# --- Request models ---

class ChallanDeptPayload(BaseModel):
    dept_id: uuid.UUID
    soiled_weight: Optional[Decimal] = None   # Pickup only
    fresh_weight: Optional[Decimal] = None    # Delivery only
    items: list[ChallanItemPayload]

class PickupSubmitRequest(BaseModel):
    challan_number: str
    hotel_id: uuid.UUID
    departments: list[ChallanDeptPayload]     # Was: single dept_id + items

class DeliverySubmitRequest(BaseModel):
    challan_number: str
    hotel_id: uuid.UUID
    departments: list[ChallanDeptPayload]     # Was: single dept_id + items

class ChallanEditRequest(BaseModel):
    departments: Optional[list[ChallanDeptPayload]] = None

# --- Response models ---

class ChallanDeptResponse(BaseModel):
    id: uuid.UUID
    dept_id: uuid.UUID
    soiled_weight: Optional[Decimal] = None
    fresh_weight: Optional[Decimal] = None
    items: list[ChallanItemResponse]
    model_config = {"from_attributes": True}

class ChallanResponse(BaseModel):
    id: uuid.UUID
    challan_type: str
    challan_number: str
    hotel_id: uuid.UUID
    agent_id: uuid.UUID
    image_key: Optional[str] = None
    entry_timestamp: datetime
    last_edited_at: Optional[datetime] = None
    edited_by: Optional[uuid.UUID] = None
    departments: list[ChallanDeptResponse]    # Was: dept_id + soiled_weight + items[]
    model_config = {"from_attributes": True}
```

### Modified Service: `challan_service.py`

#### `submit_pickup` changes:

```python
async def submit_pickup(db, payload: PickupSubmitRequest, agent_id) -> Challan:
    # 1. Create Challan header (no dept_id, no soiled_weight)
    challan = Challan(
        challan_type=ChallanType.PICKUP,
        challan_number=payload.challan_number,
        hotel_id=payload.hotel_id,
        agent_id=agent_id,
    )
    db.add(challan)
    await db.flush()

    # 2. For each department in payload.departments:
    for dept_payload in payload.departments:
        challan_dept = ChallanDepartment(
            challan_id=challan.id,
            dept_id=dept_payload.dept_id,
            soiled_weight=dept_payload.soiled_weight,
        )
        db.add(challan_dept)
        await db.flush()

        # 3. For each item in dept_payload.items:
        for ip in dept_payload.items:
            ci = ChallanItem(
                challan_dept_id=challan_dept.id,
                item_id=ip.item_id,
                qty=ip.qty,
                damaged_qty=ip.damaged_qty,
                applied_damage_delta=0,
            )
            db.add(ci)
            # Ledger: balance.qty_in_laundry += ip.qty
            balance = await _get_or_create_balance(db, payload.hotel_id, dept_payload.dept_id, ip.item_id)
            balance.qty_in_laundry += ip.qty

    await db.commit()
    await db.refresh(challan)
    return challan
```

#### `submit_delivery` changes:

Same structure but:
- Validate pickup exists (same `challan_number` + `hotel_id`, type PICKUP).
- For each dept: validate `delivery_qty <= qty_in_laundry` per item.
- Store `fresh_weight` instead of `soiled_weight` on `ChallanDepartment`.
- Compute `damage_delta` per item as before.
- Ledger: `qty_in_laundry -= qty`, `total_damaged_by_laundry += damage_delta`.

#### `edit_challan` changes:

- Reversal must iterate `challan.departments` -> `dept.items` (two levels).
- Re-application must process the new `departments[]` payload.
- The `soiled_weight` update moves from challan level to per-department.

### Modified Endpoints

#### `POST /api/v1/challans/pickup`

**New request body:**
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

#### `POST /api/v1/challans/delivery`

**New request body:**
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

#### `PATCH /api/v1/challans/{challan_id}`

**New request body:**
```json
{
  "departments": [
    {
      "dept_id": "uuid",
      "soiled_weight": 26.00,
      "items": [
        {"item_id": "uuid", "qty": 55, "damaged_qty": 3}
      ]
    }
  ]
}
```

#### `GET /api/v1/challans/hotel/{hotel_id}` (history)

**Response changes:** Each `ChallanResponse` now has `departments[]` instead of `dept_id` + `items[]`.

#### `GET /api/v1/challans/hotel/{hotel_id}/pending-deliveries`

**Response enhancement:** Each pending pickup in the response should include the full `departments[].items[]` detail so the frontend can auto-fill the delivery form ("Deliver All" feature). This data is already loaded via `selectin` on the relationships — just ensure it's serialized.

---

## Change 2: Fresh Weight (Third Weight Type)

### Problem

Currently there are two weight types: SOILED (actual scale weight at pickup) and CALCULATED (sum of `item_qty x calculated_weight_per_item`). Hotels also want to track the weight of clean/fresh linen at delivery time, and optionally bill by it.

### Schema Changes

#### `WeightSource` Enum

```python
class WeightSource(str, enum.Enum):
    SOILED = "SOILED"
    CALCULATED = "CALCULATED"
    FRESH = "FRESH"            # NEW
```

This enum is used on `Department.weight_source` (the default billing weight for that department) and as the `weight_mode` query parameter on the billing endpoint.

#### `challan_departments` Table

The `fresh_weight` column is already included in Change 1 above. It is:
- `NULL` for PICKUP challans (pickups don't have fresh weight).
- A `Numeric(10,2)` for DELIVERY challans (the scale weight of clean linen being returned).

### Billing Service Changes: `billing_service.py`

#### New helper: `_calc_fresh_weight`

```python
async def _calc_fresh_weight(db, hotel_id, dept_id, ts_start, ts_end) -> Decimal:
    """Sum fresh_weight from DELIVERY challan_departments within date range."""
    result = await db.execute(
        select(func.coalesce(func.sum(ChallanDepartment.fresh_weight), 0))
        .join(Challan, ChallanDepartment.challan_id == Challan.id)
        .where(
            Challan.challan_type == ChallanType.DELIVERY,
            Challan.hotel_id == hotel_id,
            ChallanDepartment.dept_id == dept_id,
            Challan.entry_timestamp >= ts_start,
            Challan.entry_timestamp <= ts_end,
        )
    )
    return result.scalar() or Decimal("0")
```

#### Modified `calculate_billing` — WEIGHT branch

```python
# Existing:
soiled_w = await _calc_soiled_weight(...)
calc_w = await _calc_calculated_weight(...)

# New:
fresh_w = await _calc_fresh_weight(...)

# Determine effective weight:
if weight_mode == "FRESH":
    subtotal = fresh_w * rate
elif weight_mode == "CALCULATED":
    subtotal = calc_w * rate
else:  # SOILED (default)
    subtotal = soiled_w * rate
```

#### Modified `DepartmentBilling` response

Add three new fields:
```python
class DepartmentBilling(BaseModel):
    # ... existing fields ...
    fresh_weight_kg: Optional[float] = None
    fresh_subtotal: Optional[float] = None
    # total_weight_kg and subtotal still reflect the effective mode
```

### Endpoint Changes

#### `GET /api/v1/reports/billing`

**Query param change:** `weight_mode` now accepts `"SOILED"`, `"CALCULATED"`, or `"FRESH"`.

**Response change for WEIGHT departments:**
```json
{
  "dept_name": "Housekeeping",
  "billing_type": "WEIGHT",
  "rate_per_kg": 3.0,
  "soiled_weight_kg": 45.0,
  "soiled_subtotal": 135.0,
  "calculated_weight_kg": 61.5,
  "calculated_subtotal": 184.5,
  "fresh_weight_kg": 43.0,
  "fresh_subtotal": 129.0,
  "total_weight_kg": 45.0,
  "subtotal": 135.0
}
```

---

## Change 3: Dashboard Shows Weight Instead of Item Count

### Problem

The current dashboard shows `total_items_in_laundry` (a piece count). Hotels care more about total weight since billing is weight-based.

### Endpoint Changes

#### `GET /api/v1/dashboards/super-admin`

**Modified response:**
```json
{
  "total_items_in_laundry": 735,
  "total_weight_in_laundry_kg": 1250.5,
  "total_hotels": 12,
  "recent_challans": [...]
}
```

**Implementation:** Join `LiveInventoryBalance` with `DeptItemConfig` to compute:
```sql
SUM(live_inventory_balance.qty_in_laundry * dept_item_config.calculated_weight)
```

Keep `total_items_in_laundry` for backward compatibility but add `total_weight_in_laundry_kg`.

#### `GET /api/v1/live-tracking/hotel/{hotel_id}`

**Enhancement:** Add `total_weight_kg` per department in the response:
```json
{
  "hotel_id": "...",
  "departments": [
    {
      "dept_name": "Housekeeping",
      "total_weight_kg": 245.5,
      "items": [
        {"item_name": "Bedsheet", "qty_in_laundry": 45, "total_damaged_by_laundry": 2, "weight_kg": 22.5}
      ]
    }
  ]
}
```

Where `weight_kg` per item = `qty_in_laundry * calculated_weight` (from `DeptItemConfig`).

---

## Change 4: Detailed Challan-Wise Billing

### Problem

The current billing endpoint returns a **summary** grouped by department. Hotels also want a **detailed** view showing billing broken down by individual challan (date-sorted), with department subtotals per challan.

### New Endpoint

#### `GET /api/v1/reports/billing/detailed`

**Query params:** Same as `/reports/billing` — `start_date`, `end_date`, `hotel_id?`, `weight_mode?`.

**Response structure:**

```json
{
  "period": {"start": "2026-03-01", "end": "2026-03-15"},
  "hotels": [
    {
      "hotel_name": "Hotel Sunrise",
      "challans": [
        {
          "challan_number": "CN-001",
          "challan_type": "PICKUP",
          "entry_timestamp": "2026-03-14T10:32:00Z",
          "agent_name": "Rajesh Kumar",
          "departments": [
            {
              "dept_name": "Housekeeping",
              "billing_type": "WEIGHT",
              "soiled_weight_kg": 25.5,
              "fresh_weight_kg": null,
              "calculated_weight_kg": 40.0,
              "rate_per_kg": 3.0,
              "subtotal": 76.5,
              "items": [
                {"item_name": "Bedsheet", "qty": 50, "rate": null, "subtotal": null},
                {"item_name": "Towel", "qty": 30, "rate": null, "subtotal": null}
              ]
            },
            {
              "dept_name": "Restaurant",
              "billing_type": "PIECE",
              "items": [
                {"item_name": "Napkin", "qty": 500, "rate": 0.75, "subtotal": 375.0}
              ],
              "subtotal": 375.0
            }
          ],
          "challan_total": 451.5
        },
        {
          "challan_number": "CN-004",
          "challan_type": "PICKUP",
          "entry_timestamp": "2026-03-15T09:45:00Z",
          "departments": [...],
          "challan_total": 60.0
        }
      ],
      "damage_liability": 3.0,
      "grand_total": 508.5
    }
  ]
}
```

**Implementation notes:**
- Only PICKUP challans contribute to billing (same as current summary billing).
- Group by hotel -> sort challans by `entry_timestamp` ASC.
- For each challan, iterate its `ChallanDepartment` rows and compute billing per dept.
- WEIGHT depts: use `soiled_weight` or `calculated_weight` or `fresh_weight` based on `weight_mode`.
- PIECE depts: `SUM(qty * price_per_piece)` per item.
- `challan_total` = sum of dept subtotals for that challan.
- `grand_total` = sum of all challan_totals - damage_liability.

### Alternative: Single Endpoint with `?view=detailed`

Instead of a new endpoint, add a `view` query param to the existing billing endpoint:
- `GET /api/v1/reports/billing?view=summary` (default, current behavior)
- `GET /api/v1/reports/billing?view=detailed` (challan-wise)

This is simpler for the frontend — same endpoint, just different response shape based on `view`.

---

## Change 5: Pending Deliveries Enhancement (for "Deliver All")

### Problem

The "Deliver All" feature on the frontend needs the full item list from a pending pickup challan to auto-fill the delivery form. The current `pending-deliveries` endpoint returns `ChallanResponse` which already includes items, but with the multi-dept change, it needs to include the full `departments[].items[]` structure.

### Verification

Ensure `GET /api/v1/challans/hotel/{hotel_id}/pending-deliveries` returns `ChallanResponse` with eagerly loaded `departments` and `items` (via `selectin`). No new endpoint needed — just ensure the relationship loading works after the schema change.

---

## Test Scenarios to Add/Update

### Multi-Department Challan Tests

```python
# test_challan.py updates

async def test_multi_dept_pickup():
    """Pickup with 2 departments in one challan."""
    # Seed: hotel + 2 depts (HK weight, Restaurant piece) + items
    # POST pickup with departments: [{HK, soiled=25, items=[bedsheet:50]}, {Restaurant, items=[napkin:500]}]
    # Assert: 201, challan has 2 departments, ledger updated for both

async def test_multi_dept_delivery():
    """Delivery against a multi-dept pickup."""
    # Create multi-dept pickup
    # POST delivery with same CN, departments: [{HK, fresh=24, items=[bedsheet:45]}, {Restaurant, items=[napkin:480]}]
    # Assert: 201, ledger: HK bedsheet qty=5, Restaurant napkin qty=20

async def test_multi_dept_over_delivery():
    """Over-delivery in one dept doesn't affect other depts."""
    # Create pickup: HK bedsheet:30, Restaurant napkin:100
    # Attempt delivery: HK bedsheet:50 (over!), Restaurant napkin:80
    # Assert: 400, entire request rejected, both depts' ledgers unchanged

async def test_multi_dept_edit():
    """Edit a multi-dept challan."""
    # Create multi-dept pickup
    # PATCH: change HK bedsheet 50->60, add new dept Spa with bathrobe:20
    # Assert: ledger reversed for old, applied for new
```

### Fresh Weight Tests

```python
async def test_delivery_with_fresh_weight():
    """Delivery stores fresh_weight per department."""
    # Pickup HK soiled=25kg
    # Delivery HK fresh=23kg
    # Assert: challan_dept.fresh_weight == 23

async def test_billing_fresh_weight_mode():
    """Billing uses fresh weight when weight_mode=FRESH."""
    # Seed: pickup with soiled=25kg, delivery with fresh=23kg
    # GET billing with weight_mode=FRESH
    # Assert: subtotal uses fresh_weight from delivery challans (but billing only counts PICKUP for qty...)
    # NOTE: Fresh weight comes from DELIVERY challans, so the billing service
    # must handle this differently — it sums fresh_weight from deliveries, not pickups.
```

### Dashboard Weight Tests

```python
async def test_dashboard_includes_weight():
    """Dashboard returns total_weight_in_laundry_kg."""
    # Seed: inventory + dept_item_config with calculated_weight
    # GET dashboard
    # Assert: total_weight_in_laundry_kg == sum(qty * calculated_weight)
```

### Detailed Billing Tests

```python
async def test_detailed_billing_structure():
    """Detailed billing returns challan-wise breakdown."""
    # Seed: 2 multi-dept pickups on different dates
    # GET billing?view=detailed
    # Assert: response has challans sorted by date, each with dept breakdowns

async def test_detailed_billing_challan_totals():
    """Each challan's total matches sum of its dept subtotals."""
    # Assert: challan_total == sum(dept.subtotal for dept in challan.departments)

async def test_detailed_billing_grand_total():
    """Grand total matches sum of all challans minus damage."""
    # Assert: grand_total == sum(challan_totals) - damage_liability
```

---

## Migration Checklist

1. [ ] Create `ChallanDepartment` model in `app/models/challan.py`
2. [ ] Update `Challan` model — remove `dept_id`, `soiled_weight`; add `departments` relationship
3. [ ] Update `ChallanItem` model — replace `challan_id` with `challan_dept_id`
4. [ ] Add `FRESH` to `WeightSource` enum
5. [ ] Generate and review Alembic migration (data migration for existing rows!)
6. [ ] Update `app/schemas/challan.py` — all request/response models
7. [ ] Update `app/services/challan_service.py` — submit_pickup, submit_delivery, edit_challan
8. [ ] Update `app/services/billing_service.py` — add `_calc_fresh_weight`, update WEIGHT branch, add detailed view
9. [ ] Update `app/api/v1/challans.py` — adjust all endpoints for new payload shapes
10. [ ] Update `app/api/v1/dashboards.py` — add `total_weight_in_laundry_kg`
11. [ ] Update `app/api/v1/tracking.py` — add per-item and per-dept weight info
12. [ ] Update `app/api/v1/reports.py` — add `view` param, `FRESH` weight_mode
13. [ ] Update `app/schemas/reports.py` — add `fresh_weight_kg`, `fresh_subtotal`, detailed billing models
14. [ ] Update ALL test files — adjust for new payload structure
15. [ ] Run full E2E test suite with multi-dept scenarios
