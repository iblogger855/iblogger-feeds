# Conditionals for Developers

**Tags:** #english #daily #grammar #conditionals #documentation  
**Read Time:** ~5 min

> Conditionals describe what happens under specific conditions. In software, nearly everything is conditional — "if X, then Y." Using the right conditional pattern makes your documentation, error messages, and specs precise and unambiguous.

---

## The Four Conditional Types

| Type | When to use | Pattern | Example |
|:-----|:------------|:--------|:--------|
| **Zero** | Always true — facts, rules | If + present, present | "If the token is expired, the request is rejected." |
| **First** | Likely future event | If + present, will | "If the migration fails, the system will roll back." |
| **Second** | Hypothetical / unlikely | If + past, would | "If we removed the cache, response times would triple." |
| **Third** | Past — something didn't happen | If + past perfect, would have | "If we had indexed the column, the query would have finished in 1ms." |

---

## Zero Conditional — Rules and Facts

Used for things that are always true: system behaviour, API contracts, invariants.

```
"If the queue is empty, the worker sleeps for 5 seconds."
"If the user has no active session, authentication fails."
"If you pass null, the function returns an empty array."
```

**In documentation:** This is the most common conditional. Use it to describe how a system behaves.

```
# How the cache works
If a key exists in the cache and has not expired, the cached value is returned.
If the key does not exist or has expired, the system fetches from the database
and updates the cache.
```

---

## First Conditional — Likely Futures and Warnings

Used for real future possibilities — deployment plans, release notes, warnings.

```
"If the memory usage exceeds 80%, the service will trigger an alert."
"If you run this migration without a backup, you will lose the data."
"If the client does not send a refresh token, the session will expire."
```

**In specs and runbooks:** Use first conditional to describe what will happen under expected conditions.

```
If the deploy succeeds, the health check endpoint will return 200 within 30 seconds.
If the health check fails, the deploy pipeline will automatically roll back.
```

---

## Second Conditional — Hypotheticals and Trade-off Discussions

Used when discussing options, alternatives, and design trade-offs that aren't current reality.

```
"If we used a message queue instead of synchronous calls, 
 the system would be more resilient to spikes."
"If we stored sessions in Redis, we would lose them on Redis restart 
 unless we configured persistence."
"If the team were larger, we would split this into two services."
```

**In ADRs and tech specs:** Use second conditional to discuss alternatives that were considered but not chosen.

```
If we chose MySQL instead of PostgreSQL, we would lose native JSONB support,
which would require an additional library for the metadata storage requirements.
```

---

## Third Conditional — Post-Mortems and Lessons Learned

Used to describe what would have happened differently — always about the past.

```
"If we had added an index earlier, the migration would have taken minutes instead of hours."
"If the alert threshold had been set correctly, we would have caught this before users were affected."
"If the deployment had included a smoke test, the broken config would have been detected."
```

**In post-mortems:** This is how you describe what a better system would have done.

---

## unless / provided that / as long as / only if

These are alternatives to "if" that carry specific nuance:

### unless = if not
```
"The cache is used unless the TTL has expired."
= "The cache is used if the TTL has not expired."

"Do not deploy unless CI is green."
= "Only deploy if CI is green."
```

### provided that / as long as = only under this condition
```
"The endpoint is available provided that the user has the admin role."
"Reads are served from the replica as long as replication lag is under 1 second."
```

### only if = strict condition — nothing else will do
```
"Trigger the rollback only if the error rate exceeds 5%."
"Run the migration only if a backup was confirmed successful."
```

---

## when vs if

**if** — possibility, not certain to happen  
**when** — certainty, will definitely happen

```
"If the service crashes, restart it."     ← might happen
"When the service starts, it reads the config file."  ← always happens
"When you run the migration, a backup is created automatically."
"If you run the migration without a backup, data may be lost."
```

---

## Conditionals in Error Messages

```
"If this error persists, contact support."      ← first conditional, polite
"If you see this message, the token has expired. Please log in again."
"If the issue continues after retrying, check the service status page."
```

---

## Common Mistakes

| Wrong | Why | Right |
|:------|:----|:------|
| `"If the token will expire..."` | Present tense in the if-clause, not future | `"If the token expires..."` |
| `"If I would have known..."` | Third conditional uses past perfect, not would | `"If I had known..."` |
| `"Unless you don't send a token..."` | "unless" already means "if not" — double negative | `"Unless you send a token..."` |
| `"Provided if the config exists..."` | "provided" and "if" are not combined | `"Provided the config exists..."` |

---

## Related

- [Tense in Documentation](./04-tense-in-documentation.md)
- [Sentence Connectors](./07-sentence-connectors.md)
- [Error Messages](../technical/06-error-messages.md)
