# Procedure: Commit Message Rules

**Tags:** #procedure #git #commit #conventional-commits #changelog #semver  
**Roles:** Developer · Team Lead · DevOps  
**Read Time:** ~10 min  

> A commit message is a permanent record. It is read by your future self at 2am during an incident, by the reviewer trying to understand your PR, by the automated changelog generator, and by the CI/CD system deciding whether to trigger a release. Write it for all of them.

---

## 📌 Table of Contents
- [The Golden Rule](#the-golden-rule)
- [Format](#format)
- [Part 1 — Subject Line](#part-1-subject-line)
  - [Type](#type)
  - [Scope](#scope)
  - [Description](#description)
  - [Subject Line Rules](#subject-line-rules)
- [Part 2 — Body](#part-2-body)
- [Part 3 — Footer](#part-3-footer)
- [Breaking Changes](#breaking-changes)
- [Good vs Bad — Side by Side](#good-vs-bad-side-by-side)
- [Commit Discipline — What Goes in One Commit](#commit-discipline-what-goes-in-one-commit)
- [WIP Commits and Squash Strategy](#wip-commits-and-squash-strategy)
- [Merge Strategy — Squash vs Merge vs Rebase](#merge-strategy-squash-vs-merge-vs-rebase)
- [Automated Validation — Commitlint](#automated-validation-commitlint)
- [How Commits Drive the Changelog and Semver](#how-commits-drive-the-changelog-and-semver)
- [Anti-Patterns](#anti-patterns)
- [Quick Reference Card](#quick-reference-card)
- [Related Reading](#related-reading)

---

## The Golden Rule

```
A commit message answers ONE question:
"Why was this change necessary?"

It does NOT answer:
  "What did I change?" — the diff already shows that
  "What file did I edit?" — git log --stat shows that
  "I made some changes" — useless
```

---

## Format

```
<type>(<scope>): <description>
│       │         │
│       │         └── what was done — imperative, lowercase, ≤ 72 chars total
│       └─────────── where it was done — module, service, component (optional)
└─────────────────── why category — from approved list below

[blank line]
[body — WHY this was needed, not what was changed. Optional but encouraged.]

[blank line]
[footer — Closes TICKET / BREAKING CHANGE / Co-authored-by. Optional.]
```

**The three parts are separated by blank lines. No exceptions.**

---

## Part 1 — Subject Line

### Type

The type is **required**. It must be one of:

| Type | When to Use | Changelog Section | Triggers Release? |
|:-----|:------------|:-----------------|:-----------------|
| `feat` | Adds new user-facing functionality | ✨ Features | Minor version bump |
| `fix` | Fixes a bug in existing functionality | 🐛 Bug Fixes | Patch version bump |
| `hotfix` | Urgent fix deployed directly to production | 🚨 Hotfixes | Patch version bump |
| `refactor` | Code restructure — no behavior change | — (internal) | No |
| `test` | Adds or updates tests — no production code | — (internal) | No |
| `docs` | Documentation only — README, API docs, comments | 📖 Documentation | No |
| `chore` | Build, CI, dependencies, tooling | 🔧 Maintenance | No |
| `perf` | Performance improvement — measurable, no behavior change | ⚡ Performance | Patch version bump |
| `style` | Formatting only — whitespace, semicolons, no logic change | — (internal) | No |
| `revert` | Reverts a previous commit | ⏪ Reverts | Depends on reverted type |
| `ci` | Changes to CI/CD pipeline config only | — (internal) | No |
| `build` | Changes to build system — Maven, npm, Gradle | — (internal) | No |

---

### Scope

The scope is **optional but recommended**. It names the area of the codebase affected.

```
feat(auth): ...          ← authentication module
fix(payments): ...       ← payments service
refactor(user-service):  ← user microservice
chore(deps): ...         ← dependencies
chore(ci): ...           ← CI/CD configuration
docs(api): ...           ← API documentation
test(e2e): ...           ← end-to-end tests
perf(db): ...            ← database layer
fix(auth-controller): ...← specific controller
```

**Scope naming rules:**
```
□ Lowercase
□ Hyphens if multi-word: user-service, auth-controller
□ Short — 1 to 3 words
□ Consistent across the team — agree on scope names in CONTRIBUTING.md
```

---

### Description

The description is **required**. It is the short summary of *what* was done.

```
□ Imperative mood — "add" not "added" or "adds"
□ Lowercase first letter
□ No period at the end
□ Max 72 characters including type + scope + colon + space
□ Complete the sentence: "If applied, this commit will [description]"
```

**Imperative mood test:**
```
✅ "add totp mfa enrollment endpoint"
   → If applied, this commit will add totp mfa enrollment endpoint ✓

✅ "fix null-check on mfa-secret before totp verification"
   → If applied, this commit will fix null-check... ✓

❌ "added totp mfa enrollment endpoint"     ← past tense
❌ "adding totp mfa enrollment"             ← present continuous
❌ "TOTP MFA enrollment"                   ← not a verb
❌ "fixes the bug with null mfa secret."   ← period, third person, vague
```

---

### Subject Line Rules

```
RULE 1: Total length ≤ 72 characters
  ✅  feat(auth): add totp mfa enrollment endpoint              (52 chars)
  ❌  feat(auth): add a new endpoint for totp-based multi-factor authentication enrollment for users who want to secure their account
  (too long — truncated in git log, GitHub, and most tools)

RULE 2: Imperative mood
  ✅  fix / add / remove / update / refactor / extract / rename
  ❌  fixed / added / removes / updating

RULE 3: Lowercase subject
  ✅  feat(auth): add mfa enrollment
  ❌  feat(auth): Add MFA Enrollment
  ❌  feat(auth): ADD MFA ENROLLMENT

RULE 4: No period at end
  ✅  fix(auth): return 409 when mfa-secret is null
  ❌  fix(auth): return 409 when mfa-secret is null.

RULE 5: No vague words
  ❌  fix(auth): fix bug
  ❌  chore: updates
  ❌  feat: stuff
  ❌  wip: working on it
  ❌  misc: various changes
```

---

## Part 2 — Body

The body is **optional for small changes, required for anything non-obvious**.

```
WHEN BODY IS REQUIRED:
  □ The change is not self-explanatory from the subject line
  □ There is a non-obvious technical reason for the approach chosen
  □ An alternative approach was considered and rejected
  □ The change has a side effect or a risk the reviewer should know
  □ The change references an ADR, RFC, or external constraint

WHEN BODY CAN BE OMITTED:
  □ style: fix checkstyle violations in auth-controller
  □ docs: fix typo in README
  □ test: add missing null-input test for email validator
  □ chore(deps): upgrade jackson to 2.17.0
```

**Body rules:**

```
□ Blank line between subject and body (required by git parsers)
□ Wrap lines at 72 characters
□ Explain WHY — not what the diff shows
□ Present tense is fine in body: "This uses X because Y"
□ Can reference ADRs, RFCs, issues, PRs by number
```

**Body template:**

```
<subject line>

The previous behavior was [WHAT WAS WRONG / WHAT PROBLEM EXISTED].

This change [WHAT IT DOES AND WHY THIS APPROACH WAS CHOSEN OVER ALTERNATIVES].

[If there is a trade-off or known limitation]: This approach [LIMITATION]
because [REASON]. [ALTERNATIVE] was considered but rejected because [REASON].
```

**Body examples:**

```
fix(auth): null-check mfa-secret before totp verification

The DATA-44 migration added the mfa_secret column but did not backfill
it for users enrolled before the column existed. Those users have NULL
in mfa_secret, causing a NullPointerException at login.

This adds a null check before calling .isEmpty() and throws
MfaNotConfiguredException (HTTP 409) instead of crashing with 500.
The backfill migration (AUTH-33) will run separately to permanently
fix the data gap.

Closes AUTH-31
```

```
refactor(auth): extract totp logic into dedicated mfa-service

AuthService was growing beyond a single responsibility — it handled
both password verification and TOTP validation, making it hard to
test either in isolation and causing merge conflicts on every auth change.

Extracted all TOTP logic (secret generation, QR code URI, code verification,
backup code management) into MfaService. AuthService now delegates to
MfaService after password validation. No behavior change.

Related to AUTH-5
```

---

## Part 3 — Footer

The footer is **optional** unless there is a breaking change (then it is required).

```
COMMON FOOTER LINES:

Closes AUTH-5               ← closes the Jira ticket on merge (Jira automation)
Fixes AUTH-31               ← same as Closes — alternative phrasing
Related to AUTH-33          ← references without closing
Co-authored-by: Name <email@example.com>   ← pair programming credit
Reviewed-by: Name <email@example.com>     ← optional reviewer credit
BREAKING CHANGE: <description>            ← required for breaking changes
```

**Footer rules:**

```
□ Each footer token on its own line
□ Token format: <token>: <value>  OR  <token> #<value>
□ BREAKING CHANGE must be in uppercase — it triggers a major version bump
□ Closes / Fixes must use exact Jira ticket key for automation to work
```

---

## Breaking Changes

A breaking change is any change that requires consumers of your API, library, or service to update their code or configuration. It **must** be declared explicitly — it triggers a major version bump and appears prominently in the changelog.

**How to declare a breaking change:**

```
feat(auth)!: replace session cookies with jwt tokens

Session-based authentication has been replaced with JWT (access token +
refresh token). All authenticated clients must update their login flow
to store and send the Bearer token in the Authorization header.

The old session cookie is no longer set or accepted.
Clients using the old session approach will receive HTTP 401.

BREAKING CHANGE: Session cookie authentication removed.
Clients must migrate to Bearer token authentication.
The new endpoints are documented in /docs/api/auth-migration.md

Closes AUTH-2
```

**Two ways to mark a breaking change:**

```
Method 1: Exclamation mark after type/scope (short form)
  feat(auth)!: replace session cookies with jwt tokens

Method 2: BREAKING CHANGE in footer (required for full description)
  BREAKING CHANGE: Session cookie authentication removed.
  Clients must migrate to Bearer token authentication.

Best practice: use BOTH — ! in subject + BREAKING CHANGE in footer.
```

**Semver impact:**

```
Type        Semver bump   Example
──────────  ────────────  ──────────────────────
feat!       MAJOR (1→2)   Removes or changes existing API contract
fix!        MAJOR (1→2)   Fix that changes observable behavior consumers rely on
feat        MINOR (x.1)   New backward-compatible functionality
fix / perf  PATCH (x.x.1) Backward-compatible bug fix
refactor /  none          Internal — no public API change
  test /
  chore /
  docs /
  style
```

---

## Good vs Bad — Side by Side

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  BAD                          │  GOOD                                       │
├───────────────────────────────┼─────────────────────────────────────────────┤
│  fix bug                      │  fix(auth): return 409 when mfa-secret null │
│  wip                          │  test(auth): add failing test for null mfa  │
│  updates                      │  chore(deps): upgrade googleauth to 1.5.0   │
│  adding stuff                 │  feat(auth): add backup code generation     │
│  Fixed the thing              │  fix(auth): handle expired totp window      │
│  QUICK FIX                    │  fix(auth): skip totp check if secret null  │
│  auth changes                 │  refactor(auth): extract mfa into service   │
│  more work on auth-5          │  feat(auth): add qr-code uri to enrollment  │
│  asdfjkl; (test commit)       │  test(auth): verify backup codes are hashed │
│  temp                         │  (do not commit temp work — stash it)       │
│  merge branch develop         │  (auto-generated — use squash merge)        │
│  Merge pull request #42       │  (auto-generated — use squash merge)        │
└───────────────────────────────┴─────────────────────────────────────────────┘
```

---

## Commit Discipline — What Goes in One Commit

**One commit = one logical change.** Not one file. Not one function. One *reason*.

```
✅ ONE LOGICAL CHANGE per commit:

  commit 1: test(auth): add failing tests for totp enrollment
  commit 2: feat(auth): implement totp enrollment endpoint
  commit 3: refactor(auth): extract secret encryption to helper method

  → Each commit is meaningful alone
  → Each commit can be reverted independently
  → Each commit tells a story in git log

❌ TOO MUCH in one commit:
  feat(auth): add mfa enrollment, fix null pointer, update readme,
              refactor service, add tests, upgrade dependency

  → Cannot revert one part without reverting all
  → PR reviewer cannot track what changed where
  → git bisect cannot pinpoint a regression

❌ TOO LITTLE — commits that must be read together:
  fix: line 1
  fix: line 2
  fix: oops wrong line 2
  fix: actually fix it

  → Noise in git history
  → Squash these before pushing
```

**The commit scope test:**

```
Ask: "If I revert this commit alone, does the codebase still compile
     and pass its tests?"
  Yes → good commit boundary
  No  → either split it or it's a dependency that belongs in one commit
```

---

## WIP Commits and Squash Strategy

During development, you will make "work in progress" commits that are messy. That is fine locally. The rule is: **clean up before pushing to remote.**

```
LOCAL BRANCH (private — anything goes):
  wip: started mfa enrollment
  wip: tests failing
  wip: fixed null issue
  temp: trying different approach
  revert: going back to original
  fix: finally works

BEFORE PUSHING (interactive rebase to squash):
  git rebase -i origin/develop

  In the editor, squash WIP commits into logical units:
    pick  abc1234  test(auth): add failing tests for mfa enrollment
    squash def5678  wip: started mfa enrollment
    squash 789abcd  wip: tests failing
    squash bcd0123  fix: finally works

  After rebase:
    feat(auth): add mfa enrollment with tests
    (one clean commit — or a few well-named ones)

AFTER PUSHING (remote branch — never rewrite pushed commits):
  git push --force-with-lease   ← only acceptable for your own feature branch
  NEVER force-push to develop, main, or production
```

**Interactive rebase commands:**

```
pick   p  — keep commit as-is
reword r  — keep commit but edit the message
edit   e  — stop and amend the commit
squash s  — meld into previous commit (keep both messages)
fixup  f  — meld into previous commit (discard this message)
drop   d  — remove commit entirely
```

---

## Merge Strategy — Squash vs Merge vs Rebase

How a branch lands on `develop` affects what the git history looks like.

```
SQUASH MERGE (recommended for feature branches)
  All commits from the branch squashed into ONE commit on develop.
  Branch history disappears — develop history stays clean.
  Use for: from-develop/* branches (normal feature/fix work)

  Result on develop:
    abc1234  feat(auth): add mfa enrollment endpoint  ← one clean commit
    ← all 12 WIP commits from the branch are gone

  How: GitHub PR → "Squash and merge" button
       OR: git merge --squash from-develop/auth-5-feat-mfa-enrollment

REBASE AND MERGE (for small, clean branches)
  All commits replayed onto develop one by one — no merge commit.
  Use for: branches with 1–3 already-clean commits.

  Result on develop:
    abc1234  test(auth): add failing tests for mfa enrollment
    def5678  feat(auth): implement mfa enrollment
    ← clean linear history, each commit standalone

  How: GitHub PR → "Rebase and merge" button

MERGE COMMIT (avoid for feature branches — ok for release merges)
  Creates a merge commit — preserves full branch history.
  Use for: develop → main release merges (preserves the release boundary)
  Avoid for: individual feature branches (pollutes develop history)

  Result on develop:
    abc1234  Merge branch 'from-develop/auth-5-feat-mfa-enrollment'
    ↑ noisy — reader must look inside to understand what changed
```

**Team rule:**

```
from-develop/* → develop   : Squash merge (one commit per story)
develop → main             : Merge commit (preserve release boundary)
from-production/* → prod.  : Squash merge (one commit per hotfix)
production → develop       : Merge commit (sync hotfix back)
```

---

## Automated Validation — Commitlint

Commitlint enforces the rules automatically. Configure it as a git hook so it runs on every `git commit`.

**Install:**

```bash
# npm project
npm install --save-dev @commitlint/cli @commitlint/config-conventional

# commitlint.config.js
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', [
      'feat', 'fix', 'hotfix', 'refactor', 'test',
      'docs', 'chore', 'perf', 'style', 'revert', 'ci', 'build'
    ]],
    'subject-case': [2, 'always', 'lower-case'],
    'subject-max-length': [2, 'always', 72],
    'subject-empty': [2, 'never'],
    'type-empty': [2, 'never'],
    'body-max-line-length': [2, 'always', 72],
    'footer-max-line-length': [2, 'always', 72],
  }
}
```

**Wire to git hook via Husky:**

```bash
npm install --save-dev husky
npx husky install
npx husky add .husky/commit-msg 'npx --no-install commitlint --edit "$1"'
```

**What commitlint catches:**

```bash
# ❌ Blocked by commitlint:
git commit -m "fix bug"
# ✖ subject may not be empty after type
# ✖ type must be one of: feat, fix, hotfix...

git commit -m "Fix(Auth): add enrollment"
# ✖ subject-case must be lower-case
# ✖ scope must be lower-case

git commit -m "feat(auth): add a very long subject line that exceeds seventy-two characters in total"
# ✖ subject max-length must be less than or equal to 72

# ✅ Accepted by commitlint:
git commit -m "feat(auth): add totp mfa enrollment endpoint"
```

**CI validation (GitHub Actions):**

```yaml
# .github/workflows/commitlint.yml
name: Commit Lint
on: [push, pull_request]
jobs:
  commitlint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: actions/setup-node@v4
      - run: npm ci
      - run: npx commitlint --from origin/develop --to HEAD
        # Validates every commit on the PR branch
```

---

## How Commits Drive the Changelog and Semver

When commit messages follow the convention, the changelog and version bumps can be automated.

```
COMMIT LOG:
  feat(auth): add totp mfa enrollment          → minor bump (0.x.0)
  feat(auth)!: remove session cookies          → major bump (x.0.0)
  fix(auth): return 409 for null mfa-secret    → patch bump (0.0.x)
  fix(payments): prevent double-charge         → patch bump
  chore(deps): upgrade spring-boot             → no bump
  docs(api): update mfa endpoint reference     → no bump
  refactor(auth): extract mfa-service          → no bump

AUTOMATED CHANGELOG (generated by standard-version or release-please):
  ## [3.1.0] - 2026-07-22

  ### ✨ Features
  - **auth:** add totp mfa enrollment
  - **auth:** add backup code generation
  - **auth:** add password reset via email

  ### 🐛 Bug Fixes
  - **auth:** return 409 for null mfa-secret (closes AUTH-31)
  - **payments:** prevent double-charge race condition

  ### ⚡ Performance
  - **db:** add index on users.email for login query
```

**Tools that read commit messages:**

```
standard-version       → generates CHANGELOG.md + bumps package.json version
release-please         → Google's GitHub Action for automated releases
semantic-release       → full automated publish pipeline
conventional-changelog → raw changelog generation
```

---

## Anti-Patterns

| Anti-Pattern | Why It's Dangerous | Fix |
|:-------------|:------------------|:----|
| `fix bug` | Useless in git log — what bug? in what file? | `fix(auth): return 409 when mfa-secret is null` |
| `wip` pushed to remote | WIP commits in develop history are noise forever | Squash locally before push |
| `misc changes` or `updates` | Reader has no idea what changed — must read the entire diff | One commit per logical change, descriptive subject |
| Past tense subject ("added", "fixed") | Inconsistent with git convention — reads badly in log | Imperative: "add", "fix", "remove" |
| Capital first letter or period at end | Breaks commitlint, inconsistent across team | Lowercase, no period |
| Body explains WHAT not WHY | The diff already shows what — body adds no value | Body = motivation, context, trade-offs |
| Force-pushing to `develop` / `main` | Rewrites shared history — breaks everyone's local branch | Force-push only on your own feature branch, never shared branches |
| Merge commit for every feature PR | Pollutes `develop` with merge commits — history hard to read | Use squash merge for feature branches |
| Giant commit with 20 files | Cannot bisect, cannot revert one part, impossible to review | One logical change per commit |
| No Jira ticket in footer | Changelog disconnected from requirements — no traceability | Always `Closes TICKET` or `Related to TICKET` in footer |
| BREAKING CHANGE without documentation | Consumers blindsided by breaking change | BREAKING CHANGE in footer + migration guide in body or linked doc |

---

## Quick Reference Card

```
┌──────────────────────────────────────────────────────────────────────────┐
│  COMMIT MESSAGE QUICK REFERENCE                                          │
├──────────────────────────────────────────────────────────────────────────┤
│  FORMAT                                                                  │
│    <type>(<scope>): <description>     ← subject, max 72 chars           │
│                                                                          │
│    [body — WHY, not what]             ← optional, wrap at 72 chars      │
│                                                                          │
│    [Closes TICKET / BREAKING CHANGE]  ← optional footer                 │
├──────────────────────────────────────────────────────────────────────────┤
│  TYPES                                                                   │
│    feat     new feature               hotfix   urgent prod fix           │
│    fix      bug fix                   revert   undo a commit             │
│    refactor no behavior change        perf     performance               │
│    test     tests only                style    formatting only           │
│    docs     documentation             chore    build / CI / deps         │
│    ci       CI config                 build    build system              │
├──────────────────────────────────────────────────────────────────────────┤
│  SUBJECT RULES                                                           │
│    □ Imperative mood: "add" not "added"                                 │
│    □ Lowercase first letter                                              │
│    □ No period at the end                                                │
│    □ Max 72 characters total                                             │
├──────────────────────────────────────────────────────────────────────────┤
│  BREAKING CHANGE                                                         │
│    feat(api)!: remove v1 endpoints                                       │
│    BREAKING CHANGE: v1 endpoints removed. Use v2. See migration guide.  │
├──────────────────────────────────────────────────────────────────────────┤
│  MERGE STRATEGY                                                          │
│    feature → develop    : Squash merge (clean history)                  │
│    develop → main       : Merge commit (release boundary)               │
│    hotfix  → production : Squash merge                                  │
├──────────────────────────────────────────────────────────────────────────┤
│  TOOLS                                                                   │
│    commitlint    validates on git commit (Husky hook)                   │
│    standard-version  generates CHANGELOG from commits                   │
│    release-please    automates GitHub releases                          │
└──────────────────────────────────────────────────────────────────────────┘
```

---

## Related Reading

| Resource | Why |
|:---------|:----|
| [Git Branch Strategy](./06-git-branch-strategy.md) | Branch names use the same type vocabulary as commit messages |
| [Code Review & PR Flow](./04-code-review-and-pr.md) | Reviewer checks commit message quality as part of PR review |
| [AI-Assisted Dev Workflow](../project-kickoff/03-ai-assisted-dev-workflow.md) | Where commits are made in the dev workflow |
| [Deployment Flow](./08-deployment-flow.md) | How commit types drive semantic versioning and release decisions |
| [CONTRIBUTING.md Template](../../templates/contribution/01-contributing.md) | Project-level commit convention reference for contributors |

---

*Last updated: 2026-05-18*
