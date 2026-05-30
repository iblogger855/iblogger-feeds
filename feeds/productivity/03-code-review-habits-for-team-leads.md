# Code Review Habits for Team Leads

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #code-review #team-lead #productivity #pull-request #feedback #quality  
**Category:** Productivity  
**Read Time:** ~12 min

> Code review is the highest-leverage activity a team lead does. One hour of thoughtful review protects weeks of QA time, prevents production incidents, and teaches the whole team without a single meeting. But done wrong, it becomes a bottleneck, a morale destroyer, or pure rubber-stamping. This guide is about doing it right.

---

## 📌 Table of Contents
- [The Team Lead's Review Mindset](#the-team-leads-review-mindset)
- [Time-Boxing: When and How Long](#time-boxing-when-and-how-long)
- [The Review Order — What to Read First](#the-review-order-what-to-read-first)
- [Three Levels of Comment](#three-levels-of-comment)
- [What a TL Looks For (That a Peer Misses)](#what-a-tl-looks-for-that-a-peer-misses)
- [How to Give Feedback That Teaches](#how-to-give-feedback-that-teaches)
- [The Approval Decision](#the-approval-decision)
- [After the Review — Following Through](#after-the-review-following-through)
- [Anti-Patterns to Eliminate](#anti-patterns-to-eliminate)

---

## The Team Lead's Review Mindset

A peer review asks: *"Does this code work?"*  
A team lead review asks: *"Does this code belong in our system?"*

The difference matters. A developer checks correctness. A team lead checks:

```
CORRECTNESS        Does it do what the ticket says?
ARCHITECTURE       Does it fit the design we agreed on?
SAFETY             Will it fail safely when it breaks?
TEACHABILITY       Will a junior understand this in 6 months?
MAINTAINABILITY    Can we change this without breaking 5 other things?
RISK               What is the blast radius if this is wrong?
```

You are not the last line of defence against bugs — CI and QA are. You are the guardian of the system's shape over time.

---

## Time-Boxing: When and How Long

### When to Review

```
RULE: Review PRs in two scheduled windows — not on demand.

  Morning window:   First 30 min after standup
                    PRs that arrived overnight / before standup
  Afternoon window: After lunch (13:30–14:00)
                    PRs that arrived during the morning

WHY TWO WINDOWS:
  Checking PRs every 30 minutes = context-switch death
  Waiting until end of day = developer blocked all day
  Two windows = max 4-hour wait, your flow stays intact
```

### How Long Per PR

```
PR SIZE            TIME BOX     WHAT TO DO
────────────────   ──────────   ───────────────────────────────
< 50 lines         10–15 min    Full review, check everything
50–200 lines       20–30 min    Full review with focused attention
200–500 lines      45–60 min    Full review — flag if too big
> 500 lines        Flag it      Request to split before reviewing
                                Exception: auto-generated code only

THE 500-LINE RULE:
  A PR over 500 lines of changed application code cannot be
  reviewed thoroughly in one session. The author chose convenience
  over the team's ability to review. Push it back — not as a
  rejection, as a process correction.

  Message: "This is a large PR. Can you split it into:
            1. [data model change]
            2. [service layer change]
            3. [API + tests]
            Smaller PRs = faster reviews and less risk."
```

---

## The Review Order — What to Read First

Do not read code top to bottom the way the IDE shows it. Read in this order:

```
STEP 1 — READ THE PR DESCRIPTION (2 min)
  What problem does this solve?
  How did the author choose to solve it?
  What did they test?
  If the description is blank → REQUEST CHANGES immediately.
  You cannot review code you don't understand the intent of.

STEP 2 — SCAN THE FILE LIST (1 min)
  Which files changed?
  Are there unexpected files? (config, unrelated service, migrations)
  Is the scope what the ticket described?
  Unexpected files = scope creep or hidden side effect — investigate.

STEP 3 — READ THE TESTS FIRST (5–10 min)
  Tests tell you what the author THOUGHT the code should do.
  Read tests before implementation:
    → You see intent before you see code
    → You spot missing cases before reading 400 lines of logic
    → You know what "done" looks like before judging the path

STEP 4 — READ THE IMPLEMENTATION (10–20 min)
  Now read the code with the test context in your head.
  Focus on: architecture fit, data flow, error handling, edge cases.

STEP 5 — CHECK THE DIFF HOLISTICALLY (2 min)
  Are there any debug logs left in?
  Any commented-out code blocks?
  Any TODO comments that should be tickets?
  Any secrets or hardcoded values?
```

---

## Three Levels of Comment

Not all review comments are equal. Label yours so the author knows the weight:

```
LEVEL 1 — BLOCKING (must fix before merge)
  Prefix: [MUST] or no prefix (default = blocking)
  Use for: bugs, security issues, architecture violations,
           missing tests for critical paths, data safety issues
  Example:
    "This query is missing parameterization — SQL injection risk.
     Must use prepared statement."

LEVEL 2 — RECOMMENDED (should fix, will discuss if not)
  Prefix: [SHOULD]
  Use for: design improvements, naming clarity, test coverage gaps,
           performance concerns with evidence
  Example:
    "[SHOULD] This method is doing 3 things. Consider extracting
     the validation logic into validateOrderRequest()."

LEVEL 3 — NON-BLOCKING (optional, no reply needed)
  Prefix: [NIT] or [SUGGESTION]
  Use for: style preferences not covered by linter,
           alternative approaches, minor naming tweaks
  Example:
    "[NIT] paymentAmt → paymentAmount is slightly more readable."

RULE: If you cannot tell whether a comment is MUST or SHOULD,
      it is probably SHOULD. Only block on things that would
      genuinely cause harm if shipped as-is.
```

---

## What a TL Looks For (That a Peer Misses)

### Architecture Fit

```
QUESTIONS TO ASK:
  □ Does this change follow the layered architecture we agreed on?
    (e.g. business logic must NOT be in the controller layer)
  □ Does it introduce a new pattern that conflicts with existing ones?
  □ Does it add a dependency on a module that should not depend on it?
  □ Is a new abstraction introduced? Is it justified, or premature?
  □ Is a service being called that now creates a circular dependency?
```

### Data Safety

```
QUESTIONS TO ASK:
  □ Is the database migration backward-compatible?
    (Can the old version of the app run against the new schema?)
  □ Are there NOT NULL columns added without a DEFAULT?
    → Breaks on existing rows during migration
  □ Are FK constraints defined? Or does the code "trust" orphan prevention?
  □ Is there a transaction boundary? Can partial state be committed?
  □ If this fails mid-way, what state is the DB left in?
```

### Failure Modes

```
QUESTIONS TO ASK:
  □ What happens when the external API call times out?
  □ What happens when the queue message is delivered twice?
    (Is the consumer idempotent?)
  □ What happens when this receives null / empty / unexpected input?
  □ Is there an error response that leaks a stack trace or internal path?
  □ Will this silently fail or loudly fail? Loud failure is almost always better.
```

### Test Quality (Not Just Coverage)

```
QUESTIONS TO ASK:
  □ Does the test verify behavior or just verify a mock was called?
    Bad: verify(repo).save(any())
    Good: assertThat(savedOrder.status).isEqualTo(OrderStatus.CONFIRMED)
  □ Are edge cases tested? (null input, empty list, concurrent calls)
  □ Would this test catch a real regression if the logic changed?
  □ Is the test name describing what the scenario is and what should happen?
    Bad: testCreateOrder()
    Good: createOrder_whenPaymentFails_shouldRollbackAndThrow()
```

---

## How to Give Feedback That Teaches

A review comment that only says what is wrong is half a comment. A comment that says why it is wrong and what to do instead is the full comment.

### The Feedback Formula

```
FORMULA: [WHAT] + [WHY] + [HOW]

BAD:
  "This is messy."
  "Not how we do it here."
  "Needs refactoring."

GOOD:
  "This method is doing three things: validation, persistence, and
   notification. When one changes, all three are at risk of breaking.
   Split into validateOrder(), saveOrder(), and notifyProvider() —
   each with its own test. This is Single Responsibility."

  "Catching Exception here swallows all errors silently.
   The order could fail and the customer would never know.
   Catch only PaymentGatewayException and let others propagate
   so the global error handler can log and alert."
```

### Praise Publicly, Correct Specifically

```
WHEN YOU SEE GOOD CODE — SAY SO:
  "Nice use of the builder pattern here — much easier to read
   than the old constructor with 7 parameters."

  "The retry logic with exponential backoff is exactly right.
   This is the pattern we want everywhere we call the payment API."

WHY THIS MATTERS:
  Developers learn from seeing what good looks like, not just bad.
  A team lead who only flags problems trains people to fear review.
  A team lead who also calls out quality trains people to aim for it.
```

### When You Disagree With the Author's Approach

```
DON'T: "This is wrong. Use X instead."
DO:    "I'd approach this differently — I'd use X because Y.
        Your approach works but has Z trade-off.
        Happy to discuss — what was your reasoning?"

The author may have context you don't.
If they have a good reason, update your own understanding.
If they don't, they'll see why X is better from the explanation.
Either way, a conversation is better than a verdict.
```

---

## The Approval Decision

```
APPROVE when:
  ✓ All [MUST] issues are resolved
  ✓ Tests cover the critical path
  ✓ Architecture fits the system
  ✓ No obvious security or data safety issues
  ✓ You would be comfortable debugging this in production at 2am

REQUEST CHANGES when:
  ✗ Any [MUST] issue is unresolved
  ✗ Missing tests for new logic
  ✗ Architecture diverges from team agreement
  ✗ Data migration is unsafe
  ✗ The PR description is blank (before even reading the code)

APPROVE WITH COMMENTS when:
  ~ Only [SHOULD] or [NIT] items remain
  ~ Author can merge now and optionally address minor items
  ~ Used for low-risk PRs where you trust the author's judgment
  Note: be explicit — "Approved — please address [SHOULD] items
        as a follow-up ticket before the next sprint ends."

NEVER:
  ✗ Approve a PR you did not read
  ✗ Approve to avoid conflict — a bad PR in production is worse
  ✗ Block on style preferences not enforced by the linter
  ✗ Leave a PR without a response for > 1 business day
```

---

## After the Review — Following Through

Code review does not end when you click Approve.

```
TRACK PATTERNS, NOT JUST PRs:
  If the same developer gets the same [SHOULD] comment in 3 PRs,
  that is a coaching conversation — not a 4th comment.
  Note: "Rith has missed error handling on external calls three times.
        Address in next 1-on-1 with a concrete example."

TURN RECURRING ISSUES INTO TEAM AGREEMENTS:
  If you comment on the same thing across multiple developers' PRs,
  it means the team agreement is unclear.
  → Write an ADR or add it to CONTRIBUTING.md
  → One document prevents infinite repeated comments

METRICS TO WATCH (weekly, not daily):
  □ Average PR open time: target < 1 business day from CI green
  □ PRs open > 2 days: flag in standup
  □ Review turnaround: are developers waiting on you?
  □ Comment-to-merge ratio: high ratio = either quality issues or
    over-commenting on trivial style
```

---

## Anti-Patterns to Eliminate

| Anti-Pattern | What It Costs | Fix |
|:-------------|:-------------|:----|
| **Reviewing PRs on demand, all day** | Constant context switching — your deep work disappears | Two fixed review windows per day |
| **Top-to-bottom code reading without reading tests first** | You judge correctness without knowing intent | Always read tests before implementation |
| **Vague comments: "this is messy"** | Author doesn't know what to change; learns nothing | What + Why + How in every blocking comment |
| **Blocking on linter-style preferences** | Developer frustration; slows delivery | Style goes in the linter — if it's not in the linter, it's not a block |
| **Approving to avoid conflict** | Bad code ships; your approval loses meaning | Approve means "I would ship this" — nothing less |
| **No praise, only corrections** | Team learns to fear review; quality doesn't improve | Call out good code explicitly and specifically |
| **Same comment on multiple PRs** | Your time wasted; developer confused why it matters | One CONTRIBUTING.md update prevents infinite repeated comments |
| **Re-reading unchanged sections** | Re-review takes as long as first review | On re-review, only read changed sections + related tests |

---

## Related

| Resource | Why |
|:---------|:----|
| [Code Review & PR Flow](../procedures/software-delivery/04-code-review-and-pr.md) | The team procedure this guide's habits fit inside |
| [CONTRIBUTING.md Template](../templates/contribution/01-contributing.md) | Where recurring feedback becomes a written team standard |
| [ADR Template](../templates/engineering-docs/03-adr.md) | For architecture decisions raised in review |
| [AI with TDD](./02-ai-with-tdd.md) | What good tests look like — informs what to check in review |

---

*Last updated: 2026-05-18*
