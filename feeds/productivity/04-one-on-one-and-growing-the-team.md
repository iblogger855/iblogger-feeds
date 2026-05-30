# 1-on-1s and Growing the Team

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #team-lead #one-on-one #feedback #mentoring #growth #leadership #productivity  
**Category:** Productivity  
**Read Time:** ~13 min

> The 1-on-1 is the most important meeting a team lead runs — and the one most often treated as optional. A great 1-on-1 is not a status update. It is the primary instrument for growing a developer from where they are to where they could be. This guide covers how to run them, how to give feedback that sticks, and how to turn a junior developer into someone who doesn't need you.

---

## 📌 Table of Contents
- [What a 1-on-1 Actually Is](#what-a-1-on-1-actually-is)
- [Cadence and Format](#cadence-and-format)
- [The 1-on-1 Structure](#the-1-on-1-structure)
- [How to Give Feedback That Sticks](#how-to-give-feedback-that-sticks)
- [The Growth Ladder — Junior to Senior](#the-growth-ladder-junior-to-senior)
- [Spotting Disengagement Early](#spotting-disengagement-early)
- [Difficult Conversations](#difficult-conversations)
- [Anti-Patterns to Eliminate](#anti-patterns-to-eliminate)

---

## What a 1-on-1 Actually Is

```
A 1-on-1 IS:
  ✓ The developer's meeting — they set the agenda
  ✓ A trust-building conversation
  ✓ A space to surface problems before they become crises
  ✓ A coaching session focused on growth
  ✓ Your early warning system for team health

A 1-on-1 IS NOT:
  ✗ A sprint status update ("how is ticket AUTH-12 going?")
  ✗ A performance review
  ✗ A meeting you can cancel "because nothing is urgent"
  ✗ A one-way feedback session (you talk, they listen)
  ✗ Optional

THE RULE: If you are learning about a developer's problems
          in standup, you waited too long.
          1-on-1s exist so that never happens.
```

---

## Cadence and Format

```
RECOMMENDED CADENCE:
  Weekly, 30 minutes for junior developers
  Bi-weekly, 30–45 minutes for mid-level developers
  Bi-weekly, 30 minutes for senior developers
  (Seniors need less frequency, not less quality)

WHEN TO INCREASE FREQUENCY:
  ✓ Developer is new to the team (first 3 months → weekly always)
  ✓ Developer is struggling with a story or blocked
  ✓ Developer gave signals of disengagement
  ✓ Team is under pressure or going through change

FORMAT — DO NOT SKIP:
  □ Recurring calendar invite — never "whenever we find time"
  □ Shared running notes doc — both can add agenda items async
  □ The developer owns the agenda — you facilitate, you don't present
  □ Private — never in an open office where others can hear

BEFORE THE MEETING:
  Review notes from last 1-on-1.
  Have you followed up on what you said you would do?
  If not — do it before the meeting. Nothing destroys trust faster
  than a TL who forgets their own commitments.
```

---

## The 1-on-1 Structure

The 30 minutes is the developer's time. Your opening question is always a variant of: *"What's on your mind?"* — not *"How is AUTH-12 going?"*

### Part 1 — Check-In (5 min)

```
OPENING QUESTIONS (pick one, rotate):
  "What's been the best part of this week's work?"
  "What's been the most frustrating thing this week?"
  "Is there anything blocking you that I don't know about?"
  "How are you feeling about the sprint so far?"
  "What would make next week better than this one?"

LISTEN MORE THAN YOU TALK.
  Your job in the first 5 minutes is to hear what is actually
  going on — not to fill silence with your own observations.
  Silence after a question is not awkward. It means they are thinking.
  Wait for the answer.
```

### Part 2 — Developer's Agenda (15 min)

```
THEIR AGENDA COMES FIRST.
  Ask: "What did you add to our notes this week?"
  Work through their items before yours.

COMMON DEVELOPER AGENDA ITEMS:
  → Blocked on a technical decision — wants your input
  → Frustrated with a team process
  → Wants to learn X / be given opportunity Y
  → Has concerns about the codebase direction
  → Has feedback about another team member
  → Personal stress affecting work

YOUR ROLE HERE:
  Coach, don't solve.
  "What have you tried?" before "here's what you should do."
  "What do you think the right approach is?" before giving yours.
  A developer who arrives at the answer themselves owns it.
  A developer who receives the answer forgets it by Tuesday.
```

### Part 3 — Your Feedback & Growth (10 min)

```
GIVE FEEDBACK EVERY SESSION — NOT JUST WHEN THERE IS A PROBLEM.
  Positive feedback teaches as much as corrective feedback.
  Skipping feedback because "everything is fine" is a missed
  coaching opportunity.

GROWTH QUESTIONS TO ROTATE THROUGH:
  "What is the hardest technical problem you've faced this sprint?
   How did you work through it?"
  "If you could change one thing about how the team works, what would it be?"
  "What skill do you want to build in the next 3 months?"
  "What kind of work do you want to do more of?"
  "Where do you feel you are strongest right now?"
  "What would make you feel more confident in your role?"

TRACK GROWTH OVER TIME:
  Keep a running note of: skills developing, skills gaps, goals set.
  Review quarterly: are they actually growing?
  If not — is it the work assignments? The feedback? The environment?
```

---

## How to Give Feedback That Sticks

### The SBI Framework (Situation → Behavior → Impact)

Feedback that is vague is feedback that is ignored. Feedback that is specific, behavioral, and impact-linked is feedback that changes behavior.

```
SBI FORMULA:
  S — Situation:  When/where did this happen?
  B — Behavior:   What specifically did the person do or say?
  I — Impact:     What was the effect of that behavior?

VAGUE (does not stick):
  "You need to communicate better."
  "Your code quality needs to improve."
  "You should be more proactive."

SBI (sticks):
  Situation:  "In yesterday's sprint review"
  Behavior:   "you presented the feature without mentioning the
               edge case that QA found — the empty cart scenario"
  Impact:     "The stakeholder asked why QA found it and not the dev,
               which made the team look unprepared. Next time, include
               known gaps in the demo so we control the narrative."

  Situation:  "In the last 3 PRs"
  Behavior:   "I noticed the error handling catches Exception broadly
               and logs it without re-throwing"
  Impact:     "When a payment fails, the order silently completes
               without charging the customer. This is a revenue and
               data integrity issue. Let's talk about the pattern
               we want for external API error handling."
```

### The 2:1 Ratio Rule

```
FOR EVERY CORRECTIVE FEEDBACK ITEM, GIVE TWO SPECIFIC POSITIVE ONES.
  Not generic: "Great work this week!"
  Specific:    "The way you broke down AUTH-12 into 4 small PRs
                instead of one big one — that made my review
                15 minutes instead of 2 hours. That is the right habit."

WHY THIS RATIO:
  Humans remember negative feedback 5× more than positive.
  If you only give corrective feedback, the developer hears:
  "I am always doing something wrong."
  That leads to risk-aversion, not growth.
```

### Timing of Feedback

```
CORRECTIVE FEEDBACK: as close to the event as possible
  Don't save it for the 1-on-1 two weeks later.
  A quick Slack message: "Hey — can we talk for 5 min about the
  error handling in today's PR? Something I want to show you."
  Then discuss it in the 1-on-1 as follow-through, not first mention.

POSITIVE FEEDBACK: public AND private
  In the 1-on-1: specific and personal
  In standup or team channel: "Rith's approach to the migration
  this sprint was excellent — zero downtime, full rollback plan.
  Worth sharing with the team."
```

---

## The Growth Ladder — Junior to Senior

A team lead's job is to make each developer not need you for the things they needed you for last quarter.

### Junior Developer (0–2 years)

```
WHAT THEY NEED:
  → Tight feedback loops on code quality and process
  → Clear task definitions — small, well-bounded stories
  → Psychological safety to ask questions
  → Explicit teaching: "here is why this pattern, not that one"

YOUR FOCUS IN 1-ON-1S:
  □ Is the work size right? (Not too big to get stuck, not too small to learn)
  □ Are they asking for help when blocked? (or suffering silently?)
  □ What technical concept are they struggling with?
  □ Give them one concrete thing to research before next session

ANTI-PATTERN TO AVOID:
  Solving every problem for them. They learn by working through it.
  "What have you tried?" before "here is the answer."
```

### Mid-Level Developer (2–5 years)

```
WHAT THEY NEED:
  → Ownership of a feature end-to-end
  → Exposure to design decisions and architecture discussions
  → Honest feedback on gaps that block senior promotion
  → Less hand-holding, more challenge

YOUR FOCUS IN 1-ON-1S:
  □ Are they writing tests first or retrofitting them?
  □ Are they thinking about failure modes, not just happy paths?
  □ Can they break down a vague requirement into stories independently?
  □ Are they giving quality review feedback to others?
  □ What is the gap between where they are and senior?

PROMOTION READINESS SIGNALS:
  ✓ Others come to them with questions
  ✓ They catch issues in review that you would have caught
  ✓ They raise architecture concerns before you do
  ✓ They unblock themselves and document the decision
```

### Senior Developer (5+ years)

```
WHAT THEY NEED:
  → Autonomy and trust
  → Exposure to business context, not just technical tasks
  → Problems worth solving, not just tickets to close
  → Recognition when they make the team better

YOUR FOCUS IN 1-ON-1S:
  □ Are they being utilized at their level?
    (A senior doing junior work is a retention risk)
  □ Do they want to grow toward TL/architect?
  □ Are they mentoring juniors? (leverage their expertise)
  □ Do they have opinions on the codebase direction?
    (Listen — they are usually right)

WARNING SIGN:
  A senior developer who stops raising opinions has either
  given up on the team or is preparing to leave.
  Find out which before it is too late.
```

---

## Spotting Disengagement Early

Disengagement is always visible before resignation. The signals:

```
EARLY SIGNALS (weeks 1–4 of disengagement):
  → PRs get smaller and simpler than their ability
  → Stops raising opinions in review or architecture discussions
  → 1-on-1 answers become shorter: "fine", "no issues", "all good"
  → Less initiative on stories that are not assigned to them

MIDDLE SIGNALS (weeks 4–8):
  → Starts leaving exactly at end of day, every day
  → Fewer questions in standup
  → Less energy in retrospectives
  → Takes longer to respond to async messages

LATE SIGNALS (weeks 8+, often followed by resignation notice):
  → Stops reviewing others' PRs
  → LinkedIn activity increases
  → "I'm looking at other options" in 1-on-1

WHAT TO DO:
  Do not wait for late signals.
  At early signals: address it directly in 1-on-1.
  "I've noticed you seem less engaged this sprint. Is everything OK?
   Is there something about the work or the team that's not working?"
  Most developers will tell you if they feel safe enough to.
```

---

## Difficult Conversations

Some 1-on-1s require a conversation you would rather not have. Having it early is always better than having it late.

### Performance Issues

```
STRUCTURE:
  1. Name the pattern specifically (SBI — not personality)
     "Over the last 3 sprints, stories have been carried over
      consistently at the end of sprint. The last 3 carried-over
      stories were AUTH-12, AUTH-18, and ORDER-4."

  2. Ask for their view first
     "What do you think is causing this?"

  3. Agree on a specific, measurable change
     "For the next sprint, let's agree: if a story is at risk
      of not finishing by Wednesday, you message me immediately.
      That way we can help before the sprint ends."

  4. Set a check-in date
     "Let's revisit this in two weeks. If the pattern continues
      we will need to escalate to a formal improvement plan."

NEVER: surprise someone in a performance review with something
you never raised in a 1-on-1. If it was not discussed, it was
not managed.
```

### Conflict Between Team Members

```
RULE: Never mediate a conflict between A and B by talking
      separately to A and B and never bringing them together.
      That is triangulation. It makes things worse.

PROCESS:
  1. Hear each person's perspective separately (1-on-1)
  2. Find the factual disagreement (vs the emotional one)
  3. Bring both together with you as facilitator
  4. Focus the conversation on the work, not the person
  5. Agree on a behavior going forward, not a verdict on the past
```

---

## Anti-Patterns to Eliminate

| Anti-Pattern | What It Costs | Fix |
|:-------------|:-------------|:----|
| **Cancelling 1-on-1s when busy** | Developer learns their growth is optional | 1-on-1 is non-negotiable — reschedule same week if unavoidable |
| **Using 1-on-1 as a status update** | Developer dreads it; you lose the trust signal | Ban ticket-status questions — use standup for that |
| **Only giving corrective feedback** | Developer learns to fear review; risk-aversion grows | 2:1 ratio — two specific positives for every correction |
| **Vague feedback: "needs improvement"** | Developer doesn't know what to change | SBI every time — Situation, Behavior, Impact |
| **Solving every problem for the developer** | They never develop independent judgment | "What have you tried?" before giving the answer |
| **Ignoring disengagement signals** | You find out in a resignation letter | Address at early signal — "I've noticed X, is everything OK?" |
| **Forgetting your own 1-on-1 commitments** | Trust collapses — "my TL says things but doesn't do them" | Review your notes before every 1-on-1, action your own items first |
| **Same growth conversation every session** | Developer has the same gaps after 6 months | Track skills quarterly — are they actually advancing? |

---

## Related

| Resource | Why |
|:---------|:----|
| [1-on-1 Template](../templates/meetings/02-one-on-one.md) | The running notes template for every 1-on-1 session |
| [Code Review Habits](./03-code-review-habits-for-team-leads.md) | Technical feedback to carry into 1-on-1 coaching |
| [Deep Work vs Available Time](./05-deep-work-vs-available-time.md) | How to protect your own time while running regular 1-on-1s |

---

*Last updated: 2026-05-18*
