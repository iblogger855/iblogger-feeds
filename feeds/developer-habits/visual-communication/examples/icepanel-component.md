# Example — IcePanel C4 Level 3: Component

> **Use when:** Zooming into one container to show its internal modules, classes, or logical components.

**Tool:** IcePanel | **C4 Level:** 3 — Component | **Formats:** YAML or JSON (both supported)

---

## When to Use Component Diagrams

Only create component diagrams when the internal structure of a container is genuinely complex.

**Good candidates:**
- A service with 5+ internal modules that interact in non-obvious ways
- An API with a layered architecture (router → handler → service → repository)
- A background worker with complex pipeline stages

**Skip when:**
- The container is a simple CRUD service
- The structure is obvious from the code

---

## Example: Order Service — Component View (YAML)

```yaml
# yaml-language-server: $schema=https://api.icepanel.io/v1/schemas/LandscapeImportData

namespace: ecommerce-platform

modelObjects:
  # Parent system and container (must exist for parentId references)
  - id: domain-ecommerce
    name: E-Commerce Domain
    type: domain

  - id: system-ecommerce
    name: E-Commerce Platform
    type: system
    parentId: domain-ecommerce

  - id: app-order-service
    name: Order Service
    type: app
    parentId: system-ecommerce
    description: Node.js / Express

  # Components inside Order Service
  - id: comp-router
    name: HTTP Router
    type: component
    parentId: app-order-service
    description: Maps HTTP routes to handlers (Express Router)

  - id: comp-auth-middleware
    name: Auth Middleware
    type: component
    parentId: app-order-service
    description: Validates Bearer JWT on every request

  - id: comp-order-handler
    name: Order Handler
    type: component
    parentId: app-order-service
    description: Handles POST/GET /orders, validates input

  - id: comp-order-logic
    name: Order Service Logic
    type: component
    parentId: app-order-service
    description: Business rules — stock check, price calc, fraud check

  - id: comp-payment-client
    name: Payment Client
    type: component
    parentId: app-order-service
    description: Wraps Stripe SDK for charge and refund

  - id: comp-event-publisher
    name: Event Publisher
    type: component
    parentId: app-order-service
    description: Publishes order.created and order.cancelled to RabbitMQ

  - id: comp-order-repo
    name: Order Repository
    type: component
    parentId: app-order-service
    description: CRUD operations for Order entity via TypeORM

  # External dependencies (other containers)
  - id: db-postgres
    name: PostgreSQL
    type: database
    parentId: system-ecommerce

  - id: app-queue
    name: RabbitMQ
    type: app
    parentId: system-ecommerce

  - id: system-stripe
    name: Stripe
    type: system
    parentId: domain-ecommerce

modelConnections:
  - id: conn-router-auth
    name: Every request passes through
    originId: comp-router
    targetId: comp-auth-middleware
    direction: outgoing

  - id: conn-auth-handler
    name: Forwards authenticated request
    originId: comp-auth-middleware
    targetId: comp-order-handler
    direction: outgoing

  - id: conn-handler-logic
    name: Delegates business logic
    originId: comp-order-handler
    targetId: comp-order-logic
    direction: outgoing

  - id: conn-logic-payment
    name: Initiates payment
    originId: comp-order-logic
    targetId: comp-payment-client
    direction: outgoing

  - id: conn-logic-repo
    name: Persists order
    originId: comp-order-logic
    targetId: comp-order-repo
    direction: outgoing

  - id: conn-logic-events
    name: Emits domain event
    originId: comp-order-logic
    targetId: comp-event-publisher
    direction: outgoing

  - id: conn-payment-stripe
    name: Charges via Stripe API
    originId: comp-payment-client
    targetId: system-stripe
    direction: outgoing

  - id: conn-repo-postgres
    name: SQL queries
    originId: comp-order-repo
    targetId: db-postgres
    direction: outgoing

  - id: conn-publisher-queue
    name: AMQP publish
    originId: comp-event-publisher
    targetId: app-queue
    direction: outgoing
```

---

## JSON Equivalent (condensed)

```json
{
  "namespace": "ecommerce-platform",
  "modelObjects": [
    { "id": "domain-ecommerce",    "name": "E-Commerce Domain",   "type": "domain" },
    { "id": "system-ecommerce",    "name": "E-Commerce Platform", "type": "system",    "parentId": "domain-ecommerce" },
    { "id": "app-order-service",   "name": "Order Service",       "type": "app",       "parentId": "system-ecommerce" },
    { "id": "comp-router",         "name": "HTTP Router",         "type": "component", "parentId": "app-order-service" },
    { "id": "comp-auth-middleware","name": "Auth Middleware",      "type": "component", "parentId": "app-order-service" },
    { "id": "comp-order-handler",  "name": "Order Handler",       "type": "component", "parentId": "app-order-service" },
    { "id": "comp-order-logic",    "name": "Order Service Logic",  "type": "component", "parentId": "app-order-service" },
    { "id": "comp-payment-client", "name": "Payment Client",      "type": "component", "parentId": "app-order-service" },
    { "id": "comp-event-publisher","name": "Event Publisher",      "type": "component", "parentId": "app-order-service" },
    { "id": "comp-order-repo",     "name": "Order Repository",    "type": "component", "parentId": "app-order-service" },
    { "id": "db-postgres",         "name": "PostgreSQL",          "type": "database",  "parentId": "system-ecommerce" },
    { "id": "app-queue",           "name": "RabbitMQ",            "type": "app",       "parentId": "system-ecommerce" },
    { "id": "system-stripe",       "name": "Stripe",              "type": "system",    "parentId": "domain-ecommerce" }
  ],
  "modelConnections": [
    { "id": "c1", "name": "Passes through",         "originId": "comp-router",          "targetId": "comp-auth-middleware", "direction": "outgoing" },
    { "id": "c2", "name": "Forwards request",        "originId": "comp-auth-middleware", "targetId": "comp-order-handler",  "direction": "outgoing" },
    { "id": "c3", "name": "Delegates logic",         "originId": "comp-order-handler",   "targetId": "comp-order-logic",    "direction": "outgoing" },
    { "id": "c4", "name": "Initiates payment",       "originId": "comp-order-logic",     "targetId": "comp-payment-client", "direction": "outgoing" },
    { "id": "c5", "name": "Persists order",          "originId": "comp-order-logic",     "targetId": "comp-order-repo",     "direction": "outgoing" },
    { "id": "c6", "name": "Emits domain event",      "originId": "comp-order-logic",     "targetId": "comp-event-publisher","direction": "outgoing" },
    { "id": "c7", "name": "Stripe API charge",       "originId": "comp-payment-client",  "targetId": "system-stripe",       "direction": "outgoing" },
    { "id": "c8", "name": "SQL queries",             "originId": "comp-order-repo",      "targetId": "db-postgres",         "direction": "outgoing" },
    { "id": "c9", "name": "AMQP publish",            "originId": "comp-event-publisher", "targetId": "app-queue",           "direction": "outgoing" }
  ]
}
```

---

## Rules for a Good Component Diagram

1. **One diagram per container** — don't mix components from different containers
2. **Name by responsibility** — "Order Repository", not "orderRepo.ts"
3. **`parentId` must reference the container's `id`** — hierarchy is enforced
4. **Show external containers at the boundary** — databases, queues, external APIs
5. **Keep it to 6–12 components** — more than that → split the container or skip this level
