# ☁️ DevOps & Infrastructure

Practical blueprints, deployment strategies, and architectural insights for scaling servers, managing traffic, and building resilient developer operations.

---

## 📖 Foundational Guides

| Date | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| 2026-05-17 | [Network Protocols & API Architectures: A Comprehensive Guide](./fundamentals/01-network-protocols-and-api-architectures.md) | Advanced | ~15 min | REST, SOAP, GraphQL, gRPC, WebSockets, SSE, MQTT, HTTP/3, WebRTC |

---

## 🗂️ Series & Modules

### 📡 Fundamentals (`fundamentals/`)

Core concepts and foundational guides for DevOps and infrastructure.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [Network Protocols & API Architectures](./fundamentals/01-network-protocols-and-api-architectures.md) | Advanced | ~15 min | REST, SOAP, GraphQL, gRPC, WebSockets, SSE, MQTT, HTTP/3, WebRTC |

### 🚦 API Gateways & Reverse Proxies (`api-gateways/`)

A comprehensive 8-part engineering series exploring modern routing, gateway platforms, cloud management, and reverse proxy selections.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [NGINX & Apache Reverse Proxy](./api-gateways/01-nginx-and-apache.md) | Intermediate | ~10 min | Process vs Thread model, static files, configurations |
| **02** | [Kong & Gravitee Enterprise Gateways](./api-gateways/02-kong-and-gravitee.md) | Advanced | ~12 min | Plugin ecosystems, Lua vs Java, database backends |
| **03** | [Cloudflare Edge Routing](./api-gateways/03-cloudflare-edge-routing.md) | Intermediate | ~8 min | CDN caching, WAF, Cloudflare Tunnels, edge workers |
| **04** | [Coolify Self-Hosted PaaS](./api-gateways/04-coolify.md) | Beginner | ~8 min | Independent hosting, Traefik automation, container logs |
| **05** | [HAProxy & Envoy Service Proxies](./api-gateways/05-haproxy-and-envoy.md) | Advanced | ~10 min | L4 vs L7 load balancing, service mesh, gRPC routing |
| **06** | [Traefik & Caddy Automated Proxies](./api-gateways/06-traefik-and-caddy.md) | Intermediate | ~10 min | Dynamic Docker discovery, automatic SSL, modern configuration |
| **07** | [Cloud Managed API Gateways](./api-gateways/07-cloud-managed-gateways.md) | Intermediate | ~10 min | AWS API Gateway, Azure APIM, serverless endpoints |
| **08** | [Gateway Comparison Matrix](./api-gateways/08-gateway-comparison-matrix.md) | Reference | ~8 min | Performance, cost, ease of use, feature mapping |

### 🔭 Observability Engineering (`observability/`)

A comprehensive reference library covering the four pillars of modern observability: Logging, Metrics, Tracing, and Profiling — from OpenTelemetry through to Grafana, Prometheus, Jaeger, Datadog, and beyond.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [Observability Overview](./observability/README.md) | Overview | ~5 min | All pillars, tool index |
| **01** | [OpenTelemetry — The Universal Standard](./observability/01-opentelemetry.md) | Intermediate | ~12 min | OTel SDK, Collector, traces, metrics, logs, auto-instrumentation |
| **03** | [Grafana Loki — Label-Based Logs](./observability/03-grafana-loki.md) | Intermediate | ~10 min | LogQL, LGTM stack, labels, cost comparison |
| **04** | [ELK Stack — Elasticsearch, Logstash, Kibana](./observability/04-elk-stack.md) | Advanced | ~12 min | Inverted index, EFK, Logstash pipelines, Kibana |
| **08** | [Prometheus — Pull-Based Metrics](./observability/08-prometheus.md) | Intermediate | ~10 min | PromQL, Alertmanager, exporters, Thanos/Mimir |
| **11** | [Jaeger & Tempo — Distributed Tracing](./observability/11-jaeger-and-tempo.md) | Intermediate | ~10 min | Trace context, Gantt waterfall, sampling, Zipkin |
| **15** | [Grafana — Universal Dashboard](./observability/15-grafana.md) | Intermediate | ~10 min | Data sources, panels, Explore, correlations |
| **23** | [Platform Comparison Matrix](./observability/23-platform-comparison.md) | Reference | ~10 min | Full landscape, decision guide, LGTM cost model |

### 🐛 Error Tracking & Crash Reporting (`error-tracking/`)

A dedicated series on client-side observability, UX monitoring, and exception triage.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [Error Tracking Overview](./error-tracking/README.md) | Overview | ~3 min | Concept definition, landscape |
| **01** | [Error Tracking Comparison](./error-tracking/01-error-tracking-comparison.md) | Reference | ~10 min | Sentry, Bugsnag, Rollbar, LogRocket |

### 🔎 Search Engines & Discovery (`search-engines/`)

A comprehensive guide to modern search infrastructure, from managed SaaS to self-hosted engines.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [Search Engines Overview](./search-engines/README.md) | Overview | ~3 min | Concept definition, landscape |
| **01** | [Search Engines Comparison](./search-engines/01-search-engines-comparison.md) | Reference | ~10 min | Algolia, Meilisearch, Typesense, Elasticsearch |

### 🏗️ Infrastructure as Code (`infrastructure-as-code/`)

A dedicated series on provisioning, managing, and versioning cloud resources using declarative code.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [IaC Overview](./infrastructure-as-code/README.md) | Overview | ~3 min | Concept definition, landscape |
| **01** | [IaC Comparison Matrix](./infrastructure-as-code/01-iac-comparison.md) | Reference | ~12 min | Terraform, OpenTofu, Pulumi, CloudFormation, Ansible |

### 🗄️ Database Architecture & Types (`databases/`)

A comprehensive series exploring the modern database landscape, polyglot persistence, and specialized data stores.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [Databases Overview](./databases/README.md) | Overview | ~3 min | Polyglot persistence, database landscape |
| **01** | [Database Comparison Matrix](./databases/01-databases-comparison.md) | Reference | ~10 min | CAP Theorem, Use Cases, Decision Guide |

### 🚀 CI/CD Pipelines & GitOps (`cicd-pipelines/`)

A comprehensive guide to continuous integration, delivery, and modern deployment strategies.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [CI/CD Overview](./cicd-pipelines/README.md) | Overview | ~3 min | Push vs Pull, lifecycle |
| **01** | [CI/CD Comparison Matrix](./cicd-pipelines/01-cicd-comparison.md) | Reference | ~10 min | Jenkins, GitHub Actions, GitLab CI, ArgoCD |

### 🐳 Container Orchestration (`container-orchestration/`)

A deep dive into cloud-native infrastructure, from standardizing environments with Docker to scheduling and scaling with Kubernetes.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [Containers Overview](./container-orchestration/README.md) | Overview | ~3 min | Virtual Machines vs Containers |
| **01** | [Docker & Container Runtimes](./container-orchestration/01-containers-docker.md) | Intermediate | ~10 min | Docker, Podman, Containerd, cgroups |
| **02** | [Kubernetes Architecture](./container-orchestration/02-kubernetes-architecture.md) | Advanced | ~12 min | Control Plane, Kubelet, Pods, Deployments |
| **03** | [Helm vs Kustomize](./container-orchestration/03-helm-vs-kustomize.md) | Intermediate | ~10 min | Kubernetes package managers, templating |
| **04** | [Service Meshes (Istio)](./container-orchestration/04-service-mesh.md) | Advanced | ~10 min | mTLS, Traffic splitting, Sidecars |

### 📨 Message Brokers & Integration (`message-brokers-integration/`)

A deep dive into how distributed systems communicate securely and asynchronously.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **README** | [Integration Overview](./message-brokers-integration/README.md) | Overview | ~3 min | Synchronous vs Asynchronous |
| **01** | [Enterprise Integration (Camel)](./message-brokers-integration/01-enterprise-integration-camel.md) | Advanced | ~10 min | EIPs, ESBs, Camel vs MuleSoft |
| **02** | [Message Queues (RabbitMQ)](./message-brokers-integration/02-message-queues-rabbitmq.md) | Intermediate | ~10 min | AMQP, Push Model, Queues |
| **03** | [Event Streaming (Kafka)](./message-brokers-integration/03-event-streaming-kafka.md) | Advanced | ~12 min | Immutable Logs, Pull Model, Event Sourcing |

---

## 📚 Topics Covered in This Category

- **API Gateways & Reverse Proxies** - Routing, load balancing, SSL termination, and caching
- **CI/CD Pipelines** - Automated testing, build configurations, and progressive delivery
- **Cloud Infrastructure** - AWS, GCP, Azure, serverless patterns, and container orchestration
- **Observability** - Logging, distributed tracing, metrics, and incident recovery

---

## 🎯 Quick Navigation

- [All Articles](../README.md#-quick-links-by-category)
- [Browse by Category](../../INDEX.md)
- [Contributing](../../.github/CONTRIBUTING.md)

---

*Last updated: 2026-05-16*
