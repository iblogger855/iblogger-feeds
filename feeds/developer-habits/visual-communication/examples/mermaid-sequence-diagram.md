# Example — Mermaid `sequenceDiagram`

> **Use when:** Showing who talks to whom, in what order, and what they say. Time flows downward.

**Tool:** Mermaid | **Type:** sequenceDiagram

---

## Example: OAuth 2.0 Authorization Code Flow

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'actorBkg': '#01579b', 'actorBorder': '#003c8f', 'actorTextColor': '#fff', 'signalColor': '#29b6f6', 'signalTextColor': '#fff', 'noteBkgColor': '#1a237e', 'noteTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan, .messageText, .signalText { fill: #ffffff !important; stroke: none !important; }'}}%%
sequenceDiagram
    participant U as User
    participant A as App
    participant P as Auth Provider
    participant R as Resource API

    U->>A: Click "Login with Google"
    A->>P: GET /authorize?client_id=...&scope=email
    P-->>U: Show consent screen
    U->>P: Grant permission
    P-->>A: Redirect with ?code=abc123
    A->>P: POST /token (code + secret)
    activate P
    P-->>A: access_token + refresh_token
    deactivate P
    Note over A: Store tokens securely
    A->>R: GET /userinfo (Bearer token)
    activate R
    R-->>A: { email, name, avatar }
    deactivate R
    A-->>U: Logged in as user@example.com
```

---

## Key Syntax Reference

| Syntax | Meaning |
| :--- | :--- |
| `A->>B: msg` | Solid arrow — synchronous call |
| `A-->>B: msg` | Dashed arrow — async / return |
| `A-xB: msg` | X arrow — failure / rejection |
| `activate A` | Show active lifeline bar |
| `deactivate A` | End lifeline bar |
| `Note over A,B: text` | Annotation spanning actors |
| `loop Every 30s ... end` | Loop block |
| `alt cond ... else ... end` | Conditional block |
| `par ... and ... end` | Parallel execution block |

---

**Avoid:** More than 5–6 actors (becomes unreadable). Use `flowchart` for process logic without actors.
