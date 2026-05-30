# Strategy 6: The Journalist (Inverted Pyramid)

**Audience:** Busy readers who may stop reading at any point.

**Goal:** Deliver the most important information first. Every subsequent paragraph adds depth but is optional.

**The Formula:**
```
Paragraph 1: The entire story in one sentence (the lede)
Paragraph 2: The most critical details
Paragraph 3: Supporting context
Paragraph 4: Background / history
Paragraph 5+: Details only specialists need
```

**Example — Explaining a production incident:**
> *"Our payment service was down for 23 minutes from 14:32 to 14:55 UTC, affecting 1,200 transactions totaling $87,000 in failed checkouts.*
> *Root cause: a connection pool exhaustion triggered by a slow DB query from the new coupon feature deployed at 14:20.*
> *Fix: the query is now indexed; pool size increased from 10 to 25; a circuit breaker was added.*
> *Timeline: at 14:20, feature deployed. At 14:32, first 500 errors. At 14:45, on-call paged. At 14:55, rollback complete..."*

**When to use it:** Incident postmortems, executive summaries, PRD introductions, README opening sections, Slack announcements.

**Signature move:** Write the conclusion first. Then ask: "if someone reads only this line, do they know what happened?"

---

## Related

- [← Back to Strategies](README.md)
- [07 - Storyteller](07-storyteller-narrative-arc.md)
- [08 - Engineer Strategy](08-engineer-requirements-constraints-solution.md)
