# Template: Project Status Report

> **How to use:** Send on a fixed cadence (e.g. weekly) per [05 — Stakeholders & Reporting](../05-stakeholders-and-reporting.md). Lead with the RAG status and the *why*. Surface bad news early — a report that's always green is a report nobody believes. Tailor the depth to the audience.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Status Report — [PROJECT] · [YYYY-MM-DD]

**PM:** [NAME] · **Period:** [sprint / week] · **Audience:** [who]

## 🚦 Overall Status: `🟢 GREEN` | `🟡 AMBER` | `🔴 RED`
> One sentence: why this color.

[reason]

---

## ✅ Progress
- **Milestones:** [X of Y done] — next: [milestone] by [range]
- **This period:** [what shipped / what advanced]
- **Sprint:** committed [N], delivered [N]

## ⚠️ Risks & Issues (top 3)
| Item | R/I | Impact | Status / mitigation | Owner |
|:-----|:---:|:-------|:--------------------|:------|
| [ ] | [ ] | [ ] | [ ] | [ ] |

## 🆘 Decisions Needed
- [decision] — needed by [date] — from [who]

## 🔭 Forecast
- [Milestone]: [range, e.g. "mid-to-late July"] — [trend: ↑ ↓ →]

## 📌 Next Period
- [focus]

---

## ─── FILLED EXAMPLE (excerpt) ─────────────────────────────────────

---

# Status Report — Coupons v2 · 2026-06-13

**PM:** Dara · **Period:** Sprint 12 · **Audience:** Sponsor + steering

## 🚦 Overall Status: 🟡 AMBER
> Payments-team dependency slipped a week; mitigations in flight, date at risk but recoverable.

## ✅ Progress
- Milestones: 2 of 4 done — next: "Checkout coupon support" by late June.
- This period: coupon CRUD shipped; expired-coupon 500 bug fixed & verified.
- Sprint: committed 28, delivered 27.

## ⚠️ Risks & Issues
| Item | R/I | Impact | Status / mitigation | Owner |
|:-----|:---:|:-------|:--------------------|:------|
| Payments API delay | Issue | High | Escalated; using mock to keep building | Dara |
| Single dependency on Payments | Risk | High | Requesting a backup contact | Dara |

## 🆘 Decisions Needed
- Hold scope or move date 1 week? — by June 16 — from Sponsor.

## 🔭 Forecast
- Launch: late June → early July (→ at risk). Recommend cutting "coupon analytics" to hold the date.

---

*Template for the [PM Leadership Playbook](../README.md)*
