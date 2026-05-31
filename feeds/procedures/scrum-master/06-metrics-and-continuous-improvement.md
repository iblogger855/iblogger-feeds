# Procedure: Metrics & Continuous Improvement

**Tags:** #procedure #scrum-master #agile #metrics #kaizen #continuous-improvement #team-health
**Roles:** Scrum Master · Team · Product Owner · Engineering Manager · PM
**Read Time:** ~13 min

> Metrics in agile exist for one purpose: to help the team **see itself clearly and improve**. The moment a metric is used to judge, rank, or pressure the team, it stops measuring reality and starts measuring fear. This procedure covers the healthy metrics a Scrum Master watches, the cardinal sin of **weaponizing velocity**, how to drive **kaizen** (relentless small improvement), and how to report **team health** without turning it into a stick. The throughline: **measure to learn, never to judge.**

---

## 📌 Table of Contents
- [Metrics for Improvement, Not Judgment](#metrics-for-improvement-not-judgment)
- [Healthy Agile Metrics](#healthy-agile-metrics)
- [The Velocity Trap](#the-velocity-trap)
- [Mermaid Swimlane Diagram](#mermaid-swimlane-diagram)
- [ASCII Flow](#ascii-flow)
- [Step-by-Step Responsibility Table](#step-by-step-responsibility-table)
- [Driving Kaizen](#driving-kaizen)
- [Reporting Team Health](#reporting-team-health)
- [Anti-Patterns to Avoid](#anti-patterns-to-avoid)
- [Related Documents](#related-documents)

---

## Metrics for Improvement, Not Judgment

There are two ways to use any number:

| Used for **improvement** | Used for **judgment** |
|:-------------------------|:----------------------|
| The team owns and reads it | Management reads it about the team |
| A trend over time | A single-period verdict |
| Sparks a "why?" conversation | Triggers reward or pressure |
| Safe to be honest about | Gameable; incentivizes lying |
| Compared to the team's own past | Compared across teams |

A Scrum Master is the guardian of the *left* column. The instant a metric crosses to the right, the team starts optimizing the number instead of the work — padding estimates, splitting stories to inflate counts, hiding problems. **You protect the team's metrics from becoming weapons**, including from well-meaning managers who just want a dashboard.

> Goodhart's Law: *"When a measure becomes a target, it ceases to be a good measure."* This is the most important sentence in this document.

---

## Healthy Agile Metrics

A small set of signals, watched as **trends** and owned by the **team**:

| Metric | What it tells you | How to use it (and NOT) |
|:-------|:------------------|:------------------------|
| **Velocity (as a trend)** | Rough capacity for *the team's own* forecasting | ✅ Help the team plan. ❌ Never compare teams, never a target, never a report card |
| **Cycle time** | How long work takes from start to done | ✅ Spot where flow stalls. ❌ Not a per-person stopwatch |
| **Throughput** | How many items finish per sprint | ✅ Stability/predictability signal. ❌ Not "more = better" pressure |
| **WIP** | How much is in flight at once | ✅ Too high → finish before starting. ❌ Not a busyness score |
| **Impediment age** | How fast blockers get cleared | ✅ Your removal discipline working. ❌ Not blame for who raised it |
| **Retro-action completion %** | Whether the team actually improves | ✅ The best health signal there is. ❌ Not a compliance audit |
| **Team happiness / mood** | Sustainability and engagement | ✅ Leading indicator of trouble. ❌ Never tied to individuals |

> Don't over-instrument. Pick **3–5** the team finds useful, make them visible to the team, and read them together. A wall of dashboards nobody discusses is worse than three numbers the team actually talks about.

---

## The Velocity Trap

Velocity is the most misunderstood and most abused number in agile. It is a **planning aid for one team's own forecasting** — points completed per sprint, useful only for that team's capacity estimate. It is **not** a productivity metric, and it falls apart the moment it's used as one:

- **Comparing velocity across teams is meaningless** — points are a local, relative unit. Team A's 40 and Team B's 20 say nothing about who delivered more.
- **Velocity as a target gets gamed instantly.** Tell a team to "increase velocity" and points-per-story inflate. The number goes up; nothing real improves.
- **Velocity pressure destroys quality and honesty.** Teams cut corners, skip tests, and hide problems to protect the number.
- **A manager asking "why is velocity down?"** is the signal a Scrum Master must intercept. Reframe: velocity naturally varies (holidays, hard problems, onboarding); what matters is *predictability* and *whether the team is improving*.

> **Your job as Scrum Master:** keep velocity inside the team as a forecasting tool, and firmly, repeatedly educate anyone outside the team who tries to weaponize it. This is one of the most important — and most political — things you do. It directly distinguishes you from the [PM, who owns delivery predictability](../pm-leadership/04-cadence-and-execution.md), while you own the team's *health and improvement*.

---

## Mermaid Swimlane Diagram

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#1b5e20', 'primaryBorderColor': '#003300', 'primaryTextColor': '#ffffff', 'lineColor': '#66bb6a', 'secondaryColor': '#1a237e', 'tertiaryColor': '#4a148c', 'background': '#1e1e1e', 'mainBkg': '#1b5e20', 'nodeBorder': '#003300', 'clusterBkg': '#263238', 'titleColor': '#ffffff', 'edgeLabelBackground': '#263238'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; } .edgeLabel rect { fill: #1e1e1e !important; }'
}}%%
flowchart TD
    START([📊 Measure to Learn])

    subgraph CHOOSE ["🎯 Choose Signals"]
        C1([Pick 3–5 healthy<br>metrics])
        C2([Make them<br>team-owned + visible])
        C3([Watch trends,<br>not snapshots])
    end

    subgraph INSPECT ["🔍 Inspect"]
        I1([Read together<br>in the retro])
        I2([Ask "why?" —<br>find the root])
        I3([Spot one thing<br>to improve])
    end

    subgraph ADAPT ["🔁 Adapt (Kaizen)"]
        A1([Run a small,<br>reversible experiment])
        A2([Measure the<br>outcome])
        A3([Keep / drop /<br>adjust])
    end

    subgraph REPORT ["📣 Report Health"]
        R1([Trends + context,<br>never per-person])
        R2([Shield from<br>weaponization])
        R3([Frame as<br>improvement story])
    end

    START --> C1 --> C2 --> C3
    C3 --> I1 --> I2 --> I3
    I3 --> A1 --> A2 --> A3
    A3 --> R1 --> R2 --> R3
    R3 --> I1

    style CHOOSE fill:#1a237e,stroke:#0d47a1,color:#fff
    style INSPECT fill:#4a148c,stroke:#12005e,color:#fff
    style ADAPT fill:#004d40,stroke:#00251a,color:#fff
    style REPORT fill:#1b5e20,stroke:#003300,color:#fff
```

---

## ASCII Flow

```
METRICS & CONTINUOUS IMPROVEMENT (KAIZEN LOOP)
══════════════════════════════════════════════════════════════════════════════════

📊 START
   │
   ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  CHOOSE SIGNALS                           RULE: measure to learn, not judge     │
│    ① Pick 3–5 healthy metrics (velocity-as-trend, cycle time, impediment age…) │
│    ② Make them TEAM-owned and visible — not a management dashboard             │
│    ③ Watch trends over time, never a single-sprint verdict                     │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  INSPECT                                  RULE: the data starts the conversation│
│    ④ Read the signals together in the retro                                    │
│    ⑤ Ask "why?" — chase the root cause, not the symptom                        │
│    ⑥ Pick ONE thing worth improving                                            │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  ADAPT (KAIZEN)                           RULE: small, reversible experiments   │
│    ⑦ Run one small experiment for 1–2 sprints                                  │
│    ⑧ Measure the outcome against what you expected                             │
│    ⑨ Keep it / drop it / adjust it — then loop back to inspect                 │
└────────────────────────────────────────┬─────────────────────────────────────┘
                                         ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│  REPORT HEALTH                            RULE: shield from weaponization        │
│    ⑩ Report trends + context, NEVER per-person numbers                         │
│    ⑪ Intercept anyone using velocity as a stick — educate, reframe             │
│    ⑫ Tell the improvement STORY, not just the numbers                          │
└────────────────────────────────────────────────────────────────────────────────┘
                                         │
                                         └──────► back to INSPECT (every sprint)
```

---

## Step-by-Step Responsibility Table

| # | Step | Who Owns | Who Helps | Output |
|:--|:-----|:---------|:----------|:-------|
| 1 | Choose 3–5 healthy metrics | Scrum Master | Team | Agreed signal set |
| 2 | Make metrics team-visible | Scrum Master | — | Shared, owned dashboard |
| 3 | Read signals in the retro | Team | Scrum Master facilitates | Shared understanding |
| 4 | Ask why; find root cause | Team | Scrum Master | Root cause identified |
| 5 | Pick one improvement | Team | Scrum Master | Chosen experiment |
| 6 | Run a small experiment | Team | Scrum Master | Time-boxed trial |
| 7 | Measure the outcome | Scrum Master | Team | Result vs expectation |
| 8 | Keep / drop / adjust | Team | Scrum Master | Decision |
| 9 | Report health (trends only) | Scrum Master | — | [Health report](#reporting-team-health) |
| 10 | Shield metrics from misuse | Scrum Master | Eng Manager | Protected, honest data |

---

## Driving Kaizen

*Kaizen* — continuous, small, relentless improvement — is the heartbeat of an agile team and the Scrum Master's long game. It's not big transformation programs; it's the team getting 1% better every sprint and compounding it:

1. **Inspect with data, not vibes.** The retro is where metrics earn their keep — they ground the conversation in what actually happened.
2. **One experiment at a time.** A team can absorb one or two changes per sprint, not ten. Pick the highest-leverage one.
3. **Frame as a hypothesis.** "We think shorter standups will free focus time — let's try 10 minutes for two sprints and check cycle time and mood." A hypothesis is safe to be wrong; a mandate isn't.
4. **Measure against expectation.** Did it do what you thought? If not, that's a *learning*, not a failure.
5. **Keep, drop, or adjust — then loop.** Bake the winners into working agreements; discard the rest. This loop never ends; that's the point.
6. **Make improvement visible.** Show the team its own progress over time (re-run the [maturity assessment](./02-agile-maturity-assessment.md) quarterly). Visible progress fuels motivation.

> The team that improves itself a little every sprint will, within a year, leave a "faster" team that never reflects far behind. Compounding beats intensity.

---

## Reporting Team Health

Eventually a manager will ask "how's the team doing?" How you answer protects or poisons everything above:

- **Report trends and context, never raw per-person numbers.** "Cycle time trending down, impediment age halved, last three retros' actions all completed" tells the real story.
- **Lead with health, not output.** A Scrum Master reports on the *team's effectiveness and trajectory* — delivery forecasts are the PM's report ([PM Stakeholders & Reporting](../pm-leadership/README.md)).
- **Be honest about the bad.** Hiding problems detonates later; surface them with the plan to address them. Honesty up protects the team's safety down.
- **Reframe weaponization attempts in the room.** When "why is velocity down?" comes, answer with the truth ("two engineers onboarding, plus a gnarly migration") and steer to what matters: predictability and improvement.
- **Tell the improvement story.** Numbers alone invite judgment; a narrative — "here's what we tried, learned, and changed" — invites support.

---

## Anti-Patterns to Avoid

| Anti-Pattern | Why It Hurts | Do Instead |
|:-------------|:-------------|:-----------|
| **Velocity as a target or KPI** | Gets gamed; quality and honesty collapse | Velocity is a team-only forecasting trend |
| **Comparing velocity across teams** | Points are local units — the comparison is meaningless | Compare a team only to its own past |
| **Per-person productivity metrics** | Destroys collaboration and safety | Measure the team and the system |
| **Over-instrumenting** | A wall of unread dashboards adds noise, not insight | Pick 3–5 signals the team actually discusses |
| **Snapshot judgments** | One bad sprint isn't a trend | Read trends over time |
| **Metrics owned by management** | The team optimizes the number, not the work | Metrics are team-owned, read in the retro |
| **Hiding bad signals** | Surprises blow up trust later | Report honestly with a plan |
| **Improvement without measurement** | "We feel better" can't be sustained or defended | Run experiments; measure outcomes |

---

## Related Documents
- **Previous:** [05 — Coaching & Team Health](./05-coaching-and-team-health.md)
- **Series start:** [01 — First 90 Days](./01-first-90-days.md)
- [02 — Agile Maturity Assessment](./02-agile-maturity-assessment.md) · [03 — Facilitating Ceremonies](./03-facilitating-ceremonies.md) · [04 — Removing Impediments](./04-removing-impediments.md)
- **Templates:** [Agile Maturity Assessment](./templates/agile-maturity-assessment-template.md) · [Impediment Log](./templates/impediment-log-template.md) · [Retro Formats](./templates/retro-formats-template.md)
- **Cross-feed:** [PM Cadence & Execution](../pm-leadership/04-cadence-and-execution.md) (delivery metrics, PM view) · [Sprint Ceremonies](../software-delivery/03-sprint-ceremonies.md) · [Agile feed](../../management/agile/) · [DoR vs DoD](../../management/02-dor-and-dod-guide.md)

---

*Part of the [Scrum Master Playbook](./README.md) · Last updated: 2026-05-31*
