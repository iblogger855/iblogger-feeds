# Delegation and Breaking Down Work

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #team-lead #delegation #task-breakdown #productivity #leadership #agile #sprint-planning  
**Category:** Productivity  
**Read Time:** ~11 min

> The team lead who does the hardest work themselves is not a team lead — they are a senior developer with a title. Delegation is not about offloading tasks you don't want to do. It is the primary mechanism for growing your team, reducing your own bottleneck, and building a system that does not collapse when you are on leave. This guide covers how to decompose work and assign it in a way that stretches the team without breaking it.

---

## 📌 Table of Contents
- [Why Team Leads Under-Delegate](#why-team-leads-under-delegate)
- [The Delegation Spectrum](#the-delegation-spectrum)
- [How to Break Down an Epic Into Stories](#how-to-break-down-an-epic-into-stories)
- [Matching Work to People](#matching-work-to-people)
- [How to Hand Off Without Losing Control](#how-to-hand-off-without-losing-control)
- [Following Up Without Micromanaging](#following-up-without-micromanaging)
- [When to Take Work Back](#when-to-take-work-back)
- [Anti-Patterns to Eliminate](#anti-patterns-to-eliminate)

---

## Why Team Leads Under-Delegate

```
REASON 1: "It's faster if I do it myself"
  TRUE in the short term. False over any meaningful horizon.
  Every hour you spend doing a task someone else could do
  is an hour they didn't learn to do it, and an hour you
  didn't spend on the things only you can do.

REASON 2: "They'll do it wrong"
  Maybe. But a PR review catches wrong before production.
  A developer who does it wrong, gets feedback, and corrects it
  has learned something permanent.
  A developer who never tries has learned nothing.

REASON 3: "The deadline is too tight to risk it"
  If your team cannot execute without you, your team is fragile.
  A truly tight deadline is the best argument for building
  team capability before the next tight deadline.

REASON 4: "It's the interesting work"
  This is the honest one. Acknowledge it.
  Then ask: is your job to do interesting work,
  or to build a team that can do interesting work?
  The answer is both — but not by hoarding it all yourself.

THE TEST: If you were out for 2 weeks, what would break?
  Whatever the answer is — that is your delegation gap.
```

---

## The Delegation Spectrum

Not all delegation is the same. Match the level to the developer's readiness.

```
LEVEL 1 — TELL (fully directed)
  "Do exactly this: [specific steps]"
  Use for: new developers, high-risk tasks, unfamiliar domain
  Your role: full oversight, review every step
  Risk of over-use: developer never develops judgment

LEVEL 2 — TEACH (guided)
  "Here is the approach. Try it, check in with me at X."
  Use for: developer learning this type of work for the first time
  Your role: checkpoint reviews, available for questions
  Outcome: developer learns the approach, you coach

LEVEL 3 — CONSULT (advised)
  "Figure out an approach, run it by me before you start."
  Use for: mid-level developer with relevant experience
  Your role: review the plan, not the execution
  Outcome: developer owns the approach; you validate it

LEVEL 4 — DELEGATE (trusted)
  "Own this end-to-end. Update me at key milestones."
  Use for: senior developer, repeated task type, low risk
  Your role: milestone check-ins, available if needed
  Outcome: developer has full ownership and accountability

LEVEL 5 — EMPOWER (fully autonomous)
  "This is yours. I trust your judgment."
  Use for: senior developer, proven track record, owns this domain
  Your role: visibility only — you find out when it's done
  Risk of over-use: surprises when something goes wrong

RULE: Err toward Level 3 for most mid-level developers.
      Level 1 for high-risk tasks regardless of seniority.
      Level 4–5 only after demonstrated competence on this task type.
```

---

## How to Break Down an Epic Into Stories

A well-broken-down epic is the foundation of good delegation. If stories are too large, developers get stuck. If they are too small, overhead dominates. If boundaries are unclear, two people step on each other.

### The Breakdown Process

```
STEP 1: IDENTIFY THE CORE USER LOOP
  What is the minimum path a user must take to get value?
  Everything on that path is the first priority.
  Everything off that path is a follow-on story.

  Example — Order Placement Epic:
  Core loop: user selects items → adds to cart → pays → receives confirmation
  Stories: browse menu · add to cart · checkout flow · payment · confirmation

STEP 2: SEPARATE BY LAYER
  Each story should live in one layer.
  A story that touches the database AND the API AND the frontend
  is three stories pretending to be one.

  ✗ BAD: "Implement order creation"
     (touches DB schema, service logic, API endpoint, frontend form)

  ✓ GOOD:
    Story A: Create orders table and migration  (data layer)
    Story B: Implement OrderService.createOrder  (service layer)
    Story C: POST /api/v1/orders endpoint  (API layer)
    Story D: Checkout form submits to API  (frontend layer)

STEP 3: MAKE EACH STORY INDEPENDENTLY TESTABLE
  A story is done when it can be tested on its own.
  If Story B requires Story D to be done to test it — they are too coupled.
  Add a test fixture or a simple stub to make B testable without D.

STEP 4: SEQUENCE BY DEPENDENCY
  Which stories block others?
  Data layer → Service layer → API layer → Frontend layer
  Draw the dependency chain and sequence the sprint accordingly.
  Stories with no dependencies can run in parallel.

STEP 5: SIZE CHECK — THE ONE-SPRINT RULE
  Every story must fit in one sprint by one developer.
  If it doesn't — split it further.
  A story that takes 3 sprints is an epic. Re-create it as one.
```

### Story Sizing Quick Guide

```
STORY POINTS  WHAT IT MEANS (as a TL check)
────────────  ─────────────────────────────────────────────────
1             A config change, a small fix, an obvious tweak
2             A well-understood task with clear acceptance criteria
3             Standard feature work — some unknowns, moderate tests
5             Non-trivial feature — investigate + implement + test
8             Complex — should consider splitting
13+           Split it. This is not a story, it is an epic.

IF THE TEAM CONSISTENTLY ESTIMATES 8+ POINTS:
  The breakdown is the problem, not the developer's speed.
  Revisit STEPS 2–3 above — the story is doing too much.
```

---

## Matching Work to People

The right story for the wrong person is a productivity failure even when the story is well-written.

```
MATCHING FRAMEWORK:

  CURRENT SKILL MATCH
    Can they do this today with moderate effort?
    → Good fit for velocity-critical sprint work

  STRETCH ASSIGNMENT
    Slightly above their current comfort zone?
    → Good for growth — pair with a safety net (you review at midpoint)
    → Not for the most critical path story in a tight sprint

  WRONG FIT
    Significantly beyond their current skill?
    → Learning project, not sprint story
    → Either pair them with a senior or reassign

  NEVER:
    ✗ Give a junior the most critical-path story in a release sprint
    ✗ Give a senior only routine maintenance stories for 3+ sprints
      (that is a retention risk, not a workload decision)
    ✗ Give the same type of story to the same person every sprint
      (builds a specialist, not a team member)

TRACK IT:
  Keep a simple grid: developer × story type × complexity
  Each developer should rotate through different story types over a quarter.
```

### The Goldilocks Rule

```
TOO EASY:   Developer is bored. Velocity looks fine. Engagement drops.
            → Assign a stretch companion task alongside routine work

TOO HARD:   Developer is stuck. Carries over. Loses confidence.
            → Pair with a more senior developer, or split the story

JUST RIGHT: Developer is challenged but not blocked.
            They ask one or two good questions, then deliver.
            → This is the target zone for every assignment
```

---

## How to Hand Off Without Losing Control

```
THE HANDOFF CONVERSATION (10 minutes, never skipped):

  1. CONTEXT: Why does this story exist?
     "This is part of the payment flow — the last piece before
      we can run an end-to-end test of a real order."
     Without context, a developer makes local decisions
     that are correct in isolation but wrong in the system.

  2. SCOPE: What is in and what is out?
     "In scope: the API endpoint and service layer.
      Out of scope: the frontend — that is Story ORDER-7.
      Do not build the email notification — that is ORDER-9."
     Scope creep in individual stories is a leading cause of
     sprint failures.

  3. DEPENDENCIES: What does this need? What does it block?
     "You need AUTH-12 to be merged before you start.
      This will unblock ORDER-7 (Rith) and ORDER-9 (Dara)."

  4. DEFINITION OF DONE: What does done look like?
     "Unit tests for the happy path + payment failure case.
      Integration test against staging DB.
      API returns 201 with order_id, or 402 with error code."

  5. CHECK-IN POINT: When will you check in?
     "Message me when you have a PR open and I'll review by EOD."
     or
     "Let's do a 10-min check-in Wednesday if it's not merged by then."
```

---

## Following Up Without Micromanaging

```
THE DIFFERENCE:

  MICROMANAGEMENT:
    "How is ORDER-6 going? Are you done yet? What have you done so far?
     Can I see what you have? Why is it taking this long?"
    → Developer feels distrusted. Productivity drops. Resentment builds.

  HEALTHY FOLLOW-UP:
    Monday: Assign with clear handoff (above)
    Wednesday: If not merged — "Hey, how is ORDER-6 going?
               Anything blocking you?"
    Thursday: If still not merged — "Let's look at it together
               for 15 min. I want to make sure nothing is blocking
               you before the sprint ends."
    Friday: If still not merged — address in retrospective
            and as a 1-on-1 topic next week.

  THE RULE: Your job is to remove blockers, not to monitor completion.
    Ask: "Is anything blocking you?" — not "Are you done yet?"
    The first question is leadership. The second is surveillance.

SIGNALS THAT SOMEONE IS STUCK (without them telling you):
  → Story moves to In Progress on Monday, still there Friday
  → No commits on a story in 48 hours
  → Developer is unusually quiet in standup
  → Developer asks tangentially related questions instead of a direct question
     ("What does the payment service return on a declined card?"
      when they are building the checkout flow — they are stuck
      and too uncomfortable to say so directly)

  When you see these signals: ask directly in private, not in standup.
  "Hey, I noticed ORDER-6 has been in progress for 3 days. How is it going?
   Anything I can help unblock?"
```

---

## When to Take Work Back

```
TAKE WORK BACK WHEN:
  ✓ The story is on the critical path to a release deadline
    AND the developer is clearly stuck
    AND there is no way to unblock them in time
  ✓ A security or data integrity issue was discovered that requires
    immediate TL-level judgment
  ✓ The developer is overwhelmed and adding more pressure will
    cause long-term harm

DO NOT TAKE WORK BACK WHEN:
  ✗ You could do it faster  (that is not the point)
  ✗ You are impatient with their pace  (coach, don't rescue)
  ✗ You disagree with their approach  (review and redirect instead)
  ✗ You are anxious and want control  (check your own state first)

WHEN YOU DO TAKE IT BACK:
  Be honest about it.
  "I'm going to take ORDER-6 from you because we need it merged by tomorrow.
   This is not about your ability — it is a timing decision.
   Let's look at what you have together so you understand the approach
   and can own this type of story next sprint."

  Taking work back without explanation teaches:
  "I will be rescued when I struggle."
  Taking work back WITH explanation teaches:
  "This is what a deadline trade-off looks like."
  The difference matters.
```

---

## Anti-Patterns to Eliminate

| Anti-Pattern | What It Costs | Fix |
|:-------------|:-------------|:----|
| **Doing the hardest stories yourself every sprint** | Team never grows; you become a bottleneck | Assign hard stories with a safety net — Level 2 or 3 delegation |
| **Stories too large (8+ points regularly)** | Developers get stuck; sprint carries over | Re-run STEP 2 (separate by layer) — almost always the fix |
| **No handoff conversation** | Developer makes wrong assumptions; rework | 10-min handoff: context, scope, dependencies, DoD, check-in |
| **Same developer gets same story type every sprint** | Specialist silos; single point of failure | Rotate story types intentionally across the team |
| **Checking in every hour** | Developer feels distrusted; autonomy disappears | One structured check-in at midpoint; blockers-only otherwise |
| **Taking work back silently** | Developer learns nothing; resentment builds | Take back with explanation: "here is why, here is what you learn" |
| **Giving a junior the critical-path story in a release sprint** | Release at risk; junior overwhelmed | Critical-path stories to proven devs; give juniors adjacent stories |
| **Breaking down stories in isolation** | Missed dependencies; wrong sequencing | Break down in a team session — developers know dependencies you don't |

---

## Related

| Resource | Why |
|:---------|:----|
| [Deep Work vs Available Time](./05-deep-work-vs-available-time.md) | Delegation frees your time — this is how you use it |
| [1-on-1s & Growing the Team](./04-one-on-one-and-growing-the-team.md) | Delegation gap → coaching topic for 1-on-1s |
| [Jira Story Template](../templates/jira/02-jira-story.md) | The story format that makes handoff conversations easier |
| [Ticket Lifecycle](../procedures/software-delivery/05-ticket-lifecycle.md) | Who owns what at each status — delegation boundaries |
| [Sprint Ceremony Flow](../procedures/software-delivery/03-sprint-ceremonies.md) | When to assign stories: sprint planning ceremony |

---

*Last updated: 2026-05-18*
