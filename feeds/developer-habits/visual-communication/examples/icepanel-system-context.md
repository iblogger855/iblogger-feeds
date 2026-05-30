# Example — IcePanel C4 Level 1: System Context

> **Use when:** Showing your system in relation to its users and external systems. The "30,000 ft view."

**Tool:** IcePanel | **C4 Level:** 1 — System Context | **Formats:** YAML or JSON (both supported)

---

## What Is IcePanel?

IcePanel is a C4 model diagramming tool for software architecture. It uses the **C4 model** (Context, Container, Component, Code) — four levels of abstraction for documenting architecture.

| Level | Shows | Audience |
| :--- | :--- | :--- |
| 1 — System Context | Your system + users + external systems | Everyone (non-technical too) |
| 2 — Container | Apps, databases, services inside your system | Developers, architects |
| 3 — Component | Internal structure of one container | Developers |
| 4 — Code | Classes, interfaces (rarely needed) | Developers |

IcePanel accepts both **YAML** and **JSON** using the `LandscapeImportData` schema. Both formats are equivalent — use whichever fits your tooling.

---

## Import Instructions

1. Open IcePanel → your landscape
2. Click **Import** → **Upload file**
3. Upload the `.yaml` or `.json` file below

Add this header to YAML files for IDE autocompletion:
```yaml
# yaml-language-server: $schema=https://api.icepanel.io/v1/schemas/LandscapeImportData
```

---

## Example: E-Commerce Platform — System Context (YAML)

**Narrative:** The online store serves customers and admins. It integrates with Stripe for payments, SendGrid for email, and a logistics API for shipping. External systems are tagged separately.

```yaml
# yaml-language-server: $schema=https://api.icepanel.io/v1/schemas/LandscapeImportData

namespace: ecommerce-platform

tagGroups:
  - id: tg-boundary
    name: Boundary
    icon: tag

tags:
  - id: tag-internal
    name: Internal
    color: green
    groupId: tg-boundary
  - id: tag-external
    name: External
    color: grey
    groupId: tg-boundary

modelObjects:
  # Domain (top-level grouping)
  - id: domain-ecommerce
    name: E-Commerce Domain
    type: domain

  # Actors (people)
  - id: actor-customer
    name: Customer
    type: actor
    parentId: domain-ecommerce
    description: Buys products online via browser or mobile
    tagIds:
      - tag-external

  - id: actor-admin
    name: Store Admin
    type: actor
    parentId: domain-ecommerce
    description: Manages inventory, orders, and promotions

  # Internal system
  - id: system-ecommerce
    name: E-Commerce Platform
    type: system
    parentId: domain-ecommerce
    description: Handles product catalog, orders, payments, and fulfillment
    tagIds:
      - tag-internal

  # External systems
  - id: system-stripe
    name: Stripe
    type: system
    parentId: domain-ecommerce
    description: Payment processing and card tokenization
    tagIds:
      - tag-external

  - id: system-sendgrid
    name: SendGrid
    type: system
    parentId: domain-ecommerce
    description: Transactional email delivery
    tagIds:
      - tag-external

  - id: system-logistics
    name: Logistics API
    type: system
    parentId: domain-ecommerce
    description: Shipping rates, tracking, and label generation
    tagIds:
      - tag-external

modelConnections:
  - id: conn-customer-ecommerce
    name: Browses and purchases
    originId: actor-customer
    targetId: system-ecommerce
    direction: outgoing

  - id: conn-admin-ecommerce
    name: Manages catalog and orders
    originId: actor-admin
    targetId: system-ecommerce
    direction: outgoing

  - id: conn-ecommerce-stripe
    name: Processes payments
    originId: system-ecommerce
    targetId: system-stripe
    direction: outgoing

  - id: conn-ecommerce-sendgrid
    name: Sends order confirmations
    originId: system-ecommerce
    targetId: system-sendgrid
    direction: outgoing

  - id: conn-ecommerce-logistics
    name: Creates shipments and tracks delivery
    originId: system-ecommerce
    targetId: system-logistics
    direction: outgoing
```

---

## Same Example in JSON

```json
{
  "namespace": "ecommerce-platform",
  "tagGroups": [
    { "id": "tg-boundary", "name": "Boundary", "icon": "tag" }
  ],
  "tags": [
    { "id": "tag-internal", "name": "Internal", "color": "green", "groupId": "tg-boundary" },
    { "id": "tag-external", "name": "External", "color": "grey",  "groupId": "tg-boundary" }
  ],
  "modelObjects": [
    { "id": "domain-ecommerce",  "name": "E-Commerce Domain",    "type": "domain" },
    { "id": "actor-customer",    "name": "Customer",             "type": "actor",  "parentId": "domain-ecommerce", "description": "Buys products online", "tagIds": ["tag-external"] },
    { "id": "actor-admin",       "name": "Store Admin",          "type": "actor",  "parentId": "domain-ecommerce", "description": "Manages inventory and orders" },
    { "id": "system-ecommerce",  "name": "E-Commerce Platform",  "type": "system", "parentId": "domain-ecommerce", "description": "Catalog, orders, payments, fulfillment", "tagIds": ["tag-internal"] },
    { "id": "system-stripe",     "name": "Stripe",               "type": "system", "parentId": "domain-ecommerce", "description": "Payment processing", "tagIds": ["tag-external"] },
    { "id": "system-sendgrid",   "name": "SendGrid",             "type": "system", "parentId": "domain-ecommerce", "description": "Email delivery", "tagIds": ["tag-external"] },
    { "id": "system-logistics",  "name": "Logistics API",        "type": "system", "parentId": "domain-ecommerce", "description": "Shipping and tracking", "tagIds": ["tag-external"] }
  ],
  "modelConnections": [
    { "id": "conn-1", "name": "Browses and purchases",          "originId": "actor-customer",   "targetId": "system-ecommerce",  "direction": "outgoing" },
    { "id": "conn-2", "name": "Manages catalog and orders",     "originId": "actor-admin",      "targetId": "system-ecommerce",  "direction": "outgoing" },
    { "id": "conn-3", "name": "Processes payments",             "originId": "system-ecommerce", "targetId": "system-stripe",     "direction": "outgoing" },
    { "id": "conn-4", "name": "Sends order confirmations",      "originId": "system-ecommerce", "targetId": "system-sendgrid",   "direction": "outgoing" },
    { "id": "conn-5", "name": "Creates shipments and tracks",   "originId": "system-ecommerce", "targetId": "system-logistics",  "direction": "outgoing" }
  ]
}
```

---

## Valid `type` Values

| Type | Maps to C4 | Use for |
| :--- | :--- | :--- |
| `domain` | — | Top-level grouping / boundary |
| `actor` | Person | Human user, external user role |
| `system` | Software System | An entire system (internal or external) |
| `app` | Container | Web app, API, mobile app |
| `database` | Container | Database, data store |
| `component` | Component | Internal module within an app |
| `store` | — | File store, object storage |
| `group` | — | Logical grouping within a diagram |

---

## ASCII Equivalent (for plain-text contexts)

```
[Customer] ──────────────────────────────────┐
                                              ▼
[Store Admin] ───────────────────> [E-Commerce Platform]
                                              │
                             ┌────────────────┼────────────────┐
                             ▼                ▼                ▼
                          [Stripe]       [SendGrid]      [Logistics API]
                       (Payments)        (Email)          (Shipping)
```

---

## Rules for a Good System Context Diagram

1. **One box for your system** — don't show internals at this level
2. **Name every actor** — real job titles or user types, not "user"
3. **Label every connection** — what does the arrow mean?
4. **Tag external vs internal** — use `tags` to distinguish boundaries
5. **Non-technical audience** — avoid implementation details; use business language
