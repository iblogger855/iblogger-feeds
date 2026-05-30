# Appendix A3: Wireframes & Screen Flows

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Low-fidelity, text-only** sketches of the key screens — enough to align on layout and flow, not final UI. Real visual design lives in a design tool (Figma), referenced from here when it exists. These show intent: what's on the screen and what the main action is.

These cover the four highest-traffic screens. Lower-traffic admin screens (suppliers, promotions setup, reports) follow the same patterns and are left to design.

---

## A3.1 Order Capture (Sales agent) — [Module 4](04-channels-orders.md)

```
┌──────────────────────────────────────────────┐
│  New Order                  Channel: [Facebook ▾]│
├──────────────────────────────────────────────┤
│  Customer                                       │
│   Phone/handle: [ @dara_____ ]  🔎  ← shows     │
│   ⓘ Returning customer · 4 orders · LTV $180    │
│   Name: [ Dara ]   Address: [ ............... ] │
├──────────────────────────────────────────────┤
│  Items                                          │
│   [+ Add item]                                  │
│   • Red Tee / L     x[2]   $25  (−$3) = $44     │
│   • LED Lamp        x[1]   $13         = $13     │
│                              Subtotal:    $57    │
│                              Tax:          $2    │
│                              TOTAL:       $59    │
├──────────────────────────────────────────────┤
│  Payment method: [ COD ▾ ]                      │
│  Notes: [ deliver after 5pm ]                   │
│                                                 │
│        [ Save Draft ]      [ Confirm Order ]    │
└──────────────────────────────────────────────┘
```
- Typing the handle shows customer history (NFR-13 mobile, NFR-14 ≤30s).
- "Confirm Order" reserves stock for stocked lines; blocks if oversell (OR-6).
- Manual discount per line is captured for margin (OR-7).

**Flow:** search/enter customer → add items → set payment method → Confirm → (stocked) Ready to Ship / (dropship) Awaiting Stock.

---

## A3.2 Live Capture (Host/agent during a live) — [Module 13](13-live-selling.md)

```
┌──────────────────────────────────────────────┐
│  LIVE: Friday Flash       ⏺ 00:42:13   Viewers 512│
├──────────────────────────────────────────────┤
│  Quick claim:                                   │
│   [ A1 ] [ @handle____ ] [ x1 ]   [ CLAIM ]     │
│   ↑ one line, hit enter → draft order created   │
├──────────────────────────────────────────────┤
│  Featured (allocated)                           │
│   A1  Red Tee L     ████░  3 left   12 claimed   │
│   A2  LED Lamp      ░░░░░  SOLD OUT  ⛔           │
│   A3  Phone Case    █████  20 left   2 claimed   │
├──────────────────────────────────────────────┤
│  Recent claims (32)                             │
│   @sok  A1 x1   ✓        @vinn A2 x1  ⛔waitlist │
│   @dara A3 x2   ✓        ...                     │
│                                                 │
│            [ End Live → generate orders ]        │
└──────────────────────────────────────────────┘
```
- Claim entry is one fast action, ≤5s (NFR-14, LV-2).
- Stock bar updates live; "SOLD OUT" blocks further claims (LV-3).
- Last-unit race → first wins, second flagged waitlist (LV-4).
- "End Live" turns drafts into orders + a payment-request list (LV-5).

---

## A3.3 Record Payment / Reconcile (Finance) — [Module 6](06-payments.md)

```
┌──────────────────────────────────────────────┐
│  Order #1042  ·  Total $59  ·  Status: PARTIAL  │
├──────────────────────────────────────────────┤
│  Payments                                       │
│   • Bank-ABA   $20   ✓ Confirmed (Chenda)       │
│   • COD        $39   ⏳ to collect (courier X)  │
│                         Remaining: $0 (covered) │
│  [ + Add payment ]                              │
├──────────────────────────────────────────────┤
│  Add payment                                    │
│   Method: [ Bank-ABA ▾ ]  Amount: [ ____ ]      │
│   Proof: [ upload ]                             │
│        [ Confirm payment ]   ← Finance only      │
└──────────────────────────────────────────────┘

   COD Reconciliation (courier X)         [batch]
   ┌────────────────────────────────────────────┐
   │ Remitted total: [ $540 ]                     │
   │ Covers: ☑ #1042 ☑ #1043 ... ☐ #1051          │
   │ Unmatched: $60 → #1051 stays "COD pending"   │
   │             [ Reconcile selected ]            │
   └────────────────────────────────────────────┘
```
- Split payment shown as a list; status derived (PM-2, PM-9).
- "Confirm payment" is Finance-only (NFR-7).
- COD batch reconcile allocates a lump remittance across orders (PM-5).

---

## A3.4 Demand Test Result (Owner) — [Module 15](15-product-testing.md)

```
┌──────────────────────────────────────────────┐
│  Demand Test: Mini LED Lamp     Window: 3 days  │
├──────────────────────────────────────────────┤
│  Variant   Views  Taps  Comments  Pre-orders    │
│   A $14    5,200   240     38        31          │
│   B $11    5,000   260     41        36          │
│   TOTAL   10,200   500     79        67  (0.66%) │
│  Ad spend: $15                                   │
├──────────────────────────────────────────────┤
│  Result:  ✅ STOCK  (above threshold ≥40 / ≥0.6%)│
│  Suggested first PO: 80 units                    │
│  Suggested price: $13                            │
│                                                 │
│   [ Accept → set Stocked + create PO ]           │
│   [ Override → Dropship ]   [ Drop ]             │
└──────────────────────────────────────────────┘
```
- Result maps signals → Stock/Dropship/Drop against thresholds (PT-5).
- "Accept" sets fulfillment type + suggests a PO (PT-6).
- "Drop" archives — no inventory bought (the loss-avoidance point).

---

## Screen-to-Module Map

| Screen | Primary module | Key NFRs |
|--------|----------------|----------|
| Order Capture | [04 Orders](04-channels-orders.md) | NFR-13, 14, 15 |
| Live Capture | [13 Live Selling](13-live-selling.md) | NFR-2, 14 |
| Payment / Reconcile | [06 Payments](06-payments.md) | NFR-7, 11, 12 |
| Demand Test Result | [15 Product Testing](15-product-testing.md) | NFR-15 |

## Notes

- These are **alignment sketches, not the design** — final layout, styling, and responsive behavior are produced in a design tool and linked here.
- Every screen must satisfy the relevant NFRs in [Appendix A2](A2-nfr.md), especially mobile usability and plain-language errors.
