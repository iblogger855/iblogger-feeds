# Template: 1-on-1 Meeting

> **How to use:** The IC owns this document — not the manager. Prepare your topics before the meeting. The manager adds their topics too. This is not a status update — it's a conversation about growth, blockers, and alignment. Run every 1–2 weeks, 30–60 minutes.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# 1-on-1: [IC NAME] ↔ [MANAGER NAME]

**Date:** [YYYY-MM-DD]  
**Time:** [HH:MM] [TIMEZONE]  
**Frequency:** Weekly / Bi-weekly  

---

## 🔋 Check-in

> Quick pulse. Rate energy / focus / mood: 🔴 Low / 🟡 Medium / 🟢 High

**IC:** [🔴 / 🟡 / 🟢] — [one sentence on how you're doing]  
**Manager:** [🔴 / 🟡 / 🟢]  

---

## 📌 IC Topics

> The IC prepares these before the meeting. Bring what matters to *you*.

1. [TOPIC / QUESTION / UPDATE]
2. [TOPIC / QUESTION / UPDATE]
3. [TOPIC / QUESTION / UPDATE]

---

## 📌 Manager Topics

1. [TOPIC]
2. [TOPIC]

---

## 🚧 Blockers & Friction

> What is slowing you down or frustrating you right now?

- [BLOCKER / FRICTION POINT]

---

## 🌱 Growth & Development

> Career goals, skills to build, feedback requests, learning needs.

- [GROWTH TOPIC]

---

## 💬 Feedback Exchange

**IC → Manager:**  
[FEEDBACK ON MANAGEMENT, PROCESS, OR TEAM — be direct]

**Manager → IC:**  
[SPECIFIC FEEDBACK ON PERFORMANCE, BEHAVIOUR, OR GROWTH AREA]

---

## ✅ Actions & Follow-ups

| # | Action | Owner | Due |
|:--|:-------|:------|:----|
| 1 | [ACTION] | [NAME] | [DATE] |

---

## 📅 Previous Actions Review

| Action | Owner | Status |
|:-------|:------|:-------|
| [PREVIOUS ACTION] | [NAME] | ✅ Done / ❌ Not Done / 🔄 In Progress |

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# 1-on-1: Chamrong Thor ↔ Sophea Keo

**Date:** 2026-05-14  
**Time:** 10:00 ICT  
**Frequency:** Bi-weekly  

---

## 🔋 Check-in

**Chamrong:** 🟡 Medium — productive sprint but the AUTH-31 P1 at 10pm last Friday drained me.  
**Sophea:** 🟢 High  

---

## 📌 IC Topics

1. I want to talk about the code review bottleneck — PRs sat for 2 days waiting on a second approval. Can we change the policy to 1 required reviewer for hotfixes?
2. I've been reading about KMS and I think we should plan a migration off `EncryptionService` for v2 — want to get your buy-in before I write the ADR.
3. I'd like to start mentoring Maly on backend architecture. Can I give her AUTH-10 as her first lead story?

---

## 📌 Manager Topics

1. Q3 promo cycle opens June 1 — want to discuss Chamrong's growth narrative.
2. Team health score dropped on "technical confidence" in retro — is this related to the ADR-coming-late issue?

---

## 🚧 Blockers & Friction

- Code review queue is the biggest friction point. Two stories were stuck at 95% done for 2 days because the second reviewer was heads-down. It's demoralizing to be "done" but blocked on merge.

---

## 🌱 Growth & Development

- I want to grow into a Staff Engineer role. I think the path includes: (1) owning a cross-team technical initiative, (2) writing and presenting an RFC to the wider engineering org. Can we identify one opportunity for each in H2?

---

## 💬 Feedback Exchange

**Chamrong → Sophea:**  
The scope-change on AUTH-6 mid-sprint (adding the "remember this device" requirement) wasn't flagged until QA found it missing. I need product changes to come through refinement — not discovered during testing. It cost half a day to re-scope.

**Sophea → Chamrong:**  
Your technical decisions are well-reasoned and the ADRs are high quality. The gap is upstream communication — the team didn't know the AES-256 decision was being debated until it came up in the kickoff meeting. For major decisions, draft a Slack thread or ADR stub earlier so people aren't surprised.

---

## ✅ Actions & Follow-ups

| # | Action | Owner | Due |
|:--|:-------|:------|:----|
| 1 | Propose hotfix review policy (1 reviewer) to team in Slack | Chamrong | 2026-05-16 |
| 2 | Draft ADR stub for KMS migration plan | Chamrong | 2026-05-28 |
| 3 | Assign AUTH-10 to Maly as lead story in Sprint 15 | Sophea | Sprint 15 planning |
| 4 | Add "Share ADR stub in Slack before kickoff" to team working agreement | Sophea | 2026-05-16 |

---

## 📅 Previous Actions Review

| Action | Owner | Status |
|:-------|:------|:-------|
| Write runbook for auth service incidents | Chamrong | ✅ Done — used during AUTH-31 |
| Discuss conference budget for KCD Asia 2026 | Sophea | 🔄 In Progress — HR approval pending |
