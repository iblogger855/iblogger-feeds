# 🧱 The Modular Monolith

> **Series:** Clean Code › Software Architecture · **Level:** Advanced · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. The Best of Both Worlds](#1-the-best-of-both-worlds)
- [2. Enforcing Boundaries Without Networks](#2-enforcing-boundaries-without-networks)
- [3. Implementing the Modular Monolith](#3-implementing-the-modular-monolith)
- [4. Spring Modulith](#4-spring-modulith)

---


```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#004d40', 'primaryTextColor': '#fff', 'lineColor': '#4db6ac', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }' }}%%
graph TD
    classDef mod fill:#01579b,stroke:#003c8f,color:#fff

    subgraph "Single Monolith Process"
        AUTH["Auth Module"]:::mod
        CART["Cart Module"]:::mod
        
        AUTH -.->|"No Direct Link"| CART
        AUTH --> E["Event Bus (Memory)"]
        CART --> E
    end
```

## 1. The Best of Both Worlds

The industry is currently experiencing a massive pendulum swing back away from Microservices. Companies realized they adopted Microservices for the *architectural boundaries*, but ended up paying the massive *distributed systems tax* (network failures, Kafka queues, Kubernetes complexity).

The **Modular Monolith** is the solution. It is deployed as a single application (like a standard Monolith), but internally, it is strictly partitioned into isolated modules (like Microservices).

You get the strict isolation and independent team ownership of Microservices, but with the sub-millisecond latency, simple debugging, and simple deployment of a Monolith.

---

## 2. Enforcing Boundaries Without Networks

In a Microservice architecture, the boundary is physical: **The Network**. The `Billing` team literally cannot query the `Shipping` database because the firewall blocks it.

In a Monolith, the boundary is logical. Because all code is in the same repository, a junior developer on the Shipping team can lazily write `import com.company.billing.BillingService;` and instantly couple the two domains together into a Big Ball of Mud.

To build a Modular Monolith, you must **enforce logical boundaries** as strictly as physical ones.

---

## 3. Implementing the Modular Monolith

### Step 1: Package by Component
Instead of Layered Architecture (grouping all controllers), you group by Business Domain (similar to Vertical Slices).
```text
com.company.app
├── billing/
├── shipping/
└── inventory/
```

### Step 2: Encapsulate Everything
In Java, use the `package-private` access modifier. 
Only the API Interface of the `billing` module should be `public`. Everything else (`BillingController`, `BillingService`, `BillingRepository`) should be package-private. This physically prevents the `shipping` module from directly instantiating the `BillingRepository`.

### Step 3: Event-Driven Communication
Instead of `ShippingService` directly calling `BillingService.charge()`, the `ShippingService` publishes an internal Domain Event (`OrderShippedEvent`) to a simple in-memory Spring ApplicationEventPublisher. The `BillingService` listens for that event. They remain completely decoupled, but there is zero network latency.

### Step 4: Separate Data
Modules should not share database tables. `Billing` and `Shipping` can share the same physical PostgreSQL database, but they should use different schemas (`schema_billing`, `schema_shipping`). No Foreign Keys should cross module boundaries.

---

## 4. Spring Modulith

Enforcing these rules manually relies on discipline, which eventually fails. 

**Spring Modulith** is a modern project by the Spring team designed specifically to build Modular Monoliths. 
1. It automatically writes automated tests using ArchUnit that instantly fail the CI/CD pipeline if the Shipping module tries to bypass the API and access an internal class of the Billing module.
2. It provides advanced internal Event Publication Registries to guarantee that if the Billing module crashes while processing an event, the event is saved to a database and retried later.

### The Ultimate Path
By starting with a strictly enforced Modular Monolith, if one specific module (e.g., `PDFGenerator`) eventually needs to be scaled independently, you can cleanly slice it out of the monolith and turn it into a Microservice in less than an hour—because it is already completely decoupled!

---

*← [Monolith vs Microservices](./01-monolith-vs-microservices.md) · [Back to Series Overview](../README.md) →*

## Related

- [Design Patterns](../../design-patterns/README.md)
- [Distributed Architecture Patterns](../distributed-patterns/README.md)
- [Databases](../../../devops/databases/README.md)
- [Observability & Monitoring](../../../devops/observability/README.md)
