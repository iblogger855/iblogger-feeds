# Example — IcePanel C4 Level 2: Container

> **Use when:** Showing the deployable units inside your system — apps, APIs, databases, message queues.

**Tool:** IcePanel | **C4 Level:** 2 — Container | **Formats:** YAML or JSON (both supported)

---

## What Is a "Container"?

In C4, a **container** is any separately deployable or runnable unit:
- Web application (React SPA, Next.js app) → type `app`
- Backend API (Node.js, Go, Django) → type `app`
- Mobile app (iOS, Android) → type `app`
- Database (PostgreSQL, Redis) → type `database`
- File / object storage (S3, GCS) → type `store`
- Background worker → type `app`

Not to be confused with Docker containers — this is a higher-level concept.

---

## Example: E-Commerce Platform — Container View (YAML)

```yaml
# yaml-language-server: $schema=https://api.icepanel.io/v1/schemas/LandscapeImportData

namespace: ecommerce-platform

tagGroups:
  - id: tg-tech
    name: Technology
    icon: code

tags:
  - id: tag-react
    name: React
    color: blue
    groupId: tg-tech
  - id: tag-nodejs
    name: Node.js
    color: green
    groupId: tg-tech
  - id: tag-go
    name: Go
    color: cyan
    groupId: tg-tech
  - id: tag-python
    name: Python
    color: yellow
    groupId: tg-tech
  - id: tag-postgres
    name: PostgreSQL
    color: blue
    groupId: tg-tech
  - id: tag-redis
    name: Redis
    color: red
    groupId: tg-tech

modelObjects:
  # Domain
  - id: domain-ecommerce
    name: E-Commerce Domain
    type: domain

  # Actors
  - id: actor-customer
    name: Customer
    type: actor
    parentId: domain-ecommerce

  - id: actor-admin
    name: Store Admin
    type: actor
    parentId: domain-ecommerce

  # Internal system (the boundary)
  - id: system-ecommerce
    name: E-Commerce Platform
    type: system
    parentId: domain-ecommerce

  # Containers inside the system
  - id: app-spa
    name: Web SPA
    type: app
    parentId: system-ecommerce
    description: Single-page app served via CDN
    tagIds: [tag-react]

  - id: app-mobile
    name: Mobile App
    type: app
    parentId: system-ecommerce
    description: iOS and Android client
    tagIds: [tag-react]

  - id: app-api-gateway
    name: API Gateway
    type: app
    parentId: system-ecommerce
    description: Rate limiting, auth, routing (Kong)

  - id: app-order-service
    name: Order Service
    type: app
    parentId: system-ecommerce
    description: Order creation, status, and history
    tagIds: [tag-nodejs]

  - id: app-product-service
    name: Product Service
    type: app
    parentId: system-ecommerce
    description: Catalog, inventory, and search
    tagIds: [tag-go]

  - id: app-notification-service
    name: Notification Service
    type: app
    parentId: system-ecommerce
    description: Email and push notifications
    tagIds: [tag-python]

  - id: db-postgres
    name: PostgreSQL
    type: database
    parentId: system-ecommerce
    description: Primary relational store
    tagIds: [tag-postgres]

  - id: db-redis
    name: Redis
    type: database
    parentId: system-ecommerce
    description: Session cache and rate-limit state
    tagIds: [tag-redis]

  - id: app-queue
    name: RabbitMQ
    type: app
    parentId: system-ecommerce
    description: Async event bus between services

  # External systems
  - id: system-stripe
    name: Stripe
    type: system
    parentId: domain-ecommerce

  - id: system-sendgrid
    name: SendGrid
    type: system
    parentId: domain-ecommerce

modelConnections:
  - id: conn-customer-spa
    name: Uses
    originId: actor-customer
    targetId: app-spa
    direction: outgoing

  - id: conn-customer-mobile
    name: Uses
    originId: actor-customer
    targetId: app-mobile
    direction: outgoing

  - id: conn-admin-spa
    name: Manages store
    originId: actor-admin
    targetId: app-spa
    direction: outgoing

  - id: conn-spa-gw
    name: API calls
    originId: app-spa
    targetId: app-api-gateway
    direction: outgoing

  - id: conn-mobile-gw
    name: API calls
    originId: app-mobile
    targetId: app-api-gateway
    direction: outgoing

  - id: conn-gw-orders
    name: Routes /orders
    originId: app-api-gateway
    targetId: app-order-service
    direction: outgoing

  - id: conn-gw-products
    name: Routes /products
    originId: app-api-gateway
    targetId: app-product-service
    direction: outgoing

  - id: conn-gw-redis
    name: Session and rate state
    originId: app-api-gateway
    targetId: db-redis
    direction: outgoing

  - id: conn-orders-db
    name: Reads and writes orders
    originId: app-order-service
    targetId: db-postgres
    direction: outgoing

  - id: conn-products-db
    name: Reads and writes products
    originId: app-product-service
    targetId: db-postgres
    direction: outgoing

  - id: conn-orders-stripe
    name: Charges payment
    originId: app-order-service
    targetId: system-stripe
    direction: outgoing

  - id: conn-orders-queue
    name: Publishes order.created
    originId: app-order-service
    targetId: app-queue
    direction: outgoing

  - id: conn-notifs-queue
    name: Subscribes to events
    originId: app-notification-service
    targetId: app-queue
    direction: incoming

  - id: conn-notifs-sendgrid
    name: Sends emails
    originId: app-notification-service
    targetId: system-sendgrid
    direction: outgoing
```

---

## JSON Equivalent (condensed)

```json
{
  "namespace": "ecommerce-platform",
  "modelObjects": [
    { "id": "domain-ecommerce",        "name": "E-Commerce Domain",    "type": "domain" },
    { "id": "actor-customer",          "name": "Customer",             "type": "actor",    "parentId": "domain-ecommerce" },
    { "id": "system-ecommerce",        "name": "E-Commerce Platform",  "type": "system",   "parentId": "domain-ecommerce" },
    { "id": "app-spa",                 "name": "Web SPA",              "type": "app",      "parentId": "system-ecommerce", "description": "React SPA via CDN" },
    { "id": "app-api-gateway",         "name": "API Gateway",          "type": "app",      "parentId": "system-ecommerce", "description": "Kong — auth, rate limiting, routing" },
    { "id": "app-order-service",       "name": "Order Service",        "type": "app",      "parentId": "system-ecommerce", "description": "Node.js" },
    { "id": "app-product-service",     "name": "Product Service",      "type": "app",      "parentId": "system-ecommerce", "description": "Go/Gin" },
    { "id": "app-notification-service","name": "Notification Service", "type": "app",      "parentId": "system-ecommerce", "description": "Python/FastAPI" },
    { "id": "db-postgres",             "name": "PostgreSQL",           "type": "database", "parentId": "system-ecommerce" },
    { "id": "db-redis",                "name": "Redis",                "type": "database", "parentId": "system-ecommerce" },
    { "id": "app-queue",               "name": "RabbitMQ",             "type": "app",      "parentId": "system-ecommerce" },
    { "id": "system-stripe",           "name": "Stripe",               "type": "system",   "parentId": "domain-ecommerce" },
    { "id": "system-sendgrid",         "name": "SendGrid",             "type": "system",   "parentId": "domain-ecommerce" }
  ],
  "modelConnections": [
    { "id": "c1", "name": "API calls",              "originId": "app-spa",                  "targetId": "app-api-gateway",          "direction": "outgoing" },
    { "id": "c2", "name": "Routes /orders",         "originId": "app-api-gateway",          "targetId": "app-order-service",        "direction": "outgoing" },
    { "id": "c3", "name": "Routes /products",       "originId": "app-api-gateway",          "targetId": "app-product-service",      "direction": "outgoing" },
    { "id": "c4", "name": "Reads/writes orders",    "originId": "app-order-service",        "targetId": "db-postgres",              "direction": "outgoing" },
    { "id": "c5", "name": "Charges payment",        "originId": "app-order-service",        "targetId": "system-stripe",            "direction": "outgoing" },
    { "id": "c6", "name": "Publishes order.created","originId": "app-order-service",        "targetId": "app-queue",                "direction": "outgoing" },
    { "id": "c7", "name": "Subscribes to events",   "originId": "app-notification-service", "targetId": "app-queue",                "direction": "incoming" },
    { "id": "c8", "name": "Sends emails",            "originId": "app-notification-service", "targetId": "system-sendgrid",          "direction": "outgoing" }
  ]
}
```

---

## Rules for a Good Container Diagram

1. **One object per deployable unit** — if it has its own runtime, it's a container
2. **Use `description` for technology** — e.g., "Node.js / Express", "PostgreSQL 15"
3. **Label every connection** — what data flows and which direction
4. **Show external systems at the boundary** — don't detail their internals
5. **`direction`** — use `"outgoing"` for the origin initiating the call, `"incoming"` for subscriptions/callbacks
