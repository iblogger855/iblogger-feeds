# Example — Mermaid `stateDiagram-v2`

> **Use when:** An object moves through discrete states and you want to show valid transitions between them.

**Tool:** Mermaid | **Type:** stateDiagram-v2

---

## Example: Support Ticket Lifecycle

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
stateDiagram-v2
    classDef open   fill:#e65100,stroke:#bf360c,color:#fff
    classDef active fill:#1b5e20,stroke:#003300,color:#fff
    classDef done   fill:#01579b,stroke:#003c8f,color:#fff

    [*] --> New : ticket submitted

    New --> Open : agent assigned
    New --> Closed : spam detected

    Open --> InProgress : agent starts work
    Open --> OnHold : awaiting user info

    InProgress --> Resolved : fix applied
    InProgress --> Escalated : complexity too high

    OnHold --> InProgress : user responded
    OnHold --> Closed : no response (14 days)

    Escalated --> InProgress : senior agent picks up

    Resolved --> Closed : user confirms fix
    Resolved --> InProgress : user reports issue persists

    Closed --> [*]

    class New,Open,OnHold open
    class InProgress,Escalated active
    class Resolved,Closed done
```

---

## Key Syntax Reference

| Syntax | Meaning |
| :--- | :--- |
| `[*] --> State` | Initial transition (entry point) |
| `State --> [*]` | Final transition (exit point) |
| `A --> B : event` | Labeled transition |
| `state "Label" as S` | Rename a state |
| `state S <<choice>>` | Branch / fork point |
| `state S <<fork>>` | Parallel fork |
| `state S <<join>>` | Parallel join |

---

**Avoid:** Complex transition logic with conditions — use `flowchart` instead. More than 8–10 states on one diagram.
