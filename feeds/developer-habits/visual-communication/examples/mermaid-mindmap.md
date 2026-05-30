# Example — Mermaid `mindmap`

> **Use when:** Showing how concepts branch from a central idea — brainstorming, taxonomy, system overview.

**Tool:** Mermaid | **Type:** mindmap

---

## Example: Backend Engineering Skills Map

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
mindmap
  root((Backend<br/>Engineering))
    Languages
      Go
      Rust
      Python
      Node.js
    Databases
      Relational
        PostgreSQL
        MySQL
      NoSQL
        MongoDB
        Redis
      Search
        Elasticsearch
    APIs
      REST
      GraphQL
      gRPC
    Infrastructure
      Docker
      Kubernetes
      Terraform
    Observability
      Metrics
      Logs
      Traces
    Security
      Auth & AuthZ
      Encryption
      OWASP
```

---

## Node Shape Reference

| Syntax | Shape | Use for |
| :--- | :--- | :--- |
| `((text))` | Circle | Root node |
| `(text)` | Rounded rectangle | Primary branch |
| `[text]` | Rectangle | Sub-branch |
| `))text((` | Cloud / bang | Highlight / callout |

---

**Avoid:** Directional relationships with labels — use `graph LR` instead. Mindmaps show hierarchy, not flow.
