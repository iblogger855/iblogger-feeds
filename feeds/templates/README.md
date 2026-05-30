# 📋 Templates

Copy-paste templates for Jira tickets, product documents, engineering artifacts, meetings, and Scrum ceremonies. Each file contains a **blank template** followed by a **filled example**.

> All filled examples tell the same continuous story — an MFA feature from Epic to Post-Mortem — so the relationships between templates are clear.

---

## 📁 Folder Structure

```
templates/
├── jira/                   Jira ticket templates
├── meetings/               Meeting notes and post-mortem
├── scrum-ceremonies/       Sprint events and daily standup
├── engineering-docs/       PRD, Tech Spec, ADR, RFC
├── technical-ops/          Release notes and runbooks
├── kyc/                    KYC / KYB provider verification records
└── contribution/           CONTRIBUTING.md and PR template
```

---

## 🎫 [`jira/`](./jira/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [01-jira-epic.md](./jira/01-jira-epic.md) | Jira Epic | Starting a new initiative spanning multiple sprints |
| [02-jira-story.md](./jira/02-jira-story.md) | Jira Story | Writing a user-facing feature in a sprint |
| [03-jira-bug.md](./jira/03-jira-bug.md) | Jira Bug Ticket | Reporting a defect found in QA or production |
| [04-jira-task.md](./jira/04-jira-task.md) | Jira Task / Sub-task | Technical work with no direct user-facing story |

## 🤝 [`meetings/`](./meetings/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [01-meeting-notes.md](./meetings/01-meeting-notes.md) | Meeting Notes (General) | Any meeting — kickoff, design review, stakeholder sync |
| [02-one-on-one.md](./meetings/02-one-on-one.md) | 1-on-1 | Manager–IC bi-weekly check-in |
| [03-incident-postmortem.md](./meetings/03-incident-postmortem.md) | Incident Post-Mortem | Within 48h of resolving a SEV-1 or SEV-2 incident |

## 🔄 [`scrum-ceremonies/`](./scrum-ceremonies/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [02-sprint-planning.md](./scrum-ceremonies/02-sprint-planning.md) | Sprint Planning | Start of each sprint — set goal, confirm capacity, pull stories |
| [03-backlog-refinement.md](./scrum-ceremonies/03-backlog-refinement.md) | Backlog Refinement | Mid-sprint — get next sprint's stories to DoR-ready |
| [01-retrospective.md](./scrum-ceremonies/01-retrospective.md) | Sprint Retrospective | End of sprint — what went well, what didn't, action items |
| [04-sprint-review.md](./scrum-ceremonies/04-sprint-review.md) | Sprint Review / Demo | End of sprint — demo shipped stories to stakeholders |
| [05-daily-standup.md](./scrum-ceremonies/05-daily-standup.md) | Daily Standup | Every day — sync format (15 min) or async/written format |

## 📄 [`engineering-docs/`](./engineering-docs/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [01-prd.md](./engineering-docs/01-prd.md) | PRD | Proposing a new feature or product change |
| [02-tech-spec.md](./engineering-docs/02-tech-spec.md) | Technical Specification | Designing the engineering solution before building |
| [03-adr.md](./engineering-docs/03-adr.md) | ADR | Recording a significant architecture decision |
| [04-rfc.md](./engineering-docs/04-rfc.md) | RFC | Proposing a cross-team change and gathering feedback |

## 🚀 [`technical-ops/`](./technical-ops/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [01-release-notes.md](./technical-ops/01-release-notes.md) | Release Notes | Every production release — what changed, how to upgrade |
| [02-runbook.md](./technical-ops/02-runbook.md) | Runbook | On-call alert response or scheduled operational procedure |

## 🪪 [`kyc/`](./kyc/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [01-kyc-medical-provider.md](./kyc/01-kyc-medical-provider.md) | KYC — Medical Provider | Onboarding a doctor or clinician (Doctolib-style) |
| [02-kyc-property-host.md](./kyc/02-kyc-property-host.md) | KYC — Property Host | Onboarding an individual host (Airbnb-style) |
| [03-kyc-accommodation-provider.md](./kyc/03-kyc-accommodation-provider.md) | KYB — Accommodation Provider | Onboarding a hotel or accommodation business (Booking.com-style) |

## 👥 [`contribution/`](./contribution/)

| File | Template | Use When |
|:-----|:---------|:---------|
| [01-contributing.md](./contribution/01-contributing.md) | CONTRIBUTING.md | Repository setup guide, branch strategy, PR process |
| [02-pull-request.md](./contribution/02-pull-request.md) | Pull Request | Every PR — summary, checklist, test instructions |

---

## 📋 Quick Reference: Which Template for Which Situation?

```
New initiative announced
  └── engineering-docs/01-prd.md
      → engineering-docs/02-tech-spec.md
      → jira/01-jira-epic.md
      → jira/02-jira-story.md

Sprint starts
  └── scrum-ceremonies/02-sprint-planning.md
      → scrum-ceremonies/05-daily-standup.md
      → scrum-ceremonies/03-backlog-refinement.md

Sprint ends
  └── scrum-ceremonies/04-sprint-review.md
      → scrum-ceremonies/01-retrospective.md
      → technical-ops/01-release-notes.md

Bug found
  └── jira/03-jira-bug.md
      → jira/04-jira-task.md  (hotfix)
      → meetings/03-incident-postmortem.md  (if SEV-1/2)

Architecture decision needed
  └── engineering-docs/04-rfc.md  (cross-team proposal)
      → engineering-docs/03-adr.md  (record the decision)

Code ready to merge
  └── contribution/02-pull-request.md
      → contribution/01-contributing.md  (for new contributors)

Incident occurs
  └── technical-ops/02-runbook.md  (resolve it)
      → meetings/03-incident-postmortem.md  (within 48h)
```

---

## 🔗 Related Reading

- [DoR vs DoD Guide](../management/02-dor-and-dod-guide.md) — understand the quality gates every story passes through
- [AI with TDD](../productivity/02-ai-with-tdd.md) — the full DoR-to-DoD development procedure with AI
- [Fast Documentation Workflow](../productivity/01-fast-documentation-workflow.md) — how to write these docs faster with AI tools
