# Example — PlantUML

> **Use when:** You need richly typed diagrams (sequence, component, deployment, use case, activity) with fine-grained control over layout and styling. PlantUML is text-based and renders via a JAR, VS Code extension, or online server.

**Tool:** PlantUML | **Formats:** Sequence, Component, Deployment, Activity, Use Case, Class

---

## Setup

```bash
# Option 1: Docker (no local Java needed)
docker run -d -p 8080:8080 plantuml/plantuml-server

# Option 2: VS Code Extension
# Install "PlantUML" by jebbs → renders on save

# Option 3: CLI (requires Java)
java -jar plantuml.jar diagram.puml
```

---

## Example 1: Sequence Diagram

```plantuml
@startuml
skinparam backgroundColor #1e1e1e
skinparam sequenceArrowThickness 2
skinparam roundcorner 5
skinparam participantBackgroundColor #01579b
skinparam participantFontColor #ffffff
skinparam participantBorderColor #003c8f
skinparam noteBackgroundColor #1a237e
skinparam noteFontColor #ffffff
skinparam sequenceArrowColor #29b6f6

title JWT Authentication Flow

actor       "Client"       as C
participant "API Gateway"  as G
participant "Auth Service" as A
database    "Token Store"  as T

C -> G: POST /auth/login { email, password }
G -> A: Forward credentials
A -> A: Validate password hash
A -> T: Store refresh token (TTL: 7d)
A --> G: { access_token, refresh_token }
G --> C: 200 OK { access_token, refresh_token }

... later ...

C -> G: GET /profile (Bearer: access_token)
G -> A: Validate token
A --> G: { user_id, roles }
G --> C: 200 OK { profile data }

@enduml
```

---

## Example 2: Component Diagram

```plantuml
@startuml
skinparam backgroundColor #1e1e1e
skinparam componentBackgroundColor #01579b
skinparam componentFontColor #ffffff
skinparam componentBorderColor #003c8f
skinparam arrowColor #29b6f6
skinparam databaseBackgroundColor #37474f
skinparam databaseFontColor #ffffff

title E-Commerce Platform — Components

package "Frontend" {
  [React SPA] as SPA
  [Mobile App] as Mobile
}

package "Backend" {
  [API Gateway] as GW
  [Order Service] as Orders
  [Product Service] as Products
  [Notification Service] as Notifs
}

database "PostgreSQL" as DB
database "Redis" as Cache
queue "RabbitMQ" as Queue

cloud "External" {
  [Stripe] as Stripe
  [SendGrid] as Email
}

SPA --> GW : HTTPS
Mobile --> GW : HTTPS
GW --> Orders : HTTP
GW --> Products : HTTP
GW --> Cache : Redis protocol
Orders --> DB : SQL
Orders --> Stripe : HTTPS
Orders --> Queue : AMQP publish
Products --> DB : SQL
Notifs --> Queue : AMQP subscribe
Notifs --> Email : HTTPS

@enduml
```

---

## Example 3: Activity Diagram (Decision Flow)

```plantuml
@startuml
skinparam backgroundColor #1e1e1e
skinparam activityBackgroundColor #01579b
skinparam activityFontColor #ffffff
skinparam activityBorderColor #003c8f
skinparam arrowColor #29b6f6

title Order Placement Flow

start

:Receive order request;

if (User authenticated?) then (no)
  :Return 401 Unauthorized;
  stop
endif

if (Items in stock?) then (no)
  :Return 422 Out of Stock;
  stop
endif

:Calculate total with tax;
:Charge payment via Stripe;

if (Payment successful?) then (no)
  :Return 402 Payment Failed;
  stop
endif

:Create order record;
:Publish order.created event;
:Return 201 Created;

stop

@enduml
```

---

## Example 4: Class Diagram

```plantuml
@startuml
skinparam backgroundColor #1e1e1e
skinparam classBackgroundColor #01579b
skinparam classFontColor #ffffff
skinparam classBorderColor #003c8f
skinparam arrowColor #29b6f6

interface IRepository<T> {
  + findById(id: UUID): T
  + save(entity: T): void
  + delete(id: UUID): void
}

class Order {
  + id: UUID
  + status: OrderStatus
  + total: Money
  + place(): void
  + cancel(): void
}

class OrderRepository {
  - db: DataSource
  + findById(id: UUID): Order
  + save(order: Order): void
  + delete(id: UUID): void
}

enum OrderStatus {
  PENDING
  CONFIRMED
  SHIPPED
  DELIVERED
  CANCELLED
}

IRepository <|.. OrderRepository
OrderRepository --> Order : manages
Order --> OrderStatus

@enduml
```

---

## PlantUML vs Mermaid — When to Choose

| Factor | PlantUML | Mermaid |
| :--- | :--- | :--- |
| Rendering | Requires server/JAR | Built into GitHub, Notion, Obsidian |
| Diagram types | More types (use case, deployment, object) | Fewer, but growing fast |
| Layout control | More precise | More automatic |
| Styling | Verbose `skinparam` system | Simple `%%{init}%%` block |
| Best for | Enterprise docs, fine-grained control | Markdown files, quick diagrams |
