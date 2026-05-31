# Procedure: Agile Maturity Assessment

**Tags:** #procedure #scrum-master #agile #scrum #assessment #maturity
**Roles:** Scrum Master · Team · Product Owner · Team Lead · Engineering Manager
**Read Time:** ~13 min

> You can't improve a process you haven't honestly diagnosed. This procedure is the Scrum Master's Phase 2 method: a structured way to assess where the team actually is across **six dimensions of agile maturity**, score each 1–5 with evidence, and prioritize what to improve first. The throughline: **assess the system, never the people.** A maturity assessment is a mirror you hold up *with* the team, not a report card you hand *to* management.

---

## 📌 Table of Contents
- [Why Assess Maturity](#why-assess-maturity)
- [The Six Dimensions](#the-six-dimensions)
- [The 1–5 Scoring Scale](#the-15-scoring-scale)
- [Mermaid Swimlane Diagram](#mermaid-swimlane-diagram)
- [ASCII Flow](#ascii-flow)
- [Step-by-Step Responsibility Table](#step-by-step-responsibility-table)
- [Scoring Each Dimension](#scoring-each-dimension)
- [From Scores to Priorities](#from-scores-to-priorities)
- [Anti-Patterns to Avoid](#anti-patterns-to-avoid)
- [Related Documents](#related-documents)

---

## Why Assess Maturity

A first-time Scrum Master arrives full of impressions: "the standup runs long," "retros get skipped," "one person dominates." Impressions are a starting point, not a diagnosis. The assessment turns them into something the team can act on:

- It replaces opinion ("I think our refinement is weak") with evidence ("3 of last 5 sprints started with stories that had no acceptance criteria").
- It gives the team a **shared baseline** to measure improvement against in 90 days.
- It forces *prioritization* — you cannot fix six dimensions at once, and trying is the fastest way to fix none.

> Maturity is a direction, not a destination. A "level 3" team that's steadily improving is healthier than a "level 4" team that's stagnant. You're assessing **trajectory and capability to self-improve**, not grading a test.

---

## The Six Dimensions

| # | Dimension | The question it answers |
|:--|:----------|:------------------------|
| 1 | **Ceremonies** | Do the events happen, on time, and produce real value (not theater)? |
| 2 | **Backlog health** | Is the backlog ordered, refined, and ready — or a dumping ground? |
| 3 | **Self-organization** | Does the team decide *how* to do the work, or wait to be told? |
| 4 | **Flow / WIP** | Does work move smoothly to done, or pile up half-finished? |
| 5 | **Psychological safety** | Can people raise problems, disagree, and admit mistakes safely? |
| 6 | **Continuous improvement** | Does the team actually change based on what it learns (kaizen)? |

These map directly onto what a Scrum Master can influence. Notice none of them is "velocity" or "did we hit the date" — those are PM/delivery concerns, not maturity. See the role boundaries in [01 — First 90 Days](./01-first-90-days.md#scrum-master-vs-pm-vs-team-lead).

---

## The 1–5 Scoring Scale

Use the same scale for every dimension so scores are comparable:

| Score | Label | What it looks like |
|:-----:|:------|:-------------------|
| **1** | Absent | The practice doesn't exist or is actively harmful |
| **2** | Ad hoc | Happens inconsistently; no shared expectation |
| **3** | Practiced | Happens reliably but mechanically; value is uneven |
| **4** | Effective | Done well, produces real value, team owns it |
| **5** | Self-improving | The team inspects and adapts the practice itself, without you |

> A level **5** specifically means the team would keep improving the practice *if the Scrum Master left*. That's the whole point of the role — to make yourself progressively less necessary.

---

## Mermaid Swimlane Diagram

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#4a148c', 'primaryBorderColor': '#12005e', 'primaryTextColor': '#ffffff', 'lineColor': '#ab47bc', 'secondaryColor': '#1a237e', 'tertiaryColor': '#004d40', 'background': '#1e1e1e', 'mainBkg': '#4a148c', 'nodeBorder': '#12005e', 'clusterBkg': '#263238', 'titleColor': '#ffffff', 'edgeLabelBackground': '#263238'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; } .edgeLabel rect { fill: #1e1e1e !important; }'
}}%%
flowchart TD
    START([🔍 Begin Assessment])

    subgraph GATHER ["📥 Gather Evidence"]
        G1([Observe all<br>ceremonies])
        G2([Review board,<br>backlog, retros])
        G3([Listen in<br>1-on-1s])
    end

    subgraph SCORE ["📊 Score 6 Dimensions"]
        S1([Rate each 1–5<br>with evidence])
        S2([Note what would<br>raise each by 1])
        S3([Draft maturity<br>radar])
    end

    subgraph SHARE ["🤝 Share with Team"]
        T1([Bring to a retro —<br>"does this match?"])
        T2([Team validates<br>+ adjusts scores])
        T3([Team picks 1–2<br>to improve])
    end

    subgraph ACT ["🎯 Prioritize"]
        AC1([Impact × effort<br>on chosen gaps])
        AC2([Turn into<br>experiments])
        AC3([Share with<br>manager last])
    end

    START --> G1 --> G2 --> G3
    G3 --> S1 --> S2 --> S3
    S3 --> T1 --> T2 --> T3
    T3 --> AC1 --> AC2 --> AC3

    style GATHER fill:#1a237e,stroke:#0d47a1,color:#fff
    style SCORE fill:#4a148c,stroke:#12005e,color:#fff
    style SHARE fill:#004d40,stroke:#00251a,color:#fff
    style ACT fill:#1b5e20,stroke:#003300,color:#fff
```

---

## ASCII Flow

```
AGILE MATURITY ASSESSMENT
══════════════════════════════════════════════════════════════════════════════════

🔍 START (Day 15)
   │
   ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  GATHER EVIDENCE                          RULE: observe, don't grade           │
│    ① Observe every ceremony — at least one full sprint's worth                 │
│    ② Review the board, backlog, last 3 retros (were actions done?), DoR/DoD    │
│    ③ Listen in 1-on-1s — where does the process help / hurt each person?       │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  SCORE 6 DIMENSIONS                       RULE: every score needs evidence      │
│    ④ Rate 1–5: Ceremonies · Backlog · Self-org · Flow · Safety · Kaizen        │
│    ⑤ For each, write "what would raise this by one level"                       │
│    ⑥ Draft the maturity radar + the assessment doc                             │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  SHARE WITH THE TEAM                      RULE: it's their mirror, not yours    │
│    ⑦ Bring to a retro: "here's what I see — does it match your experience?"     │
│    ⑧ Team validates and adjusts the scores (their reality > your guess)         │
│    ⑨ Team picks the 1–2 dimensions it wants to improve first                    │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  PRIORITIZE                               RULE: small, reversible experiments   │
│    ⑩ Impact × effort on the chosen gaps                                         │
│    ⑪ Turn each into a time-boxed experiment ("try for 2 sprints, then inspect") │
│    ⑫ Share the summary with your manager LAST — health signals, not blame       │
└────────────────────────────────────────────────────────────────────────────────┘
```

---

## Step-by-Step Responsibility Table

| # | Step | Who Owns | Who Helps | Output |
|:--|:-----|:---------|:----------|:-------|
| 1 | Observe all ceremonies | Scrum Master | Team | Observation notes |
| 2 | Review board, backlog, retros | Scrum Master | PO | Evidence log |
| 3 | Gather signal from 1-on-1s | Scrum Master | Team members | Per-person notes |
| 4 | Score the 6 dimensions | Scrum Master | — | Draft scores + evidence |
| 5 | Draft the maturity radar | Scrum Master | — | [Assessment doc](./templates/agile-maturity-assessment-template.md) |
| 6 | Validate scores with the team | Team | Scrum Master facilitates | Agreed scores |
| 7 | Pick 1–2 dimensions to improve | Team | Scrum Master | Chosen focus areas |
| 8 | Prioritize gaps (impact × effort) | Scrum Master | Team | Ranked improvements |
| 9 | Turn gaps into experiments | Team | Scrum Master | Improvement backlog |
| 10 | Share summary with manager | Scrum Master | — | Team-health summary |

---

## Scoring Each Dimension

For each dimension, here's what 1–5 looks like in practice. Use these as anchors; cite specific evidence.

### 1. Ceremonies
- **1–2:** Events skipped or hijacked. Standup is a status report to a manager; retros get cancelled "because we're busy."
- **3:** All events happen on schedule but feel mechanical — people attend, little changes.
- **4:** Each event produces a clear output (a sprint goal, ready stories, real feedback, a change).
- **5:** The team prunes and adapts its own ceremonies — drops what doesn't help, time-boxes itself.
- **Evidence to collect:** Did each event happen? How long did it run? What concrete output did it produce?

### 2. Backlog health
- **1–2:** A dumping ground; planning is the *first* time the team sees most stories.
- **3:** Backlog is ordered and some refinement happens, but stories often arrive at planning not ready.
- **4:** Top of backlog is consistently DoR-ready ([DoR vs DoD](../../management/02-dor-and-dod-guide.md)); refinement is a real, separate session.
- **5:** The PO and team keep a healthy backlog continuously; readiness is rarely a planning bottleneck.
- **Evidence:** % of committed stories that met DoR at planning; how far ahead the backlog is refined.

### 3. Self-organization
- **1–2:** Work is assigned to individuals (often by a lead or manager); the team waits to be told.
- **3:** The team pulls work but defers most "how" decisions to one or two people.
- **4:** The team decides how to break down and tackle work; swarms on blockers without prompting.
- **5:** The team adjusts its own composition, working agreements, and approach as conditions change.
- **Evidence:** Who assigns work? Who decides technical approach? What happens when someone's blocked?

### 4. Flow / WIP
- **1–2:** Everything "in progress," nothing "done"; work sits in review or QA for days.
- **3:** Work moves but in big batches near the sprint end; visible end-of-sprint crunch.
- **4:** WIP is limited; work flows steadily; the team finishes before starting.
- **5:** The team watches its own flow, spots bottlenecks, and adjusts WIP limits itself.
- **Evidence:** WIP per person, where work piles up (the bottleneck), cycle-time spread within a sprint.

### 5. Psychological safety
- **1–2:** Silence in retros; one or two voices dominate; bad news travels slowly or not at all.
- **3:** People raise problems but soften or sidestep the hard ones; some voices still quiet.
- **4:** People disagree openly and respectfully; mistakes are discussed as learning, not blame.
- **5:** The team actively invites dissent; quiet voices are drawn in; "I was wrong" is normal.
- **Evidence:** In a retro, how many people speak? Is bad news raised early? How are mistakes treated?

### 6. Continuous improvement (kaizen)
- **1–2:** Retros produce no actions, or actions that never happen; same problems recur.
- **3:** Retros produce actions; some get done, many slip; little measurement.
- **4:** Most retro actions get done and are reviewed; the team sees its own improvement.
- **5:** The team experiments deliberately, measures outcomes, and adapts — improvement is a habit, not an event.
- **Evidence:** % of last 5 retros' actions actually completed; recurrence of the same issues.

---

## From Scores to Priorities

A common rookie mistake is trying to lift every low score at once. Don't. Use this sequence:

1. **Plot the radar.** Six spokes, 1–5. The shape tells a story at a glance.
2. **Look for the constraint, not the lowest score.** Sometimes a low *psychological safety* score is *why* retros produce nothing — fix safety and kaizen follows. Find the root, not the symptom.
3. **Let the team choose.** Bring the radar to a retro and ask: *"Which one of these, if it got better, would make the biggest difference to your week?"* Their answer beats yours, and they'll own the fix.
4. **Pick 1–2 experiments.** Frame each as time-boxed: *"Let's try X for two sprints, then look at the signal and decide."*
5. **Define what 'better' looks like** for each before you start, so you can tell at the next assessment whether it moved.

Capture all of this in the **[Agile Maturity Assessment template](./templates/agile-maturity-assessment-template.md)**, and feed the chosen experiments into your improvement backlog. Re-run the assessment at the 90-day mark to show trajectory.

---

## Anti-Patterns to Avoid

| Anti-Pattern | Why It Hurts | Do Instead |
|:-------------|:-------------|:-----------|
| **Grading the people** | Maturity is a property of the system; blaming people kills safety | Score the practice; cite system evidence |
| **Scoring from your office** | Scores without observation are just your bias with numbers | Sit in every ceremony before you score |
| **Showing management first** | Publishing a verdict before the team sees it breaks trust instantly | Validate with the team, then summarize for management |
| **Fixing all six at once** | Spreads effort thin; nothing actually improves | Pick 1–2; experiment; re-assess |
| **Treating the score as the goal** | "Get to level 4" becomes theater and gaming | Treat trajectory + capability to self-improve as the goal |
| **Confusing maturity with velocity** | Velocity is delivery, not health; conflating them weaponizes the assessment | Keep delivery metrics out of the maturity model |
| **One-and-done** | A single snapshot can't show improvement | Re-run at 90 days and quarterly thereafter |

---

## Related Documents
- **Previous:** [01 — First 90 Days](./01-first-90-days.md)
- **Next:** [03 — Facilitating Ceremonies](./03-facilitating-ceremonies.md)
- [04 — Removing Impediments](./04-removing-impediments.md) · [05 — Coaching & Team Health](./05-coaching-and-team-health.md) · [06 — Metrics & Continuous Improvement](./06-metrics-and-continuous-improvement.md)
- **Templates:** [Agile Maturity Assessment](./templates/agile-maturity-assessment-template.md) · [Retro Formats](./templates/retro-formats-template.md)
- **Cross-feed:** [DoR vs DoD](../../management/02-dor-and-dod-guide.md) · [Sprint Ceremonies](../software-delivery/03-sprint-ceremonies.md) · [Agile feed](../../management/agile/) · [QA Leadership Playbook](../qa-leadership/README.md)

---

*Part of the [Scrum Master Playbook](./README.md) · Last updated: 2026-05-31*
