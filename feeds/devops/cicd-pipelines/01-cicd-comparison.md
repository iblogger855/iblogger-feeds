# 🔄 CI/CD Tool Comparison Matrix

> **Series:** DevOps › CI/CD Pipelines · **Level:** Reference · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. The Evolution of CI/CD](#1-the-evolution-of-cicd)
- [2. Feature Comparison Matrix](#2-feature-comparison-matrix)
- [3. Decision Guide](#3-decision-guide)

---

## 1. The Evolution of CI/CD

1. **Generation 1 (Jenkins):** Standalone automation servers. You run the server, you maintain the plugins, you write complex scripts (Groovy) to define pipelines.
2. **Generation 2 (GitHub Actions / GitLab CI):** CI/CD is integrated directly into the Git repository. Pipelines are defined in YAML. The vendor manages the servers (Runners).
3. **Generation 3 (GitOps / ArgoCD):** Instead of the CI server *pushing* code to production, an agent runs *inside* production (Kubernetes) and constantly *pulls* the desired state from Git.

---

## 2. Feature Comparison Matrix

| Feature | Jenkins | GitHub Actions | GitLab CI/CD | CircleCI | ArgoCD (GitOps) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Model** | Push | Push | Push | Push | **Pull** |
| **Hosting** | Self-Hosted | Managed SaaS / Self | Managed SaaS / Self | Managed SaaS | Self-Hosted in K8s |
| **Config Language** | Groovy (Jenkinsfile) | YAML | YAML | YAML | YAML (K8s Manifests)|
| **Plugin Ecosystem**| Massive (but brittle) | Massive (Marketplace) | Built-in features | Orbs | K8s native |
| **Primary Use Case**| Legacy / Complex jobs| Modern web apps | Enterprise platforms | Fast execution | Kubernetes deployment|
| **Cost** | Free (Pay for compute) | Free tier / Paid | Free tier / Paid | Paid (Expensive) | Free (Open Source) |

---

## 3. Decision Guide

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
flowchart TD
    classDef q    fill:#37474f,stroke:#263238,color:#fff
    classDef self fill:#b71c1c,stroke:#7f0000,color:#fff
    classDef saas fill:#01579b,stroke:#003c8f,color:#fff
    classDef k8s  fill:#1b5e20,stroke:#003300,color:#fff

    START["Where is your<br/>code<br/>hosted?"]:::q
    
    START -->|"GitHub"| GHA["✅ GitHub Actions<br/>(Default Choice)"]:::saas
    START -->|"GitLab"| GL["✅ GitLab CI/CD<br/>(Default Choice)"]:::saas
    START -->|"On-Premise / Other"| A{"Are you deploying<br/>exclusively to Kubernetes?"}:::q
    
    A -->|"Yes"| GITOPS["✅ ArgoCD / Flux<br/>(GitOps)"]:::k8s
    A -->|"No, complex legacy<br/>infrastructure"| JEN["✅ Jenkins<br/>(Ultimate Flexibility)"]:::self
```

### Strategic Recommendation
1. **The Modern Default:** Use **GitHub Actions**. If your code is on GitHub, it makes zero sense to pay for and maintain a separate CI/CD system. GitHub Actions is incredibly powerful, free for public repos, and has a massive marketplace of pre-built steps.
2. **The Unified Enterprise:** Use **GitLab CI/CD**. If you want a single pane of glass for issue tracking, code hosting, CI/CD, and security scanning, GitLab is arguably superior to GitHub.
3. **The Legacy Behemoth:** Use **Jenkins** only if you have massive, highly complex, cross-platform build requirements that cannot be expressed in simple YAML, or if you are legally required to host everything entirely offline behind a strict corporate firewall.
4. **The Kubernetes Future:** Use **ArgoCD** for deployment. You still use GitHub Actions to run your tests and build your Docker images (CI), but you use ArgoCD to actually deploy them to Kubernetes (CD).

## Related

- [Container Orchestration](../container-orchestration/README.md)
- [Infrastructure as Code](../infrastructure-as-code/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
