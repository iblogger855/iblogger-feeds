# Procedure: Performance & Growth

**Tags:** #procedure #engineering-manager #leadership #performance #growth #career-ladder #people-management
**Roles:** Engineering Manager · Engineers (direct reports) · Your Manager · HR/People · Team Lead
**Read Time:** ~14 min

> Your job is to make your people better than they were when they joined your team. This procedure covers growth frameworks, career ladders, setting clear expectations, recognition, promotions, and the hardest part of the job — managing underperformance fairly and humanely. The principle: **growth is a partnership, and performance management is an act of respect, not punishment.** When someone is struggling, the fair thing is to tell them clearly, support them genuinely, and give them a real chance to succeed — surprises at review time are a management failure, not an employee one.

---

## 📌 Table of Contents
- [The Principle: Growth Is a Partnership](#the-principle-growth-is-a-partnership)
- [Mermaid Swimlane Diagram](#mermaid-swimlane-diagram)
- [ASCII Flow](#ascii-flow)
- [Step-by-Step Responsibility Table](#step-by-step-responsibility-table)
- [Career Ladders & Levels](#career-ladders--levels)
- [Setting Expectations](#setting-expectations)
- [Growth Plans](#growth-plans)
- [Recognition](#recognition)
- [Promotions](#promotions)
- [Managing Underperformance](#managing-underperformance)
- [Anti-Patterns to Avoid](#anti-patterns-to-avoid)
- [Related Documents](#related-documents)

---

## The Principle: Growth Is a Partnership

> You cannot grow someone who doesn't want to grow, and you can't force a direction that isn't theirs. Your role is to provide **clarity** (what good looks like at the next level), **opportunity** (the stretch work that builds it), and **honest feedback** (where they stand). They provide the effort and the ownership. Growth is co-authored — meet people where they are and help them get where *they* want to go.

Two truths that govern everything here:
- **No surprises.** If a rating or a struggle is news to the person at review time, you failed to communicate, not them.
- **Fairness is non-negotiable.** Apply the same standard to everyone, document decisions, and check your own bias. Performance is about behavior and outcomes, never about who you like.

---

## Mermaid Swimlane Diagram

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#1b5e20', 'primaryBorderColor': '#003300', 'primaryTextColor': '#ffffff', 'lineColor': '#66bb6a', 'secondaryColor': '#1a237e', 'tertiaryColor': '#4a148c', 'background': '#1e1e1e', 'mainBkg': '#1b5e20', 'nodeBorder': '#003300', 'clusterBkg': '#263238', 'titleColor': '#ffffff', 'edgeLabelBackground': '#263238'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; } .edgeLabel rect { fill: #1e1e1e !important; }'
}}%%
flowchart TD
    START([🌱 Grow Each Person])

    subgraph EXPECT ["📐 Set Expectations"]
        X1([Map to ladder<br>level])
        X2([Define "good"<br>at this level])
        X3([Agree growth<br>direction])
    end

    subgraph SUPPORT ["🤝 Support Growth"]
        S1([Stretch work +<br>opportunity])
        S2([Coaching +<br>feedback])
        S3([Recognition])
    end

    subgraph DECIDE ["⚖️ Performance Decisions"]
        D1{Meeting<br>expectations?}
        D2([Promotion<br>case])
        D3([Growth plan —<br>support + clarity])
    end

    START --> X1 --> X2 --> X3
    X3 --> S1 --> S2 --> S3
    S3 --> D1
    D1 -->|Exceeding| D2
    D1 -->|Struggling| D3

    style EXPECT fill:#1a237e,stroke:#0d47a1,color:#fff
    style SUPPORT fill:#004d40,stroke:#00251a,color:#fff
    style DECIDE fill:#1b5e20,stroke:#003300,color:#fff
```

---

## ASCII Flow

```
PERFORMANCE & GROWTH
══════════════════════════════════════════════════════════════════════════════════

🌱 START — per person
   │
   ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  SET EXPECTATIONS                                                             │
│    ① Map them to a ladder level   ② define what "good" looks like here         │
│    ③ agree the growth direction THEY want (not the one you'd pick)             │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         │
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  SUPPORT GROWTH  (the daily work)                                             │
│    ④ stretch work & opportunity   ⑤ coaching + SBI feedback   ⑥ recognition    │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         │
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  PERFORMANCE DECISIONS  (no surprises, ever)                                  │
│    EXCEEDING → ⑦ build the promotion case (evidence at next level)             │
│    STRUGGLING → ⑧ growth plan: clear gap, real support, fair timeline          │
└────────────────────────────────────────────────────────────────────────────────┘
```

---

## Step-by-Step Responsibility Table

| # | Step | Who Owns | Who Helps | Output |
|:--|:-----|:---------|:----------|:-------|
| 1 | Map person to ladder level | EM | HR, Your Manager | Current-level agreement |
| 2 | Define "good" at this level | EM | Team Lead | Clear expectations doc |
| 3 | Agree growth direction | EM + Report | — | [Growth plan](./templates/growth-plan-template.md) |
| 4 | Provide stretch opportunity | EM | Team Lead, PM | Stretch assignment |
| 5 | Coach & give feedback | EM | — | Ongoing SBI feedback |
| 6 | Recognize good work | EM | Team | Specific, timely recognition |
| 7 | Build promotion case | EM | Your Manager, peers | Evidence packet |
| 8 | Manage underperformance | EM | HR, Your Manager | Documented support plan |

---

## Career Ladders & Levels

A **career ladder** describes what's expected at each level (e.g., Junior → Mid → Senior → Staff, and an IC vs management split at senior levels). It is the shared, objective language of growth.

- **Scope grows with level.** Junior: owns a task with help. Mid: owns a feature independently. Senior: owns an ambiguous problem and lifts others. Staff: owns impact across teams.
- **Use the ladder, don't invent your own bar.** If your company has one, anchor every growth and promotion conversation to it. If it doesn't, push for one — inconsistent bars breed unfairness.
- **Both tracks are equal.** A Staff engineer and an EM are peers. Don't push strong ICs into management as the only way "up" — many great engineers make reluctant, unhappy managers.

---

## Setting Expectations

Most "performance problems" are actually unclear-expectation problems. Make expectations explicit *before* you ever evaluate against them.

- **State the level and what it requires** in plain language, tied to the ladder.
- **Define what "good" looks like this quarter** — concrete outcomes, not vibes.
- **Confirm understanding.** Ask them to play it back. "What do you think strong performance looks like for you this quarter?"
- **Write it down.** A short shared doc means there's a reference, not a memory contest, at review time.

---

## Growth Plans

A growth plan is a forward-looking partnership doc (distinct from an underperformance plan). Use the [growth plan template](./templates/growth-plan-template.md).

It captures: **current level**, **where they want to go**, **the gap** (skills/scope to close), **concrete actions** (stretch work, learning, exposure), **the support you'll provide**, and **check-in dates**. Revisit it in 1-on-1s — a growth plan you write once and never reopen is theater.

> Growth is mostly on-the-job. Courses help, but the real lever is giving someone work slightly bigger than they're comfortable with, plus the safety net to attempt it. Delegate things you're good at — that's how people grow and how you scale.

---

## Recognition

Recognition is cheap, high-leverage, and chronically underused by new managers.

- **Be specific:** "Your incident writeup was so clear the on-call rotation now uses it as the template" beats "great job."
- **Be timely:** recognize the moment, not at the annual review.
- **Match the person:** some love public shout-outs; others find them excruciating. Ask in a 1-on-1 how they like to be recognized.
- **Recognize the right things:** helping others, raising a hard problem early, mentoring — not just heroics and crunch. What you celebrate, you get more of.

---

## Promotions

A promotion recognizes that someone is *already operating* at the next level — it is not a reward for tenure or a retention bribe.

- **Gather evidence at the next level** over time: examples of scope, impact, and behaviors expected at the target level.
- **Build the case as a partnership.** The person should know exactly what's needed and see you advocating for them.
- **Calibrate fairly.** Compare against the ladder and against peers at that level, not against your favorites. Watch for bias (who self-promotes vs who quietly delivers).
- **If it's not yet there, say so honestly** and name the specific gap and timeline. A vague "maybe next cycle" is corrosive.

---

## Managing Underperformance

This is the hardest and most human part of the job. Done well, it is fair and often recoverable; done poorly (or avoided), it's unjust to the person, the team, and you.

**The humane, fair process:**
1. **Diagnose honestly first.** Is it a skill gap, a clarity gap, a motivation issue, a personal-life issue, or a mismatch with the role? The fix differs entirely. Often it's unclear expectations or the wrong work — fixable without any formal process.
2. **Give direct, early feedback** using [SBI](./03-one-on-ones-and-feedback.md#giving-feedback-the-sbi-model). The person must hear, clearly and kindly, that there's a gap — long before any formal step. **No surprises.**
3. **Make a real support plan** with a clear gap, concrete expected outcomes, genuine support (coaching, pairing, reduced scope), and a fair timeline. The goal is to help them *succeed*, not to build a paper trail.
4. **Document fairly and involve HR / your manager** for sustained issues — to protect the person's rights and ensure consistency, not to ambush them.
5. **If it doesn't improve, act with dignity.** A respectful, honest parting is kinder than letting someone fail slowly in a role that isn't right for them.

| Do | Don't |
|:---|:------|
| Tell them early and clearly | Spring it on them at review time |
| Diagnose root cause before acting | Assume it's a "them" problem |
| Offer genuine support and a fair chance | Use the plan as a pre-decided exit |
| Keep it private and dignified | Discuss it with the team |
| Document to ensure fairness | Document to build a case against them |
| Check your own bias | Let "fit" stand in for measurable gaps |

> A performance plan is not a punishment — it is a clear contract that says "here's the gap, here's the support, here's a real chance." Many people recover from one. Treat it as the respectful, honest path it should be.

---

## Anti-Patterns to Avoid

| Anti-Pattern | Why It Hurts | Do Instead |
|:-------------|:-------------|:-----------|
| **Surprise low rating** | Unfair; the person never got a chance to fix it | Continuous feedback; no surprises ever |
| **Avoiding the underperformance talk** | Unfair to the person AND the team | Address early, kindly, clearly |
| **Promoting strong ICs into management** | Loses a great engineer, gains a sad manager | Offer an equal IC track |
| **Recognition only at review time** | Cheap leverage wasted; people feel unseen | Specific, timely, frequent recognition |
| **Inventing your own bar** | Inconsistency breeds unfairness | Anchor to the career ladder |
| **Plan as a paper trail** | Cynical; people sense it and disengage | Make it a real, supported chance to succeed |
| **Ignoring bias** | Unfair outcomes, legal & moral risk | Calibrate on evidence; audit your decisions |

---

## Related Documents
- **Previous:** [03 — 1-on-1s & Feedback](./03-one-on-ones-and-feedback.md)
- **Next:** [05 — Hiring & Team Building](./05-hiring-and-team-building.md)
- **Template:** [Growth Plan](./templates/growth-plan-template.md) · [1-on-1 Notes](./templates/one-on-one-template.md)
- **Cross-feed:** [Team Health Assessment](./02-team-health-assessment.md) · [DoR vs DoD](../../management/02-dor-and-dod-guide.md) · [Team Lead Playbook](../team-lead/README.md) · [PM Leadership Playbook](../pm-leadership/README.md)

---

*Part of the [Engineering Manager Playbook](./README.md) · Last updated: 2026-05-31*
