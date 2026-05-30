# Example — ASCII: Box-and-Line Architecture

> **Use when:** Showing system components and their connections in code comments, commit messages, terminal output, or any plain-text surface.

**Tool:** ASCII | **Type:** Box-and-Line Architecture

---

## When to Use ASCII Over Mermaid

ASCII diagrams work everywhere Mermaid doesn't:
- Code comments (`//`, `#`, `/* */`)
- Git commit messages
- Terminal / CLI output
- Slack and Teams messages
- Plain-text emails
- Architecture Decision Records (ADRs)
- Log files

**Rule:** If the reader sees raw text instead of a rendered image → use ASCII.

---

## Example: Microservices Architecture

```
                          ┌─────────────────────────────┐
                          │        API Gateway           │
                          │   (Kong / AWS API GW)        │
                          └──────────┬──────────────────┘
                                     │
              ┌──────────────────────┼─────────────────────┐
              │                      │                      │
              ▼                      ▼                      ▼
  ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
  │  Order Service  │   │ Product Service  │   │  User Service   │
  │   (Node.js)     │   │    (Go/Gin)      │   │   (Python)      │
  └────────┬────────┘   └────────┬────────┘   └────────┬────────┘
           │                     │                      │
           ▼                     ▼                      ▼
  ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
  │   PostgreSQL    │   │   PostgreSQL     │   │   PostgreSQL    │
  │  (orders DB)   │   │  (products DB)  │   │   (users DB)    │
  └─────────────────┘   └─────────────────┘   └─────────────────┘
           │
           ▼
  ┌─────────────────┐           ┌─────────────────────────┐
  │   RabbitMQ      │ ────────► │  Notification Service   │
  │  (event bus)    │           │      (Python)           │
  └─────────────────┘           └───────────┬─────────────┘
                                             │
                               ┌─────────────┴──────────┐
                               ▼                        ▼
                        ┌────────────┐          ┌────────────┐
                        │  SendGrid  │          │  Firebase  │
                        │  (email)   │          │   (push)   │
                        └────────────┘          └────────────┘
```

---

## Example: Request/Response Flow (inline-friendly)

```
Client → [API GW] → [Auth] → [Rate Limiter] → [Service] → [DB]
                                                    │
                                              [Cache Miss]
                                                    │
                                              [DB Query]
                                                    │
                                            [Cache Write]
                                                    │
                                             Response ←
```

---

## ASCII Box Character Reference

| Character | Unicode | Use for |
| :--- | :--- | :--- |
| `┌ ┐ └ ┘` | U+250C/10/14/18 | Box corners |
| `─` | U+2500 | Horizontal line |
| `│` | U+2502 | Vertical line |
| `├ ┤ ┬ ┴ ┼` | U+251C/24/2C/34/3C | T-junctions and cross |
| `►` / `◄` | U+25BA/25C4 | Horizontal arrows |
| `▲` / `▼` | U+25B2/25BC | Vertical arrows |
| `→` / `←` | U+2192/2190 | Simple arrows |
| `↕` | U+2195 | Bidirectional vertical |

**Tip:** Use `[Name]` (brackets) as a lightweight alternative to box-drawing characters when copying into code comments.
