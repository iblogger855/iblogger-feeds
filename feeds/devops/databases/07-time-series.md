# 📈 Time-Series Databases

> **Series:** DevOps › Databases · **Level:** Advanced · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. What Is a Time-Series Database (TSDB)?](#1-what-is-a-time-series-database-tsdb)
- [2. The Unique Characteristics of Time Data](#2-the-unique-characteristics-of-time-data)
- [3. Downsampling and Retention](#3-downsampling-and-retention)
- [4. InfluxDB vs TimescaleDB](#4-influxdb-vs-timescaledb)
- [5. When to Use TSDBs](#5-when-to-use-tsdbs)

---

## 1. What Is a Time-Series Database (TSDB)?

A **Time-Series Database** is optimized for measuring change over time. Every single row or data point inserted into the database is firmly attached to a **Timestamp**.

Instead of updating an existing record (e.g., `UPDATE server SET cpu = 90`), a TSDB appends a brand new record:
- `10:00:00 -> server1 cpu=80`
- `10:00:01 -> server1 cpu=85`
- `10:00:02 -> server1 cpu=90`

---

## 2. The Unique Characteristics of Time Data

Why not just use PostgreSQL or MongoDB? 
Time-series data has unique traits that break traditional databases:

1. **Insane Write Volumes:** An IoT fleet of 10,000 trucks sending GPS data every second results in 864 million rows per day. Traditional B-Tree indexes in SQL shatter under this write pressure.
2. **Immutable Appends:** You almost never `UPDATE` or `DELETE` a single historical metric. You only ever `INSERT` new data at the current time.
3. **Time-Range Queries:** You almost exclusively query contiguous blocks of time (`WHERE time > NOW() - 1h`).

TSDBs use specialized compression algorithms and column-oriented storage to reduce disk space and make time-range queries lightning fast.

---

## 3. Downsampling and Retention

Because TSDBs ingest so much data, they would fill up your hard drive in weeks. TSDBs solve this through native **Continuous Queries** and **Retention Policies**.

**Downsampling:**
1. Keep the raw "1-second resolution" data for exactly **7 days**.
2. Automatically average that data into "1-minute resolution" blocks, and keep those for **30 days**.
3. Average *that* data into "1-hour resolution" blocks, and keep it **forever** (for historical graphing).

The database automatically deletes the raw data as it ages out, saving massive amounts of storage space.

---

## 4. InfluxDB vs TimescaleDB

The two most popular general-purpose TSDBs have completely different philosophies.

| Feature | InfluxDB | TimescaleDB |
| :--- | :--- | :--- |
| **Foundation** | Custom-built engine (Go/Rust) | An extension on top of PostgreSQL |
| **Query Language**| Flux / InfluxQL | Standard SQL |
| **Ecosystem** | Purpose-built for metrics (TICK stack) | Seamless integration with existing SQL apps |
| **Setup** | Easy standalone binary | Requires PostgreSQL tuning |

> **Recommendation:** If you are building a pure metrics/monitoring dashboard (like Grafana), use **InfluxDB** (or Prometheus). If your main application runs on PostgreSQL and you just need to add a time-series feature (e.g., cryptocurrency price history attached to user accounts), use **TimescaleDB** to avoid running a second database engine.

---

## 5. When to Use TSDBs

### When to Choose a TSDB
✅ **DevOps Monitoring:** Server CPU, memory, and network throughput.
✅ **IoT (Internet of Things):** Smart home temperature sensors, connected car telemetry.
✅ **Financial Markets:** Stock tickers, cryptocurrency trading algorithms.

### When to Avoid a TSDB
❌ **User Data:** Storing user profiles, passwords, or session tokens.
❌ **Standard Application Logs:** While logs have timestamps, they are unstructured text. Use Elasticsearch, OpenSearch, or Grafana Loki for log aggregation. TSDBs are for *numeric metrics*.

---

*← [Graph Databases](./06-graph-databases.md) · Next: [Vector Databases (AI)](./08-vector-ai.md) →*

## Related

- [Software Architecture Patterns](../../clean-code/software-architecture/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Observability & Monitoring](../observability/README.md)
