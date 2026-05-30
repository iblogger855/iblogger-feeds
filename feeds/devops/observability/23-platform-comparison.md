# 🏗️ Observability Platform Comparison Matrix

> **Series:** Observability Engineering › Unified Platforms · **Level:** Reference · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. The Full Landscape](#1-the-full-landscape)
- [2. Open-Source vs Commercial](#2-open-source-vs-commercial)
- [3. Logging Tools Matrix](#3-logging-tools-matrix)
- [4. Metrics Tools Matrix](#4-metrics-tools-matrix)
- [5. Tracing Tools Matrix](#5-tracing-tools-matrix)
- [6. Unified Platforms Matrix](#6-unified-platforms-matrix)
- [7. Decision Guide](#7-decision-guide)
- [8. The Standard LGTM Stack Diagram](#8-the-standard-lgtm-stack-diagram)

---

## 1. The Full Landscape

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef instr  fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef log    fill:#01579b,stroke:#003c8f,color:#fff
    classDef metric fill:#1b5e20,stroke:#003300,color:#fff
    classDef trace  fill:#e65100,stroke:#bf360c,color:#fff
    classDef prof   fill:#37474f,stroke:#263238,color:#fff
    classDef plat   fill:#b71c1c,stroke:#7f0000,color:#fff

    subgraph "🧩 Instrumentation"
        OTL["OpenTelemetry"]:::instr
        PRO["Prometheus Client Libs"]:::instr
        APM["APM Agents<br/>(Datadog / Elastic)"]:::instr
    end

    subgraph "📋 Logging"
        LOK["Grafana Loki"]:::log
        ELK["ELK / OpenSearch"]:::log
        GR2["Graylog"]:::log
        CLD["Cloud Logging<br/>(AWS / GCP / Azure)"]:::log
    end

    subgraph "📈 Metrics"
        PRM["Prometheus + Alertmanager"]:::metric
        VIC["VictoriaMetrics"]:::metric
        THA["Thanos / Mimir"]:::metric
    end

    subgraph "🔗 Tracing"
        JAE["Jaeger"]:::trace
        TEM["Grafana Tempo"]:::trace
        ZIP["Zipkin"]:::trace
    end

    subgraph "📊 Visualization"
        GRF["Grafana"]:::metric
        KIB["Kibana"]:::log
    end

    subgraph "🏗️ Unified Platforms"
        DDG["Datadog"]:::plat
        NRE["New Relic"]:::plat
        DYN["Dynatrace"]:::plat
        SPL["Splunk"]:::plat
        SIG["SigNoz"]:::plat
    end

    OTL --> LOK & ELK & PRM & JAE & TEM
    PRM --> GRF
    LOK --> GRF
    TEM --> GRF
    ELK --> KIB
```

---

## 2. Open-Source vs Commercial

| Dimension | Open-Source Stack | Commercial Platform |
| :--- | :--- | :--- |
| **Cost at low volume** | Very low (infra only) | Free tier / trial |
| **Cost at high volume** | Low (storage cost only) | Can be very high |
| **Setup complexity** | High | Very low |
| **Operational burden** | High | Zero |
| **Vendor lock-in** | None | Medium–High |
| **Feature depth** | High (with right tools) | Very high (integrated) |
| **AI/ML features** | Limited | Excellent |
| **Best for** | Teams with DevOps capacity | Product teams moving fast |

---

## 3. Logging Tools Matrix

| Tool | Type | Indexing | Storage | Full-Text Search | Cost | Best For |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Grafana Loki** | OSS | Labels only | Object (S3/GCS) | ⚠️ Line-based | 💚 Very low | Kubernetes / Grafana stack |
| **Elasticsearch** | OSS / Commercial | Full inverted index | Local SSD | ✅ Excellent | 🔴 High | Complex search, analytics |
| **OpenSearch** | OSS (Apache 2.0) | Full inverted index | Local SSD | ✅ Excellent | 🔴 High | Elasticsearch without licensing |
| **Graylog** | OSS + Enterprise | Full (uses ES) | Elasticsearch | ✅ Good | 🟡 Medium | Syslog / network log collection |
| **Splunk** | Commercial | Proprietary | Proprietary | ✅ Excellent | 🔴 Very high | Enterprise SIEM / compliance |
| **Datadog Logs** | SaaS | Full | Managed | ✅ Good | 🔴 High | All-in-one SaaS team |
| **AWS CloudWatch** | SaaS | Log groups/streams | AWS-managed | ⚠️ Limited | 🟡 Medium | AWS-native workloads |
| **GCP Cloud Logging** | SaaS | Managed | GCP-managed | ⚠️ Limited | 🟡 Medium | GCP-native workloads |

---

## 4. Metrics Tools Matrix

| Tool | Type | Model | Storage | Scale | PromQL | Best For |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Prometheus** | OSS | Pull | Local TSDB | Medium | ✅ Native | Kubernetes, standard choice |
| **Thanos** | OSS | Pull + Federation | Object (S3) | Large | ✅ Compatible | Multi-cluster Prometheus |
| **Grafana Mimir** | OSS | Pull | Object (S3) | Very Large | ✅ Compatible | Massive scale, low cost |
| **VictoriaMetrics** | OSS | Pull + Push | Local / Object | Very Large | ✅ Compatible | High cardinality, memory efficient |
| **InfluxDB** | OSS / Commercial | Push | Time-series DB | Medium | ❌ Flux/InfluxQL | IoT, high write throughput |
| **Datadog Metrics** | SaaS | Push | Managed | Unlimited | ❌ Datadog QL | All-in-one SaaS |
| **CloudWatch Metrics** | SaaS | Push (AWS) | AWS-managed | Large | ❌ CloudWatch QL | AWS services |

---

## 5. Tracing Tools Matrix

| Tool | Type | Storage | Search by Tags | OTel Support | Grafana Integration | Best For |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Jaeger** | OSS | ES / Cassandra / Badger | ✅ Yes | ✅ Native | ✅ Plugin | Feature-rich, independent |
| **Grafana Tempo** | OSS | Object (S3/GCS) | ⚠️ TraceQL only | ✅ Native | ✅ Native | LGTM stack, cost-efficient |
| **Zipkin** | OSS | In-memory / MySQL / ES | ✅ Yes | ⚠️ Bridge | ✅ Plugin | Legacy / simple setups |
| **Elastic APM** | OSS / Commercial | Elasticsearch | ✅ Yes | ✅ Yes | ⚠️ Plugin | All-Elastic environments |
| **Datadog APM** | SaaS | Managed | ✅ Yes | ✅ Yes | ❌ Not needed | Datadog ecosystem |
| **SigNoz** | OSS | ClickHouse | ✅ Yes | ✅ Native | ✅ Built-in | OTel-first, full-stack OSS |

---

## 6. Unified Platforms Matrix

| Platform | Type | Logs | Metrics | Traces | Profiling | AI/ML | Monthly Cost (est.) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Datadog** | SaaS | ✅ | ✅ | ✅ | ✅ | ✅ | $$$$ |
| **New Relic** | SaaS | ✅ | ✅ | ✅ | ✅ | ✅ | $$$ |
| **Dynatrace** | SaaS + On-prem | ✅ | ✅ | ✅ | ✅ | ✅✅ | $$$$ |
| **Splunk** | SaaS + On-prem | ✅ | ✅ | ✅ | ❌ | ✅ | $$$$ |
| **SigNoz** | OSS / Cloud | ✅ | ✅ | ✅ | ❌ | ❌ | $ (infra) |
| **Elastic Observability** | OSS / Cloud | ✅ | ✅ | ✅ | ❌ | ⚠️ | $$ |
| **LGTM Stack (self-hosted)** | OSS | ✅ Loki | ✅ Prometheus | ✅ Tempo | ✅ Pyroscope | ❌ | $ (infra) |

---

## 7. Decision Guide

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
flowchart TD
    classDef q    fill:#37474f,stroke:#263238,color:#fff
    classDef ans  fill:#01579b,stroke:#003c8f,color:#fff
    classDef good fill:#1b5e20,stroke:#003300,color:#fff
    classDef warn fill:#e65100,stroke:#bf360c,color:#fff

    START["Start: Choose observability<br/>stack"]:::q
    A{"Budget?"}:::q
    B{"Team has<br/>DevOps capacity?"}:::q
    C{"Need SIEM /<br/>Security analytics?"}:::q
    D{"On Kubernetes?"}:::q
    E{"Log search<br/>complexity?"}:::q

    START --> A
    A -->|"High budget,<br/>want managed"| DD["✅ Datadog / New Relic<br/>(Best all-in-one SaaS)"]:::good
    A -->|"Low budget,<br/>self-manage"| B
    B -->|"No DevOps capacity"| SIG["✅ SigNoz (free OSS)<br/>or Grafana Cloud<br/>free tier"]:::good
    B -->|"Yes, team can manage"| C
    C -->|"Yes"| SPL["✅ Splunk / ELK<br/>+ Elastic Security"]:::warn
    C -->|"No"| D
    D -->|"Yes, Kubernetes"| LGTM["✅ LGTM Stack<br/>(Loki + Grafana + Tempo +<br/>Mimir)"]:::good
    D -->|"No, VMs / bare metal"| E
    E -->|"Simple filtering"| LGTM
    E -->|"Complex full-text"| ELK["✅ ELK / OpenSearch<br/>+ Prometheus + Grafana"]:::warn
```

---

## 8. The Standard LGTM Stack Diagram

For **most teams building on Kubernetes**, the LGTM stack is the recommended open-source setup:

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef app   fill:#37474f,stroke:#263238,color:#fff
    classDef coll  fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef back  fill:#01579b,stroke:#003c8f,color:#fff
    classDef store fill:#1b5e20,stroke:#003300,color:#fff
    classDef viz   fill:#e65100,stroke:#bf360c,color:#fff

    APP["🐳 Services (OTel-instrumented)"]:::app

    subgraph "Collection Layer"
        COL["OTel Collector / Alloy"]:::coll
        PROM["Prometheus Scraper"]:::coll
    end

    subgraph "Storage Backends (LGTM)"
        LOK["📋 Loki (Logs)"]:::back
        MIM["📈 Mimir / Prometheus (Metrics)"]:::back
        TEM["🔗 Tempo (Traces)"]:::back
        PYR["🧠 Pyroscope (Profiles)"]:::back
    end

    subgraph "Storage"
        S3["☁️ Object Storage (S3 /<br/>GCS)"]:::store
    end

    VIZ["📊 Grafana (Dashboards + Explore +<br/>Alerts)"]:::viz

    APP -->|"OTLP"| COL
    APP -->|"/metrics"| PROM
    COL --> LOK & TEM
    PROM --> MIM
    APP -->|"Profiles"| PYR
    LOK & MIM & TEM & PYR --> S3
    VIZ --> LOK & MIM & TEM & PYR
```

**Cost breakdown for 50-person engineering team:**

| Component | Infra Cost (est.) |
| :--- | :--- |
| OTel Collector | Free (compute ~$20/mo) |
| Loki + S3 (100 GB/day, 30d) | ~$100–$150/mo |
| Prometheus + Mimir (10k series) | ~$50–$100/mo |
| Grafana Tempo (traces, S3) | ~$30–$60/mo |
| Grafana (OSS) | Free |
| **Total** | **~$200–$310/mo** |

vs. **Datadog** for same team: **$3,000–$8,000/mo**

---

*← [Observability README](./README.md)*

## Related

- [Network Protocols & API Architectures](../fundamentals/01-network-protocols-and-api-architectures.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Error Tracking](../error-tracking/README.md)
- [Enterprise Security](../../security/README.md)
