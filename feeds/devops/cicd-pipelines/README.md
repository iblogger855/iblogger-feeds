# 🚀 CI/CD Pipelines & GitOps

A comprehensive series on automating the testing, building, and deployment of modern software. The goal of CI/CD is to move code from a developer's laptop to production as safely and quickly as possible.

---

## 📖 Table of Contents

- [The CI/CD Lifecycle](#the-cicd-lifecycle)
- [📚 Module Index](#module-index)
- [The CI/CD Landscape](#the-cicd-landscape)

---

## The CI/CD Lifecycle

1. **Continuous Integration (CI):** The practice of automating the merging and testing of code. When a developer opens a Pull Request, the CI server automatically builds the app and runs unit tests. If tests fail, the PR cannot be merged.
2. **Continuous Delivery (CD):** Once code is merged, the server automatically builds the production artifacts (e.g., Docker images) and uploads them to a registry.
3. **Continuous Deployment (CD):** The final step where the artifact is automatically deployed to the production environment (AWS, Kubernetes) without human intervention.

---

## 📚 Module Index

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [CI/CD Comparison Matrix](./01-cicd-comparison.md) | Reference | ~10 min | Jenkins, GitHub Actions, GitLab CI, ArgoCD |
| **02** | [Jenkins — The Enterprise Veteran](./02-jenkins.md) | Intermediate | ~10 min | Groovy, Jenkinsfiles, Plugins, Self-Hosted |
| **03** | [GitHub Actions — Modern Standard](./03-github-actions.md) | Intermediate | ~8 min | YAML workflows, Marketplace, Runners |
| **04** | [GitLab CI/CD — The Unified Platform](./04-gitlab-ci.md) | Intermediate | ~8 min | `.gitlab-ci.yml`, Auto DevOps, Runners |
| **05** | [GitOps (ArgoCD & Flux)](./05-gitops-argocd.md) | Advanced | ~10 min | Pull vs Push, Kubernetes declarative state |

---

## The CI/CD Landscape

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#4a148c', 'primaryTextColor': '#fff', 'lineColor': '#9c27b0', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef self fill:#b71c1c,stroke:#7f0000,color:#fff
    classDef saas fill:#01579b,stroke:#003c8f,color:#fff
    classDef gitops fill:#1b5e20,stroke:#003300,color:#fff

    subgraph TRAD["Traditional Push-Based CI/CD"]
        JEN["Jenkins<br/>(Self-Hosted,<br/>Plugin Heavy)"]:::self
        GHA["GitHub Actions<br/>(SaaS, Modern)"]:::saas
        GL["GitLab CI/CD<br/>(Unified Platform)"]:::saas
        CIR["CircleCI<br/>(Fast, Premium)"]:::saas
    end

    subgraph GITOPS["Modern Pull-Based (GitOps)"]
        ARGO["ArgoCD<br/>(Kubernetes Native)"]:::gitops
        FLUX["FluxCD<br/>(Kubernetes Native)"]:::gitops
    end
```
