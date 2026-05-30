# 🐳 Container Orchestration & Cloud Native

A comprehensive series exploring how modern applications are packaged, deployed, scheduled, and scaled across distributed infrastructure.

---

## 📖 Table of Contents

- [The Container Revolution](#the-container-revolution)
- [📚 Module Index](#module-index)
- [The Cloud Native Landscape](#the-cloud-native-landscape)

---

## The Container Revolution

Before containers, deploying an application meant configuring a Virtual Machine (VM). This was slow, required gigabytes of storage (because every VM included a full Operating System), and suffered from the **"It works on my machine"** problem.

Containers solved this by packaging the application code, its dependencies, and the required system libraries into a single, portable, immutable image that runs identically on a developer's laptop and an AWS production server.

**Container Orchestration** (Kubernetes) is the system that manages *thousands* of these containers—automatically restarting them if they crash, scaling them up when traffic spikes, and load balancing traffic between them.

---

## 📚 Module Index

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [Docker & Container Runtimes](./01-containers-docker.md) | Intermediate | ~10 min | Docker, Podman, Containerd, cgroups |
| **02** | [Kubernetes Architecture](./02-kubernetes-architecture.md) | Advanced | ~12 min | Control Plane, Kubelet, Pods, Deployments |
| **03** | [Helm vs Kustomize](./03-helm-vs-kustomize.md) | Intermediate | ~10 min | Kubernetes package managers, templating |
| **04** | [Service Meshes (Istio)](./04-service-mesh.md) | Advanced | ~10 min | mTLS, Traffic splitting, Sidecars |

---

## The Cloud Native Landscape

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef runtime fill:#01579b,stroke:#003c8f,color:#fff
    classDef k8s fill:#1b5e20,stroke:#003300,color:#fff
    classDef tool fill:#4a148c,stroke:#6a1b9a,color:#fff

    subgraph RUN["1. Runtimes & Engines"]
        DOC["Docker / Podman<br/>(Build & Run)"]:::runtime
        CRI["Containerd / CRI-O<br/>(Server Runtime)"]:::runtime
    end

    subgraph ORCH["2. Orchestration"]
        K8S["Kubernetes<br/>(The OS of<br/>the Cloud)"]:::k8s
    end

    subgraph EXT["3. Extensions"]
        HELM["Helm / Kustomize<br/>(Package Managers)"]:::tool
        MESH["Istio / Linkerd<br/>(Service Mesh)"]:::tool
    end

    RUN -->|"Images deployed to"| ORCH
    EXT -->|"Enhances & Manages"| ORCH
```
