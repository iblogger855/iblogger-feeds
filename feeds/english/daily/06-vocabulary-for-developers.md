# Essential Vocabulary for Developers

**Tags:** #english #daily #vocabulary #writing  
**Read Time:** ~6 min

> These are the words that appear constantly in technical writing, code reviews, and documentation. Using them precisely makes you sound like a professional.

---

## Describing Code Quality

| Word | Meaning | Example |
|:-----|:--------|:--------|
| **robust** | Works correctly under many conditions, including edge cases | "We need a more robust error handler." |
| **brittle** | Breaks easily when conditions change slightly | "This regex is brittle — it will fail on non-ASCII input." |
| **idiomatic** | Written in the natural style of the language/framework | "That's not idiomatic Python — use a list comprehension instead." |
| **verbose** | Uses more words/code than necessary | "This is verbose — we can simplify with a helper function." |
| **concise** | Short and clear | "Rewrite this to be more concise." |
| **explicit** | Clearly stated, no assumptions | "Be explicit about the error type — don't catch all exceptions." |
| **implicit** | Assumed, not stated | "The implicit dependency on the config file makes testing hard." |
| **opaque** | Hard to understand | "This function name is opaque — what does `processData()` actually do?" |
| **self-documenting** | Code that explains itself through naming | "Good naming makes this self-documenting." |

---

## Describing System Behaviour

| Word | Meaning | Example |
|:-----|:--------|:--------|
| **deterministic** | Same input always produces same output | "The function must be deterministic for testing to be reliable." |
| **idempotent** | Calling multiple times has same effect as calling once | "Make the endpoint idempotent — duplicate requests should not create duplicates." |
| **atomic** | All or nothing — either fully completes or has no effect | "The database write must be atomic." |
| **synchronous** | Waits for the operation to complete before continuing | "This is a synchronous API call — it blocks the thread." |
| **asynchronous** | Does not wait — continues and handles the result later | "Use an async handler so the UI doesn't freeze." |
| **stateless** | Does not store information between calls | "Keep the service stateless so it scales horizontally." |
| **deprecated** | Still works but will be removed in a future version | "This endpoint is deprecated — use v2 instead." |
| **obsolete** | No longer used or supported | "This library is obsolete — it hasn't been updated in 5 years." |

---

## Describing Changes

| Word | Meaning | Example |
|:-----|:--------|:--------|
| **introduce** | Add for the first time | "This PR introduces a caching layer." |
| **address** | Fix or deal with (an issue) | "This PR addresses the memory leak." |
| **resolve** | Completely fix | "This resolves the race condition." |
| **mitigate** | Reduce (but not eliminate) the impact | "Adding a retry will mitigate the connection timeout issue." |
| **propagate** | Spread through the system | "The error propagates up through the call stack." |
| **expose** | Make available | "The service exposes a REST API." |
| **consume** | Use a service or API | "The frontend consumes this endpoint." |
| **abstract** | Hide complexity behind a simpler interface | "We abstract the database layer so tests don't need a real DB." |
| **encapsulate** | Bundle related things together and hide internal details | "Encapsulate the payment logic in a single service." |

---

## Describing Problems

| Word | Meaning | Example |
|:-----|:--------|:--------|
| **regression** | A bug that was previously fixed and has returned | "The refactor introduced a regression in the login flow." |
| **bottleneck** | The slowest part that limits the whole system | "The database is the bottleneck — not the API." |
| **edge case** | An unusual input or condition at the boundary of normal usage | "Handle the edge case where the cart is empty." |
| **root cause** | The underlying reason, not just the symptom | "Fix the root cause, not the symptom." |
| **cascade** | When one failure triggers other failures | "A single pod failure cascaded across the cluster." |
| **intermittent** | Happening sometimes but not consistently | "The error is intermittent — hard to reproduce." |
| **flaky** | Unreliable — sometimes passes, sometimes fails | "This test is flaky — it depends on timing." |

---

## Describing Architecture

| Word | Meaning | Example |
|:-----|:--------|:--------|
| **coupling** | How dependent two components are on each other | "High coupling makes this hard to test in isolation." |
| **cohesion** | How related the responsibilities of a component are | "Low cohesion — this class does too many unrelated things." |
| **dependency** | Something a component requires to function | "Add the new library as a dependency." |
| **abstraction** | A simplified interface over complex implementation | "This abstraction hides the database details from the controller." |
| **contract** | The agreed interface between two components | "The API contract says this field is always a string." |
| **boundary** | Where one component ends and another begins | "Don't cross the service boundary without going through the API." |
| **throughput** | Amount of work processed in a given time | "Target: 1,000 requests per second throughput." |
| **latency** | Time from request to response | "P99 latency must be under 200ms." |

---

## Words That Sound Professional

| Instead of | Use |
|:-----------|:----|
| `make it work` | `implement`, `address`, `resolve` |
| `good` | `robust`, `reliable`, `maintainable` |
| `bad` | `brittle`, `opaque`, `tightly coupled` |
| `fix` | `resolve`, `address`, `mitigate` (choose based on how complete the fix is) |
| `look at` | `review`, `investigate`, `audit` |
| `change` | `update`, `modify`, `refactor`, `migrate` (choose the most precise word) |

---

## Related

- [Commonly Confused Words](./01-commonly-confused-words.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
- [Engineering Slang](../idioms/03-engineering-slang.md)
