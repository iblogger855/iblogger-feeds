# Template: Sprint Retrospective

> **How to use:** Run this at the end of every sprint — before the next sprint planning. Time-box to 60–90 minutes. The facilitator fills the template during the session. Action items must have owners and due dates or they don't exist.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Retrospective: [SPRINT NAME / NUMBER]

**Date:** [YYYY-MM-DD]  
**Facilitator:** [NAME]  
**Team:** [TEAM NAME]  
**Sprint Duration:** [YYYY-MM-DD] → [YYYY-MM-DD]  
**Attendees:** [NAMES]  

---

## 📊 Sprint Stats

| Metric | Planned | Actual |
|:-------|:--------|:-------|
| Story Points Committed | [X] | [X] |
| Story Points Completed | [X] | [X] |
| Stories Completed | [X] | [X] |
| Bugs Fixed | [X] | [X] |
| Carry-over Stories | [X] | — |

---

## 🌡️ Team Health Check

> Rate 1–5 (1 = struggling, 5 = excellent). Anonymous if needed.

| Dimension | Score | Notes |
|:----------|:------|:------|
| Clarity of goals | [1–5] | |
| Collaboration | [1–5] | |
| Technical confidence | [1–5] | |
| Work-life balance | [1–5] | |
| Process satisfaction | [1–5] | |

---

## ✅ What Went Well

> Celebrate and reinforce. Be specific — "we communicated better" is not useful. "Daily standups were under 15 minutes every day" is.

- [ITEM]
- [ITEM]
- [ITEM]

---

## 🔴 What Didn't Go Well

> Be honest and blameless. Focus on systems and processes, not individuals. "The deployment pipeline broke twice and we had no runbook" is good. "John broke the build" is not.

- [ITEM]
- [ITEM]
- [ITEM]

---

## 💡 Ideas & Suggestions

> Improvements anyone wants to try next sprint.

- [IDEA]
- [IDEA]

---

## 🔁 Action Items

> Each item must have an owner and a due date. Max 3 action items per retro — fewer, better.

| # | Action | Owner | Due Date | Status |
|:--|:-------|:------|:---------|:-------|
| 1 | [WHAT WILL BE DONE] | [NAME] | [DATE] | Open |
| 2 | [WHAT WILL BE DONE] | [NAME] | [DATE] | Open |
| 3 | [WHAT WILL BE DONE] | [NAME] | [DATE] | Open |

---

## 🔍 Previous Action Items Review

> Check items from last retro. Did we do them?

| Action | Owner | Status |
|:-------|:------|:-------|
| [PREVIOUS ACTION] | [NAME] | ✅ Done / ❌ Not Done / 🔄 In Progress |

---

## 💬 Shoutouts

> Recognize teammates for specific contributions this sprint.

- [NAME]: [WHAT THEY DID THAT DESERVES RECOGNITION]

---

## 📝 Notes

[ADDITIONAL DISCUSSION POINTS OR CONTEXT]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Retrospective: Sprint 14

**Date:** 2026-05-16  
**Facilitator:** Sophea Keo  
**Team:** Auth Squad  
**Sprint Duration:** 2026-05-05 → 2026-05-16  
**Attendees:** Chamrong Thor, Sophea Keo, Dara Pich, Maly Chea, Ratha Noun  

---

## 📊 Sprint Stats

| Metric | Planned | Actual |
|:-------|:--------|:-------|
| Story Points Committed | 34 | 28 |
| Story Points Completed | 28 | 28 |
| Stories Completed | 6 | 6 |
| Bugs Fixed | 2 | 3 |
| Carry-over Stories | 2 | — |

---

## 🌡️ Team Health Check

| Dimension | Score | Notes |
|:----------|:------|:------|
| Clarity of goals | 4 | Sprint goal was clear; some ACs ambiguous mid-sprint |
| Collaboration | 5 | Pair programming on AUTH-5 worked really well |
| Technical confidence | 3 | MFA crypto decisions slowed us down — needed ADR earlier |
| Work-life balance | 4 | No crunch; one late night due to P1 hotfix (AUTH-31) |
| Process satisfaction | 3 | Code review queue blocked stories for 1–2 days |

---

## ✅ What Went Well

- AUTH-5 (MFA enrollment) was delivered on time — pair programming with Dara on the QR code generation unblocked a 2-day stuck point in under 30 minutes.
- All 6 stories shipped with test coverage ≥ 85% — first sprint where we hit our coverage target.
- Daily standups averaged 12 minutes. No status reads — only blockers discussed.
- AUTH-31 P1 hotfix was resolved in 4 hours, within SLA, thanks to the on-call runbook Ratha wrote in Sprint 13.

---

## 🔴 What Didn't Go Well

- AUTH-6 and AUTH-8 were carried over because the crypto approach for TOTP secret storage was debated mid-sprint. The ADR (ADR-007) should have been written and approved before sprint planning, not during it.
- Code review turnaround averaged 2 days. Two stories were blocked at 95% done for over a day each, waiting on a second approval.
- Two ACs in AUTH-7 (password reset) were rewritten mid-sprint because QA found them ambiguous during refinement. Refinement was not thorough enough.

---

## 💡 Ideas & Suggestions

- Write ADRs for new technical decisions during refinement, not after sprint planning.
- Set a team norm: code reviews within 1 business day. If a reviewer can't do it, they hand off explicitly rather than silently blocking.
- Add a "30-minute AC review" step at end of each refinement session where QA reads every AC aloud before signing off.

---

## 🔁 Action Items

| # | Action | Owner | Due Date | Status |
|:--|:-------|:------|:---------|:-------|
| 1 | Add "ADR required?" checkbox to DoR template for stories with crypto, DB schema, or infra decisions | Chamrong Thor | 2026-05-19 | Open |
| 2 | Add "Code review SLA: 1 business day" to team working agreement doc | Sophea Keo | 2026-05-19 | Open |
| 3 | Add QA 30-min AC review to the end of each refinement meeting agenda | Maly Chea | 2026-05-20 | Open |

---

## 🔍 Previous Action Items Review

| Action | Owner | Status |
|:-------|:------|:-------|
| Write on-call runbook for auth service | Ratha Noun | ✅ Done — used successfully during AUTH-31 |
| Move unit test coverage threshold to 80% in CI | Chamrong Thor | ✅ Done — Sprint 14 first sprint to hit it |
| Reduce standup to 15 minutes max | Sophea Keo | ✅ Done — averaged 12 min this sprint |

---

## 💬 Shoutouts

- **Ratha Noun**: The on-call runbook you wrote in Sprint 13 saved us from an SLA breach on AUTH-31. Direct, no fluff, exact steps — exactly what was needed at 10pm.
- **Dara Pich**: Pairing on the QR code logic turned a 2-day blocker into a 30-minute solution. The code is also the cleanest in the service.

---

## 📝 Notes

Team raised the question of whether we should consider SMS OTP as an alternative to TOTP. Agreed to table it — it's already listed as a non-goal in the PRD. Will revisit in v2 planning.
