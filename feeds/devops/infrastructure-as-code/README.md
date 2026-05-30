# 🏗️ Infrastructure as Code (IaC)

A comprehensive series exploring how to provision, manage, and version-control cloud infrastructure using code rather than clicking through web consoles.

---

## 📖 Table of Contents

- [What Is Infrastructure as Code?](#what-is-infrastructure-as-code)
- [📚 Module Index](#module-index)
- [The IaC Landscape](#the-iac-landscape)

---

## What Is Infrastructure as Code?

Infrastructure as Code (IaC) is the practice of managing and provisioning computing data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools (like the AWS Web Console).

**Why use IaC?**
1. **Reproducibility:** You can destroy an entire environment and recreate an identical one from scratch in minutes.
2. **Version Control:** Infrastructure changes go through the same Git pull-request review process as application code.
3. **Drift Detection:** Tools can detect if someone manually changed a setting in the cloud console that deviates from the code.

---

## 📚 Module Index

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [IaC Comparison Matrix](./01-iac-comparison.md) | Reference | ~12 min | Terraform, OpenTofu, Pulumi, CloudFormation, Ansible |
| **02** | [Terraform & OpenTofu](./02-terraform-opentofu.md) | Intermediate | ~10 min | HCL, State files, Provisioning, Drift |
| **03** | [Pulumi — Code-First IaC](./03-pulumi.md) | Intermediate | ~8 min | TypeScript, Real code abstraction, vs Terraform |
| **04** | [Ansible — Configuration Mgmt](./04-ansible.md) | Intermediate | ~8 min | Agentless, Playbooks, Idempotency, Mutable |

---

## The IaC Landscape

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#4a148c', 'primaryTextColor': '#fff', 'lineColor': '#9c27b0', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef tf   fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef pul  fill:#e65100,stroke:#bf360c,color:#fff
    classDef aws  fill:#01579b,stroke:#003c8f,color:#fff
    classDef ans  fill:#1b5e20,stroke:#003300,color:#fff

    subgraph PROV["Infrastructure Provisioning"]
        TF["Terraform /<br/>OpenTofu (HCL)"]:::tf
        PUL["Pulumi<br/>(TypeScript, Python,<br/>Go)"]:::pul
        CF["AWS CloudFormation<br/>(Cloud-Specific)"]:::aws
    end

    subgraph CONF["Configuration Management"]
        ANS["Ansible / Chef<br/>(Server<br/>Configuration)"]:::ans
    end
```
