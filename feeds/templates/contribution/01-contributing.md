# Template: CONTRIBUTING.md

> **How to use:** Place this file at the root of your repository as `CONTRIBUTING.md`. GitHub automatically links to it from the "New Issue" and "New PR" screens. Customize every `[PLACEHOLDER]` section for your project. Delete sections that don't apply.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Contributing to [PROJECT NAME]

Thank you for taking the time to contribute. This guide covers everything you need to go from zero to a merged pull request.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct-1)
- [Getting Started](#getting-started-1)
- [How to Contribute](#how-to-contribute)
- [Branch Strategy](#branch-strategy-1)
- [Commit Message Convention](#commit-message-convention)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards-1)
- [Testing Requirements](#testing-requirements-1)
- [Documentation](#documentation)
- [Getting Help](#getting-help-1)

---

## Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). By participating, you agree to uphold it. Report violations to [EMAIL].

---

## Getting Started

### Prerequisites

- [TOOL + VERSION — e.g. Java 17+, Node 20+, Python 3.11+]
- [TOOL + VERSION]
- [TOOL + VERSION]

### Setup

```bash
# 1. Fork and clone
git clone https://github.com/[YOUR-USERNAME]/[REPO].git
cd [REPO]

# 2. Install dependencies
[INSTALL COMMAND — e.g. npm install / mvn install / pip install -e .]

# 3. Copy environment config
cp .env.example .env
# Edit .env — fill in required values (see .env.example comments)

# 4. Run the app
[RUN COMMAND]

# 5. Run tests
[TEST COMMAND]
```

---

## How to Contribute

### Reporting Bugs

Use the [bug report template](../jira/03-jira-bug.md). Before submitting:
1. Search existing issues — it may already be reported.
2. Confirm the bug on the latest `main` branch.
3. Include steps to reproduce, expected vs actual behavior, and environment details.

### Suggesting Features

Open a [GitHub Discussion](https://github.com/[ORG]/[REPO]/discussions) first, before opening an issue. This lets us discuss scope before work begins.

### Submitting Code

1. Check the issue is assigned to you (or self-assign it).
2. Follow the [branch strategy](#branch-strategy-1) below.
3. Follow [coding standards](#coding-standards-1).
4. Ensure all [testing requirements](#testing-requirements-1) are met.
5. Open a PR using the [PR template](./02-pull-request.md).

---

## Branch Strategy

| Branch | Purpose | Protected |
|:-------|:--------|:----------|
| `main` | Production-ready code | ✅ Yes — no direct push |
| `develop` | Integration branch | ✅ Yes — PRs only |
| `feature/[KEY]-[short-desc]` | New feature work | No |
| `fix/[KEY]-[short-desc]` | Bug fixes | No |
| `hotfix/[KEY]-[short-desc]` | Production hotfixes → branches from `main` | No |
| `chore/[short-desc]` | Tooling, deps, CI changes | No |

**Examples:**
```
feature/AUTH-5-mfa-enrollment
fix/AUTH-31-mfa-null-pointer
hotfix/AUTH-32-mfa-500-fix
chore/upgrade-spring-boot-3.3
```

---

## Commit Message Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short description>

[optional body]

[optional footer — e.g. Closes AUTH-5]
```

**Types:**

| Type | When to Use |
|:-----|:------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code change with no feature or bug change |
| `test` | Adding or updating tests |
| `docs` | Documentation only |
| `chore` | Build, CI, dependency updates |
| `perf` | Performance improvement |
| `revert` | Reverting a previous commit |

**Examples:**
```
feat(auth): add TOTP MFA enrollment endpoint

Implements QR code generation and backup code provisioning.
Secret encrypted with AES-256-GCM via EncryptionService.

Closes AUTH-5
```

```
fix(auth): null-check mfa_secret before TOTP verification

Users enrolled before v3.0.1 had null mfa_secret due to migration gap.
Returns 409 MFA_NOT_CONFIGURED instead of 500 NullPointerException.

Closes AUTH-31
```

---

## Pull Request Process

1. Ensure your branch is up to date with `develop`: `git rebase origin/develop`.
2. Fill out the PR template completely — no empty sections.
3. All CI checks must pass before requesting review.
4. Request review from **at least 1 team member** (2 for hotfixes to `main`).
5. Address all review comments — mark resolved when done.
6. Do not merge your own PR — the reviewer merges after approval.
7. Delete your branch after merge.

**PR title format:** `[KEY] Short description` — e.g. `[AUTH-5] Add TOTP MFA enrollment`

---

## Coding Standards

- **Language:** [LANGUAGE + VERSION — e.g. Java 17, TypeScript 5]
- **Style guide:** [LINK — e.g. Google Java Style / Airbnb JS / PEP 8]
- **Formatter:** [TOOL — e.g. Checkstyle / Prettier / Black] — run before commit: `[COMMAND]`
- **Linter:** [TOOL — e.g. SpotBugs / ESLint / Flake8] — CI will fail on violations
- **No TODO comments in PRs** — create a ticket instead
- **No commented-out code** — delete it; git history preserves it

---

## Testing Requirements

| Level | Requirement | Tool |
|:------|:------------|:-----|
| Unit tests | Required for all business logic | [FRAMEWORK] |
| Integration tests | Required for DB/API interactions | [FRAMEWORK] |
| Coverage threshold | ≥ [X]% — CI fails below this | [TOOL] |
| E2E tests | Required for user-facing flows (where applicable) | [TOOL] |

**Running tests locally:**
```bash
[TEST COMMAND — e.g. mvn test / npm test / pytest]
```

See [AI with TDD](../productivity/02-ai-with-tdd.md) for how we use AI to accelerate test writing.

---

## Documentation

- Update `README.md` if you change setup, configuration, or key behavior.
- Update API docs (`/docs/api/`) if you add or modify endpoints.
- Add or update Javadoc/JSDoc for all public methods.
- For significant architecture changes, write or update an [ADR](../engineering-docs/03-adr.md).

---

## Getting Help

- **Questions about the codebase:** Open a [GitHub Discussion](https://github.com/[ORG]/[REPO]/discussions).
- **Security vulnerabilities:** Email [SECURITY EMAIL] — do NOT open a public issue.
- **Real-time chat:** [SLACK / DISCORD CHANNEL]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Contributing to iblogger-auth

Thank you for taking the time to contribute. This guide covers everything you need to go from zero to a merged pull request.

---

## Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). Report violations to security@iblogger.example.com.

---

## Getting Started

### Prerequisites

- Java 17+
- Maven 3.9+
- Docker (for Testcontainers integration tests)
- PostgreSQL 15 (or use Docker Compose)

### Setup

```bash
# 1. Fork and clone
git clone https://github.com/YOUR-USERNAME/iblogger-auth.git
cd iblogger-auth

# 2. Install dependencies
mvn install -DskipTests

# 3. Copy environment config
cp .env.example .env
# Required: DATABASE_URL, JWT_SECRET, JWT_REFRESH_SECRET, ENCRYPTION_KEY

# 4. Start database
docker-compose up -d postgres

# 5. Run migrations
./mvnw flyway:migrate

# 6. Run the app
mvn spring-boot:run

# 7. Run tests
mvn test
```

---

## Branch Strategy

| Branch | Purpose | Protected |
|:-------|:--------|:----------|
| `main` | Production-ready code | ✅ Yes |
| `develop` | Integration branch | ✅ Yes |
| `feature/AUTH-X-short-desc` | Feature work | No |
| `fix/AUTH-X-short-desc` | Bug fixes | No |
| `hotfix/AUTH-X-short-desc` | Production hotfixes | No |

---

## Coding Standards

- **Java 17** — use records, switch expressions, text blocks where appropriate
- **Checkstyle:** `mvn checkstyle:check` — CI fails on violations
- **SpotBugs:** `mvn spotbugs:check` — CI fails on violations
- No TODO comments in PRs — create a Jira ticket instead
- All public methods must have Javadoc

---

## Testing Requirements

| Level | Requirement | Tool |
|:------|:------------|:-----|
| Unit tests | Required for all service and utility classes | JUnit 5 + Mockito |
| Integration tests | Required for controllers and repositories | Testcontainers + MockMvc |
| Coverage threshold | ≥ 80% line coverage — CI fails below | JaCoCo |
| E2E tests | Required for all auth user flows | Playwright (separate repo) |

```bash
mvn test                     # unit + integration
mvn verify -Pcoverage        # with JaCoCo coverage report
```

---

## Getting Help

- **Questions:** [GitHub Discussions](https://github.com/iblogger/auth/discussions)
- **Security vulnerabilities:** security@iblogger.example.com — do NOT open a public issue
- **Team chat:** #auth-squad on Slack
