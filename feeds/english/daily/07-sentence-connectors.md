# Sentence Connectors for Technical Writing

**Tags:** #english #daily #grammar #connectors #writing  
**Read Time:** ~5 min

> Connectors are the words that link ideas together — showing cause, contrast, sequence, and consequence. Using them precisely makes documentation and technical writing read like professional writing, not a list of disconnected facts.

---

## Categories

| Category | Purpose | Key words |
|:---------|:--------|:----------|
| **Cause / Result** | X happened because of Y | therefore, thus, as a result, consequently, because, since |
| **Contrast** | X is true, but Y is also true | however, although, whereas, while, despite, in contrast |
| **Addition** | Adding more supporting information | furthermore, in addition, moreover, also |
| **Sequence** | Steps in order | first, then, next, finally, subsequently |
| **Condition** | X only applies when Y is true | if, when, unless, provided that, as long as |
| **Example** | Illustrating a point | for example, for instance, such as, e.g. |
| **Clarification** | Restating more clearly | that is, i.e., in other words, specifically |

---

## Cause and Result

### therefore / thus / as a result / consequently

All mean the same thing: the previous sentence is the cause, this sentence is the effect.

```
"The query was not indexed. Therefore, response times exceeded 10 seconds."
"The query was not indexed; thus, response times exceeded 10 seconds."
"The query was not indexed. As a result, response times exceeded 10 seconds."
```

**Formality:**  
`consequently` → most formal  
`therefore` / `thus` → formal, common in docs  
`as a result` → neutral, natural in most contexts  
`so` → informal (fine in Slack, avoid in documentation)

### because vs since

Both introduce a reason. Use **because** when the reason is the main point. Use **since** only for time — it avoids ambiguity.

```
"The deploy failed because the environment variable was missing."    ✓
"The deploy failed since the environment variable was missing."      ✗ (ambiguous — time or reason?)
```

---

## Contrast

### however

Introduces a statement that contrasts with the previous one. Always starts a new sentence or follows a semicolon.

```
"PostgreSQL offers strong ACID guarantees. However, horizontal sharding requires more effort."
"The feature is complete; however, the tests are still failing."
```

Never write: `"The feature is complete, however the tests are failing."` — a comma before "however" is incorrect.

### although / even though / while

Introduce a contrast within the same sentence.

```
"Although the cache reduced latency, it introduced consistency issues."
"Even though the tests pass locally, CI is failing."
"While PostgreSQL is more feature-rich, MySQL is simpler to operate."
```

### whereas

Directly compares two things — used when showing a direct opposition.

```
"The old approach uses synchronous calls, whereas the new one uses a message queue."
"REST is stateless, whereas WebSockets maintain a persistent connection."
```

### despite / in spite of

Show that something happened even though a barrier existed.

```
"Despite the high latency, the system remained stable."
"The deploy succeeded in spite of the failed smoke test." (unexpected — usually you'd fail)
```

---

## Addition

### furthermore / moreover / in addition

Add a second supporting point — stronger and more important than "also."

```
"The new indexing strategy reduces query time. Furthermore, it reduces CPU load."
"The migration is irreversible. Moreover, it affects all environments simultaneously."
```

Use `also` in casual writing. Use `furthermore` / `moreover` in formal documentation.

---

## Sequence

| Connector | Position | Example |
|:----------|:---------|:--------|
| `First,` | Step 1 | "First, run the migration." |
| `Then,` | Next step | "Then, restart the service." |
| `Next,` | Following step | "Next, verify the queue is empty." |
| `Subsequently,` | Formal next step | "Subsequently, the worker picks up the job." |
| `Finally,` | Last step | "Finally, confirm the health check passes." |
| `Once X,` | After condition | "Once the migration completes, restart the worker." |

---

## Condition

```
"If the queue depth exceeds 1,000, scale up the workers."
"Unless the token is valid, the request is rejected."
"The cache is used provided that the TTL has not expired."
"As long as the primary is healthy, reads are served from it."
```

---

## Clarification

### i.e. vs e.g. (review)

```
"Use a relational database, i.e. PostgreSQL."     — that is (only one)
"Use a relational database, e.g. PostgreSQL."     — for example (one of many)
```

### in other words / that is / specifically

```
"The endpoint is idempotent — in other words, calling it multiple times 
 has the same effect as calling it once."
"The system is stateless, that is, it stores no information between requests."
"Three services are affected, specifically: auth, payments, and notifications."
```

---

## Common Mistakes

| Wrong | Why | Right |
|:------|:----|:------|
| `"The test failed, however CI passed."` | Comma before "however" is wrong | `"The test failed; however, CI passed."` |
| `"Since the config was missing, the deploy failed."` | Ambiguous — time or reason? | `"Because the config was missing, the deploy failed."` |
| `"Although X, but Y"` | "although" and "but" cannot both be in the same sentence | `"Although X, Y."` or `"X, but Y."` |
| `"Despite of the errors..."` | "despite" does not take "of" | `"Despite the errors..."` |

---

## Related

- [Active vs Passive Voice](./05-active-vs-passive-voice.md)
- [Tense in Documentation](./04-tense-in-documentation.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
