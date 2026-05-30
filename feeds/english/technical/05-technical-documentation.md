# Writing Technical Documentation

**Tags:** #english #technical #documentation #adr #spec #runbook  
**Read Time:** ~7 min

> Technical documentation is not about showing that you understood something. It is about making sure the next person understands it without having to ask you.

---

## Types of Technical Documents

| Document | Purpose | Audience |
|:---------|:--------|:---------|
| **Tech Spec** | Explains how a feature will be built before it is built | Team Lead, other developers |
| **ADR** (Architecture Decision Record) | Records *why* an architectural decision was made | Future developers who will question it |
| **Runbook** | Step-by-step instructions for operating or recovering a system | On-call engineers |
| **Post-mortem** | What went wrong, why, and what will prevent it | Team, management |
| **API Docs** | How to use an API | Developers integrating with the API |

---

## Writing a Tech Spec

A tech spec answers: *what are we building, how will it work, and what are the trade-offs?*

```markdown
# Tech Spec: [Feature Name]

**Author:** [Name]
**Status:** Draft | In Review | Approved
**Date:** YYYY-MM-DD

## Problem
What problem are we solving? Why does it matter?

## Goals
What must this solution achieve? (Measurable where possible)

## Non-Goals
What is explicitly out of scope? This prevents scope creep.

## Proposed Solution
How will it work? Include diagrams, data models, API shapes.

## Alternatives Considered
What else did you consider? Why did you reject it?

## Trade-offs & Risks
What are the downsides of this approach?

## Open Questions
What is still undecided?
```

**Key language patterns:**

| Situation | Phrase |
|:----------|:-------|
| Stating a goal | `The system must...` / `Users should be able to...` |
| Stating a non-goal | `This spec does not cover...` / `Out of scope: ...` |
| Proposing | `We propose to...` / `The solution is to...` |
| Acknowledging trade-offs | `The downside of this approach is...` |
| Flagging uncertainty | `This is still under discussion.` / `TBD pending team review.` |

---

## Writing an ADR

An ADR records a decision that was made and why. The most important part is the **context** and **consequences** — not just the decision itself.

```markdown
# ADR-042: Use PostgreSQL for the main database

**Status:** Accepted
**Date:** 2026-05-19
**Deciders:** Dara, Sophea, TL

## Context
We need to choose a primary database for the platform.
The data is relational (users, bookings, payments) with complex queries.
The team has deep PostgreSQL experience. MySQL was also considered.

## Decision
We will use PostgreSQL 15.

## Consequences
**Positive:**
- Full ACID compliance with strong consistency guarantees
- Native JSONB support for semi-structured data (e.g. metadata fields)
- Team is already experienced — no learning curve

**Negative:**
- Horizontal sharding is more complex than with MySQL
- Cloud costs slightly higher on RDS vs Aurora MySQL at scale

## Alternatives Rejected
- MySQL: familiar but lacks native JSONB and window function support we need
- MongoDB: document model does not fit our relational data well
```

**Tip:** The ADR is written **after** the decision is made, not during the debate. It is a record, not a proposal.

---

## Writing a Runbook

A runbook is for people who are stressed at 2 AM. Write it accordingly — short sentences, numbered steps, expected outputs.

```markdown
# Runbook: Restart the Payment Worker

**Use when:** Payment jobs are stuck in the queue and not processing.
**Severity:** High — payments are delayed but not lost.

## Check First
1. Open Grafana: [link]
2. Check "Payment Queue Depth" panel — if > 500, continue
3. Check worker logs: `kubectl logs -l app=payment-worker --tail=100`

## Steps
1. Scale down the worker: `kubectl scale deployment payment-worker --replicas=0`
2. Wait 30 seconds for in-flight jobs to complete
3. Scale back up: `kubectl scale deployment payment-worker --replicas=3`
4. Monitor queue depth in Grafana — should drop within 2 minutes

## If This Does Not Work
Escalate to: @dara-oncall in #incidents
```

**Key rules for runbooks:**
- Use numbered lists for sequential steps — never bullets
- State the expected result after each step
- Include escalation path — who to call if it fails
- Never write "check the logs" without saying which logs and where

---

## Phrases for Technical Documents

### Describing a system
- `The service is responsible for...`
- `This component handles...`
- `Data flows from X to Y via...`
- `The API exposes the following endpoints:...`

### Explaining a decision
- `We chose X over Y because...`
- `X was rejected due to...`
- `The primary reason for this approach is...`
- `This trade-off was acceptable because...`

### Describing constraints
- `The system must not...`
- `This approach assumes that...`
- `A precondition for this is...`
- `This is only valid when...`

### Flagging incomplete sections
- `TBD — pending decision from [person/team]`
- `To be confirmed after spike in [sprint]`
- `Open question: [the question]`

---

## Related

- [README Files](./04-readme-files.md) — entry-level documentation
- [Error Messages](./06-error-messages.md) — documentation in the product itself
