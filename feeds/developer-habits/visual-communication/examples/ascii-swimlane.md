# Example — ASCII: Swimlane Diagram

> **Use when:** Showing a process where different actors (teams, systems, roles) are responsible for different steps.

**Tool:** ASCII | **Type:** Swimlane

---

## Example: Order Fulfillment Process

```
Customer          │  Frontend App     │  Order Service    │  Warehouse        │  Logistics API
──────────────────┼───────────────────┼───────────────────┼───────────────────┼──────────────────
                  │                   │                   │                   │
  Place order ──► │                   │                   │                   │
                  │ POST /orders ────►│                   │                   │
                  │                   │ Validate & save   │                   │
                  │                   │ Charge payment    │                   │
                  │                   │ Publish event ───►│                   │
                  │ 201 Created ◄──── │                   │                   │
  Confirmation ◄──│                   │                   │                   │
                  │                   │                   │ Pick items        │
                  │                   │                   │ Pack order        │
                  │                   │                   │ Create shipment──►│
                  │                   │                   │                   │ Generate label
                  │                   │                   │◄─── Tracking ID ──│
                  │                   │◄─── order.shipped─│                   │
                  │                   │ Update status     │                   │
  Tracking email◄─│                   │                   │                   │
```

---

## Example: CI/CD Pipeline (simplified)

```
Developer         │  GitHub Actions   │  Docker Hub       │  Staging Env      │  Production
──────────────────┼───────────────────┼───────────────────┼───────────────────┼──────────────────
                  │                   │                   │                   │
  git push ──────►│                   │                   │                   │
                  │ Lint + test       │                   │                   │
                  │ Build Docker img  │                   │                   │
                  │ Push image ──────►│                   │                   │
                  │                   │                   │                   │
                  │ Deploy to staging─────────────────────►                   │
                  │                   │                   │ Health check      │
                  │                   │                   │ Smoke tests       │
                  │ Tests passed ◄────────────────────────│                   │
                  │                   │                   │                   │
  Approve? ◄──── │ (manual gate)     │                   │                   │
  ✓ Approve ─────►│                   │                   │                   │
                  │ Deploy to prod ───────────────────────────────────────────►
                  │                   │                   │                   │ Rolling deploy
                  │                   │                   │                   │ Health check
  Deploy done ◄──│                   │                   │                   │
```

---

## Swimlane Construction Rules

1. **One column per actor/system** — separated by `│`
2. **Horizontal arrows** show handoffs: `──►` (to right) `◄──` (to left)
3. **Vertical activity** shows work happening within one lane
4. **Keep lanes consistent width** — align `│` at fixed character positions
5. **Label only key handoffs** — not every internal step

---

## Minimal Version (for code comments)

```
[Customer]     [API]          [Service]      [DB]
     │              │               │              │
     │──POST /order►│               │              │
     │              │──validate────►│              │
     │              │               │──INSERT ────►│
     │              │               │◄──order_id──│
     │◄──201 id=42──│               │              │
```
