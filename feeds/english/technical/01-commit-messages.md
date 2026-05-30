# Writing Clear Commit Messages

**Tags:** #english #technical #git #writing  
**Read Time:** ~5 min

> A commit message is a letter to the next developer who touches this code — including future you. Write it so they understand not just *what* changed, but *why*.

---

## The Basic Structure

```
<type>: <short summary in present tense>

<optional body — explain why, not what>

<optional footer — breaking changes, issue links>
```

**Example:**
```
fix: prevent session expiry on active users

Sessions were timing out after 30 minutes even when the user
was actively clicking. The expiry timer was not being reset
on API calls, only on page loads.

Closes #1042
```

---

## The Summary Line — Rules

| Rule | Wrong | Right |
|:-----|:------|:------|
| Use present tense | "Fixed the bug" | "Fix the bug" |
| Start with a verb | "Session timeout issue" | "Fix session timeout on active users" |
| No period at the end | "Add login feature." | "Add login feature" |
| Under 72 characters | (too long to fit in git log) | Keep it short |
| Be specific | "Fix bug" | "Fix null pointer on empty cart checkout" |

---

## Common Types

| Type | When to Use | Example |
|:-----|:------------|:--------|
| `feat` | New feature | `feat: add email verification on signup` |
| `fix` | Bug fix | `fix: handle empty state in user list` |
| `refactor` | Code change with no behavior change | `refactor: extract payment logic into service` |
| `test` | Adding or fixing tests | `test: add unit tests for discount calculator` |
| `docs` | Documentation only | `docs: update README with docker setup steps` |
| `chore` | Tooling, dependencies, config | `chore: upgrade eslint to v9` |
| `perf` | Performance improvement | `perf: cache user permissions to reduce DB calls` |
| `style` | Formatting only | `style: fix indentation in auth module` |

---

## Writing the Body

The body answers **why** — not what. The diff already shows what changed.

**Bad body:**
```
refactor: move auth logic to service layer

Moved the authentication logic from the controller
to a new AuthService class.
```
*(The diff already shows this. Useless.)*

**Good body:**
```
refactor: move auth logic to service layer

The controller was growing too large and auth logic was
duplicated across three endpoints. Centralising it in
AuthService makes it testable in isolation and removes
the duplication.
```
*(Explains the motivation — the reader now understands the decision.)*

---

## Breaking Change Footer

```
feat!: change user ID format from integer to UUID

BREAKING CHANGE: user IDs are now UUIDs (string).
Any client storing user IDs as integers must migrate.
Migration script: scripts/migrate-user-ids.sh
```

---

## Phrases That Work Well

| Situation | Phrase |
|:----------|:-------|
| You fixed a bug | `Fix X when Y` |
| You added a feature | `Add X to Y` |
| You removed something | `Remove X` / `Drop support for X` |
| You improved performance | `Improve X performance by doing Y` |
| You updated a dependency | `Upgrade X from vN to vM` |
| You prevented a future problem | `Prevent X by doing Y` |
| You renamed something | `Rename X to Y` |

---

## Common Mistakes

| Mistake | Example | Fix |
|:--------|:--------|:----|
| Past tense | `"Added login"` | `"Add login"` |
| Too vague | `"Fix stuff"` | `"Fix cart total calculation when discount applied"` |
| Explains what, not why | `"Moved code to utils"` | `"Extract date helpers to utils to avoid duplication"` |
| Includes ticket number in summary | `"[JIRA-123] Fix thing"` | Put the ticket in the footer: `Closes JIRA-123` |
| All caps | `"FIX CRASH ON LOGIN"` | `"Fix crash on login when session is null"` |

---

## Related

- [Pull Request Descriptions](./02-pull-request-descriptions.md) — the longer form of this same skill
- [Commit Message Rules Procedure](../../procedures/software-delivery/07-commit-message-rules.md) — the full team standard
