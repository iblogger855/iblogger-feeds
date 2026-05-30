# Example — Mermaid `flowchart`

> **Use when:** Showing a process with decisions, branches, loops, or pipelines.

**Tool:** Mermaid | **Type:** flowchart | **Direction:** LR (left-right)

---

## Example: API Request Lifecycle

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'}}%%
flowchart LR
    classDef start fill:#1b5e20,stroke:#003300,color:#fff
    classDef step  fill:#01579b,stroke:#003c8f,color:#fff
    classDef dec   fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef db    fill:#37474f,stroke:#263238,color:#fff
    classDef fail  fill:#b71c1c,stroke:#7f0000,color:#fff

    A([Client Request]):::start --> B[Parse Headers]:::step
    B --> C{Authenticated?}:::dec
    C -- No --> D([401 Unauthorized]):::fail
    C -- Yes --> E{Rate limit OK?}:::dec
    E -- No --> F([429 Too Many Requests]):::fail
    E -- Yes --> G[Route to Handler]:::step
    G --> H[(Query DB)]:::db
    H --> I[Build Response]:::step
    I --> J([200 OK]):::start
```

---

## Node Shape Reference

| Syntax | Shape | Use for |
| :--- | :--- | :--- |
| `A[text]` | Rectangle | Regular step |
| `A{text}` | Diamond | Decision / branch |
| `A([text])` | Stadium | Start / end terminal |
| `A((text))` | Circle | Event / trigger |
| `A[(text)]` | Cylinder | Database / storage |
| `A>text]` | Asymmetric | Tag / annotation |

## Direction Options

| Code | Direction |
| :--- | :--- |
| `TD` | Top → Down |
| `LR` | Left → Right |
| `BT` | Bottom → Top |
| `RL` | Right → Left |

---

**Avoid:** Time-ordered actor messages → use `sequenceDiagram` instead.
