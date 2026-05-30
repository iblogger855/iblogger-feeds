# ⚡ Key-Value Stores (In-Memory)

> **Series:** DevOps › Databases · **Level:** Intermediate · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. What Is a Key-Value Store?](#1-what-is-a-key-value-store)
- [2. The In-Memory Architecture](#2-the-in-memory-architecture)
- [3. Redis: The King of Key-Value](#3-redis-the-king-of-key-value)
- [4. Common Use Cases](#4-common-use-cases)
- [5. Redis vs Memcached](#5-redis-vs-memcached)

---

## 1. What Is a Key-Value Store?

A **Key-Value Store** is the simplest possible database. It works exactly like a Hash Map or Dictionary in programming languages. You store a piece of data (the `value`) against a unique string (the `key`).

You cannot query a Key-Value store with complex logic like `WHERE age > 18`. You can only say, "Give me the value for key `user:123`."

---

## 2. The In-Memory Architecture

The defining characteristic of tools like Redis and Memcached is that they store all data directly in **RAM (Memory)** rather than on Disk (SSDs/HDDs).

- **Disk Databases (SQL, MongoDB):** Latency is usually **1-10 milliseconds**.
- **In-Memory (Redis):** Latency is usually **sub-millisecond (< 1ms)**.

Because RAM is highly volatile (if the server loses power, all data is lost), Key-Value stores are primarily used as **Caches** for transient data, not as the primary source of truth.

---

## 3. Redis: The King of Key-Value

**Redis** (Remote Dictionary Server) is the industry standard. While it is a key-value store, it supports complex data structures as values, including:

- **Strings:** Standard caching (`SET user:1 "Alice"`).
- **Hashes:** Storing objects (`HSET user:1 name "Alice" age 28`).
- **Lists:** Ordered queues (e.g., a background job queue).
- **Sets:** Unordered collections of unique strings.
- **Sorted Sets:** Sets ordered by a score (e.g., Gaming leaderboards).

---

## 4. Common Use Cases

### 1. Database Query Caching
If your PostgreSQL database takes 2 seconds to generate the "Top 10 Products" report, you run the query once, save the JSON result in Redis with a Time-To-Live (TTL) of 5 minutes. For the next 5 minutes, all users hit Redis instead of PostgreSQL, reducing load and returning instantly.

### 2. Session Management
When a user logs in, you generate a Session ID, store it as the Key in Redis, and store their user data as the Value. Redis checks the session on every web request in microseconds.

### 3. Rate Limiting
You can use Redis counters to track API usage: `INCR api_limit:user123`. If the value hits 100, you block the user for an hour.

### 4. Pub/Sub Messaging
Redis supports Publish/Subscribe, allowing a backend server to broadcast a message to multiple connected WebSocket servers instantly.

---

## 5. Redis vs Memcached

| Feature | Redis | Memcached |
| :--- | :--- | :--- |
| **Data Types** | Strings, Lists, Sets, Hashes | Strings only |
| **Persistence** | Can write to disk periodically for backups | 100% Volatile (No disk backup) |
| **Threading** | Single-threaded | Multi-threaded |
| **Use Case** | Complex caching, Queues, Pub/Sub | Pure, simple, massive string caching |

> **Recommendation:** Use **Redis** for almost everything. Memcached is only recommended for specific legacy architectures or highly specific multi-threaded caching needs.

---

*← [Document Databases](./03-nosql-document.md) · Next: [Wide-Column Stores](./05-wide-column.md) →*

## Related

- [Software Architecture Patterns](../../clean-code/software-architecture/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Observability & Monitoring](../observability/README.md)
