# Functional Spec (FS) Procedure — How to Write One

Standard Operating Procedure (SOP). This is an internal process document, not a legal contract.

A **Functional Spec (FS)** is the document the PO writes to define *what* is being built and *why*, before any ticket is created. It is the single input to the [Ticket Sign-Off Procedure](../procedure/signoff-jira-ticket-procedure.md) (Gate 0). This procedure explains who writes an FS, when, what goes in it, and how good enough is "ready."

## Document Control

| Field | Value |
|-------|-------|
| Document type | Internal Standard Operating Procedure (SOP) |
| Document owner | `<name / role responsible for maintaining this doc>` |
| Version | `<1.0>` |
| Status | `<Draft / Approved>` |
| Effective date | `<YYYY-MM-DD>` |
| Applies to | PO (author), PM, Dev, QA on `<team / project>` |

---

## Table of Contents
1. What an FS Is — and Is Not
2. Who Writes It and When
3. The FS Template (section by section)
4. How to Write Good Acceptance Criteria
5. Definition of Ready for an FS
6. Rules
7. FS Template (copy block)
8. Change Log

---

## 1. What an FS Is — and Is Not

**An FS is:** a clear statement of the problem, the users, the behavior the system must have, and how you'll know it works. It describes *what* and *why* — not *how*.

**An FS is not:** a technical design, a database schema, or code. Those are the Dev's job (and, for big technical choices, an [ADR](../procedure/signoff-adr-procedure.md)). If your FS is telling engineers which table to add a column to, it has gone too far.

A good test: a developer should read the FS and know exactly *what success looks like*, while still being free to decide *how* to build it.

---

## 2. Who Writes It and When

- **Author:** the **PO**. The FS is the one artifact the PO fully owns.
- **Reviewers:** PM (scope, schedule, dependencies), Dev (feasibility), QA (testability). They comment; the PO decides.
- **When:** the FS must be ready **one sprint ahead** — drafted and reviewed during the previous sprint so tickets can be created and refined before the next sprint's planning. (Aligns with the FS Day-7 deadline in the ticket flow.)
- **From FS to tickets:** once approved, the **PM** creates Backlog tickets from the FS (Gate 0 of the ticket procedure).

---

## 3. The FS Template (section by section)

Each FS should contain these sections. Keep it as short as it can be while still answering every question a builder would ask.

0. **Document Control** — status (Draft / In Review / Approved), version, author, reviewers, last updated. Lets readers trust they're looking at the current, agreed version.
1. **Title & Summary** — one-paragraph "what and why." If someone reads only this, they should grasp the point.
2. **Background / Problem** — what's wrong today, what pain or opportunity drives this. Ground it in the real situation.
3. **Goals & Non-Goals** — what this delivers, and — just as important — what it explicitly does *not* cover (so scope can't creep silently).
4. **Users / Personas** — who uses this and what they're trying to achieve.
5. **User Stories / Use Cases** — "As a `<role>`, I want `<capability>` so that `<benefit>`." The heart of the FS.
6. **Functional Requirements** — the specific behaviors the system must have, numbered (FR-1, FR-2…) so tickets and tests can reference them.
7. **Acceptance Criteria** — testable conditions for each requirement (see §4). This is what QA verifies and the PO accepts.
8. **Non-Functional Requirements** — performance, security, availability, localization, etc., where they matter.
9. **Scope: In / Out** — restate the boundaries explicitly. What this FS owns, and what it deliberately leaves to another FS or phase.
10. **MVP vs Post-MVP** — the smallest version that delivers the core value (MVP), and what is consciously deferred to a later phase. Stops a big FS from blocking a first release.
11. **Dependencies & Assumptions** — what must be true or in place (other systems, data, third parties).
12. **Open Questions** — things still undecided, with an owner for each.
13. **Approval & Sign-Off** — the roles who reviewed and agreed to build it (PO, PM, Dev Lead, QA), with status and date. An internal working agreement, not a legal contract.
14. **Change Log** — version history, so changes after approval are visible, not silent.

Not every FS needs every section — but consciously *decide* to omit one, don't just forget it. The "why" (rationale) for significant choices should be woven into the Summary, Background, and the requirements themselves — a reader should always understand *why*, not just *what*.

---

## 4. How to Write Good Acceptance Criteria

Acceptance criteria are where most FS documents fail — they get vague, and vague criteria can't be tested or accepted. Use the **Given / When / Then** form:

> **Given** `<a starting situation>`, **When** `<an action happens>`, **Then** `<the expected, observable result>`.

Good criteria are:
- **Testable** — QA can run it and get a clear pass/fail. "The page should be fast" is not testable; "the page loads in under 2 seconds on 4G" is.
- **Specific** — covers the success path *and* the failure paths (what happens when the card is declined, the network drops, the input is invalid).
- **Free of solution** — they state the outcome, not the implementation.

If you can't write a testable acceptance criterion for a requirement, the requirement isn't clear enough yet.

---

## 5. Definition of Ready for an FS

An FS is ready to become tickets when:

- [ ] The problem and goals are clear, with non-goals stated.
- [ ] Every functional requirement is numbered and has at least one testable acceptance criterion.
- [ ] Failure / edge cases are covered, not just the happy path.
- [ ] Dependencies and assumptions are listed.
- [ ] Open questions are either resolved or assigned an owner and a date.
- [ ] PM (scope), Dev (feasibility), and QA (testability) have reviewed it.

Until all boxes are ticked, tickets created from it will be guesses.

---

## 6. Rules

1. PO owns the FS. One author, so the document has a single coherent voice; reviewers comment, the PO decides.
2. What and why, never how. Keep technical design out — that's the Dev's space.
3. Every requirement is testable. If QA can't verify it, it isn't a requirement yet.
4. State the non-goals. Scope creep hides in what you didn't write down.
5. Ready one sprint ahead. An FS that lands mid-sprint is too late for clean planning.
6. Living until approved, frozen after. Once the FS is approved and tickets are cut, changes go through a new version + the normal change process — not silent edits.

---

## 7. FS Template (copy block)

Copy everything below into a new FS document and fill it in.

```markdown
# FS: <feature name>

## Document Control
| Field | Value |
|-------|-------|
| Status | <Draft / In Review / Approved> |
| Version | <0.1> |
| Author (PO) | <name> |
| Reviewers | PM <name>, Dev <name>, QA <name> |
| Last updated | <YYYY-MM-DD> |

## 1. Summary
<One paragraph: what and why.>

## 2. Background / Problem
<What's wrong today; the pain or opportunity.>

## 3. Goals & Non-Goals
**Goals:**
- <goal 1>
**Non-Goals:**
- <explicitly not doing 1>

## 4. Users / Personas
- <role> — <what they want to achieve>

## 5. User Stories
- As a <role>, I want <capability> so that <benefit>.

## 6. Functional Requirements
- **FR-1:** <requirement>
- **FR-2:** <requirement>

## 7. Acceptance Criteria
- **FR-1:** Given <…>, When <…>, Then <…>.
- **FR-2:** Given <…>, When <…>, Then <…>.

## 8. Non-Functional Requirements
- <performance / security / availability / localization …>

## 9. Scope: In / Out
**In scope:** <…>
**Out of scope:** <… — point to the FS/phase that covers it>

## 10. MVP vs Post-MVP
| Phase | What ships |
|-------|-----------|
| **MVP** | <smallest version that delivers the core value> |
| **Post-MVP** | <deferred enhancements> |

## 11. Dependencies & Assumptions
- <…>

## 12. Open Questions
- <question> — owner: <name>, due: <date>

## 13. Approval & Sign-Off
*Internal working agreement, not a legal contract.*
| Role | Name | Status (Reviewed / Approved) | Date |
|------|------|------------------------------|------|
| Product Owner (PO) | <name> | <> | <YYYY-MM-DD> |
| Project Manager (PM) | <name> | <> | <YYYY-MM-DD> |
| Dev Lead | <name> | <> | <YYYY-MM-DD> |
| QA | <name> | <> | <YYYY-MM-DD> |

## 14. Change Log
| Version | Date | Author | Change |
|---------|------|--------|--------|
| 0.1 | <YYYY-MM-DD> | <name> | Initial draft |
```

---

## 8. Change Log

| Version | Date | Author | Change |
|---------|------|--------|--------|
| 1.0 | `<YYYY-MM-DD>` | `<name>` | Initial version |
