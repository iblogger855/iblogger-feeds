# Example — Mermaid `erDiagram`

> **Use when:** Documenting database tables and their relationships — one-to-many, many-to-many, foreign keys.

**Tool:** Mermaid | **Type:** erDiagram

---

## Example: SaaS Multi-Tenant Schema

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'attributeBackgroundColorEven': '#01579b', 'attributeBackgroundColorOdd': '#003c8f', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
erDiagram
    ORGANIZATION {
        uuid id PK
        string name
        string plan
        datetime created_at
    }

    USER {
        uuid id PK
        uuid org_id FK
        string email UK
        string role
        boolean active
    }

    PROJECT {
        uuid id PK
        uuid org_id FK
        string name
        string status
    }

    MEMBERSHIP {
        uuid user_id FK
        uuid project_id FK
        string permission
    }

    AUDIT_LOG {
        uuid id PK
        uuid user_id FK
        string action
        jsonb payload
        datetime occurred_at
    }

    ORGANIZATION ||--o{ USER : "has members"
    ORGANIZATION ||--o{ PROJECT : "owns"
    USER ||--o{ MEMBERSHIP : "holds"
    PROJECT ||--o{ MEMBERSHIP : "grants"
    USER ||--o{ AUDIT_LOG : "generates"
```

---

## Cardinality Symbol Reference

| Symbol | Meaning |
| :--- | :--- |
| `\|\|` | Exactly one |
| `\|o` | Zero or one |
| `}o` | Zero or many |
| `}\|` | One or many |

**Pattern:** `LEFT_TABLE LEFT_CARD--RIGHT_CARD RIGHT_TABLE : "label"`

Example: `USER ||--o{ ORDER : "places"` → one user places zero or many orders.

---

**Avoid:** Code structure (use `classDiagram`). This is strictly for data/schema relationships.
