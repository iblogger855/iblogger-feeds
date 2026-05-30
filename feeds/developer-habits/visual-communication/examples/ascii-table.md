# Example — ASCII: Tables

> **Use when:** Presenting structured comparisons, reference data, or decision matrices in plain text.

**Tool:** ASCII | **Type:** Table

---

## Example: Technology Comparison Table

```
┌──────────────────┬───────────────┬───────────────┬───────────────┐
│ Database         │ Type          │ Best For       │ Avoid When    │
├──────────────────┼───────────────┼───────────────┼───────────────┤
│ PostgreSQL       │ Relational    │ Complex joins  │ High write    │
│                  │               │ ACID txns      │ throughput    │
├──────────────────┼───────────────┼───────────────┼───────────────┤
│ MongoDB          │ Document      │ Flexible schema│ Many-to-many  │
│                  │               │ Rapid iteration│ joins         │
├──────────────────┼───────────────┼───────────────┼───────────────┤
│ Redis            │ Key-Value     │ Caching        │ Complex       │
│                  │               │ Sessions       │ queries       │
├──────────────────┼───────────────┼───────────────┼───────────────┤
│ Elasticsearch    │ Search        │ Full-text      │ Primary OLTP  │
│                  │               │ Analytics      │ store         │
└──────────────────┴───────────────┴───────────────┴───────────────┘
```

---

## Example: API Response Codes Reference

```
┌────────┬──────────────────────┬────────────────────────────────────┐
│ Code   │ Status               │ When to use                        │
├────────┼──────────────────────┼────────────────────────────────────┤
│ 200    │ OK                   │ Successful GET, PUT, PATCH          │
│ 201    │ Created              │ Successful POST (resource created)  │
│ 204    │ No Content           │ Successful DELETE                   │
│ 400    │ Bad Request          │ Invalid input, malformed JSON       │
│ 401    │ Unauthorized         │ Missing or invalid token            │
│ 403    │ Forbidden            │ Valid token, insufficient scope     │
│ 404    │ Not Found            │ Resource does not exist             │
│ 409    │ Conflict             │ Duplicate resource, version clash   │
│ 422    │ Unprocessable Entity │ Validation error on valid JSON      │
│ 429    │ Too Many Requests    │ Rate limit exceeded                 │
│ 500    │ Internal Server Error│ Unhandled exception in server       │
│ 503    │ Service Unavailable  │ Dependency down, maintenance mode   │
└────────┴──────────────────────┴────────────────────────────────────┘
```

---

## Lightweight Markdown Table (simpler alternative)

When box-drawing chars aren't needed (GitHub, Confluence), use Markdown tables:

```
| Database      | Type       | Best For           |
| :------------ | :--------- | :----------------- |
| PostgreSQL    | Relational | ACID transactions  |
| MongoDB       | Document   | Flexible schema    |
| Redis         | Key-Value  | Caching, sessions  |
| Elasticsearch | Search     | Full-text, analytics |
```

---

## Table Character Reference

| Character | Unicode | Use for |
| :--- | :--- | :--- |
| `┌ ┐ └ ┘` | U+250C/10/14/18 | Outer corners |
| `├ ┤` | U+251C/2524 | Left/right T-junction (row divider) |
| `┬ ┴` | U+252C/2534 | Top/bottom T-junction (col divider) |
| `┼` | U+253C | Interior cross |
| `─` | U+2500 | Horizontal line |
| `│` | U+2502 | Vertical line |

**Alignment tip:** Use a monospace font. Column widths must be consistent for the table to align properly.
