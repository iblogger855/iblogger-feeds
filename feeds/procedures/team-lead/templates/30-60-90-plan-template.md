# Template: 30/60/90 Day Plan (New Team Lead)

> **How to use:** Fill this out in your first week and review it with your manager. It turns the [First 90 Days procedure](../01-first-90-days.md) into a concrete, shareable commitment. Keep it to one page. Update it at each 30-day mark. As a Tech Lead, the through-line is the doer→multiplier shift: each phase you do *less* of the coding yourself and *more* of the enabling.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# 30/60/90 Plan — [YOUR NAME], Team Lead

**Start date:** [YYYY-MM-DD]
**Manager:** [NAME]
**Mandate (in one line):** [What success looks like, per your manager]
**Hands-on expectation:** [Roughly what % on keyboard, and on what kind of work]

---

## 🎯 First 30 Days — LISTEN & ASSESS
**Theme:** Earn credibility; understand the codebase and people before changing either.

| Goal | How I'll measure it |
|:-----|:--------------------|
| 1-on-1 with every engineer | [N] meetings done |
| Map stakeholders (PM/QA/PO/partners) | Stakeholder map |
| Clone, build, ship one small change | First PR merged [Y/N] |
| Complete technical assessment (6 dims, 1–5) | Report shared |

**Out of scope this phase:** big refactors, new standards, tooling overhauls.

---

## 🗺️ Days 31–60 — PLAN
| Goal | How I'll measure it |
|:-----|:--------------------|
| Set technical direction (standards + ADR process) | Co-authored with team |
| Stand up a tech-debt register + capacity policy | Agreed with manager + PM |
| Prioritize top 3 improvements (impact × effort) | Roadmap agreed |
| Socialize plan 1-on-1, then group | Buy-in secured |

---

## 🚀 Days 61–90 — EXECUTE
| Goal | How I'll measure it |
|:-----|:--------------------|
| Ship 1–2 quick wins the team feels | [metric] |
| Establish review culture + rotation | No single-reviewer bottleneck |
| Run regular 1-on-1s + a design discussion | Cadence live |
| Define 3–5 engineering metrics | [metrics live] |

---

## 🆘 What I need from my manager
- [Support / decision / introduction / capacity]

---

## ─── FILLED EXAMPLE (excerpt) ─────────────────────────────────────

---

**Plan — Sok, Team Lead · Start 2026-06-01 · Manager: Lina (Eng Manager)**

**Mandate:** "Make this team ship predictably again — the legacy monolith and flaky CI are killing us. Stay hands-on, but stop being the only one who can touch payments."

**Hands-on expectation:** ~50% on keyboard, focused on the risky monolith seams and CI — *not* on the critical-path feature work.

**30 days:** 1-on-1 with all 5 engineers; mapped PM (Dara), QA Lead (Mara), PO, and the Platform team dependency; shipped a small PR day 3 (fixed the broken local-setup script — took me 1.5 days, which told me everything). Technical assessment shared with Lina by day 28. Headline scores: Architecture 2/5 (one 180k-line monolith, payments is a single-point-of-knowledge in Rith's head), Tests 2/5 (44% coverage, ~14% flaky), CI/CD 1/5 (main branch red ~30% of the time from flaky CI), Tech Debt 2/5 (untracked, lives in TODOs), Code Quality 3/5, Team Skills 2/5 (bus factor of 1 on payments and on deploys).

**60 days:** co-authored a one-page coding standard with the team (linter now enforces format — ended the style debates); started a tracked debt register; agreed a 20% per-sprint debt capacity with Lina and Dara; wrote ADR-001 (carve a `payments` module out of the monolith behind a clear interface — first step to splitting it). Top-3 = flaky CI, payments bus factor, untracked debt.

**90 days:** quick win the team felt — quarantined the 9 worst flaky tests and added retry+isolation, main-branch green rate went 70% → 96%; one-command local setup. Review rotation live (Rith no longer the only payments reviewer — paired Sokha onto it as second owner). Weekly design discussion + biweekly 1-on-1s running. Metrics live = lead time, change-fail rate, deploy frequency, PR review latency, main-branch green rate.

**Need:** Lina to back a Q3 "engineering health" slice so the monolith split (ADR-001) gets real capacity, not just goodwill.

---

*Template for the [Team Lead Playbook](../README.md)*
