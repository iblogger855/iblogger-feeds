# 📈 Prometheus — Pull-Based Metrics Collection

> **Series:** Observability Engineering › Pillar 3 — Metrics · **Level:** Intermediate · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. What Is Prometheus?](#1-what-is-prometheus)
- [2. Pull vs Push Model](#2-pull-vs-push-model)
- [3. Core Architecture](#3-core-architecture)
- [4. Data Model](#4-data-model)
- [5. PromQL — The Query Language](#5-promql-the-query-language)
- [6. Alertmanager](#6-alertmanager)
- [7. Scaling: Thanos & Mimir](#7-scaling-thanos-mimir)
- [8. When to Use Prometheus](#8-when-to-use-prometheus)

---

## 1. What Is Prometheus?

**Prometheus** is an open-source **time-series database and monitoring system** originally built at **SoundCloud** and now a **CNCF graduated project**. It is the industry standard for metrics in cloud-native and Kubernetes environments.

> **Core design:** Prometheus **scrapes** (pulls) metrics from HTTP endpoints exposed by your services, rather than having services push data to a central server.

---

## 2. Pull vs Push Model

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#b71c1c', 'primaryTextColor': '#fff', 'lineColor': '#ef5350', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph LR
    classDef push fill:#b71c1c,stroke:#7f0000,color:#fff
    classDef pull fill:#1b5e20,stroke:#003300,color:#fff

    subgraph PUSH["Push Model (StatsD)"]
        S1["Service A"]:::push -->|push| C1["Central<br/>Collector"]:::push
        S2["Service B"]:::push -->|push| C1
    end

    subgraph PULL["Pull (Prometheus)"]
        P["Prometheus<br/>Server"]:::pull -->|scrape /metrics| S3["Service A<br/>:8080/metrics"]:::pull
        P -->|scrape /metrics| S4["Service B<br/>:8081/metrics"]:::pull
    end
```

| | Pull (Prometheus) | Push |
| :--- | :--- | :--- |
| **Discovery** | Prometheus finds targets via SD | Service must know collector address |
| **Failure detection** | ✅ Scrape failure = service down | Hard to distinguish "no data" from "down" |
| **Firewall** | Prometheus needs network access to targets | Simpler for ephemeral/batch jobs |
| **Short-lived jobs** | ❌ Hard (use Pushgateway) | ✅ Natural fit |

---

## 3. Core Architecture

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef svc  fill:#1b5e20,stroke:#003300,color:#fff
    classDef prom fill:#01579b,stroke:#003c8f,color:#fff
    classDef viz  fill:#e65100,stroke:#bf360c,color:#fff
    classDef alert fill:#4a148c,stroke:#6a1b9a,color:#fff

    SD["Service Discovery<br/>(Kubernetes / Consul / EC2)"]:::svc
    EX["Exporters<br/>(node, blackbox, mysql...)"]:::svc
    PG["Pushgateway<br/>(batch jobs)"]:::svc

    P["Prometheus Server<br/>(Scrape + TSDB)"]:::prom

    AM["Alertmanager"]:::alert
    GR["Grafana<br/>(Dashboards)"]:::viz

    SD -->|targets| P
    EX -->|/metrics| P
    PG -->|push| P
    P -->|firing alerts| AM
    AM -->|notify| SL["PagerDuty / Slack"]:::alert
    P -->|PromQL| GR
```

| Component | Role |
| :--- | :--- |
| **Prometheus Server** | Scrapes targets, stores TSDB, evaluates rules |
| **Exporters** | Expose `/metrics` for systems that don't natively support it |
| **Pushgateway** | Accepts push from short-lived jobs |
| **Alertmanager** | Routes, deduplicates, and silences alerts |
| **Grafana** | Visualization layer querying Prometheus via PromQL |

---

## 4. Data Model

Every metric is a **time series** identified by a metric name and a set of **labels** (key-value pairs):

```
# HELP http_requests_total Total HTTP requests served
# TYPE http_requests_total counter
http_requests_total{method="GET",  route="/api/orders", status="200"} 94857
http_requests_total{method="POST", route="/api/orders", status="201"} 12034
http_requests_total{method="POST", route="/api/orders", status="500"} 47
```

**Metric Types:**

| Type | Description | Example |
| :--- | :--- | :--- |
| `Counter` | Always increasing | `http_requests_total` |
| `Gauge` | Can go up/down | `memory_usage_bytes` |
| `Histogram` | Bucketed distribution | `request_duration_seconds` |
| `Summary` | Pre-computed quantiles | `rpc_duration_seconds` |

---

## 5. PromQL — The Query Language

PromQL is a functional query language for time series:

```promql
# 5-minute request rate (requests per second)
rate(http_requests_total[5m])

# Error rate percentage
100 * rate(http_requests_total{status=~"5.."}[5m])
  / rate(http_requests_total[5m])

# P99 latency (requires histogram metric)
histogram_quantile(0.99,
  rate(http_request_duration_seconds_bucket[5m])
)

# CPU usage across all pods in a namespace
sum by (pod) (
  rate(container_cpu_usage_seconds_total{
    namespace="production"
  }[5m])
)

# Alert: high error rate
ALERT HighErrorRate
  IF rate(http_requests_total{status=~"5.."}[5m]) > 0.1
  FOR 5m
  LABELS { severity="critical" }
  ANNOTATIONS { summary = "Error rate above 10%" }
```

---

## 6. Alertmanager

Alertmanager handles alerts **fired by Prometheus rules** and routes them to the right receivers:

```yaml
# alertmanager.yml
route:
  group_by: ['alertname', 'service']
  group_wait:      30s
  group_interval:  5m
  repeat_interval: 3h
  receiver: 'team-slack'

  routes:
    - match:
        severity: critical
      receiver: 'pagerduty-critical'
    - match:
        severity: warning
      receiver: 'team-slack'

receivers:
  - name: 'team-slack'
    slack_configs:
      - channel: '#alerts'
        api_url: 'https://hooks.slack.com/services/...'

  - name: 'pagerduty-critical'
    pagerduty_configs:
      - service_key: '<PAGERDUTY_KEY>'

inhibit_rules:
  - source_match:
      severity: 'critical'
    target_match:
      severity: 'warning'
    equal: ['alertname', 'service']
```

---

## 7. Scaling: Thanos & Mimir

Prometheus has **no native clustering or long-term storage**. For production at scale, you need one of:

| Tool | Approach | Best For |
| :--- | :--- | :--- |
| **Thanos** | Sidecar → Object Storage, Global Query View | Multi-cluster federation |
| **Grafana Mimir** | Fully distributed Prometheus-compatible TSDB | Massive scale (1B+ series) |
| **VictoriaMetrics** | Drop-in Prometheus replacement, very efficient | Cost-sensitive high-volume |

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#4a148c', 'primaryTextColor': '#fff', 'lineColor': '#9c27b0', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph LR
    classDef prom  fill:#01579b,stroke:#003c8f,color:#fff
    classDef thanos fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef store fill:#1b5e20,stroke:#003300,color:#fff

    P1["Prometheus<br/>(Cluster A)"]:::prom --> SC1["Thanos Sidecar"]:::thanos
    P2["Prometheus<br/>(Cluster B)"]:::prom --> SC2["Thanos Sidecar"]:::thanos
    SC1 --> OBJ["☁️ S3<br/>(Long-term storage)"]:::store
    SC2 --> OBJ
    OBJ --> STO["Thanos Store"]:::thanos
    SC1 --> QU["Thanos Query<br/>(Global view)"]:::thanos
    SC2 --> QU
    STO --> QU
```

---

## 8. When to Use Prometheus

| Use Case | Recommendation |
| :--- | :--- |
| Kubernetes workloads | ✅ Native integration via `kube-state-metrics` |
| Microservices metrics | ✅ Ideal pull model |
| Short-lived batch jobs | ⚠️ Use Pushgateway |
| Long-term metrics storage | ⚠️ Add Thanos / Mimir / VictoriaMetrics |
| Multi-cluster global view | ⚠️ Add Thanos Query |
| All-in-one SaaS | ❌ Consider Datadog / New Relic |

> [!TIP]
> Use the [**kube-prometheus-stack**](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) Helm chart to deploy a full production-grade Prometheus + Grafana + Alertmanager setup in minutes.

---

*← [Observability README](./README.md) · Next: [VictoriaMetrics & Thanos](./09-long-term-metrics-storage.md) →*

## Related

- [Network Protocols & API Architectures](../fundamentals/01-network-protocols-and-api-architectures.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Error Tracking](../error-tracking/README.md)
- [Enterprise Security](../../security/README.md)
