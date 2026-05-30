# Example — Mermaid `classDiagram`

> **Use when:** Showing how classes, interfaces, and objects relate — inheritance, composition, dependencies.

**Tool:** Mermaid | **Type:** classDiagram

---

## Example: E-Commerce Domain Model

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
classDiagram
    class User {
        +int id
        +string email
        +string name
        +login() bool
        +logout() void
    }

    class Order {
        +int id
        +string status
        +decimal total
        +place() void
        +cancel() void
    }

    class OrderItem {
        +int quantity
        +decimal unitPrice
        +subtotal() decimal
    }

    class Product {
        +int id
        +string name
        +decimal price
        +int stock
        +isAvailable() bool
    }

    class PaymentMethod {
        <<interface>>
        +charge(amount) bool
        +refund(amount) bool
    }

    class CreditCard {
        +string last4
        +string brand
        +charge(amount) bool
        +refund(amount) bool
    }

    class BankTransfer {
        +string iban
        +charge(amount) bool
        +refund(amount) bool
    }

    User "1" --> "0..*" Order : places
    Order "1" *-- "1..*" OrderItem : contains
    OrderItem "0..*" --> "1" Product : references
    Order "0..*" --> "1" PaymentMethod : paid via
    CreditCard ..|> PaymentMethod
    BankTransfer ..|> PaymentMethod
```

---

## Relationship Symbol Reference

| Symbol | Relationship | Meaning |
| :--- | :--- | :--- |
| `A <\|-- B` | Inheritance | B extends A |
| `A *-- B` | Composition | B can't exist without A |
| `A o-- B` | Aggregation | B can exist independently |
| `A --> B` | Association | A uses B |
| `A ..> B` | Dependency | Weak / dashed usage |
| `A ..\|> B` | Realization | B implements interface A |

---

**Avoid:** Runtime behavior (use `sequenceDiagram`). Database tables (use `erDiagram`).
