# 🔄 Procedures

Visual collaboration flows showing who does what, when, and in what order — across the full software delivery lifecycle.

Each procedure includes:
- A **Mermaid swimlane diagram** (roles as lanes, steps as nodes)
- An **ASCII flow** (portable — works in any text editor, Confluence, or Slack)
- A **step-by-step responsibility table**

---

## 📁 Software Delivery

How teams plan, build, review, and ship software day to day.

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [software-delivery/01-feature-lifecycle.md](./software-delivery/01-feature-lifecycle.md) | Full Feature Lifecycle | Starting a new feature — from idea to production |
| [software-delivery/02-bug-and-incident-flow.md](./software-delivery/02-bug-and-incident-flow.md) | Bug & Incident Flow | Bug found or alert fired — triage to post-mortem |
| [software-delivery/03-sprint-ceremonies.md](./software-delivery/03-sprint-ceremonies.md) | Sprint Ceremony Flow | Each sprint — who facilitates, who prepares, who attends |
| [software-delivery/04-code-review-and-pr.md](./software-delivery/04-code-review-and-pr.md) | Code Review & PR Flow | Every PR — from branch to merged |
| [software-delivery/05-ticket-lifecycle.md](./software-delivery/05-ticket-lifecycle.md) | Ticket Lifecycle | Status ownership rules — who can move a ticket at each status |
| [software-delivery/06-git-branch-strategy.md](./software-delivery/06-git-branch-strategy.md) | Git Branch Strategy | Branch naming convention, types, 400-char limit, CI/CD integration |
| [software-delivery/07-commit-message-rules.md](./software-delivery/07-commit-message-rules.md) | Commit Message Rules | Format, types, breaking changes, squash strategy, commitlint |
| [software-delivery/08-deployment-flow.md](./software-delivery/08-deployment-flow.md) | Deployment Flow | Local → Dev → Staging → Pre-Prod → Production — gates, approvals, rollback |

---

## 🚀 Project Kickoff

Before the first sprint — turning an idea into a running, scoped project.

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [project-kickoff/01-project-setup-from-idea.md](./project-kickoff/01-project-setup-from-idea.md) | Project Setup — From Idea to First Sprint | New project — goals → business model → delivery model → MVP → tech stack → Sprint 1 |
| [project-kickoff/02-vague-client-to-mvp.md](./project-kickoff/02-vague-client-to-mvp.md) | Vague Client → Shippable MVP | Client has an idea but unclear requirements — discovery to scope freeze to launch |
| [project-kickoff/03-ai-assisted-dev-workflow.md](./project-kickoff/03-ai-assisted-dev-workflow.md) | AI-Assisted Dev Workflow | DoR → TDD → CI/CD gates → peer review → DoD — full developer procedure with AI |

---

## 🏗️ System Design

Architecture, database schema, and UI design — from blank page to documented system.

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [system-design/01-system-architecture.md](./system-design/01-system-architecture.md) | System Design & Architecture | Requirements → scale estimate → component design → data flow → scalability → security → ADR |
| [system-design/02-database-design.md](./system-design/02-database-design.md) | Database Design | Domain → ERD → normalized schema → DDL → indexes → review → zero-downtime migration |
| [system-design/03-ui-design-system-with-ai.md](./system-design/03-ui-design-system-with-ai.md) | UI Design System with AI | PRD → Claude design language → tokens → Next.js + shadcn → component library → domain pages |
| [system-design/04-ui-from-inspiration-to-production.md](./system-design/04-ui-from-inspiration-to-production.md) | UI from Inspiration to Production | PRD → Behance/Dribbble → Lovable/v0 → Claude refinement → full React theme |

---

## 💳 Payments & Revenue

How money moves — from customer card to provider bank account.

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [payments-and-revenue/01-payment-gateway.md](./payments-and-revenue/01-payment-gateway.md) | Payment Gateway | Auth → capture → webhooks → refunds → disputes → payouts → PCI-DSS |
| [payments-and-revenue/02-platform-revenue-and-provider-payout.md](./payments-and-revenue/02-platform-revenue-and-provider-payout.md) | Platform Revenue & Provider Payout | Fee models · split-at-capture vs wallet · ledger design · withdrawal flow · reconciliation |
| [payments-and-revenue/03-ad-revenue-and-creator-payout.md](./payments-and-revenue/03-ad-revenue-and-creator-payout.md) | Ad Revenue & Creator Payout | Advertiser → RTB auction → impression → AdSense wallet → international wire → ABA/Wing |

---

## 🔐 Compliance & Accounts

KYC verification, account deletion, and legal data retention.

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [compliance-and-accounts/kyc/01-kyc-provider-verification.md](./compliance-and-accounts/kyc/01-kyc-provider-verification.md) | KYC / KYB Provider Verification | Onboarding doctors, property hosts, hotels — application to active account |
| [compliance-and-accounts/01-account-deletion-and-data-retention.md](./compliance-and-accounts/01-account-deletion-and-data-retention.md) | Account Deletion & Data Retention | Deletion request → grace period → anonymisation vs hard delete → GDPR / legal retention by data type |
| [compliance-and-accounts/02-file-upload-validation-pipeline.md](./compliance-and-accounts/02-file-upload-validation-pipeline.md) | File Upload & Validation Pipeline | ClamAV virus scan · MIME magic bytes · image quality · EXIF strip · async worker scaling |

---

## 🏥 Domain Workflows

Real product flows — clinical systems, booking platforms, and marketplace operations.

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [domain-workflows/01-doctor-prescription-and-clinical-workflow.md](./domain-workflows/01-doctor-prescription-and-clinical-workflow.md) | Doctor Prescription & Clinical Workflow | Booking → vitals → SOAP notes → RCP e-prescription → pharmacy dispensing → billing → insurance |
| [domain-workflows/02-second-opinion-clinical-workflow.md](./domain-workflows/02-second-opinion-clinical-workflow.md) | Second Opinion Clinical Workflow | Patient request → record sharing consent → independent review → report → reconciliation → patient decision |
| [domain-workflows/03-short-term-rental-booking-workflow.md](./domain-workflows/03-short-term-rental-booking-workflow.md) | Short-Term Rental Booking Workflow | Search → book → check-in → checkout → review → payout — all scenarios including disputes |
| [domain-workflows/04-online-appointment-booking-o2o.md](./domain-workflows/04-online-appointment-booking-o2o.md) | Online Appointment Booking (O2O) | Search → slot lock → deposit → reminders → check-in → queue → post-visit summary → follow-up |

---

## 👥 Roles Referenced

| Role | Abbreviation | Responsibility |
|:-----|:-------------|:--------------|
| Product Owner | PO | Owns the backlog, defines business value, accepts stories |
| Product Manager | PM | Writes PRD, coordinates stakeholders, defines success metrics |
| Team Lead | TL | Technical decisions, architecture, code review, unblocks team |
| Developer | DEV | Implements stories, writes tests, raises PRs |
| QA Engineer | QA | Tests stories, writes E2E tests, signs off for release |

---

## 🔗 Related

- [Templates](../templates/README.md) — documents used at each step of these flows
- [DoR vs DoD Guide](../management/02-dor-and-dod-guide.md) — the quality gates in the feature lifecycle
- [AI with TDD](../productivity/02-ai-with-tdd.md) — the development procedure inside the feature lifecycle
