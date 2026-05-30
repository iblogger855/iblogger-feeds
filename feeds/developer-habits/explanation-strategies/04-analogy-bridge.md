# Strategy 4: The Analogy Bridge

**Audience:** Learners who already understand one domain and need to map it to a new one.

**Goal:** Transfer understanding from the known domain to the unknown one.

**The Formula:**
```
known_concept : known_domain = unknown_concept : unknown_domain

State the mapping explicitly:
"X in [familiar domain] is exactly Y in [new domain], because both..."
Then show where the analogy BREAKS — this is where real understanding lives.
```

**Example — Explaining Promises/Async to a synchronous programmer:**
> *"You know how a restaurant gives you a buzzer when they take your order? The buzzer is a Promise. Right now it's Pending. When your table is ready, it resolves (buzzes). You can 'chain' actions: 'when buzzer fires, go to table, then sit, then order drinks.' If the kitchen closes, the buzzer rejects and you go somewhere else.*
> *Where the analogy breaks: unlike a buzzer, a Promise can only resolve OR reject once — it can't buzz twice."*

**When to use it:** Teaching a new paradigm (async, functional programming, distributed systems) to someone strong in a different paradigm.

**Signature move:** Always say where the analogy breaks. It shows intellectual honesty and prevents wrong mental models.

---

## Related

- [← Back to Strategies](README.md)
- [03 - ELI5](03-eli5.md)
- [07 - Storyteller](07-storyteller-narrative-arc.md)
