# Tense in Documentation and Commit Messages

**Tags:** #english #daily #grammar #tense #writing  
**Read Time:** ~4 min

> Using the wrong tense makes documentation confusing. The wrong tense signals to the reader: "this was written at a specific moment in time and may no longer be true."

---

## The Quick Rules

| Document type | Tense | Why |
|:-------------|:------|:----|
| Commit messages | Present | Describes what the commit *does*, not what you *did* |
| PR descriptions | Present (for changes), Past (for problems fixed) | Matches the commit convention |
| README / docs | Present | Documentation describes the current state |
| Post-mortem | Past | Describes what happened |
| Runbook / instructions | Imperative (command) | You're telling someone what to do |
| Code comments (describing behaviour) | Present | The code *does* something, always |
| ADR | Past (for context), Present (for decision) | The decision is still in effect |

---

## Commit Messages — Present Tense

Commits describe what the commit does when applied, not what you did.

```
✓  "Add email validation on signup"
✗  "Added email validation on signup"

✓  "Fix null pointer on empty cart checkout"
✗  "Fixed null pointer on empty cart checkout"

✓  "Remove deprecated payment endpoint"
✗  "Removed deprecated payment endpoint"
```

**Think of it as:** "If you apply this commit, it will [verb] [thing]."

---

## README / Documentation — Present Tense

Documentation describes the current state of the system.

```
✓  "The service handles authentication and token refresh."
✗  "The service handled authentication and token refresh."
✗  "The service will handle authentication and token refresh."

✓  "Run npm install to install dependencies."
✓  "The config file is located at /etc/app/config.yaml."
```

**Exception:** When describing history — "This module was originally part of the auth service and was extracted in v2."

---

## Runbooks and Instructions — Imperative

When telling someone what to do, use commands (imperative mood). No subject needed.

```
✓  "Run the migration script."
✓  "Check the queue depth in Grafana."
✓  "Scale down the worker to 0 replicas."
✓  "Wait 30 seconds."

✗  "You should run the migration script."
✗  "The engineer should check the queue depth."
```

Imperative is shorter, clearer, and sounds more authoritative.

---

## Post-Mortems — Past Tense

Post-mortems describe what happened.

```
✓  "At 14:32 UTC, the payment service stopped processing webhooks."
✓  "The on-call engineer was paged at 14:45."
✓  "The root cause was a race condition in the idempotency key check."
✓  "We deployed the fix at 16:10 UTC."
```

---

## ADRs — Mixed Tense

| Section | Tense | Example |
|:--------|:------|:--------|
| Context | Past | "We needed to choose a primary database." |
| Decision | Present | "We use PostgreSQL." |
| Consequences | Present | "This gives us strong ACID guarantees." |

---

## Common Mistakes

| Wrong | Right | Why |
|:------|:------|:----|
| `"Added login feature"` (commit) | `"Add login feature"` | Commits use present tense |
| `"This function returned the user"` (comment) | `"Returns the user"` | Code always *does* something |
| `"You should run npm install"` (runbook) | `"Run npm install"` | Instructions use imperative |
| `"The system will handle auth"` (README) | `"The system handles auth"` | Docs describe current state |
| `"This fixed the bug"` (PR body — changes section) | `"This fixes the bug"` | Present for current changes |

---

## Related

- [Commit Messages](../technical/01-commit-messages.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
- [Active vs Passive Voice](./05-active-vs-passive-voice.md)
