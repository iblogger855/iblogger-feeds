# 📚 iblogger-feeds

[![Last Commit](https://img.shields.io/github/last-commit/iblogger855/iblogger-feeds)](https://github.com/iblogger855/iblogger-feeds/commits/main)
[![License](https://img.shields.io/github/license/iblogger855/iblogger-feeds)](LICENSE)
[![Articles](https://img.shields.io/badge/articles-comprehensive-blue)](INDEX.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)](https://github.com/iblogger855/iblogger-feeds/pulls)

An enterprise-grade technical reference library capturing real-world software engineering — clean code, emerging tech, reverse proxies, project management, visual security architectures, and sustainable developer habits.

---

## 🎯 Quick Navigation

| Reference File | Purpose |
| :--- | :--- |
| **[INDEX.md](INDEX.md)** | Browse all technical articles & modules by category |
| **[QUICK_START.md](QUICK_START.md)** | Onboard and get up-to-speed in under 5 minutes |
| **[STRUCTURE.md](STRUCTURE.md)** | Detailed repository layout & naming conventions |
| **[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)** | Community contribution & collaboration standards |
| **[CONTRIBUTING.md](.github/CONTRIBUTING.md)** | Step-by-step pipeline to draft, review, and merge articles |

---

## 🗂️ Knowledge Domains

| Domain / Category | Folder Link | Primary Subjects Covered |
| :--- | :--- | :--- |
| **💡 Concepts** | [feeds/concepts/](./feeds/concepts/README.md) | Cognitive biases, problem-solving, root-cause 5-whys |
| **💻 Clean Code** | [feeds/clean-code/](./feeds/clean-code/README.md) | GoF design patterns, DSA complexity, refactoring smelly code |
| **☁️ DevOps** | [feeds/devops/](./feeds/devops/README.md) | NGINX, HAProxy, Envoy load balancing, Coolify PaaS, Cloudflare |
| **🛡️ Security** | [feeds/security/](./feeds/security/README.md) | OAuth 2.1, OIDC, SAML, WebAuthn Passkeys, DDoS, ASVS 5.0 |
| **📊 Management** | [feeds/management/](./feeds/management/README.md) | Agile, Waterfall, Spiral, V-Model comparison matrices, DoR/DoD |
| **🎯 Habits** | [feeds/developer-habits/](./feeds/developer-habits/README.md) | Visual design guides, fast workflows, Model Context Protocol (MCP) |
| **🚀 Careers** | [feeds/concepts/career-paths/](./feeds/concepts/career-paths/README.md) | Professional matrices for SWE, Product Owner, QA, and Ops |
| **🧠 Well-being** | [feeds/mental-health/](./feeds/mental-health/README.md) | Chronic burnout markers, stress management, building resilience |
| **☕ Dev Stories** | [feeds/daily-dev/](./feeds/daily-dev/README.md) | Production outage post-mortems, bug hunting reflections |
| **🌐 Trending** | [feeds/trending-tech/](./feeds/trending-tech/README.md) | AI integrations, new frameworks, compiler advancements |
| **🧬 Science** | [feeds/science/](./feeds/science/biology/README.md) | Biology, taxonomy, evolution, and 6 kingdoms |

---

## 🌟 Featured Deep-Dives

Here are some of the most rigorous, highly-visual engineering guides in the library:

*   **🛡️ Enterprise Authentication:** [OAuth 2.0 & Delegated Access](./feeds/security/auth-and-identity-patterns/02-oauth2-and-delegated-access.md) — Illustrating PKCE security handshakes.
*   **💻 Architectural Principles:** [Creational, Structural & Behavioral Patterns](./feeds/clean-code/design-patterns/README.md) — 23 Gang-of-Four patterns with Java examples.
*   **☁️ Edge Engineering:** [Traefik, NGINX & Cloudflare Reverse Proxies](./feeds/devops/README.md) — Comparative matrices for high-traffic load balancers.
*   **📡 Communication Layers:** [Network Protocols & API Architectures](./feeds/devops/fundamentals/01-network-protocols-and-api-architectures.md) — Rigorous guide covering REST, SOAP, GraphQL, gRPC, and WebSockets.
*   **💡 Root-Cause Analysis:** [The 5 Whys Problem Solving Technique](./feeds/concepts/02-five-whys-technique.md) — Transitioning from surface fixes to process surgery.
*   **🗣️ Science of Communication:** [10 EQ Flaws in Conversation](./feeds/concepts/03-science-of-communication-eq-flaws.md) — Diagnosing conversational faults and psychological strategies.
*   **🎭 Pedagogical Parables:** [Psychological Parable Library](./feeds/concepts/README.md#🎭-pedagogical-parable-library-feedsconceptsparables) — 12 rich analogical narratives exploring biases, bounds, and behaviors.
*   **📊 Delivery Frameworks:** [Agile, Spiral & V-Model SDLC Matrix](./feeds/management/sdlc-05-comparison-matrix.md) — Choosing the right development lifecycle.

---

## 🚀 Repository Directory Structure

```
iblogger-feeds/
├── README.md                    ← You are here
├── INDEX.md                     ← Global index linking to all modules
├── QUICK_START.md               ← Onboarding blueprint
├── STRUCTURE.md                 ← Repo tree and naming conventions
│
├── feeds/                       ← Categorized article database
│   ├── concepts/                ← Mental models & biases
│   │   ├── career-paths/        ← Role competency matrices
│   ├── clean-code/              ← Design patterns, DSA, refactoring, architecture
│   ├── devops/                  ← Infrastructure, observability, databases, CI/CD
│   │   └── fundamentals/        ← Network protocols & API architectures
│   ├── security/                ← Auth, DDoS, OWASP, session security
│   ├── management/              ← SDLC, DoR/DoD, project tools
│   │   └── sdlc/                ← SDLC model comparison series
│   ├── developer-habits/        ← Workflows, MCP, visual communication
│   ├── mental-health/           ← Well-being & burnout prevention
│   ├── daily-dev/               ← Real developer reflections
│   ├── trending-tech/           ← AI & emerging tools
│   └── science/                 ← Hard sciences and natural world
│       └── biology/             ← Biology and 6 kingdoms
│
├── _templates/
│   └── article-template.md      ← Base markdown skeleton for new drafts
│
└── .github/
    ├── CONTRIBUTING.md          ← Branching, review, and merging rules
    └── ISSUE_TEMPLATE/          ← Bug reports & content requests
```

---

## ✍️ Contribution Workflow

We welcome contributions! To draft a new technical reference or add a code case-study, follow these steps:

```bash
# 1. Clone the repository
git clone https://github.com/iblogger855/iblogger-feeds.git
cd iblogger-feeds

# 2. Create a clean feature branch
git checkout -b article/visual-security-guide

# 3. Copy the base template to the correct category folder using the standard naming format
cp _templates/article-template.md feeds/security/auth-and-identity-patterns/12-your-topic-here.md

# 4. Draft your article (incorporating Mermaid diagrams & ELI5 sections)

# 5. Link your article to the category README.md and the global INDEX.md

# 6. Push and create a Pull Request
git add .
git commit -m "Add: Detailed Visual Guide to Topic X"
git push origin article/your-topic-here
```

Please consult [STRUCTURE.md](STRUCTURE.md) for style requirements, image embed rules, and internal cross-link naming standards.

---

*Maintained by [@iblogger855](https://github.com/iblogger855)*
