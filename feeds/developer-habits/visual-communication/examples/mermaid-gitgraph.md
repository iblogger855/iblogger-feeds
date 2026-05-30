# Example — Mermaid `gitgraph`

> **Use when:** Documenting git workflows, branch strategies, or release processes.

**Tool:** Mermaid | **Type:** gitgraph

---

## Example: Gitflow Branching Strategy

```mermaid
%%{init: {'theme': 'dark', 'gitGraph': {'rotateCommitLabel': false}, 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'git0': '#01579b', 'git1': '#1b5e20', 'git2': '#4a148c', 'git3': '#e65100', 'git4': '#b71c1c', 'gitInv0': '#fff', 'gitInv1': '#fff', 'gitInv2': '#fff', 'gitInv3': '#fff', 'gitInv4': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
gitgraph
    commit id: "init"
    branch develop
    checkout develop
    commit id: "setup"
    branch feature/auth
    checkout feature/auth
    commit id: "add login"
    commit id: "add JWT"
    checkout develop
    merge feature/auth id: "merge auth"
    branch feature/payments
    checkout feature/payments
    commit id: "stripe setup"
    commit id: "webhook handler"
    checkout develop
    merge feature/payments id: "merge payments"
    branch release/1.0
    checkout release/1.0
    commit id: "bump version"
    commit id: "release notes"
    checkout main
    merge release/1.0 id: "v1.0.0" tag: "v1.0.0"
    checkout develop
    merge release/1.0 id: "sync develop"
    branch hotfix/auth-bug
    checkout hotfix/auth-bug
    commit id: "fix token expiry"
    checkout main
    merge hotfix/auth-bug id: "v1.0.1" tag: "v1.0.1"
    checkout develop
    merge hotfix/auth-bug id: "sync hotfix"
```

---

## Example: Trunk-Based Development

```mermaid
%%{init: {'theme': 'dark', 'gitGraph': {'rotateCommitLabel': false}, 'themeVariables': {'primaryColor': '#1b5e20', 'primaryTextColor': '#fff', 'git0': '#1b5e20', 'git1': '#01579b', 'git2': '#4a148c', 'gitInv0': '#fff', 'gitInv1': '#fff', 'gitInv2': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
gitgraph
    commit id: "feat: dark mode"
    commit id: "fix: navbar"
    branch short-lived/api-v2
    checkout short-lived/api-v2
    commit id: "api refactor"
    commit id: "add tests"
    checkout main
    merge short-lived/api-v2 id: "squash merge"
    commit id: "feat: search" tag: "deploy"
    commit id: "fix: caching" tag: "deploy"
```

---

## Key Syntax

```
gitgraph
    commit id: "label"              ← commit on current branch
    commit id: "label" tag: "v1"   ← commit with tag
    branch feature/name             ← create new branch
    checkout feature/name           ← switch to branch
    merge feature/name              ← merge into current branch
    merge feature/name id: "label" tag: "v1"
```

---

**Avoid:** Non-git branching scenarios. More than 4–5 active branches at once (becomes hard to read).
