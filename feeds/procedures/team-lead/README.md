# 🧭 Team Lead / Tech Lead Playbook

A practical, step-by-step playbook for someone stepping into a **Team Lead / Tech Lead role for the first time, in a new company/workspace.** It covers both halves of the job:

1. **Onboarding** — what *you* do in your first 90 days to land well.
2. **Technical leadership** — the direction, standards, review culture, and people growth you *build* for the team.

> Built on one principle: **lead through technical credibility and trust, not title.** The hardest shift is from top individual contributor to **multiplier** — you still write code, but your real output is now the team's throughput and growth. Spend your first month earning trust and understanding the codebase before you change it.

Each procedure follows the house format: a **Mermaid swimlane diagram**, a portable **ASCII flow**, and a **step-by-step responsibility table** — so it works in GitHub, Confluence, or a terminal.

---

## 📁 The Series — Read in Order

| # | Procedure | When to Reference | Time |
|:--|:----------|:------------------|:----:|
| 01 | [First 90 Days as a New Team Lead](./01-first-90-days.md) | Day 1 — your onboarding roadmap (Listen → Assess → Plan → Execute) | ~14 min |
| 02 | [Technical Assessment](./02-technical-assessment.md) | Phase 2 — auditing engineering health across 6 dimensions (1–5 scoring) | ~13 min |
| 03 | [Technical Direction](./03-technical-direction.md) | Phase 3 — standards, ADRs, tech-debt strategy, delivery vs quality | ~13 min |
| 04 | [Code Review & Quality](./04-code-review-and-quality.md) | Owning the review culture and quality bar without being the bottleneck | ~12 min |
| 05 | [Mentoring & Growth](./05-mentoring-and-growth.md) | Growing engineers — 1-on-1s, delegation, pairing, feedback, careers | ~13 min |
| 06 | [Delivery & Collaboration](./06-delivery-and-collaboration.md) | Working with PM/QA/PO — estimation, unblocking, representing the team | ~12 min |

---

## 📋 Ready-to-Use Templates

Each is a **blank template** + a **filled example** (same continuous story — a new Team Lead named Sok joining a team with a legacy monolith and flaky CI).

| Template | Use it for |
|:---------|:-----------|
| [30/60/90 Day Plan](./templates/30-60-90-plan-template.md) | Aligning expectations with your manager in week 1 |
| [Technical Assessment](./templates/tech-assessment-template.md) | The output of your Phase 2 audit (6 dimensions, 1–5 scores) |
| [ADR — Architecture Decision Record](./templates/adr-template.md) | Recording a significant technical decision and its trade-offs |
| [1-on-1 Notes](./templates/one-on-one-template.md) | Per-report running notes + first-meeting discovery questions |

---

## 🧭 How to Use This Playbook

```
You just got the Team Lead role
        │
        ▼
  Read 01 (First 90 Days) ── fill the 30/60/90 template
        │
        ▼
  Days 1–14:  LISTEN  → 1-on-1 template, discovery questions
  Days 15–30: ASSESS  → 02 + Technical Assessment template
  Days 31–60: PLAN    → 03 (Technical Direction) + ADRs
  Days 61–90: EXECUTE → 04, 05, 06 + review culture, growth, cadence
```

> **New to the role and short on time?** Read **01** today, skim **02**, and start your 1-on-1s tomorrow. Keep writing code so you stay credible — just not on the critical path. Everything else can wait until you understand the team.

---

## 🎯 Quick Navigation
- [All Procedures](../README.md)
- [QA Leadership Playbook](../qa-leadership/README.md) — the sibling series for a first-time QA Lead
- [PM Leadership Playbook](../pm-leadership/README.md) — the sibling series for a first-time Project Manager
- [Software Delivery flows](../software-delivery/) — [Code Review & PR](../software-delivery/04-code-review-and-pr.md) · [Sprint Ceremonies](../software-delivery/03-sprint-ceremonies.md)
- [Management & Leadership feed](../../management/README.md) — [DoR vs DoD](../../management/02-dor-and-dod-guide.md)

---

## 📚 Cross-References
- **Quality gates:** [DoR vs DoD](../../management/02-dor-and-dod-guide.md)
- **Review mechanics in detail:** [Code Review & PR Flow](../software-delivery/04-code-review-and-pr.md)
- **Where the team's work fits:** [Sprint Ceremonies](../software-delivery/03-sprint-ceremonies.md) · [System Design & Architecture](../system-design/01-system-architecture.md)
- **Sibling leadership series:** [QA Leadership](../qa-leadership/README.md) · [PM Leadership](../pm-leadership/README.md)
- **Leadership skills:** [Management & Leadership](../../management/README.md)

---

*Part of the [Procedures](../README.md) collection · Last updated: 2026-05-31*
