# Procedure: Git Branch Strategy & Naming Convention

**Tags:** #procedure #git #branch #naming #convention #workflow  
**Roles:** Developer · Team Lead · DevOps  
**Read Time:** ~8 min  

> This procedure defines the exact branch structure, naming format, allowed types, and rules for every branch in the repository. Consistent naming makes CI/CD automation, code review, and audit trails reliable. One wrong branch name breaks automation and confuses the team.

---

## 📌 Table of Contents
- [Branch Structure Overview](#branch-structure-overview)
- [Mermaid Branch Flow](#mermaid-branch-flow)
- [ASCII Branch Tree](#ascii-branch-tree)
- [Branch Naming Format](#branch-naming-format)
- [Branch Types — Full List](#branch-types-full-list)
- [Naming Rules](#naming-rules)
- [Examples — Valid and Invalid](#examples-valid-and-invalid)
- [Protected Branches](#protected-branches)
- [Branch Lifecycle — Create to Delete](#branch-lifecycle-create-to-delete)
- [Commit Message Convention](#commit-message-convention)
- [Git Commands Quick Reference](#git-commands-quick-reference)
- [CI/CD Integration](#cicd-integration)
- [Anti-Patterns](#anti-patterns)
- [Related Reading](#related-reading)

---

## Branch Structure Overview

```
main
  │
  ├── develop
  │     └── from-develop/[jira-ticket]-[type]-[short-description]
  │         (all feature, fix, refactor, test, chore, docs branches)
  │
  └── production  (mirrors main — used only for hotfix branches)
        └── from-production/[jira-ticket]-[type]-[short-description]
            (hotfix branches only — urgent fixes straight to production)
```

| Branch | Source | Merges Into | Protected | Who Creates |
|:-------|:-------|:------------|:----------|:------------|
| `main` | — | — | ✅ Yes | Repository default |
| `develop` | `main` | `main` (via release) | ✅ Yes | DevOps / TL on project init |
| `production` | `main` | — | ✅ Yes | DevOps / TL on project init |
| `from-develop/...` | `develop` | `develop` | No | Developer |
| `from-production/...` | `production` | `production` + `develop` | No | Developer (TL approval) |

---

## Mermaid Branch Flow

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#1b5e20', 'primaryBorderColor': '#003300', 'primaryTextColor': '#ffffff', 'lineColor': '#66bb6a', 'secondaryColor': '#1a237e', 'tertiaryColor': '#4a148c', 'background': '#1e1e1e', 'mainBkg': '#1b5e20', 'nodeBorder': '#003300', 'clusterBkg': '#263238', 'titleColor': '#ffffff', 'edgeLabelBackground': '#263238'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; } .edgeLabel rect { fill: #1e1e1e !important; }'
}}%%
gitGraph
   commit id: "initial"
   branch develop
   checkout develop
   commit id: "dev-base"

   branch from-develop/auth-5-feat-mfa-enrollment
   checkout from-develop/auth-5-feat-mfa-enrollment
   commit id: "write tests"
   commit id: "implement"
   commit id: "refactor"
   checkout develop
   merge from-develop/auth-5-feat-mfa-enrollment id: "PR merged"

   branch from-develop/auth-31-fix-mfa-null-pointer
   checkout from-develop/auth-31-fix-mfa-null-pointer
   commit id: "null check fix"
   checkout develop
   merge from-develop/auth-31-fix-mfa-null-pointer id: "hotfix merged to dev"

   checkout main
   merge develop id: "release v3.1.0"

   branch production
   checkout production
   merge main id: "production sync"

   branch from-production/auth-32-fix-mfa-500-crash
   checkout from-production/auth-32-fix-mfa-500-crash
   commit id: "emergency fix"
   checkout production
   merge from-production/auth-32-fix-mfa-500-crash id: "hotfix to prod"
   checkout develop
   merge production id: "sync hotfix back"
```

---

## ASCII Branch Tree

```
GIT BRANCH STRUCTURE
════════════════════════════════════════════════════════════════════════════════

  main ─────────────────────────────────────────────────────────────► (stable)
   │                                                    ▲
   │                                              release merge
   │                                                    │
   └──► develop ──────────────────────────────────────────────────────►
              │                              ▲         ▲
              │         ┌────────────────────┘         │
              │         │ PR merged                     │ PR merged
              │         │                               │
              └──► from-develop/                   from-develop/
                   auth-5-feat-                    auth-31-fix-
                   mfa-enrollment                  mfa-null-pointer
                   (DEV works here)                (DEV works here)


  main ─────────────────────────────────────────────────────────────►
   │
   └──► production ──────────────────────────────────────────────────►
                  │                              ▲
                  │         ┌────────────────────┘
                  │         │ PR merged (hotfix — TL approval)
                  │         │
                  └──► from-production/
                       auth-32-fix-
                       mfa-500-crash
                       (hotfix — urgent)
                              │
                              └──► must also merge back to develop
                                   git checkout develop
                                   git merge production
```

---

## Branch Naming Format

```
NORMAL WORK (from develop):
  from-develop/[jira-ticket]-[type]-[short-description]

HOTFIX (from production):
  from-production/[jira-ticket]-[type]-[short-description]

Rules:
  □ All lowercase — no uppercase letters anywhere
  □ Words separated by hyphens (-) — no underscores, no spaces
  □ Total length ≤ 400 characters (including the prefix)
  □ Jira ticket number required — no ticket, no branch
  □ Type required — see full type list below
  □ Short description: 2–6 words describing what this branch does
```

### Format Breakdown

```
from-develop / auth-5 - feat - mfa-enrollment
│             │         │       │
│             │         │       └── short description (2–6 words, hyphens)
│             │         └────────── type (see list below)
│             └──────────────────── jira ticket key (lowercase)
└────────────────────────────────── prefix (from-develop or from-production)
```

---

## Branch Types — Full List

| Type | When to Use | Example |
|:-----|:------------|:--------|
| `feat` | New feature or functionality | `from-develop/auth-5-feat-mfa-enrollment` |
| `fix` | Bug fix — non-urgent, goes through normal sprint | `from-develop/auth-31-fix-mfa-null-pointer` |
| `hotfix` | Urgent production fix — use `from-production/` prefix | `from-production/auth-32-hotfix-mfa-500-crash` |
| `refactor` | Code change with no feature or behavior change | `from-develop/auth-10-refactor-auth-service-extract-methods` |
| `test` | Adding or updating tests only — no production code change | `from-develop/auth-9-test-add-e2e-login-suite` |
| `docs` | Documentation only — README, API docs, comments | `from-develop/auth-0-docs-update-mfa-api-reference` |
| `chore` | Tooling, dependencies, CI config — no production code | `from-develop/infra-12-chore-upgrade-spring-boot-3-3` |
| `perf` | Performance improvement — no behavior change | `from-develop/api-44-perf-optimize-user-query-index` |
| `style` | Code formatting only — no logic change | `from-develop/auth-20-style-fix-checkstyle-violations` |
| `revert` | Reverts a previous commit or merge | `from-develop/auth-33-revert-mfa-secret-migration` |
| `release` | Preparing a release — version bump, changelog | `from-develop/release-v3-1-0` |
| `experiment` | Spike or proof-of-concept — never merged to develop | `from-develop/spike-auth-99-experiment-webauthn-poc` |

---

## Naming Rules

### Rule 1: All lowercase

```
✅  from-develop/auth-5-feat-mfa-enrollment
❌  from-develop/AUTH-5-Feat-MFA-Enrollment
❌  from-develop/auth-5-feat-MFAEnrollment
```

### Rule 2: Hyphens only — no spaces, no underscores, no dots

```
✅  from-develop/auth-5-feat-totp-mfa-enrollment
❌  from-develop/auth_5_feat_totp_mfa_enrollment
❌  from-develop/auth 5 feat totp mfa enrollment
❌  from-develop/auth-5.feat.totp.mfa.enrollment
```

### Rule 3: Jira ticket required — lowercase

```
✅  from-develop/auth-5-feat-mfa-enrollment
✅  from-develop/infra-12-chore-upgrade-docker-base-image
❌  from-develop/feat-mfa-enrollment              ← no ticket
❌  from-develop/my-changes                       ← no ticket, no type
❌  from-develop/fix                              ← too vague
```

Ticket key format: project prefix + number, all lowercase.
`AUTH-5` → `auth-5`, `INFRA-12` → `infra-12`, `DATA-44` → `data-44`

### Rule 4: Type required — from the approved list

```
✅  from-develop/auth-5-feat-mfa-enrollment
❌  from-develop/auth-5-feature-mfa-enrollment   ← "feature" not "feat"
❌  from-develop/auth-5-bugfix-mfa-enrollment    ← "bugfix" not "fix"
❌  from-develop/auth-5-improvement-login-speed  ← "improvement" not in list
```

### Rule 5: Short description — 2 to 6 words, lowercase, hyphens

```
✅  from-develop/auth-5-feat-mfa-enrollment
✅  from-develop/auth-5-feat-add-totp-mfa-enrollment-flow
❌  from-develop/auth-5-feat-a                              ← too short
❌  from-develop/auth-5-feat-add-totp-based-multi-factor-authentication-enrollment-and-verification-flow
                                                            ← too long (use max 6 words)
```

### Rule 6: Total length ≤ 400 characters

```bash
# Check branch name length before creating
echo -n "from-develop/auth-5-feat-mfa-enrollment" | wc -c
# Output: 41  ← well within limit
```

Git itself allows branch names up to ~255 bytes, but many CI/CD systems, Jira integrations, and log tools truncate at lower limits. 400 characters is a safe ceiling.

### Rule 7: Hotfixes always use `from-production/` prefix

```
✅  from-production/auth-32-hotfix-mfa-500-crash
❌  from-develop/auth-32-hotfix-mfa-500-crash   ← hotfix must branch from production
❌  from-develop/auth-32-fix-mfa-500-crash      ← wrong prefix for urgent prod fix
```

The prefix tells CI/CD which pipeline to run. A `from-production/` branch triggers the hotfix pipeline (faster gates, deploys to production after approval). A `from-develop/` branch triggers the normal sprint pipeline.

---

## Examples — Valid and Invalid

### Valid branch names

```bash
from-develop/auth-5-feat-mfa-enrollment
from-develop/auth-6-feat-totp-verification-on-login
from-develop/auth-7-feat-password-reset-via-email
from-develop/auth-8-feat-logout-token-revocation
from-develop/auth-9-test-add-e2e-auth-suite
from-develop/auth-31-fix-mfa-null-pointer-login
from-develop/auth-33-chore-backfill-mfa-secret-migration
from-develop/auth-10-refactor-extract-totp-service
from-develop/infra-12-chore-upgrade-spring-boot-3-3
from-develop/data-44-chore-add-mfa-columns-migration
from-develop/release-v3-1-0
from-production/auth-32-hotfix-mfa-500-on-login
from-production/pay-99-hotfix-double-charge-race-condition
```

### Invalid branch names — and why

```bash
# ❌ No ticket
from-develop/feat-add-mfa
# Fix: from-develop/auth-5-feat-add-mfa

# ❌ No type
from-develop/auth-5-mfa-enrollment
# Fix: from-develop/auth-5-feat-mfa-enrollment

# ❌ Wrong type spelling
from-develop/auth-5-feature-mfa-enrollment
from-develop/auth-31-bugfix-null-pointer
# Fix: feat / fix

# ❌ Uppercase
from-develop/AUTH-5-Feat-MFA
# Fix: from-develop/auth-5-feat-mfa

# ❌ No prefix
auth-5-feat-mfa-enrollment
feature/auth-5-mfa
# Fix: from-develop/auth-5-feat-mfa-enrollment

# ❌ Underscore
from-develop/auth_5_feat_mfa_enrollment
# Fix: hyphens only

# ❌ Hotfix on wrong base
from-develop/auth-32-hotfix-mfa-crash
# Fix: from-production/auth-32-hotfix-mfa-crash

# ❌ Too vague
from-develop/auth-5-fix-bug
from-develop/auth-5-feat-changes
# Fix: describe what the branch does in 2–6 words
```

---

## Protected Branches

| Branch | Rules |
|:-------|:------|
| `main` | No direct push. PRs only. Requires TL approval. CI must pass. |
| `develop` | No direct push. PRs only. Requires peer review approval. CI must pass. |
| `production` | No direct push. PRs only. Requires TL + PO approval. CI must pass. Only `from-production/` branches merge here. |

**Enforce via GitHub / GitLab branch protection settings:**

```
main:
  □ Require pull request before merging
  □ Require approvals: 2
  □ Dismiss stale reviews when new commits are pushed
  □ Require status checks: CI pipeline (style, tests, sonar, snyk)
  □ Require branches to be up to date before merging
  □ Restrict who can push: nobody (PRs only)

develop:
  □ Require pull request before merging
  □ Require approvals: 1
  □ Require status checks: CI pipeline
  □ Require branches to be up to date before merging

production:
  □ Require pull request before merging
  □ Require approvals: 2 (TL + one other)
  □ Restrict who can push: nobody
  □ Require linear history
```

---

## Branch Lifecycle — Create to Delete

```
BRANCH LIFECYCLE
════════════════════════════════════════════════════════════════════════════════

STEP 1: PICK UP JIRA TICKET
  Ticket status: Ready → In Progress
  Note the ticket key: AUTH-5

STEP 2: CREATE BRANCH
  # Normal work — branch from develop
  git checkout develop
  git pull origin develop
  git checkout -b from-develop/auth-5-feat-mfa-enrollment

  # Hotfix — branch from production
  git checkout production
  git pull origin production
  git checkout -b from-production/auth-32-hotfix-mfa-500-crash

STEP 3: WORK ON BRANCH
  Follow TDD cycle: RED → GREEN → REFACTOR
  Commit often with meaningful messages (see commit convention below)
  Push to remote regularly (at least daily)

STEP 4: KEEP BRANCH UP TO DATE
  # Rebase onto develop before opening PR
  git fetch origin
  git rebase origin/develop
  # Resolve conflicts if any, then:
  git push --force-with-lease origin from-develop/auth-5-feat-mfa-enrollment

STEP 5: OPEN PR
  Base branch: develop (or production for hotfixes)
  Fill PR template completely
  Ensure CI is green before requesting review

STEP 6: AFTER MERGE
  # Delete local branch
  git branch -d from-develop/auth-5-feat-mfa-enrollment

  # Delete remote branch
  git push origin --delete from-develop/auth-5-feat-mfa-enrollment
  # (GitHub/GitLab can auto-delete on merge — enable this in repo settings)

STEP 7: HOTFIX — SYNC BACK TO DEVELOP
  # After hotfix is merged to production, sync back:
  git checkout develop
  git pull origin develop
  git merge origin/production
  git push origin develop
  # Or open a PR from production → develop if conflicts expected
```

---

## Commit Message Convention

> Full commit message rules, breaking changes, squash strategy, commitlint setup, and changelog automation are in [Commit Message Rules](./07-commit-message-rules.md). This section is a summary only.

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/). The format mirrors the branch type.

```
<type>(<scope>): <short description>

[optional body — explain WHY, not WHAT]

[optional footer — e.g. Closes AUTH-5]
```

### Types (same as branch types)

| Type | Commit example |
|:-----|:--------------|
| `feat` | `feat(auth): add totp mfa enrollment endpoint` |
| `fix` | `fix(auth): null-check mfa-secret before totp verification` |
| `hotfix` | `hotfix(auth): handle null mfa-secret to prevent 500 on login` |
| `refactor` | `refactor(auth): extract totp logic into dedicated mfa-service` |
| `test` | `test(auth): add e2e playwright suite for login flow` |
| `docs` | `docs(auth): update api reference for mfa endpoints` |
| `chore` | `chore(deps): upgrade spring-boot to 3.3.0` |
| `perf` | `perf(users): add index on users.email for login query` |
| `style` | `style(auth): fix checkstyle violations in auth-controller` |
| `revert` | `revert(auth): revert mfa-secret migration — data loss risk` |

### Scope

The scope is optional but recommended. It names the module, service, or area being changed.

```
feat(auth): ...       ← auth module
fix(payments): ...    ← payments service
chore(ci): ...        ← CI/CD configuration
docs(api): ...        ← API documentation
test(e2e): ...        ← end-to-end tests
```

### Rules

```
□ Subject line: max 72 characters
□ Subject line: imperative mood ("add" not "added" or "adding")
□ Subject line: lowercase — no capital first letter
□ Subject line: no period at the end
□ Body: explain WHY the change was needed, not what it does
□ Footer: reference Jira ticket — "Closes AUTH-5" or "Related to AUTH-5"
```

### Full example

```
feat(auth): add totp mfa enrollment endpoint

Users can now enroll an authenticator app as a second factor.
Enrollment generates a TOTP secret (AES-256 encrypted at rest),
produces a QR code URI, and issues 8 single-use backup codes.

The secret is encrypted via EncryptionService rather than KMS
because KMS infrastructure is not yet provisioned (see ADR-007).
KMS migration is planned for Q3 — tracked in RFC-003.

Closes AUTH-5
```

---

## Git Commands Quick Reference

```bash
# ─── CREATE ─────────────────────────────────────────────────────────────────
# Branch from develop (normal work)
git checkout develop && git pull origin develop
git checkout -b from-develop/auth-5-feat-mfa-enrollment

# Branch from production (hotfix only)
git checkout production && git pull origin production
git checkout -b from-production/auth-32-hotfix-mfa-500-crash

# ─── KEEP UP TO DATE ────────────────────────────────────────────────────────
# Rebase before PR (do this daily when develop is active)
git fetch origin
git rebase origin/develop

# If rebase has conflicts:
git status                    # see conflicted files
# resolve conflicts in each file, then:
git add <file>
git rebase --continue
git push --force-with-lease   # safe force push — fails if remote has new commits

# ─── COMMIT ─────────────────────────────────────────────────────────────────
git add src/main/java/com/example/auth/MfaService.java
git add src/test/java/com/example/auth/MfaServiceTest.java
# Never: git add .  — may include unintended files
git commit -m "feat(auth): add totp secret generation and qr code uri"

# ─── VERIFY BRANCH NAME ─────────────────────────────────────────────────────
git branch --show-current
echo -n "$(git branch --show-current)" | wc -c   # check length ≤ 400

# ─── DELETE AFTER MERGE ─────────────────────────────────────────────────────
git checkout develop
git branch -d from-develop/auth-5-feat-mfa-enrollment        # local
git push origin --delete from-develop/auth-5-feat-mfa-enrollment  # remote

# ─── HOTFIX SYNC BACK TO DEVELOP ────────────────────────────────────────────
git checkout develop
git pull origin develop
git merge origin/production
git push origin develop
```

---

## CI/CD Integration

The branch prefix drives which CI/CD pipeline runs automatically.

```
Branch prefix            CI/CD pipeline triggered
───────────────────────  ──────────────────────────────────────────────────────
from-develop/*           Full pipeline:
                           style → unit tests → integration → coverage
                           → SonarQube → Snyk → deploy to dev server

from-production/*        Hotfix pipeline (faster):
                           style → unit tests → integration → coverage
                           → SonarQube → Snyk → deploy to staging only
                           → manual trigger for production deploy

release-*                Release pipeline:
                           full pipeline + version tagging
                           + deploy to staging + notify QA

develop                  Integration pipeline:
                           runs on every merge to develop
                           → full CI gates + auto-deploy to dev server

production               Production promotion pipeline:
                           triggered manually after TL + PO approval
                           → deploy to production + smoke test
```

**GitHub Actions example — branch-based pipeline routing:**

```yaml
# .github/workflows/ci.yml
on:
  push:
    branches:
      - 'from-develop/**'
      - 'from-production/**'
      - develop
      - production

jobs:
  detect-branch-type:
    runs-on: ubuntu-latest
    outputs:
      is_hotfix: ${{ startsWith(github.ref_name, 'from-production/') }}
    steps:
      - run: echo "Branch is ${{ github.ref_name }}"

  validate-branch-name:
    runs-on: ubuntu-latest
    steps:
      - name: Enforce naming convention
        run: |
          BRANCH="${{ github.ref_name }}"
          # Skip protected branches
          if [[ "$BRANCH" == "main" || "$BRANCH" == "develop" || "$BRANCH" == "production" ]]; then
            exit 0
          fi
          # Must start with from-develop/ or from-production/
          if [[ ! "$BRANCH" =~ ^from-(develop|production)/[a-z0-9]+-[a-z0-9]+-[a-z]+-[a-z0-9-]+$ ]]; then
            echo "❌ Branch name '$BRANCH' does not match naming convention."
            echo "   Expected: from-develop/[ticket]-[type]-[description]"
            echo "   Example:  from-develop/auth-5-feat-mfa-enrollment"
            exit 1
          fi
          # Check length
          if [[ ${#BRANCH} -gt 400 ]]; then
            echo "❌ Branch name is ${#BRANCH} chars — exceeds 400 char limit."
            exit 1
          fi
          echo "✅ Branch name '$BRANCH' is valid."
```

---

## Anti-Patterns

| Anti-Pattern | Why It's Dangerous | Fix |
|:-------------|:------------------|:----|
| Branch without a Jira ticket | Cannot trace code to requirement — audit trail broken | No ticket = no branch. Create the Jira ticket first. |
| Pushing directly to `main`, `develop`, or `production` | Bypasses all review and CI gates | Branch protection enforced in GitHub/GitLab settings |
| Long-lived feature branches (> 1 sprint) | Massive merge conflicts, integration surprises | Break into smaller stories. Max branch age = 1 sprint. |
| Uppercase in branch name | Breaks CI/CD regex, filesystem issues on case-sensitive systems | Always lowercase. Pre-push hook validates. |
| Using underscore instead of hyphen | Git works, but inconsistency breaks CI regex patterns | Hyphens only. Validated by CI branch name check. |
| Forgetting to sync hotfix back to `develop` | Hotfix disappears — same bug reintroduced next sprint | Mandatory step after every `from-production/` merge. |
| Working on `develop` directly | `develop` is integration — direct commits skip peer review | Always branch from `develop`, open a PR back to `develop`. |
| Not rebasing before opening PR | Merge conflicts discovered in PR — wastes reviewer time | `git rebase origin/develop` before every PR. |
| Reusing a branch after it's merged | Stale commits, confusing history | Delete after merge. Create a new branch for new work. |
| Committing to wrong branch type | `fix` work on a `feat` branch — unclear PR scope | One branch = one Jira ticket = one type. |

---

## Related Reading

| Resource | Why |
|:---------|:----|
| [Code Review & PR Flow](./04-code-review-and-pr.md) | What happens after the branch is opened as a PR |
| [AI-Assisted Dev Workflow](../project-kickoff/03-ai-assisted-dev-workflow.md) | Full development workflow on the branch |
| [Deployment Flow](./08-deployment-flow.md) | How branches map to deployment environments |
| [Ticket Lifecycle](./05-ticket-lifecycle.md) | Jira ticket status changes that align with branch lifecycle |
| [CONTRIBUTING.md Template](../../templates/contribution/01-contributing.md) | Project-level contribution guide |
| [Pull Request Template](../../templates/contribution/02-pull-request.md) | PR description when the branch is ready for review |

---

*Last updated: 2026-05-18*
