# 📦 Helm vs Kustomize

> **Series:** DevOps › Container Orchestration · **Level:** Intermediate · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. The YAML Sprawl Problem](#1-the-yaml-sprawl-problem)
- [2. Helm (The Package Manager)](#2-helm-the-package-manager)
- [3. Kustomize (The Overlay Engine)](#3-kustomize-the-overlay-engine)
- [4. Comparison & When to Use Which](#4-comparison-when-to-use-which)

---

## 1. The YAML Sprawl Problem

Deploying a microservice to Kubernetes requires writing a lot of YAML: a `Deployment`, a `Service`, an `Ingress`, a `ConfigMap`, and a `Secret`. 

Now imagine you have three environments: **Dev**, **Staging**, and **Prod**.
Do you copy and paste 500 lines of YAML three times? What if you need to update the Docker image tag? You would have to manually find and replace the tag across multiple files.

This is the problem **Helm** and **Kustomize** solve.

---

## 2. Helm (The Package Manager)

**Helm** is the "apt-get" or "npm" of Kubernetes. It uses **Go Templating** to turn static YAML files into dynamic blueprints called **Charts**.

You write a generic `deployment.yaml` with variables like `{{ .Values.image.tag }}`. Then, you provide a `values.yaml` file for each environment.

```yaml
# templates/deployment.yaml (The Blueprint)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-webapp
spec:
  replicas: {{ .Values.replicaCount }}
  template:
    spec:
      containers:
        - name: web
          image: "myregistry/webapp:{{ .Values.image.tag }}"
```

```yaml
# values-prod.yaml (The Production Values)
replicaCount: 5
image:
  tag: "v2.1.0"
```

To deploy to production, you run:
`helm upgrade --install my-app ./my-chart -f values-prod.yaml`

**Pros:** 
- Incredibly powerful templating (`if/else` logic, loops).
- Massive open-source ecosystem. If you want to install Redis on your cluster, you just run `helm install redis bitnami/redis`.

**Cons:** 
- Go templating can get incredibly ugly and hard to read (YAML indentation inside curly braces).
- Steep learning curve.

---

## 3. Kustomize (The Overlay Engine)

**Kustomize** takes a completely different approach. It is built entirely on the concept of **Overlays and Patching**. There is no templating language, no variables, and no curly braces. It is native to Kubernetes (you can run it with `kubectl apply -k`).

You define a `base` containing pure, standard Kubernetes YAML. Then you define `overlays` (like prod or dev) that specify how to patch or modify the base.

```yaml
# overlays/prod/kustomization.yaml
resources:
  - ../../base

# Modify the image tag and the replica count without touching the base!
images:
  - name: myregistry/webapp
    newTag: v2.1.0

patchesStrategicMerge:
  - patch-replicas.yaml
```

**Pros:** 
- 100% pure YAML. No confusing Go templates.
- Built directly into `kubectl`.
- Very easy to understand for developers.

**Cons:** 
- No logical operators (`if` this, `then` deploy that).
- Not great for distributing complex third-party software (which is why Helm dominates that space).

---

## 4. Comparison & When to Use Which

| Feature | Helm | Kustomize |
| :--- | :--- | :--- |
| **Paradigm** | Templating (Variables) | Patching (Overlays) |
| **Logic** | Supports loops and if/else | No logic, pure declarative |
| **Third-Party Apps** | The absolute standard | Very rarely used |
| **Learning Curve** | High | Low |

### Strategic Recommendation
- **Use Helm** when you are installing complex third-party applications (like Prometheus, Redis, Cert-Manager) or if your application requires wildly different configurations based on complex logic.
- **Use Kustomize** for your internal company microservices where the structure is generally static, and the only things changing between Dev and Prod are resource limits, replicas, and image tags. 
- **Hybrid Approach:** Many modern teams use Helm to generate the base YAML, and then use Kustomize to patch it for specific edge cases!

---

*← [Kubernetes Architecture](./02-kubernetes-architecture.md) · Next: [Service Meshes (Istio)](./04-service-mesh.md) →*

## Related

- [CI/CD Pipelines](../cicd-pipelines/README.md)
- [Infrastructure as Code](../infrastructure-as-code/README.md)
- [Observability & Monitoring](../observability/README.md)
