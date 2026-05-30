# Repository Structure Guide

This document explains the folder organization and naming conventions for iblogger-feeds.

---

## Directory Layout

```
iblogger-feeds/
├── README.md                     ← Overview, domain table, featured articles
├── INDEX.md                      ← Complete article index with links
├── QUICK_START.md                ← 5-minute onboarding for readers and contributors
├── STRUCTURE.md                  ← This file — repo tree and naming conventions
├── CODE_OF_CONDUCT.md            ← Community guidelines
├── LICENSE
├── .gitignore
│
├── .github/
│   ├── CONTRIBUTING.md
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── ISSUE_TEMPLATE/
│       ├── suggestion.md
│       └── discussion.md
│
├── _templates/
│   └── article-template.md       ← Base skeleton for new articles
│
└── feeds/
    ├── clean-code/               ← Code quality, architecture, patterns
    │   ├── README.md
    │   ├── design-patterns/
    │   │   ├── README.md
    │   │   ├── 01-creational-patterns.md
    │   │   ├── 02-structural-patterns.md
    │   │   ├── 03-behavioral-patterns.md
    │   │   └── 04-cheat-sheet.md
    │   ├── dsa/
    │   │   ├── README.md
    │   │   ├── 01-linear-structures.md
    │   │   ├── 02-non-linear-structures.md
    │   │   └── 03-algorithms.md
    │   ├── frontend-architecture/
    │   │   ├── README.md
    │   │   ├── code-organization/
    │   │   ├── core-architecture/
    │   │   ├── design-systems/
    │   │   ├── performance-and-security/
    │   │   └── scaling-and-builds/
    │   ├── refactoring/
    │   │   ├── README.md
    │   │   ├── 01-dirty-vs-clean-code.md
    │   │   ├── 02-the-refactoring-process.md
    │   │   ├── 03-code-smells.md
    │   │   └── 04-refactoring-techniques.md
    │   ├── software-architecture/
    │   │   ├── README.md
    │   │   ├── code-organization/
    │   │   ├── distributed-patterns/
    │   │   └── system-design/
    │   └── uncle-bob-rules/
    │       ├── README.md
    │       ├── 01-meaningful-names.md
    │       ├── 02-functions-and-methods.md
    │       ├── 03-comments-and-formatting.md
    │       ├── 04-error-handling-boundaries.md
    │       └── 05-classes-and-solid.md
    │
    ├── concepts/                 ← Mental models and cognitive frameworks
    │   ├── README.md
    │   ├── career-paths/         ← Role roadmaps and competency matrices
    │   ├── 01-confirmation-bias.md
    │   └── 02-five-whys-technique.md
    │
    ├── developer-habits/         ← Productivity, tools, and workflows
    │   ├── README.md
    │   ├── 01-fast-documentation-workflow.md
    │   ├── 02-mcp-development-guide.md
    │   └── 03-visual-communication-guide.md
    │
    ├── devops/                   ← Infrastructure, deployment, observability
    │   ├── README.md
    │   ├── fundamentals/
    │   │   └── 01-network-protocols-and-api-architectures.md
    │   ├── api-gateways/
    │   ├── cicd-pipelines/
    │   ├── container-orchestration/
    │   ├── databases/
    │   ├── error-tracking/
    │   ├── infrastructure-as-code/
    │   ├── message-brokers-integration/
    │   ├── observability/
    │   └── search-engines/
    │
    ├── management/               ← SDLC, project management, team frameworks
    │   ├── README.md
    │   ├── sdlc/
    │   │   ├── README.md
    │   │   ├── 01-what-is-sdlc.md
    │   │   ├── 02-waterfall-model.md
    │   │   ├── 03-agile-model.md
    │   │   ├── 04-spiral-model.md
    │   │   ├── 05-v-model.md
    │   │   └── 06-comparison-matrix.md
    │   ├── 01-project-management-tools.md
    │   └── 02-dor-and-dod-guide.md
    │
    ├── mental-health/            ← Burnout, well-being, resilience
    │   ├── README.md
    │   └── 01-five-signs-of-burnout.md
    │
    ├── security/                 ← Auth, DDoS, OWASP, session security
    │   ├── README.md
    │   ├── anti-spam-architecture/
    │   ├── auth-and-identity-patterns/
    │   ├── bot-protection/
    │   ├── ddos-defense/
    │   ├── file-upload-defense/
    │   ├── network-security/
    │   ├── owasp-asvs-5.0/
    │   ├── session-and-cookie-security/
    │   └── social-engineering/
    │
    ├── daily-dev/                ← Incident stories, bug reflections
    │   └── README.md
    │
    ├── trending-tech/            ← Emerging tools and frameworks
    │   └── README.md
    │
    └── science/                  ← Hard sciences and natural world
        └── biology/              ← Taxonomy and history of the 6 biological kingdoms
```

## Naming Conventions

### Files

All article files use a numeric prefix: `NN-kebab-case-name.md`

- `01-topic-name.md` — first article in a series
- `02-next-topic.md` — second, and so on

The prefix orders articles naturally in file browsers and git without relying on dates.

### Folders

Domain folders use `kebab-case`. Sub-folders within a domain group a coherent series (e.g., `software-architecture/distributed-patterns/`). Create a new sub-folder only when 3+ articles belong together — standalone topics stay at the domain root.

### README.md

Every folder has a `README.md` that serves as its index — a brief description of the topic and links to each article in the folder.

---

## Navigation

| Goal | Where to go |
|---|---|
| Browse everything | [INDEX.md](INDEX.md) |
| Understand a domain | Open the domain folder's `README.md` |
| Find something specific | GitHub search or `grep` |
| Get started fast | [QUICK_START.md](QUICK_START.md) |
