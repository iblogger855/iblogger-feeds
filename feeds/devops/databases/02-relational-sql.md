# 🗃️ Relational (SQL) Databases

> **Series:** DevOps › Databases · **Level:** Intermediate · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. What Is a Relational Database?](#1-what-is-a-relational-database)
- [2. The ACID Guarantees](#2-the-acid-guarantees)
- [3. Normalization (Rules of SQL)](#3-normalization-rules-of-sql)
- [4. PostgreSQL vs MySQL](#4-postgresql-vs-mysql)
- [5. Scaling Relational Databases](#5-scaling-relational-databases)

---

## 1. What Is a Relational Database?

**Relational Database Management Systems (RDBMS)** store data in highly structured **tables** (rows and columns). Relationships between data are maintained through **Foreign Keys** that link a column in one table to the primary key of another table.

You communicate with an RDBMS using **SQL** (Structured Query Language).

---

## 2. The ACID Guarantees

Relational databases are the gold standard for financial and transactional systems because they strictly adhere to **ACID** properties:

- **Atomicity:** A transaction is "all or nothing." If you transfer $100 from Account A to Account B, both the deduction and the addition must succeed, or both fail.
- **Consistency:** Data must always adhere to defined rules (e.g., "Account balance cannot be negative").
- **Isolation:** Concurrent transactions don't interfere with each other.
- **Durability:** Once a transaction is committed, it is saved permanently, even if the database crashes 1 millisecond later.

---

## 3. Normalization (Rules of SQL)

In SQL, you **normalize** data. This means you structure your tables to eliminate data redundancy.

**Example: A Blog Application**
Instead of storing the `author_name` and `author_email` on every single post:
1. You create an `authors` table.
2. You create a `posts` table with an `author_id` foreign key.
3. When querying, you `JOIN` the two tables together.

```sql
SELECT posts.title, authors.name 
FROM posts 
JOIN authors ON posts.author_id = authors.id;
```

---

## 4. PostgreSQL vs MySQL

These are the two dominant open-source relational databases in the industry.

| Feature | PostgreSQL | MySQL |
| :--- | :--- | :--- |
| **Reputation** | The most advanced, feature-rich database. | The fastest, simplest database. |
| **NoSQL Support**| Phenomenal `JSONB` support (can act like MongoDB). | Basic JSON support. |
| **Vector AI** | Industry-standard `pgvector` extension. | Not natively supported. |
| **Usage** | Enterprise applications, strict data integrity. | WordPress, simple web apps, high-read loads. |

> **Recommendation:** In the modern era, **PostgreSQL** is almost always the correct choice for a new project due to its incredible extensibility (JSONB, PostGIS for geospatial, pgvector for AI).

---

## 5. Scaling Relational Databases

The biggest weakness of relational databases is that they are **difficult to scale horizontally** (across multiple servers) because maintaining ACID guarantees across a network is computationally expensive.

1. **Scale Up (Vertical):** Buy a bigger server (more RAM, more CPU). This is the easiest and most common way to scale SQL.
2. **Read Replicas:** Send all `INSERT/UPDATE` queries to the Primary Node, but route `SELECT` queries to Read Replicas.
3. **Sharding:** Split the database across multiple servers (e.g., Users A-M on Server 1, N-Z on Server 2). This is extremely complex and breaks standard `JOIN` operations.

---

*← [Database Comparison Matrix](./01-databases-comparison.md) · Next: [Document (NoSQL) Databases](./03-nosql-document.md) →*

## Related

- [Software Architecture Patterns](../../clean-code/software-architecture/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Observability & Monitoring](../observability/README.md)
