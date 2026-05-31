# Template: Technical Assessment Report

> **How to use:** This is the output of [02 — Technical Assessment](../02-technical-assessment.md), produced in Phase 2 (days 15–30). Score each of the six dimensions on the **1–5 maturity scale**, anchor every score to a fact or number, and keep recommendations clearly separated from findings. **Review it privately with your manager before publishing widely.** Facts first; opinions clearly labeled.

**1–5 scale:** 1 Ad hoc · 2 Repeatable · 3 Defined · 4 Measured · 5 Optimizing

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Technical Assessment — [TEAM / SYSTEM]

**Author:** [YOUR NAME], Team Lead
**Date:** [YYYY-MM-DD]
**Period assessed:** [days X–Y]

## Executive Summary
- **Overall health:** [1-line headline + average score]
- **Top 3 pains (by impact × effort):** [1] … [2] … [3] …
- **Quick wins identified:** [list]

## Scorecard

| # | Dimension | Score (1–5) | Key evidence (facts, not vibes) |
|:--|:----------|:-----------:|:--------------------------------|
| 1 | Architecture | [ ] | [coupling / boundaries / right-sizing] |
| 2 | Code Quality | [ ] | [lint in CI? complexity? duplication?] |
| 3 | Tests | [ ] | [coverage %, flaky %, pyramid shape, speed] |
| 4 | CI/CD & Tooling | [ ] | [build time, green rate, deploy freq, local setup] |
| 5 | Tech Debt | [ ] | [tracked? hot spots? interest rate] |
| 6 | Team Skills | [ ] | [skill matrix, bus factor, growth gaps] |

## Findings by Dimension
### 1. Architecture — [score]
- [fact] … [fact] …

### 2. Code Quality — [score]
- …

### 3. Tests — [score]
- …

### 4. CI/CD & Tooling — [score]
- …

### 5. Tech Debt — [score]
- …

### 6. Team Skills — [score]
- [skill matrix summary + bus-factor risks]

## Recommendations (clearly separated from findings)

| Priority | Recommendation | Impact | Effort | Owner |
|:--------:|:---------------|:------:|:------:|:------|
| DO NOW | [ ] | High | Low | [ ] |
| SCHEDULE | [ ] | High | High | [ ] |
| FILL-IN | [ ] | Low | Low | [ ] |

## Proposed Targets (next quarter)
- [Dimension]: [current] → [target]

---

## ─── FILLED EXAMPLE (excerpt) ─────────────────────────────────────

---

# Technical Assessment — Payments Squad / Order Monolith

**Author:** Sok, Team Lead · **Date:** 2026-06-28 · **Period:** days 15–30

## Executive Summary
- **Overall health:** 2.0/5 average — capable team held back by flaky CI and a single-point-of-knowledge monolith.
- **Top 3 pains (impact × effort):** (1) flaky CI red ~30% of the time *[high impact, low effort]*; (2) payments knowledge lives only in Rith's head *[high impact, medium effort]*; (3) untracked tech debt in the order monolith *[high impact, high effort]*.
- **Quick wins:** quarantine the 9 worst flaky tests; one-command local setup (currently a 1.5-day onboarding slog).

## Scorecard

| # | Dimension | Score | Key evidence |
|:--|:----------|:-----:|:-------------|
| 1 | Architecture | 2 | One 180k-line order monolith; `payments` has no module boundary; dependency cycles between billing↔orders |
| 2 | Code Quality | 3 | Linter exists but not enforced in CI; style argued in ~40% of PRs; 3 hot files exceed 800 lines |
| 3 | Tests | 2 | 44% coverage; ~14% flaky rate; inverted pyramid (mostly slow E2E, 22-min suite) |
| 4 | CI/CD & Tooling | 1 | Main branch green only ~70% of the time (flaky CI + runner timeouts); deploy is manual, ~weekly; local setup takes 1.5 days |
| 5 | Tech Debt | 2 | Untracked — lives in 140+ TODO comments; no register; hot spot = `OrderService` (high churn × high complexity) |
| 6 | Team Skills | 2 | Bus factor of 1 on payments (Rith) and on deploys (Mony); 2 juniors with no owned feature yet |

## Recommendations

| Priority | Recommendation | Impact | Effort | Owner |
|:--------:|:---------------|:------:|:------:|:------|
| DO NOW | Quarantine flaky tests + add CI retry/isolation | High | Low | Sok |
| DO NOW | One-command local setup script | High | Low | Sokha |
| SCHEDULE | Carve `payments` out of the monolith (ADR-001) | High | High | Rith |
| SCHEDULE | Pair a second owner onto payments + deploys | High | Med | Sok |
| FILL-IN | Enforce linter in CI to end style debates | Med | Low | team |

## Proposed Targets (Q3)
- CI/CD: 1 → 3 (green-rate > 95%, automated deploy)
- Team Skills: 2 → 3 (no bus-factor-1 systems)
- Tests: 2 → 3 (flaky < 2%, suite < 10 min)

---

*Template for the [Team Lead Playbook](../README.md)*
