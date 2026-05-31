# Template: Architecture Decision Record (ADR)

> **How to use:** Write an ADR when a technical decision is **costly to reverse**, **cross-cutting**, or **contested** (see [03 — Technical Direction](../03-technical-direction.md)). Keep them numbered and immutable in a `/docs/adr/` folder, reviewed in PRs like code. You don't edit a decided ADR — you supersede it with a new one that links back. Record the rejected options and the honest consequences; that's half the value.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# ADR-[NNN]: [Short, descriptive title]

**Status:** [Proposed | Accepted | Superseded by ADR-XXX | Deprecated]
**Date:** [YYYY-MM-DD]
**Deciders:** [names involved in the decision]
**Tags:** [#architecture #data #api …]

## Context
[What problem are we solving? What forces are at play — technical, business, time? What constraints bound the decision? State facts, not the conclusion.]

## Options Considered
1. **[Option A]** — [summary]. Pros: […]. Cons: […].
2. **[Option B]** — [summary]. Pros: […]. Cons: […].
3. **[Option C]** — [summary]. Pros: […]. Cons: […].

## Decision
[The option we chose, stated plainly, and *why* it beat the alternatives. "We will …"]

## Consequences
**Positive**
- [ ]

**Negative / trade-offs we accept**
- [ ]

**Follow-ups required**
- [ ] [migration, doc, monitoring, deprecation step…]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# ADR-001: Extract `payments` into a module behind a clean interface

**Status:** Accepted
**Date:** 2026-07-10
**Deciders:** Sok (Team Lead), Rith (payments owner), Sokha, Dara (PM)
**Tags:** #architecture #payments #monolith #techdebt

## Context
The order system is a single 180k-line monolith. Payment logic is scattered across `OrderService`, `BillingController`, and several utils with no boundary, and is effectively understood by one engineer (Rith) — a bus factor of 1 flagged in the [technical assessment](./tech-assessment-template.md). Every payment change risks unrelated order code, and onboarding a second owner is hard because there's no seam to learn behind. A full microservice split is tempting but high-risk for a 5-person team and would stall feature delivery for weeks.

## Options Considered
1. **Do nothing** — keep payments inline. Pros: zero cost now. Cons: bus factor stays at 1; every change stays risky; debt compounds.
2. **Extract a `payments` module behind an interface (same deploy unit)** — carve a clear boundary inside the monolith. Pros: enforces a seam, enables a second owner, low blast radius, reversible. Cons: doesn't get independent deploy/scaling.
3. **Split payments into a separate microservice** — full extraction. Pros: independent deploy & scaling, hard boundary. Cons: distributed-systems complexity, new infra, weeks of stalled feature work — over-sized for our team and traffic today.

## Decision
We will **extract payments into an in-process module behind a well-defined interface** (Option 2). All payment access goes through `PaymentGateway` (the interface); no other module reaches into payment internals. This is explicitly a **first step**: it creates the seam that *later* makes a microservice split (Option 3) cheap if traffic ever justifies it. We are deliberately right-sizing to today's team and load, not a hypothetical future scale.

## Consequences
**Positive**
- A real boundary lets us pair a second owner (Sokha) onto payments — kills the bus-factor-1 risk.
- Payment changes stop rippling into unrelated order code; smaller, safer PRs.
- Keeps a clean path to a service split later without committing to that complexity now.

**Negative / trade-offs we accept**
- No independent deploy or scaling yet — acceptable at current traffic.
- ~2 sprints of refactoring funded from the agreed 20% engineering-health capacity (no independent feature value to the customer in the short term — surfaced to Dara, who agreed).

**Follow-ups required**
- [ ] Define and review the `PaymentGateway` interface (Rith + Sok)
- [ ] Add a lint/architecture rule forbidding direct access to payment internals
- [ ] Pair Sokha through the extraction as second owner
- [ ] Revisit Option 3 (service split) only if payment traffic 5×'s — supersede this ADR if so

---

*Template for the [Team Lead Playbook](../README.md)*
