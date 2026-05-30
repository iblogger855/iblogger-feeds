# Deep Work vs Available Time — The Team Lead's Schedule Problem

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #team-lead #focus #deep-work #async #productivity #time-management #schedule  
**Category:** Productivity  
**Read Time:** ~10 min

> A team lead has two jobs that are fundamentally at war with each other: being deeply available to the team, and doing deep technical work. Most team leads solve this problem by sacrificing one — usually deep work. This guide is about designing a schedule that protects both.

---

## 📌 Table of Contents
- [The Maker vs Manager Problem](#the-maker-vs-manager-problem)
- [Why Context Switching Is Expensive](#why-context-switching-is-expensive)
- [Designing Your Weekly Schedule](#designing-your-weekly-schedule)
- [Async-First Communication Habits](#async-first-communication-habits)
- [How to Say No Without Blocking the Team](#how-to-say-no-without-blocking-the-team)
- [The Emergency Exception](#the-emergency-exception)
- [Protecting the Team's Deep Work Too](#protecting-the-teams-deep-work-too)
- [Anti-Patterns to Eliminate](#anti-patterns-to-eliminate)

---

## The Maker vs Manager Problem

Paul Graham described two types of schedules that are fundamentally incompatible when mixed together:

```
MAKER SCHEDULE (developer / architect / deep work)
  Works in half-day or full-day blocks.
  A single meeting in the middle of a block destroys it.
  Needs 90–120 min uninterrupted to enter flow and produce.
  Context: writing code, designing architecture, reviewing complex PRs.

MANAGER SCHEDULE (meetings, decisions, unblocking)
  Works in 30–60 min slots.
  Can take a meeting at 10am, another at 11am, another at 2pm.
  Context: 1-on-1s, standups, PR reviews, Slack responses.

THE TEAM LEAD PROBLEM:
  You need both. A purely Maker TL neglects the team.
  A purely Manager TL stops being technically credible.
  A TL who mixes them randomly does both badly.

THE SOLUTION:
  Not a compromise. A schedule.
  Maker blocks are untouchable. Manager blocks are for everything else.
```

---

## Why Context Switching Is Expensive

```
CONTEXT SWITCH COST:
  Research shows it takes 23 minutes to fully re-enter a complex
  task after an interruption.

  Scenario A — Mixed day (no schedule):
    08:30  Start reading architecture doc
    09:00  Slack ping: "quick question about AUTH-12"
    09:05  Answer Slack
    09:28  Back in flow on architecture doc  ← 23 min lost
    10:00  Standup (scheduled)
    10:15  Try to return to architecture doc
    10:38  Back in flow  ← 23 min lost again
    10:45  Slack ping: "can you review my PR?"
    ...

    Result: 3 hours of "work" → 20 min of actual deep work

  Scenario B — Blocked schedule:
    08:00–10:00  DEEP WORK BLOCK (no Slack, no PRs)
                 Architecture doc: complete
    10:00        Standup
    10:15–12:00  Manager block: PR reviews + Slack + async answers
    12:00        Lunch
    13:30–15:00  DEEP WORK BLOCK #2
    15:00–17:00  Manager block: 1-on-1s + async review + wrap-up

    Result: 3.5 hours deep work, team fully unblocked by 10:15
```

---

## Designing Your Weekly Schedule

### The Template

```
MONDAY
  08:00–09:30  DEEP WORK — architecture / hard PR / spike
  09:30        Standup
  09:45–12:00  Manager block — PR reviews, Slack, async
  13:30–15:30  DEEP WORK — continue technical work
  15:30–17:00  Manager block — 1-on-1s, planning prep

TUESDAY
  08:00–09:30  DEEP WORK
  09:30        Standup
  09:45–11:30  Manager block
  11:30–12:00  1-on-1 (30 min)
  13:30–15:30  DEEP WORK
  15:30–17:00  Manager block

WEDNESDAY (mid-sprint — highest meeting density)
  09:00        Standup
  09:15–10:00  Backlog refinement
  10:00–12:00  Manager block (heaviest PR review day)
  13:00–15:00  DEEP WORK
  15:00–15:30  1-on-1
  15:30–17:00  Manager block

THURSDAY
  08:00–09:30  DEEP WORK
  09:30        Standup
  09:45–12:00  Manager block
  13:30–15:30  DEEP WORK
  15:30–17:00  Wrap-up + prep for sprint review/retro

FRIDAY (sprint ceremony day or light day)
  09:00        Standup
  09:30–10:30  Sprint review / retrospective (alternating)
  10:30–12:00  Manager block — catch-up, async responses
  13:00–15:00  DEEP WORK (if not sprint ceremony day)
  15:00–17:00  Weekly prep: next sprint stories, ADRs, notes
```

### Non-Negotiable Rules

```
DEEP WORK BLOCK RULES:
  □ Slack on Do Not Disturb
  □ Calendar shows "Busy / Focus Time"
  □ No PR review notifications during this block
  □ Phone on silent (or out of reach)
  □ Door closed / headphones on / status set
  □ Team knows: "TL is in deep work until 10:00 — async only"

WHAT QUALIFIES AS DEEP WORK:
  ✓ Writing or reviewing architecture / ADR
  ✓ Designing a system or data model
  ✓ Writing code on a complex story
  ✓ Reviewing a large or risky PR thoroughly
  ✓ Technical investigation / spike
  ✓ Writing a tech spec

WHAT DOES NOT BELONG IN A DEEP WORK BLOCK:
  ✗ Slack messages
  ✗ Email
  ✗ Routine PR reviews (< 50 lines, low risk)
  ✗ Jira updates
  ✗ Status conversations
```

---

## Async-First Communication Habits

Most interruptions are self-inflicted — by a team culture that expects instant responses.

```
SET THE EXPECTATION EXPLICITLY:
  "My response SLA on Slack is 2 hours during working hours.
   For urgent things, call me directly. If it can wait for Slack,
   it can wait 2 hours."

  Say this. Write it. Repeat it. Teams mirror the culture their
  TL sets. If you respond to every Slack in 2 minutes, the team
  expects 2-minute responses from each other too.

ASYNC-FIRST PRACTICES:

  For questions that need your input:
    Slack thread, not a DM.
    Visible to the whole team.
    Someone else might answer it first.
    Your answer is in context for anyone who has the same question.

  For architectural questions:
    "Write it up as a short note — context, options, your recommendation.
     I'll review and respond by end of day."
    This forces clearer thinking from the asker.
    It gives you structured information, not a verbal brain dump.

  For PR reviews:
    Use your two daily review windows (morning + after lunch).
    Do NOT review PRs reactively throughout the day.
    A developer waiting 3 hours for review is acceptable.
    A developer waiting 2 business days is not.

  For "quick calls":
    Most "quick calls" are not quick.
    "Can you send me the context in writing first?
     I'll have a better answer if I can think about it."
    Short exception: if someone is blocked and can't move forward,
    a 5-min call to unblock is worth breaking the rule.
```

---

## How to Say No Without Blocking the Team

```
THE WRONG WAY:
  Never say no.
  → Your calendar fills with everyone else's priorities.
  → Your deep work disappears.
  → You become resentful and reactive.

THE WRONG WAY (other extreme):
  "I'm in deep work, figure it out yourself."
  → Team is blocked. Trust erodes. You become a bottleneck by absence.

THE RIGHT WAY — Redirect, Don't Refuse:

  "Can you quickly review this PR?"
  → "I have a review window at 10:15. I'll have feedback by then."
     (not: "I'm busy right now")

  "Can we jump on a call to discuss this design?"
  → "I want to give this proper thought. Can you write up the
     options you've considered? I'll review and we can discuss
     at our 1-on-1 Thursday."

  "I'm stuck on this — can you help?"
  → "What have you tried so far? Send me what you have and I'll
     look at it in the next 30 min."
     (not: stopping everything immediately every time)

  "The PM wants a quick architecture review in 15 min"
  → "I'm in a deep work block. Can we move it to after standup
     tomorrow? I'll give a better answer with time to prepare."

THE PATTERN:
  Acknowledge the need.
  Give a specific time when you will address it.
  Never leave someone hanging — "later" without a time is not an answer.
```

---

## The Emergency Exception

Some things genuinely cannot wait. Know the difference.

```
GENUINE EMERGENCIES (interrupt deep work):
  ✓ Production is down
  ✓ Data breach or security incident in progress
  ✓ A developer is completely blocked and cannot move at all
  ✓ A deadline is at risk and a decision is needed NOW to save it

NOT EMERGENCIES (handle at next manager block):
  ✗ "Quick question about the API design"
  ✗ "Can you review my PR?" (unless it's the only thing blocking release)
  ✗ "The PM wants to discuss the roadmap"
  ✗ "I'm not sure which approach to use" (unless they've tried both)

MAKE THE ESCALATION PATH CLEAR TO THE TEAM:
  "If it's a production emergency: call my phone directly.
   If it can wait 2 hours: Slack me.
   If it can wait until tomorrow: add it to our 1-on-1 agenda."

  A team that knows the escalation path uses it correctly.
  A team that doesn't know interrupts everything equally.
```

---

## Protecting the Team's Deep Work Too

A team lead who protects their own focus but schedules meetings over the team's focus time is solving only half the problem.

```
MEETING HYGIENE FOR THE TEAM:

  Cluster meetings:
    All recurring ceremonies on the same days
    (e.g. Monday standup + planning, Wednesday standup + refinement,
    Friday standup + review/retro)
    Leaves Tuesday and Thursday as low-meeting focus days.

  No-meeting morning rule:
    No meetings before 10:00 AM (except standup).
    This is the best deep work time for most developers.
    Even a single 9:00 AM sync destroys the morning.

  Async standups option:
    For teams in different timezones or high-focus periods:
    "Yesterday / Today / Blockers" in Slack at 09:00.
    Synchronous standup only when there is a coordination need.

  Protect focus time in the calendar:
    Add "Focus Time" blocks to the team calendar.
    This signals: don't schedule over this without a strong reason.

  The 2-day focus day:
    Aim for at least 2 days per week per developer with fewer than
    2 hours of meetings. Measure it. If it's consistently < 2 days,
    audit the meeting load.
```

---

## Anti-Patterns to Eliminate

| Anti-Pattern | What It Costs | Fix |
|:-------------|:-------------|:----|
| **No schedule — reactive all day** | Zero deep work; high stress; low output quality | Design the week in advance with blocked time |
| **Responding to every Slack in 2 minutes** | Team never develops independence; you can never focus | Set and communicate a 2-hour response SLA |
| **Accepting every meeting invite** | Calendar fills with everyone else's priorities | Decline or reschedule anything that conflicts with a deep work block |
| **"Quick calls" for everything** | 30 min of lost deep work per "5-min call" | "Write it up first — I'll give a better answer" |
| **Deep work with notifications on** | 23-min re-entry cost per notification | DND + status + close the apps during deep work blocks |
| **Protecting your focus but not the team's** | Developers get interrupted while you don't | Cluster team meetings; add focus time blocks to shared calendar |
| **No escalation path for genuine emergencies** | Team interrupts everything because nothing has a defined path | Publish the path: phone = emergency, Slack = 2h, 1-on-1 = tomorrow |

---

## Related

| Resource | Why |
|:---------|:----|
| [Code Review Habits](./03-code-review-habits-for-team-leads.md) | How to do PR reviews in time-boxed windows, not reactively |
| [1-on-1s & Growing the Team](./04-one-on-one-and-growing-the-team.md) | How to schedule 1-on-1s without destroying your maker blocks |
| [Delegation & Breaking Down Work](./06-delegation-and-task-breakdown.md) | How to reduce the number of interruptions by delegating better |
| [AI-Assisted Dev Workflow](../procedures/project-kickoff/03-ai-assisted-dev-workflow.md) | How the team's workflow reduces questions to you |

---

*Last updated: 2026-05-18*
