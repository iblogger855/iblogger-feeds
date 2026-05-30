# Writing Pull Request Descriptions

**Tags:** #english #technical #git #code-review #writing  
**Read Time:** ~6 min

> A good PR description is the difference between a reviewer who understands your change in 2 minutes and one who spends 20 minutes guessing what you were trying to do.

---

## Why It Matters

The reviewer has not been inside your head for the last two days. They open your PR cold. A good description gives them:

1. **What** changed — a plain-language summary
2. **Why** it changed — the motivation or problem being solved
3. **How to verify** it works — steps to test it
4. **What to watch out for** — risks, edge cases, trade-offs

---

## The Standard Structure

```markdown
## Summary
One or two sentences. What does this PR do?

## Why
What problem does this solve? What would happen if we didn't merge this?

## Changes
- Bullet list of the main changes
- Keep each point to one line
- Focus on the important ones — not every file touched

## How to Test
1. Step-by-step instructions to verify the change works
2. Include what the expected result looks like
3. Mention any test accounts, feature flags, or setup needed

## Screenshots (if UI change)
Before / After

## Checklist
- [ ] Tests added or updated
- [ ] No new lint warnings
- [ ] Tested locally
- [ ] Documentation updated (if needed)
```

---

## Real Examples

### Bad PR Description

```
Fix bug
```

The reviewer has no idea what bug, where, why it happened, or how to verify the fix. This wastes everyone's time.

---

### Good PR Description

```markdown
## Summary
Fix session timeout that was logging out active users every 30 minutes.

## Why
Users reported being unexpectedly logged out mid-workflow. The session
expiry timer was resetting only on page loads, not on API calls — so
a user who stayed on a single-page view would be logged out even while
actively working.

## Changes
- Reset session expiry on every authenticated API request
- Add unit test for session extension logic
- Add integration test for the 30-minute boundary

## How to Test
1. Log in as any test user
2. Stay on the dashboard page without refreshing
3. Wait 25 minutes and make any action (e.g. click "Save")
4. Previously: logged out after 30 min. Now: session extends.

## Checklist
- [x] Tests added
- [x] No new lint warnings
- [x] Tested locally
```

---

## Useful Phrases for Each Section

### Summary
- `This PR adds...`
- `This PR fixes...`
- `This PR refactors... to...`
- `This PR replaces X with Y`

### Why
- `Previously, X would happen when Y.`
- `This was causing [problem] for [who].`
- `Without this change, [consequence].`
- `This is a prerequisite for [other work].`

### Changes
- `Add X to handle Y`
- `Remove X — no longer needed since Y`
- `Extract X into its own module for reuse`
- `Update X to use Y instead of Z`

### How to Test
- `Navigate to...`
- `Log in as... (credentials in 1Password)`
- `Expected result: ...`
- `Previously you would see... Now you should see...`

---

## Things Reviewers Hate

| Mistake | Why It's Bad |
|:--------|:------------|
| No description | Reviewer must read every line to understand intent |
| "As per the ticket" | Not everyone has Jira access open; summarise it here |
| Screenshots missing for UI changes | Reviewer cannot see what "looks right" means |
| No test instructions | Reviewer cannot verify the fix themselves |
| Vague summary | "Improvements to auth" — what improvements? |
| Giant PR with no explanation | 2,000 lines with one line of context is a nightmare to review |

---

## Length Guide

| PR size | Description length |
|:--------|:------------------|
| 1–50 lines changed | 2–4 sentences |
| 51–200 lines | Full structure above |
| 200+ lines | Full structure + a note explaining why it's large and how to read it |

---

## Related

- [Commit Messages](./01-commit-messages.md) — the short form of the same skill
- [Code Review & PR Flow](../../procedures/software-delivery/04-code-review-and-pr.md) — the team procedure
