# 🔄 Procedures

Visual collaboration flows showing who does what, when, and in what order — across the full software delivery lifecycle.

Each procedure includes:
- A **Mermaid swimlane diagram** (roles as lanes, steps as nodes)
- An **ASCII flow** (portable — works in any text editor, Confluence, or Slack)
- A **step-by-step responsibility table**

> 🧭 **New to a leadership role?** Start at the **[Leadership Playbooks hub](./leadership-playbooks.md)** — first-90-days guides for ten roles (Business Owner, Product Owner, Project Manager, Engineering Manager, Team Lead, Scrum Master, QA Lead, Designer Lead, Data/Analytics Lead, and Support/CS Lead), with a "which role am I?" comparison.

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

## 🚀 Startup

Foundations, strategy, and build playbooks for starting and scaling a business. ([series overview](./startup/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [startup/foundations/01-four-foundations-of-starting-a-business.md](./startup/foundations/01-four-foundations-of-starting-a-business.md) | The Four Foundations of Starting a Business | Deciding whether/what to build — Knowledge → Skill → Credit → Problem |
| [startup/01-africa-market-expansion-architecture.md](./startup/01-africa-market-expansion-architecture.md) | Africa Market Expansion & Architecture | Strategy & architecture for expanding into African markets |
| [startup/clone/README.md](./startup/clone/README.md) | Clone Playbooks | Build-and-expand guides for marketplace & SaaS clones (Doctolib, Airbnb) |

---

## 💼 Business Owner Leadership

Stepping into a business/product-line owner (sponsor) role for the first time — owning the P&L, vision, budget, and outcomes. ([series overview](./business-owner/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [business-owner/01-first-90-days.md](./business-owner/01-first-90-days.md) | First 90 Days as a New Business Owner | Day 1 — own outcomes, empower the doers (strategy altitude) |
| [business-owner/02-business-and-product-assessment.md](./business-owner/02-business-and-product-assessment.md) | Business & Product Assessment | Diagnosing business/product health across 6 dimensions |
| [business-owner/03-vision-strategy-and-okrs.md](./business-owner/03-vision-strategy-and-okrs.md) | Vision, Strategy & OKRs | North-star, strategy, focus, cascading OKRs |
| [business-owner/04-budget-roi-and-investment.md](./business-owner/04-budget-roi-and-investment.md) | Budget, ROI & Investment | Business cases, ROI, build-vs-buy, portfolio bets |
| [business-owner/05-stakeholders-and-governance.md](./business-owner/05-stakeholders-and-governance.md) | Stakeholders & Governance | Senior stakeholders, decision rights, board reporting |
| [business-owner/06-empowering-delivery-and-metrics.md](./business-owner/06-empowering-delivery-and-metrics.md) | Empowering Delivery & Metrics | Delegation, business KPIs, outcomes over activity, go/no-go |

---

## 🎯 Product Owner Leadership

Stepping into a Product Owner role for the first time — owning the backlog and maximizing the value the team delivers. ([series overview](./product-owner/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [product-owner/01-first-90-days.md](./product-owner/01-first-90-days.md) | First 90 Days as a New PO | Day 1 — owner of value, not a ticket-writer |
| [product-owner/02-product-and-backlog-assessment.md](./product-owner/02-product-and-backlog-assessment.md) | Product & Backlog Assessment | Assessing product & backlog health across 6 dimensions |
| [product-owner/03-vision-and-roadmap.md](./product-owner/03-vision-and-roadmap.md) | Vision & Roadmap | Outcomes over outputs; a value-based roadmap |
| [product-owner/04-backlog-and-stories.md](./product-owner/04-backlog-and-stories.md) | Backlog & Stories | User stories, INVEST, acceptance criteria, refinement |
| [product-owner/05-prioritization-and-value.md](./product-owner/05-prioritization-and-value.md) | Prioritization & Value | Value vs effort, MoSCoW, WSJF, RICE, saying no |
| [product-owner/06-stakeholders-and-collaboration.md](./product-owner/06-stakeholders-and-collaboration.md) | Stakeholders & Collaboration | Customer alignment, team availability, accepting work |

---

## 🧪 QA Leadership

Stepping into a QA Lead role for the first time, in a new workspace — onboarding plus the QA process you build. ([series overview](./qa-leadership/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [qa-leadership/01-first-90-days.md](./qa-leadership/01-first-90-days.md) | First 90 Days as a New QA Lead | Day 1 — Listen → Assess → Plan → Execute roadmap |
| [qa-leadership/02-qa-assessment.md](./qa-leadership/02-qa-assessment.md) | QA State Assessment | Auditing the existing QA setup across 6 dimensions |
| [qa-leadership/03-test-strategy.md](./qa-leadership/03-test-strategy.md) | Building the Test Strategy | The team's source of truth for how you test |
| [qa-leadership/04-bug-lifecycle-and-triage.md](./qa-leadership/04-bug-lifecycle-and-triage.md) | Bug Lifecycle & Triage | The everyday defect process the QA Lead owns |
| [qa-leadership/05-release-signoff.md](./qa-leadership/05-release-signoff.md) | Release Sign-Off & QA Gate | Every release — the objective Go/No-Go gate |
| [qa-leadership/06-team-and-cadence.md](./qa-leadership/06-team-and-cadence.md) | Team, Cadence & Metrics | Rhythm, 1-on-1s, metrics, growing the team |

---

## 📋 PM Leadership

Stepping into a Project Manager role (Agile/delivery) for the first time, in a new workspace — onboarding plus the delivery process you run. ([series overview](./pm-leadership/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [pm-leadership/01-first-90-days.md](./pm-leadership/01-first-90-days.md) | First 90 Days as a New PM | Day 1 — Listen → Assess → Plan → Execute roadmap |
| [pm-leadership/02-delivery-assessment.md](./pm-leadership/02-delivery-assessment.md) | Delivery Health Assessment | Auditing delivery across 6 dimensions |
| [pm-leadership/03-planning-and-estimation.md](./pm-leadership/03-planning-and-estimation.md) | Planning & Estimation | Roadmap, sizing, capacity, forecasting with ranges |
| [pm-leadership/04-cadence-and-execution.md](./pm-leadership/04-cadence-and-execution.md) | Cadence & Execution | Ceremonies, flow health, clearing blockers |
| [pm-leadership/05-stakeholders-and-reporting.md](./pm-leadership/05-stakeholders-and-reporting.md) | Stakeholders & Reporting | Stakeholder mapping, status reports, bad news |
| [pm-leadership/06-risk-issues-and-change.md](./pm-leadership/06-risk-issues-and-change.md) | Risk, Issues & Change | Keeping surprises off the table; scope control |

---

## 🛠️ Team Lead Leadership

Stepping into a Team Lead / Tech Lead role for the first time — onboarding plus the technical direction you set. ([series overview](./team-lead/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [team-lead/01-first-90-days.md](./team-lead/01-first-90-days.md) | First 90 Days as a New Team Lead | Day 1 — the doer → multiplier shift, Listen→Assess→Plan→Execute |
| [team-lead/02-technical-assessment.md](./team-lead/02-technical-assessment.md) | Technical Health Assessment | Auditing the codebase & engineering health across 6 dimensions |
| [team-lead/03-technical-direction.md](./team-lead/03-technical-direction.md) | Setting Technical Direction | Standards, ADRs, tech-debt strategy, delivery vs quality |
| [team-lead/04-code-review-and-quality.md](./team-lead/04-code-review-and-quality.md) | Code Review & Quality | Owning the quality bar without becoming the bottleneck |
| [team-lead/05-mentoring-and-growth.md](./team-lead/05-mentoring-and-growth.md) | Mentoring & Growth | 1-on-1s, delegation, pairing, growing engineers |
| [team-lead/06-delivery-and-collaboration.md](./team-lead/06-delivery-and-collaboration.md) | Delivery & Collaboration | Working with PM/QA/PO, unblocking, representing the team |

---

## 👥 Engineering Manager Leadership

Stepping into an Engineering Manager role for the first time — onboarding plus the people-leadership craft. ([series overview](./engineering-manager/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [engineering-manager/01-first-90-days.md](./engineering-manager/01-first-90-days.md) | First 90 Days as a New EM | Day 1 — the build-software → build-team shift |
| [engineering-manager/02-team-health-assessment.md](./engineering-manager/02-team-health-assessment.md) | Team Health Assessment | Diagnosing team health across 6 dimensions |
| [engineering-manager/03-one-on-ones-and-feedback.md](./engineering-manager/03-one-on-ones-and-feedback.md) | 1-on-1s & Feedback | The core EM craft — trust, SBI feedback, hard conversations |
| [engineering-manager/04-performance-and-growth.md](./engineering-manager/04-performance-and-growth.md) | Performance & Growth | Career ladders, expectations, humane performance management |
| [engineering-manager/05-hiring-and-team-building.md](./engineering-manager/05-hiring-and-team-building.md) | Hiring & Team Building | Hire-vs-grow, fair interview loops, onboarding |
| [engineering-manager/06-delivery-and-stakeholders.md](./engineering-manager/06-delivery-and-stakeholders.md) | Delivery & Stakeholders | Accountability without micromanaging; team-health metrics |

---

## 🔄 Scrum Master Leadership

Stepping into a Scrum Master role for the first time — servant-leadership onboarding plus the facilitation craft. ([series overview](./scrum-master/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [scrum-master/01-first-90-days.md](./scrum-master/01-first-90-days.md) | First 90 Days as a New SM | Day 1 — servant-leadership mindset, SM vs PM vs Team Lead |
| [scrum-master/02-agile-maturity-assessment.md](./scrum-master/02-agile-maturity-assessment.md) | Agile Maturity Assessment | Assessing the team's agile maturity across 6 dimensions |
| [scrum-master/03-facilitating-ceremonies.md](./scrum-master/03-facilitating-ceremonies.md) | Facilitating Ceremonies | Facilitate vs run — technique for each Scrum event |
| [scrum-master/04-removing-impediments.md](./scrum-master/04-removing-impediments.md) | Removing Impediments | Surface, track, escalate; the impediment log |
| [scrum-master/05-coaching-and-team-health.md](./scrum-master/05-coaching-and-team-health.md) | Coaching & Team Health | Coaching stances, psychological safety, retros that change things |
| [scrum-master/06-metrics-and-continuous-improvement.md](./scrum-master/06-metrics-and-continuous-improvement.md) | Metrics & Continuous Improvement | Healthy metrics for improvement, not judgment; kaizen |

---

## 🎨 Designer Lead Leadership

Stepping into a Designer Lead role for the first time — owning design quality, the design system, and growing designers. ([series overview](./designer-lead/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [designer-lead/01-first-90-days.md](./designer-lead/01-first-90-days.md) | First 90 Days as a New Designer Lead | Day 1 — the IC-designer → multiplier shift |
| [designer-lead/02-design-assessment.md](./designer-lead/02-design-assessment.md) | Design Health Assessment | Auditing design maturity across 6 dimensions |
| [designer-lead/03-design-system-and-ops.md](./designer-lead/03-design-system-and-ops.md) | Design System & Ops | Tokens, components, governance, handoff |
| [designer-lead/04-critique-and-quality.md](./designer-lead/04-critique-and-quality.md) | Critique & Quality | Healthy critique culture without being the bottleneck |
| [designer-lead/05-research-and-user-centered.md](./designer-lead/05-research-and-user-centered.md) | Research & User-Centered | Evidence over opinion; usability; measuring impact |
| [designer-lead/06-collaboration-and-growth.md](./designer-lead/06-collaboration-and-growth.md) | Collaboration & Growth | Embedding design in delivery; mentoring designers |

---

## 📈 Data & Analytics Lead Leadership

Stepping into a Data / Analytics Lead role for the first time — making data trustworthy and actually used. ([series overview](./data-lead/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [data-lead/01-first-90-days.md](./data-lead/01-first-90-days.md) | First 90 Days as a New Data Lead | Day 1 — make data trustworthy AND used |
| [data-lead/02-data-assessment.md](./data-lead/02-data-assessment.md) | Data Health Assessment | Auditing data maturity across 6 dimensions |
| [data-lead/03-data-quality-and-governance.md](./data-lead/03-data-quality-and-governance.md) | Data Quality & Governance | Trust, data contracts, lineage, observability, access |
| [data-lead/04-metrics-and-single-source-of-truth.md](./data-lead/04-metrics-and-single-source-of-truth.md) | Metrics & Single Source of Truth | The metric layer; killing "whose number is right?" |
| [data-lead/05-experimentation-and-decisions.md](./data-lead/05-experimentation-and-decisions.md) | Experimentation & Decisions | Sound A/B testing; avoiding p-hacking; decisions |
| [data-lead/06-enablement-and-growth.md](./data-lead/06-enablement-and-growth.md) | Enablement & Growth | Self-serve analytics, data literacy, growing the team |

---

## 💬 Support & Customer Success Lead Leadership

Stepping into a Support / CS Lead role for the first time — owning customer outcomes and being the voice of the customer. ([series overview](./support-cs-lead/README.md))

| File | Procedure | When to Reference |
|:-----|:----------|:-----------------|
| [support-cs-lead/01-first-90-days.md](./support-cs-lead/01-first-90-days.md) | First 90 Days as a New Support/CS Lead | Day 1 — own customer outcomes; Support vs CS |
| [support-cs-lead/02-support-assessment.md](./support-cs-lead/02-support-assessment.md) | Support & CS Assessment | Auditing support/CS maturity across 6 dimensions |
| [support-cs-lead/03-slas-and-ticket-operations.md](./support-cs-lead/03-slas-and-ticket-operations.md) | SLAs & Ticket Operations | SLAs, priority tiers, queue & staffing, CSAT/QA |
| [support-cs-lead/04-escalation-and-feedback-loop.md](./support-cs-lead/04-escalation-and-feedback-loop.md) | Escalation & Feedback Loop | Escalation paths; turning tickets into product priorities |
| [support-cs-lead/05-retention-and-customer-success.md](./support-cs-lead/05-retention-and-customer-success.md) | Retention & Customer Success | Onboarding, health scores, churn/save plays, renewals |
| [support-cs-lead/06-knowledge-team-and-growth.md](./support-cs-lead/06-knowledge-team-and-growth.md) | Knowledge, Team & Growth | Self-service deflection, humane team care, growth |

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
| Business Owner | BO | Owns the P&L, vision, budget, ROI; the executive sponsor |
| Product Owner | PO | Owns the backlog, defines business value, accepts stories |
| Product Manager | PM | Writes PRD, coordinates stakeholders, defines success metrics |
| Project Manager | PM (Delivery) | Plans & forecasts delivery, runs cadence, clears blockers, manages risk |
| Team Lead | TL | Technical decisions, architecture, code review, unblocks team |
| Engineering Manager | EM | Hiring, performance, growth, team health; accountable for delivery |
| Scrum Master | SM | Facilitates ceremonies, removes impediments, coaches on agile |
| Developer | DEV | Implements stories, writes tests, raises PRs |
| QA Engineer | QA | Tests stories, writes E2E tests, signs off for release |
| Designer Lead | DL | Owns design system, UX quality, critique culture; grows designers |
| Data / Analytics Lead | Data | Owns data trust, the metric layer, experimentation & decision support |
| Support / CS Lead | CS | Owns SLAs, escalation, retention; the voice of the customer |
| QA Lead | QA Lead | Owns the test strategy, defect process, release gate, and QA team |

---

## 🔗 Related

- [Templates](../templates/README.md) — documents used at each step of these flows
- [DoR vs DoD Guide](../management/02-dor-and-dod-guide.md) — the quality gates in the feature lifecycle
- [AI with TDD](../productivity/02-ai-with-tdd.md) — the development procedure inside the feature lifecycle
