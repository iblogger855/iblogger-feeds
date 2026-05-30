# Strategy 8: The Engineer (Requirements → Constraints → Solution)

**Audience:** Engineers reviewing a technical decision or design.

**Goal:** Show that the solution is the logical result of the requirements and constraints, not an arbitrary choice.

**The Formula:**
```
1. State the requirements (what must be true)
2. State the constraints (what limits the solution space)
3. Show all candidate solutions
4. Eliminate each one that fails a requirement or constraint
5. The remaining solution is correct by elimination
6. Show trade-offs of the chosen solution
```

**Example — Choosing between SQL and NoSQL:**
> *"Requirements: store user sessions with O(1) read/write. Constraints: 50,000 writes/sec peak, 5ms SLA, schema may change.*
> *Candidates: PostgreSQL (relational), Redis (key-value), MongoDB (document), Cassandra (wide-column).*
> *PostgreSQL fails the write throughput constraint at this scale without massive sharding complexity.*
> *Redis satisfies all requirements but has persistence trade-offs if not configured correctly.*
> *MongoDB satisfies writes but adds document overhead we don't need for key-value access.*
> *Cassandra satisfies writes but adds operational complexity disproportionate to the problem.*
> *Redis is the correct choice — with AOF persistence enabled for durability."*

**When to use it:** Architecture Decision Records (ADRs), design reviews, RFC documents, code comments explaining non-obvious choices.

**Signature move:** "We considered X and Y, but eliminated them because... That left Z."

---

## Related

- [← Back to Strategies](README.md)
- [01 - MIT Professor](01-mit-professor.md)
- [06 - Journalist](06-journalist-inverted-pyramid.md)
