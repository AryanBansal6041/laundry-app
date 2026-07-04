# LaundroTrack — Screen-by-Screen Design Specification

This document provides a comprehensive design specification for every screen in the LaundroTrack Flutter app. It covers layout, components, data requirements, API calls, error states, platform differences, and designer notes.

All HTML mockups are in the `mockups/` directory.

---

## Table of Contents

1. [Design System](#design-system)
2. [Login Screen](#1-login-screen)
3. [Agent Home](#2-agent-home)
4. [Department Selection](#3-department-selection)
5. [Pickup Form](#4-pickup-form)
6. [Delivery Form](#5-delivery-form)
7. [Challan Detail](#6-challan-detail)
8. [Challan History](#7-challan-history)
9. [Pending Deliveries](#8-pending-deliveries)
10. [Pending Sync (Offline Queue)](#9-pending-sync-offline-queue)
11. [Hotel Admin Dashboard](#10-hotel-admin-dashboard)
12. [Live Inventory](#11-live-inventory)
13. [Hotel Billing Report](#12-hotel-billing-report)
14. [Damage Report](#13-damage-report)
15. [Super Admin Dashboard](#14-super-admin-dashboard)
16. [Hotels CRUD](#15-hotels-crud)
17. [Hotel Detail](#16-hotel-detail)
18. [Users CRUD](#17-users-crud)
19. [Agent-Hotel Mapping](#18-agent-hotel-mapping)
20. [Super Admin Billing](#19-super-admin-billing)
21. [Items & Department-Item Linking](#20-items--department-item-linking)
22. [Backend Requirements & Missing Endpoints](#backend-requirements--missing-endpoints)

---

## Design System

### Colors

| Token | Hex | Usage |
|---|---|---|
| `--primary` | `#1A237E` | App bars, primary buttons, sidebar |
| `--primary-light` | `#3949AB` | Hover states, active nav items |
| `--accent` | `#00897B` | Secondary actions, success states |
| `--pickup-blue` | `#1565C0` | Pickup badges, pickup submit button |
| `--delivery-green` | `#2E7D32` | Delivery badges, delivery submit button |
| `--weight-chip` | `#1565C0` | WEIGHT billing type chip background |
| `--piece-chip` | `#2E7D32` | PIECE billing type chip background |
| `--soiled-chip` | `#00897B` | SOILED weight source chip |
| `--calculated-chip` | `#7B1FA2` | CALCULATED weight source chip |
| `--fresh-chip` | `#0277BD` | FRESH weight source chip |
| `--damage-red` | `#C62828` | High damage indicators, errors |
| `--damage-yellow` | `#F9A825` | Medium damage indicators, warnings |
| `--damage-green` | `#43A047` | No damage, online status |
| `--offline-red` | `#E53935` | Offline banner, failed sync |
| `--bg-light` | `#F5F5F5` | Page background |
| `--card-bg` | `#FFFFFF` | Card background |
| `--text-primary` | `#212121` | Primary text |
| `--text-secondary` | `#757575` | Secondary/muted text |
| `--border` | `#E0E0E0` | Card borders, dividers |

### Typography

| Style | Size | Weight | Usage |
|---|---|---|---|
| Heading 1 | 24sp | Bold (700) | Page titles |
| Heading 2 | 20sp | Semi-bold (600) | Section headers |
| Heading 3 | 16sp | Semi-bold (600) | Card titles |
| Body | 14sp | Regular (400) | General text |
| Caption | 12sp | Regular (400) | Timestamps, hints |
| Stat Value | 32sp | Bold (700) | Dashboard numbers |

### Spacing

| Token | Value | Usage |
|---|---|---|
| `--space-xs` | 4dp | Inline spacing |
| `--space-sm` | 8dp | Between related items |
| `--space-md` | 16dp | Card padding, section gaps |
| `--space-lg` | 24dp | Section padding (desktop) |
| `--space-xl` | 32dp | Page margins (desktop) |

### Component Patterns

| Component | Mobile | Tablet | Desktop/Web |
|---|---|---|---|
| Navigation | BottomNavigationBar | NavigationRail (left) | Sidebar (220px, dark) |
| App bar | Platform-adaptive | Same as mobile | Breadcrumb bar |
| Lists | Card-based, full-width | Card or DataTable | DataTable with actions |
| Forms | Full-screen, scrollable | Centered (max 600px) | Dialog or side panel |
| Filters | Horizontal chip scroll | Horizontal row | Inline row with dropdowns |
| Empty states | Centered illustration | Same | Same, wider |

### Platform-Specific Adaptations

| Aspect | iOS | Android | Web |
|---|---|---|---|
| Font | SF Pro Display | Roboto | Inter |
| Text fields | Rounded rect, cupertino | Material Outlined | Material Outlined |
| Buttons | iOS rounded, system blue | FilledButton + ripple | Standard filled/outlined |
| Date picker | CupertinoDatePicker | Material DateRangePicker | Inline calendar |
| Dropdowns | CupertinoPicker wheel | DropdownMenu | Searchable dropdown |
| Touch targets | 44x44pt minimum | 48x48dp minimum | Standard click targets |
| Pull-to-refresh | CupertinoSliverRefresh | RefreshIndicator | Not needed (auto-refresh) |

---

## 1. Login Screen (Google Sign-In)

**File:** `mockups/login.html`
**Route:** `/login`
**Roles:** All
**API:** `POST /api/v1/auth/google`

### Layout

- **Mobile (iOS/Android):** Centered layout, full-width within 16dp padding. Logo at top, tagline, Google Sign-In button, error area below.
- **Web/Desktop:** Centered card (max-width 400px) with elevation shadow on a gradient background. Optional: split layout with brand illustration on left half.

### Components

| Component | Details |
|---|---|
| Logo | LaundroTrack branding, ~80px height |
| Tagline | "Commercial Laundry Management" subtitle below logo |
| Google Sign-In button | Standard Google-branded button ("Sign in with Google"), full-width on mobile, centered on web. Uses `google_sign_in` package. |
| Error display | Inline red text below button, or snackbar |
| Version | Small caption at bottom |

### States

| State | Behavior |
|---|---|
| Default | Google Sign-In button enabled, no errors shown |
| Loading | Button disabled, shows circular progress indicator while authenticating |
| Error: Cancelled | Grey text: "Sign-in was cancelled" (dismisses after 3s) |
| Error: No account | Red text: "No account found for this email. Contact your administrator to get access." |
| Error: Account inactive | Red text: "Your account has been deactivated. Contact your administrator." |
| Error: Network | Red text: "Unable to connect. Check your internet connection." |
| Success | Navigate to role-appropriate home (no visible state — instant redirect) |

### Data Flow

1. User taps "Sign in with Google".
2. Google OAuth flow opens (native on mobile, popup on web).
3. User selects their Google account.
4. App receives `GoogleSignInAccount` with `idToken`.
5. `POST /api/v1/auth/google` with `{"id_token": "<google-id-token>"}`.
6. Backend verifies the ID token with Google, extracts email, looks up user by `google_email`.
7. Response: `{"access_token": "eyJ...", "token_type": "bearer"}`.
8. Decode JWT → extract `sub` (user_id), `role`, `hotel_id`, `exp`.
9. Store token in secure storage.
10. Redirect: `SUPER_ADMIN` → `/admin/dashboard`, `HOTEL_ADMIN` → `/hotel/dashboard`, `SERVICE_AGENT` → `/agent/home`.

### Designer Notes

- No username/password fields — the entire login is a single Google Sign-In tap. This simplifies the UI dramatically.
- The Google Sign-In button should follow Google's branding guidelines (white/dark background, Google "G" logo, specific font).
- On web, the OAuth popup flow may be blocked by popup blockers. Consider using redirect mode as fallback.
- On app restart, attempt `silentSignIn()` to restore the Google session without user interaction. If a valid app JWT is in secure storage and not expired, skip the login screen entirely.
- Consider adding a subtle loading animation on the logo while authenticating.
- The error "No account found" is safe to display because Google already authenticated the user — we're just telling them they don't have a LaundroTrack account.

### Backend Needs

- **New endpoint:** `POST /api/v1/auth/google` — accepts `{"id_token": "..."}`, verifies with Google, looks up user by email, returns app JWT.
- **Schema change:** Replace `username`/`hashed_password` on the users table with `google_email` (unique, indexed).
- See `BACKEND_CHANGES_GOOGLE_AUTH.md` for full backend migration details.

---

## 2. Agent Home

**File:** `mockups/agent_home.html`
**Route:** `/agent/home`
**Roles:** SERVICE_AGENT
**APIs:** `GET /api/v1/challans/hotel/{id}/pending-deliveries` (per hotel)

### Layout

- **Mobile only** (agents use phones in the field).
- Top: Greeting with agent name, network status banner.
- Pending sync card (if offline queue has items).
- List of assigned hotel cards.
- Bottom: 3-tab navigation (Home, History, Settings).

### Components

| Component | Details |
|---|---|
| Network banner | Red "Offline" / Green "Online" at very top |
| Greeting | "Hello, {displayName}" with role subtitle |
| Pending sync card | Yellow card if pending > 0: "{N} challans awaiting sync — View >" |
| Hotel card | Hotel name, address, pending deliveries count badge |
| Hotel actions | Two buttons per card: "New Pickup" (primary/blue), "Pending" (outlined) |
| Bottom nav | Home (active), History, Settings |

### States

| State | Behavior |
|---|---|
| Loading | Skeleton cards while fetching pending counts |
| Loaded | Hotel cards with pending delivery counts |
| Offline | Red banner, cached hotel data shown, pending sync card visible |
| Empty (no hotels) | Empty state: "No hotels assigned. Contact your administrator." |

### Data Flow

1. On mount: load assigned hotels from Drift cache.
2. For each hotel: `GET /api/v1/challans/hotel/{id}/pending-deliveries` → count results for badge.
3. Check Drift `PendingChallan` count for sync card.

### Designer Notes

- The agent's assigned hotels aren't available via a dedicated endpoint. They come from the cached form-schema data or can be inferred from pending-deliveries/history responses. Consider caching hotel IDs on first successful form-schema fetch.
- Pending delivery counts should refresh on screen focus (not just on mount).
- "New Pickup" button should be the most prominent action — it's the primary daily task.
- Consider adding a "last synced: 5 min ago" timestamp on each hotel card.

### Backend Needs

- **Missing:** `GET /api/v1/agent/hotels` — an endpoint that returns hotels assigned to the current agent. Currently, agents can only discover their hotels via form-schema or by knowing hotel IDs. This would simplify the home screen data loading significantly.
- **Missing:** A way to get pending delivery COUNT without fetching the full list. Consider adding a `?count_only=true` query param to the pending-deliveries endpoint.

---

## 3. Department Selection

**File:** `mockups/agent_department_select.html`
**Route:** `/agent/hotel/:hotelId/departments`
**Roles:** SERVICE_AGENT
**APIs:** `GET /api/v1/setup/hotels/{id}/form-schema` (cached)

### Layout

- Back arrow + hotel name in app bar.
- Operation type selector: PICKUP / DELIVERY toggle at top.
- List of department cards.

### Components

| Component | Details |
|---|---|
| Operation toggle | Segmented control: PICKUP (blue) / DELIVERY (green) at top |
| Department card | Name, billing type badge (WEIGHT/PIECE), weight source badge (if WEIGHT), price per kg (if WEIGHT), item count |
| Card tap action | Navigates to pickup or delivery form based on toggle |

### States

| State | Behavior |
|---|---|
| Loading | Skeleton cards (only on first load — cache is used after) |
| Loaded | Department cards from cached form-schema |
| Offline | Works fully from Drift cache, no degradation |

### Designer Notes

- The segmented control for PICKUP/DELIVERY should be sticky at the top when scrolling.
- Color the entire card border subtly based on selected operation: blue tint for pickup, green tint for delivery.
- Consider showing a tooltip or info icon explaining WEIGHT vs PIECE billing types for new agents.
- For DELIVERY: if there are no pending deliveries for a department, show the department card but with a "No pending pickups" note and disable it.

### Backend Needs

- None — form-schema endpoint provides all needed data.

---

## 4. Pickup Form (Multi-Department with Item Search)

**File:** `mockups/agent_pickup_form.html`
**Route:** `/agent/challan/pickup/:hotelId`
**Roles:** SERVICE_AGENT
**APIs:** `POST /api/v1/challans/pickup`

### Layout

- App bar: "Pickup — {Hotel Name}" with PICKUP badge.
- Scrollable form body with department sections.
- Sticky summary footer above submit button.

### Components

| Component | Details |
|---|---|
| Challan Number | Required text field, hint "e.g. CN-001" |
| Add Department button | Dropdown of hotel departments from form-schema. Each department can only appear once per challan. |
| Department section | Collapsible card per department: name + billing badge + remove (×) button |
| Soiled Weight | Per WEIGHT department: decimal field with "kg" suffix |
| Item search bar | Type-ahead search within each department's item list (filters by name) |
| Item rows | One per matching item: Item Name (label) + Qty field + Damaged Qty field |
| Qty stepper | Numeric field with -/+ buttons, min 0 |
| Damaged stepper | Same, default 0 |
| Dept subtotal | Per department: "N pieces · N damaged" |
| Summary footer | Grand total: "Total pieces: N across K departments · Total damaged: N" |
| Attach Photo | Camera icon button, optional |
| Submit button | Full-width, blue, "SUBMIT PICKUP" |

### Validation Rules

| Field | Rule | Error Message |
|---|---|---|
| Challan Number | Required, non-empty | "Challan number is required" |
| Departments | At least one department added | "Add at least one department" |
| Soiled Weight | If WEIGHT dept: must be > 0 when items have qty | "Enter the soiled weight" |
| Item Qty | >= 0 | "Quantity cannot be negative" |
| Damaged Qty | >= 0 and <= Qty | "Damaged cannot exceed total quantity" |
| At least one item | SUM(qty) > 0 across all departments | "Add at least one item" |

### Error States

| Error | Source | UX |
|---|---|---|
| Duplicate CN | 409/500 from backend | Inline error on CN field: "A pickup with this number already exists" |
| Network error | No connectivity | Save to offline queue, show snackbar |
| Server error | 500 | Generic error dialog with retry |

### Data Flow

1. Agent enters challan number.
2. Agent taps "Add Department" → selects from dropdown → department section appears with its items.
3. Agent can add more departments (multi-dept challan).
4. Per department: agent optionally enters soiled weight (WEIGHT depts), then fills item quantities.
5. Item search bar filters the item list within each department for quick entry.
6. On submit: builds `departments[]` payload with each department's items and weight.

### Designer Notes

- The +/- stepper buttons must be large (min 44x44) for field use with gloves or dirty hands.
- Consider a "quick entry" mode where tapping the qty shows a numpad overlay for fast number entry.
- The challan number field should remember the last prefix used (e.g., "CN-") and auto-increment the number.
- **Item search is critical** — departments may have 20+ items. The search bar should be sticky within each department section.
- The "Add Department" button should be prominent — possibly a FAB or a highlighted button between the CN field and the first department section.
- Department sections should be reorderable and individually collapsible/expandable.
- The soiled weight field position matters — it should be the first field in each WEIGHT department section.
- After successful submit, show a success animation (checkmark) and offer "Attach Photo" and "Create Another Pickup" actions.
- Color-code department section headers to differentiate WEIGHT (blue tint) vs PIECE (green tint) departments.

### Backend Needs

- **Required:** Backend must support multi-department challan structure (`departments[]` in request/response). See `BACKEND_CHANGES.md`.

---

## 5. Delivery Form (Multi-Department with Deliver-All & Item Search)

**File:** `mockups/agent_delivery_form.html`
**Route:** `/agent/challan/delivery/:hotelId`
**Roles:** SERVICE_AGENT
**APIs:** `GET /api/v1/challans/hotel/{id}/pending-deliveries`, `POST /api/v1/challans/delivery`

### Layout

- App bar: "Delivery — {Hotel Name}" with DELIVERY badge (green).
- Challan number dropdown at top.
- **"Deliver All" button** — prominent action after CN selection.
- Multi-department sections auto-populated from selected pickup.
- Fresh weight field per WEIGHT department.
- Sticky summary footer above submit button.

### Components

| Component | Details |
|---|---|
| CN dropdown | Dropdown of pending pickup challan numbers |
| Deliver All button | Green outlined button: "DELIVER ALL ITEMS" — copies all pickup quantities into delivery fields |
| Department section | Collapsible card per department (auto-populated from pickup): name + billing badge |
| Fresh Weight | Per WEIGHT department: decimal field with "kg" suffix, label "Fresh Weight (kg)" |
| Item search bar | Type-ahead search within each department's item list |
| Item rows | Item Name + "Picked: N" reference + Deliver Qty field + Damaged Qty field + "In laundry: N" hint |
| Dept subtotal | Per department: "N delivering · N damaged" |
| Summary footer | Grand total: "Total delivering: N across K departments · Total damaged: N" |
| Submit button | Full-width, green, "SUBMIT DELIVERY" |

### Key Differences from Pickup

| Aspect | Pickup | Delivery |
|---|---|---|
| CN input | Free text | Dropdown of pending pickup CNs |
| Auto-populate | Manual entry | Departments + items from pickup; "Deliver All" copies quantities |
| Weight field | Soiled Weight (pickup scale) | Fresh Weight (delivery scale) |
| Qty reference | None | "Picked: N" and "In laundry: N" per item |
| Color accent | Blue | Green |
| Submit text | "SUBMIT PICKUP" | "SUBMIT DELIVERY" |
| Error: over-deliver | N/A | Inline per-item: "Only {N} in laundry" |

### "Deliver All" Flow

1. Agent selects a pending pickup CN from dropdown.
2. Department sections auto-appear with items from the pickup challan.
3. Agent taps **"Deliver All"** → all deliver qty fields are set to the pickup qty for each item.
4. Agent can then **adjust** any individual qty or damaged qty before submitting.
5. This covers the common case where everything picked up is returned.

### Error States

| Error | Source | UX |
|---|---|---|
| Over-delivery | 400 from backend | Parse error detail, highlight specific item row in red with message |
| No pickup found | 400 from backend | Should not happen with dropdown, but show alert |
| Network error | No connectivity | Save to offline queue |

### Designer Notes

- When a pending pickup CN is selected, **auto-populate all department sections and items** from the pickup data. The pending-deliveries endpoint must return full `departments[].items[]` for this to work.
- The **"Deliver All" button** should be visually prominent — it's the most common action. Consider making it a full-width button right below the CN dropdown.
- **Fresh Weight** is the new third weight type — the scale weight of clean linen being delivered back. It should be labeled clearly: "Fresh Weight (kg) — weight of clean linen".
- **Item search** is especially useful here since the agent may only need to adjust a few items after "Deliver All".
- The "In laundry" hint should come from the live tracking endpoint. If offline, use the last cached value with a "may be outdated" note.
- Visually, delivery should feel distinct from pickup — green header, green submit button, green badges — so agents don't accidentally submit the wrong type.
- The over-delivery error must clearly identify WHICH item failed. The backend returns a string like "Cannot deliver 50 of item {uuid}; only 30 in laundry". The frontend needs to parse this and map the UUID to the item name.

### Backend Needs

- **Required:** Backend must support multi-department challan structure. See `BACKEND_CHANGES.md`.
- **Required:** Pending deliveries endpoint must return full `departments[].items[]` detail for "Deliver All" to work.
- **Required:** Backend must accept `fresh_weight` per department on delivery challans.
- **Enhancement needed:** Structured over-delivery error object `{"item_id": "...", "item_name": "...", "requested": 50, "available": 30}`.

---

## 6. Challan Detail (Multi-Department View)

**File:** `mockups/agent_challan_detail.html`
**Route:** `*/challan/:challanId`
**Roles:** All (each role sees their own scope)
**APIs:** Data comes from the list that navigated here (no separate detail endpoint)

### Layout

- Header: challan type badge, challan number, hotel, agent, timestamp.
- Edit indicator (if edited).
- **Department sections** — one collapsible section per department in the challan.
- Image thumbnail (if attached).
- Edit button (conditional).

### Components

| Component | Details |
|---|---|
| Type badge | PICKUP (blue) or DELIVERY (green) |
| Challan number | Large, prominent |
| Metadata | Hotel name, agent name, timestamp |
| Edit badge | "Edited {date}" gray badge, only if `last_edited_at` is set |
| Dept section header | Department name + billing type badge (WEIGHT/PIECE) |
| Soiled weight | Per WEIGHT dept on PICKUP: card with "25.5 kg" |
| Fresh weight | Per WEIGHT dept on DELIVERY: card with "24.0 kg" |
| Items table | Per department: Item Name, Qty, Damaged Qty columns + dept subtotal row |
| Grand total row | Total pieces and damaged across all departments |
| Image | Thumbnail from S3, tap to view full-screen |
| Edit button | "Edit Challan" — visible based on rules |
| Edit countdown | "Editable for 21h 28m" — for non-super-admin |

### Edit Button Visibility

| Role | Within 24h | After 24h |
|---|---|---|
| SERVICE_AGENT | Visible, active | Visible, disabled, tooltip "Can only edit within 24 hours" |
| HOTEL_ADMIN | Visible, active | Visible, disabled, tooltip |
| SUPER_ADMIN | Visible, active | Visible, active (no time limit) |

### Designer Notes

- For PICKUP detail: show a **"Deliver All"** action button that navigates to the delivery form with this CN pre-selected and all quantities auto-filled. Also show a plain "Create Delivery" button for manual entry.
- Multi-department layout: each department is a collapsible `ExpansionTile` with its own items table. Start all expanded.
- For DELIVERY detail with WEIGHT depts: show both the soiled weight (from the corresponding pickup) and fresh weight side-by-side as a comparison. Label: "Soiled: 25.5 kg → Fresh: 24.0 kg".
- Consider a "Share" button that generates a text summary for WhatsApp/SMS sharing.
- The image viewer should support pinch-to-zoom on mobile.
- Show the 24h countdown as a live updating timer for urgency.

### Backend Needs

- **Missing:** `GET /api/v1/challans/{challan_id}` — a dedicated detail endpoint.
- **Missing:** Agent name is not in `ChallanResponse` — only `agent_id` (UUID). Consider adding `agent_name`.

---

## 7. Challan History

**File:** `mockups/agent_challan_history.html`
**Route:** `*/history` or `*/challans`
**Roles:** All
**APIs:** `GET /api/v1/challans/hotel/{id}?dept_id=&challan_type=&start_date=&end_date=&page=&page_size=`

### Layout

- Filter bar at top (collapsible on mobile).
- Result count.
- Paginated card list (mobile) or DataTable (web).
- Infinite scroll or "Load more" button.

### Filters

| Filter | Type | Values |
|---|---|---|
| Department | Dropdown | All departments from form-schema |
| Challan Type | Segmented | All / PICKUP / DELIVERY |
| Date Range | Date picker | Start + End date |

### List Item Card (Mobile)

```
┌────────────────────────────────┐
│ CN-007  [PICKUP 🔵]            │
│ Housekeeping                   │
│ Mar 15, 2026 · 9:45 AM        │
│ 85 pieces · 25.5 kg           │
└────────────────────────────────┘
```

### DataTable (Web)

| CN | Type | Department | Date | Pieces | Weight | Actions |
|---|---|---|---|---|---|---|
| CN-007 | PICKUP | Housekeeping | Mar 15, 9:45a | 85 | 25.5 kg | View |

### Designer Notes

- Default sort: newest first (`entry_timestamp DESC`).
- The filter bar on mobile should be collapsible — show a "Filters" button that expands the filter section. Show a badge on the button when filters are active.
- Pagination: prefer infinite scroll on mobile, page controls on web.
- Add a search bar for challan number search (client-side filter on loaded data, or could be a future backend feature).

### Backend Needs

- **Enhancement:** Consider adding `challan_number` as a search/filter query param to the history endpoint.
- **Missing:** Agent name and department name are not in the response — only UUIDs. The frontend must maintain a local mapping. Consider adding `agent_name` and `dept_name` to `ChallanResponse`.

---

## 8. Pending Deliveries (with Deliver-All)

**File:** `mockups/agent_pending_deliveries.html`
**Route:** `*/pending-deliveries`
**Roles:** SERVICE_AGENT, HOTEL_ADMIN
**APIs:** `GET /api/v1/challans/hotel/{id}/pending-deliveries`

### Layout

- Count header: "N pickups awaiting delivery".
- Card list of pending pickup challans (now showing multi-dept info).
- Each card has "View", "Create Delivery", and **"Deliver All"** actions.

### Card Design (Multi-Department)

```
┌────────────────────────────────────┐
│ CN-007                    [PICKUP] │
│ Housekeeping [WEIGHT] · 85 pcs    │
│ Restaurant [PIECE] · 500 pcs      │
│ Picked: Mar 15, 9:45 AM           │
│ Total: 585 pieces · 25.5 kg       │
│ ⏱️ Pending for 2 days              │
│                                    │
│ [View] [Create Delivery] [Deliver All] │
└────────────────────────────────────┘
```

### Age Indicators

| Age | Color | Label |
|---|---|---|
| < 24h | Green | "Pending for {N} hours" |
| 1–3 days | Yellow/Amber | "Pending for {N} days" |
| > 3 days | Red | "Overdue: {N} days" |

### "Deliver All" vs "Create Delivery"

| Action | Behavior |
|---|---|
| **Deliver All** | Opens delivery form with CN pre-selected AND all department quantities auto-filled from the pickup. Agent reviews/adjusts, then submits. |
| Create Delivery | Opens delivery form with CN pre-selected but all quantities blank for manual entry. |

### Designer Notes

- This is a critical workflow screen — agents check it at the start of each shift to know what deliveries are expected.
- **"Deliver All" should be the most prominent action** — it's the fastest path for the common case.
- Each card now shows multiple departments as a list. If the challan has 3+ departments, show the first two and a "+N more" badge.
- Consider sorting by age (oldest first) to prioritize overdue items.
- On mobile, make the "Deliver All" button full-width at the bottom of each card for easy tapping. "Create Delivery" and "View" can be smaller text buttons.
- The total piece count and weight aggregate across all departments.

### Backend Needs

- **Required:** Pending deliveries response must include full `departments[].items[]` detail for the "Deliver All" feature to auto-populate the delivery form. See `BACKEND_CHANGES.md`.

---

## 9. Pending Sync (Offline Queue)

**File:** `mockups/agent_pending_sync.html`
**Route:** `/agent/pending-sync`
**Roles:** SERVICE_AGENT
**APIs:** Local Drift only (no backend calls)

### Layout

- Network status banner.
- Count: "N challans pending".
- Card list of queued challans.
- "Sync Now" button (manual trigger).

### Card States

| Status | Badge Color | Actions |
|---|---|---|
| pending | Yellow | Delete |
| syncing | Blue (animated) | None (in progress) |
| failed | Red | Retry, Delete |

### Failed Card Extra Content

```
┌────────────────────────────────┐
│ 🔴 FAILED                      │
│ CN-005 · DELIVERY              │
│ Hotel Grand · Spa              │
│ Saved: 1 hour ago              │
│                                │
│ ⚠️ Cannot deliver 50 of       │
│ Bathrobe; only 20 in laundry  │
│                                │
│ [Retry]              [Delete]  │
└────────────────────────────────┘
```

### Designer Notes

- "Sync Now" button at the top should be disabled when offline.
- Deleting a pending challan should show a confirmation dialog — this action loses data.
- Consider showing an expandable view of the full payload so the agent can verify the data before retrying.
- When a sync is in progress, show a linear progress indicator at the top of the screen.

### Backend Needs

- None — this is entirely local storage.

---

## 10. Hotel Admin Dashboard (Weight-First Metrics)

**File:** `mockups/hotel_dashboard.html`
**Route:** `/hotel/dashboard`
**Roles:** HOTEL_ADMIN
**APIs:** `GET /api/v1/live-tracking/hotel/{id}`, `GET /api/v1/challans/hotel/{id}?page_size=10`

### Layout

- **Mobile:** Stat cards (2 across, top row = weight), recent activity list, bottom nav with 5 tabs.
- **Tablet:** NavigationRail on left, stat cards in row, recent activity as DataTable.

### Stat Cards

| Card | Value Source | Display | Icon |
|---|---|---|---|
| **Total Weight in Laundry** (PRIMARY) | `SUM(qty_in_laundry × calculated_weight)` from live tracking | Large bold "1,250.5 kg" | ⚖️ |
| Items in Laundry (secondary) | `SUM(qty_in_laundry)` from live tracking | Smaller "735 items" | 📦 |
| Damaged Items | `SUM(total_damaged_by_laundry)` from live tracking | "23 items" | ⚠️ |

### Weight Breakdown (below stat cards)

- Per-department weight bar showing department name and weight contribution:
  - "Housekeeping: 450.2 kg (36%)"
  - "Restaurant: 380.0 kg (30%)"
  - "Spa: 420.3 kg (34%)"
- Visual: horizontal stacked bar chart or individual progress bars.

### Recent Activity

Timeline-style list of last 10 challans:
- Type badge (PICKUP/DELIVERY)
- Challan number
- Departments (comma-separated, since multi-dept)
- Agent name
- Timestamp
- Total pieces + total weight (for WEIGHT depts)

### Designer Notes

- **Weight is now the primary metric** — it should be the largest, most prominent stat card. Item count becomes secondary.
- The weight breakdown chart gives hotel admins a quick view of which departments contribute most to their laundry load.
- Consider adding a donut chart showing breakdown of weight by department.
- "Quick Actions" section: "View Pending Deliveries", "Generate Report".
- Pull-to-refresh on mobile.
- Auto-refresh every 60 seconds on the dashboard.
- The weight value requires `calculated_weight` from `DeptItemConfig` — the live tracking endpoint must include this or the frontend must compute it from cached form-schema data.

### Backend Needs

- **Required:** Live tracking endpoint should include `total_weight_kg` per department and `calculated_weight` per item. See `BACKEND_CHANGES.md`.
- **Missing:** Agent names in challan responses (only `agent_id` UUID is available).
- **Missing:** Department names in challan responses (only `dept_id` UUID is available).

---

## 11. Live Inventory

**File:** `mockups/hotel_live_inventory.html`
**Route:** `/hotel/inventory`
**Roles:** HOTEL_ADMIN (scoped), SUPER_ADMIN (any hotel)
**APIs:** `GET /api/v1/live-tracking/hotel/{id}`

### Layout

- **Mobile:** Search bar + ExpansionTile per department, Card per item inside.
- **Tablet:** Search bar + full DataTable.
- Auto-refresh indicator: "Updated 30s ago ⟳".

### Item Display

| Field | Description |
|---|---|
| Item Name | From response |
| Department | Group header (mobile) or column (tablet) |
| Qty in Laundry | Number with unit |
| Damaged by Laundry | Number + color indicator |

### Damage Color Coding

| Condition | Color | Indicator |
|---|---|---|
| `total_damaged_by_laundry == 0` | Green 🟢 | No damage |
| `damaged > 0 && damaged < qty * 0.1` | Yellow 🟡 | Low damage |
| `damaged >= qty * 0.1` | Red 🔴 | High damage |

### Designer Notes

- Items with 0 qty are NOT shown (backend filters them).
- When all items in a department have qty = 0, the department section won't appear.
- Consider adding a "total weight estimate" row: SUM(qty × calculated_weight) per department.
- Export to CSV button on tablet/web.
- The auto-refresh should be configurable or pausable to save battery.

### Backend Needs

- **Enhancement:** Consider adding `calculated_weight` per item to the live-tracking response so the frontend can compute estimated weight in laundry.

---

## 12. Hotel Billing Report (Summary + Detailed Views, Three Weight Types)

**File:** `mockups/hotel_billing.html`
**Route:** `/hotel/billing`
**Roles:** HOTEL_ADMIN
**APIs:** `GET /api/v1/reports/billing?hotel_id={id}&start_date=&end_date=&weight_mode=&view=summary|detailed`

### Layout

- **View toggle:** Summary (default) / Detailed — tabs or segmented control at top.
- Date range picker.
- Weight mode toggle (SOILED / CALCULATED / FRESH) — 3-way segmented control.
- Content area changes based on view toggle.
- Damage liability card.
- Grand total card.

### Summary View

**Department breakdown** using `ExpansionTile` per department:

**WEIGHT Department Expanded:**
```
Housekeeping [WEIGHT · SOILED]          Subtotal: ₹135.00
├─ Soiled Weight:     45.0 kg × ₹3.00/kg = ₹135.00  ✓ (active)
├─ Calculated Weight: 61.5 kg × ₹3.00/kg = ₹184.50
└─ Fresh Weight:      43.0 kg × ₹3.00/kg = ₹129.00
```

**PIECE Department Expanded:**
```
Restaurant [PIECE]                       Subtotal: ₹375.00
├─ Napkin       500 × ₹0.75 = ₹375.00
└─ Tablecloth    50 × ₹2.00 = ₹100.00
```

### Detailed View (Challan-Wise Billing)

Challans sorted by date (newest first):

```
┌─────────────────────────────────────────────────┐
│ CN-007 [PICKUP]  Mar 15, 2026 · 9:45 AM        │
│ Agent: Rajesh Kumar                              │
│                                                  │
│ Housekeeping [WEIGHT]                            │
│   Soiled: 25.5 kg × ₹3.00 = ₹76.50            │
│                                                  │
│ Restaurant [PIECE]                               │
│   Napkin    500 × ₹0.75 = ₹375.00              │
│                                                  │
│ Challan Total: ₹451.50                          │
├─────────────────────────────────────────────────┤
│ CN-004 [PICKUP]  Mar 14, 2026 · 2:15 PM        │
│ Agent: Suresh Patel                              │
│ ...                                              │
│ Challan Total: ₹60.00                           │
└─────────────────────────────────────────────────┘

Damage Liability: -₹3.00
═══════════════════════════════════
GRAND TOTAL: ₹508.50
```

### Designer Notes

- The **view toggle** (Summary vs Detailed) should be prominent at the top — this is a key new feature.
- The weight mode 3-way toggle should update the UI instantly without a new API call (all three values are in the response).
- Show a comparison callout: "Difference: Soiled ₹135 | Calc ₹184.50 | Fresh ₹129" to help admins compare billing methods.
- **Detailed view** is useful for auditing — hotel admins can verify billing challan by challan.
- In detailed view, each challan card should be collapsible/expandable.
- The grand total should be visually prominent (large font, card with accent background).
- **Fresh Weight** is a new concept — add a tooltip: "Fresh weight = scale weight of clean linen at delivery. Available only for delivery challans."
- Consider a "Download PDF" button for sharing with management.
- Damage liability: add an info tooltip explaining the deduction formula.

### Backend Needs

- **Required:** Backend must support `view=detailed` query param returning challan-wise billing. See `BACKEND_CHANGES.md`.
- **Required:** Backend must support `weight_mode=FRESH` returning fresh weight billing.
- **Design issue:** `damage_liability` is a raw piece count, not a monetary value. Flag to backend team.

---

## 13. Damage Report

**File:** `mockups/hotel_damage_report.html`
**Route:** `*/quality`
**Roles:** HOTEL_ADMIN (scoped), SUPER_ADMIN (all or filtered)
**APIs:** `GET /api/v1/quality-control/damages?hotel_id=&start_date=&end_date=`

### Layout

- Date range picker (affects only challan-based summary).
- Two distinct sections:
  1. **Period Damage Summary** — `challan_damage_summary` from response.
  2. **All-Time Totals** — `all_time_totals` from response.

### Section 1: Period Damage

| Column | Description |
|---|---|
| Hotel Name | (super admin only, hidden for hotel admin) |
| Item Name | From response |
| Net Damage | `applied_damage_delta` sum — attributed to laundry |

### Section 2: All-Time Totals

| Column | Description |
|---|---|
| Hotel Name | (super admin only) |
| Item Name | From response |
| Total Damaged | `total_damaged_by_laundry` from live ledger |

### Designer Notes

- Add an info banner explaining: "Net damage = items damaged at delivery minus items already damaged at pickup. Only the excess is attributed to the laundry."
- This explanation is critical — hotel admins may not understand the formula and may dispute the numbers.
- Consider a bar chart showing damage trend over time (weekly/monthly) using the period filter.
- Items with high damage should be highlighted in red and sorted to the top.
- On the super admin version, add a hotel filter dropdown.

### Backend Needs

- **Enhancement:** Consider adding a trend endpoint that returns damage aggregated by week/month for charting.

---

## 14. Super Admin Dashboard (Weight-First Metrics)

**File:** `mockups/admin_dashboard.html`
**Route:** `/admin/dashboard`
**Roles:** SUPER_ADMIN
**APIs:** `GET /api/v1/dashboards/super-admin`, `GET /api/v1/quality-control/damages`

### Layout (Web/Desktop)

- Sidebar navigation (persistent).
- Content: 4 stat cards in a row (weight is primary), 2-column layout below (chart + damage table), full-width recent challans table.

### Stat Cards

| Card | Source Field | Display | Icon |
|---|---|---|---|
| **Total Weight in Laundry** (PRIMARY) | `total_weight_in_laundry_kg` | Large bold "1,250.5 kg" | ⚖️ |
| Items in Laundry (secondary) | `total_items_in_laundry` | "735 items" | 📦 |
| Total Hotels | `total_hotels` | "12" | 🏨 |
| Challans Today | (derived — frontend calculation) | "28" | 📋 |

### Chart

- Line/bar chart: challans per day for last 30 days.
- Source: challan history with date filtering (frontend aggregation).

### Damage Red Flags Table

- Top items sorted by `total_damaged_by_laundry` DESC.
- Rows exceeding a threshold highlighted in red.

### Recent Challans Table

| Column | Description |
|---|---|
| Time | `entry_timestamp` formatted |
| CN | `challan_number` (but not in dashboard response — see backend needs) |
| Hotel | `hotel_name` |
| Agent | `agent_name` |
| Departments | Comma-separated dept names (multi-dept challan) |
| Type | PICKUP/DELIVERY badge |

### Designer Notes

- The dashboard should feel like a command center — use a dark sidebar, clean stat cards, and data-dense tables.
- **Weight is now the primary stat card** — it should be the largest and leftmost card.
- The chart should support hover tooltips on web.
- Consider adding quick filters on the recent challans table (by hotel, by type).
- "Challans Today" stat card requires frontend calculation — the dashboard endpoint doesn't provide this directly.
- Recent challans now show department names as a comma-separated list since a single challan can cover multiple departments.

### Backend Needs

- **Required:** Dashboard endpoint must include `total_weight_in_laundry_kg`. See `BACKEND_CHANGES.md`.
- **Missing:** `challan_number` is not in the `recent_challans` response.
- **Missing:** Challan type (PICKUP/DELIVERY) is not in the recent_challans response.
- **Enhancement:** Consider adding `challans_today` count to the dashboard endpoint.

---

## 15. Hotels CRUD

**File:** `mockups/admin_hotels.html`
**Route:** `/admin/hotels`
**Roles:** SUPER_ADMIN
**APIs:** `GET /api/v1/admin/hotels`, `POST /api/v1/admin/hotels`

### Layout (Web)

- Page header with "Add Hotel" button.
- Search bar.
- DataTable with all hotels.
- Modal dialog for hotel creation.

### DataTable Columns

| Column | Sortable | Description |
|---|---|---|
| Name | Yes | Hotel name |
| Address | No | Address text |
| Contact | No | Phone number |
| Created | Yes | `created_at` formatted |
| Actions | No | View detail button |

### Add Hotel Dialog

| Field | Type | Required | Validation |
|---|---|---|---|
| Name | Text | Yes | Non-empty |
| Address | Text | No | — |
| Contact Number | Tel | No | — |

### Designer Notes

- Add hotel count in the page header: "Hotels (12)".
- Consider adding inline status: "3 departments · 2 agents · 127 items in laundry" as a subtitle per row.
- The "View" action navigates to the hotel detail screen.

### Backend Needs

- **Missing:** `PUT /api/v1/admin/hotels/{id}` — no update endpoint exists. Cannot edit hotel name/address/contact.
- **Missing:** `DELETE /api/v1/admin/hotels/{id}` — no delete/deactivate endpoint.
- **Enhancement:** Add department count and assigned agent count to the hotel list response.

---

## 16. Hotel Detail

**File:** `mockups/admin_hotel_detail.html`
**Route:** `/admin/hotels/:hotelId`
**Roles:** SUPER_ADMIN
**APIs:** `GET /api/v1/setup/hotels/{id}/form-schema`, `POST /api/v1/setup/hotels/{id}/departments`, `POST /api/v1/admin/mappings`

### Layout (Web)

- Hotel info header.
- Two sections: Departments table, Assigned Agents table.
- Add Department and Assign Agent buttons.

### Designer Notes

- Clicking a department row navigates to the item-linking screen for that department.
- The "Assign Agent" action should show a dropdown of SERVICE_AGENT users who are NOT already assigned to this hotel.

### Backend Needs

- **Missing:** No endpoint to list agent-hotel mappings filtered by hotel. The frontend cannot show "Assigned Agents" for a specific hotel without fetching all mappings and filtering client-side.
- **Missing:** `DELETE /api/v1/admin/mappings/{id}` — no unassign endpoint.
- **Missing:** `GET /api/v1/admin/users` — no endpoint to list all users. The "Assign Agent" dropdown needs a list of SERVICE_AGENT users.

---

## 17. Users CRUD

**File:** `mockups/admin_users.html`
**Route:** `/admin/users`
**Roles:** SUPER_ADMIN
**APIs:** `POST /api/v1/admin/users`

### Layout (Web)

- DataTable of users with role filter.
- "Create User" button → dialog.

### Create User Dialog

| Field | Type | Required | Conditional |
|---|---|---|---|
| Google Email | Email input | Yes | Validated as email format |
| Role | Dropdown | Yes | — |
| Phone | Tel | No | — |
| Hotel | Dropdown | Yes for HOTEL_ADMIN | Shown only when role = HOTEL_ADMIN |

### Designer Notes

- No password field — users authenticate via Google Sign-In using the email registered here.
- Validate email format before submission. Consider showing a hint: "Enter the user's Google account email."
- Role badges: purple for SUPER_ADMIN, blue for HOTEL_ADMIN, orange for SERVICE_AGENT.
- Hotel dropdown should dynamically show/hide based on role selection.
- Consider adding an "Active" toggle per user for deactivation.

### Backend Needs

- **Missing:** `GET /api/v1/admin/users` — no list users endpoint. This is critical for the users screen and for agent/hotel admin dropdowns throughout the admin console.
- **Missing:** `PUT /api/v1/admin/users/{id}` — no update user endpoint.
- **Missing:** `PATCH /api/v1/admin/users/{id}/deactivate` — no deactivation endpoint.

---

## 18. Agent-Hotel Mapping

**File:** `mockups/admin_agent_mapping.html`
**Route:** `/admin/agents`
**Roles:** SUPER_ADMIN
**APIs:** `POST /api/v1/admin/mappings`

### Layout (Web)

- DataTable of current mappings.
- "Create Mapping" button → dialog.

### Designer Notes

- Group the table by agent for better readability.
- Consider a matrix/grid view: agents as rows, hotels as columns, checkboxes at intersections.

### Backend Needs

- **Missing:** `GET /api/v1/admin/mappings` — no list mappings endpoint.
- **Missing:** `DELETE /api/v1/admin/mappings/{id}` — no unassign endpoint.
- **Missing:** `GET /api/v1/admin/users?role=SERVICE_AGENT` — need to list agents for the dropdown.

---

## 19. Super Admin Billing (Summary + Detailed, Three Weight Types)

**File:** `mockups/admin_billing.html`
**Route:** `/admin/reports`
**Roles:** SUPER_ADMIN
**APIs:** `GET /api/v1/reports/billing?start_date=&end_date=&hotel_id=&weight_mode=&view=summary|detailed`

### Layout (Web)

- **View toggle:** Summary (default) / Detailed — tabs at top.
- Filter bar: date range + hotel dropdown + weight mode toggle (SOILED / CALCULATED / FRESH).
- Content changes based on view toggle.

### Summary View

- Expandable hotel sections, each with department breakdowns.
- Same 3-weight display as hotel billing (soiled / calculated / fresh with active highlight).
- Hotel leaderboard table sorted by revenue.

### Detailed View (Challan-Wise Billing)

- Per hotel: challans sorted by date.
- Each challan shows department breakdown with weight/piece billing.
- Challan totals and hotel grand totals.
- Useful for auditing across all hotels.

### Designer Notes

- Same as hotel billing but across all hotels, with additional hotel filter.
- **Detailed view** is especially powerful here — super admins can drill into any challan's billing for any hotel.
- Hotel leaderboard could be a horizontal bar chart for visual impact.
- Weight mode 3-way toggle with FRESH as the new option. Tooltip: "Fresh = delivery weight of clean linen."
- "Export All" button for CSV/PDF download.

### Backend Needs

- **Required:** Backend must support `view=detailed` and `weight_mode=FRESH`. See `BACKEND_CHANGES.md`.

---

## 20. Items & Department-Item Linking

**File:** `mockups/admin_items.html`
**Route:** `/admin/items` and `/admin/departments/:deptId/items`
**Roles:** SUPER_ADMIN
**APIs:** `GET /api/v1/setup/items`, `POST /api/v1/setup/items`, `POST /api/v1/setup/departments/{id}/items`

### Layout (Web)

- Two-panel or tabbed: Items Master list + Department-Item linking.
- Items Master: searchable table with "Add Item" button.
- Dept-Item Link: select department dropdown, show linked items, "Link Item" button.

### Designer Notes

- The "Link Item" dialog should change based on the department's billing type:
  - WEIGHT dept → show "Calculated Weight (kg)" field.
  - PIECE dept → show "Price per Piece" field.
- Consider drag-and-drop from items master to department.

### Backend Needs

- **Missing:** `DELETE /api/v1/setup/departments/{dept_id}/items/{item_id}` — no unlink endpoint.
- **Missing:** `PUT /api/v1/setup/items/{id}` — no rename item endpoint.

---

## Backend Requirements & Missing Endpoints

This section summarizes all backend endpoints and changes needed by the frontend. For detailed implementation specs, see `BACKEND_CHANGES.md`.

### Critical — New Feature Requirements (Blocking)

| Priority | Change | Description | Blocking Screen |
|---|---|---|---|
| P0 | Multi-department challan structure | `Challan` → `ChallanDepartment` → `ChallanItem` hierarchy. New `challan_departments` table. All challan endpoints restructured. | Pickup Form, Delivery Form, Challan Detail, all challan screens |
| P0 | Fresh weight support | Add `FRESH` to `WeightSource` enum. Add `fresh_weight` to `ChallanDepartment`. Update billing to support `weight_mode=FRESH`. | Delivery Form, Billing Report |
| P0 | Detailed billing view | Add `view=detailed` query param to billing endpoint returning challan-wise breakdown sorted by date. | Hotel Billing, Admin Billing |
| P0 | Dashboard weight metric | Add `total_weight_in_laundry_kg` to dashboard response. Add `total_weight_kg` per dept to live-tracking. | Hotel Dashboard, Admin Dashboard |
| P0 | Pending deliveries full detail | Ensure pending-deliveries response includes full `departments[].items[]` for "Deliver All" auto-population. | Delivery Form, Pending Deliveries |

### Critical — Pre-Existing Missing Endpoints

| Priority | Endpoint | Method | Description | Blocking Screen |
|---|---|---|---|---|
| P0 | `/api/v1/admin/users` | GET | List all users with optional role filter | Users CRUD, Agent dropdown, Admin dropdowns |
| P0 | `/api/v1/admin/mappings` | GET | List all agent-hotel mappings | Agent Mapping, Hotel Detail |
| P0 | `/api/v1/agent/hotels` | GET | List hotels assigned to current agent | Agent Home |

### Important (Degraded UX Without)

| Priority | Endpoint | Method | Description | Affected Screen |
|---|---|---|---|---|
| P1 | `/api/v1/admin/mappings/{id}` | DELETE | Remove agent-hotel mapping | Agent Mapping, Hotel Detail |
| P1 | `/api/v1/admin/users/{id}` | PUT/PATCH | Update user details / deactivate | Users CRUD |
| P1 | `/api/v1/admin/hotels/{id}` | PUT | Update hotel details | Hotels CRUD |
| P1 | `/api/v1/challans/{id}` | GET | Get single challan by ID | Challan Detail (deep links) |

### Nice to Have (Enhancement)

| Priority | Endpoint/Change | Description | Affected Screen |
|---|---|---|---|
| P2 | Add `agent_name`, `dept_name` to ChallanResponse | Avoid UUID lookups | All challan displays |
| P2 | Add `challan_number`, `challan_type` to dashboard recent_challans | More context | Super Admin Dashboard |
| P2 | Add `challans_today` to dashboard response | Stat card | Super Admin Dashboard |
| P2 | Structured over-delivery error | Return `{item_id, item_name, requested, available}` | Delivery Form error display |
| P2 | Add `count_only` param to pending-deliveries | Efficient count for badges | Agent Home |
| P2 | Add challan_number search to history | Quick lookup | Challan History |
| P2 | Monetary damage_liability in billing | Convert piece count to currency | Billing Report |
| P2 | Damage trend endpoint | Weekly/monthly aggregation | Damage Report chart |
| P2 | `DELETE /setup/departments/{dept_id}/items/{item_id}` | Unlink item from department | Items Management |
