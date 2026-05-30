# 📄 Document (NoSQL) Databases

> **Series:** DevOps › Databases · **Level:** Intermediate · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. What Is a Document Database?](#1-what-is-a-document-database)
- [2. The Schemaless Advantage](#2-the-schemaless-advantage)
- [3. Denormalization (The NoSQL Way)](#3-denormalization-the-nosql-way)
- [4. MongoDB vs DynamoDB](#4-mongodb-vs-dynamodb)
- [5. When to Avoid Document Databases](#5-when-to-avoid-document-databases)

---

## 1. What Is a Document Database?

A **Document Database** (a type of NoSQL database) stores data in JSON-like, hierarchical documents (like BSON in MongoDB) instead of rows and columns.

Instead of defining strict tables and relations, you store everything a front-end application needs to render a page inside a single document.

---

## 2. The Schemaless Advantage

In SQL, if you want to add a `twitter_handle` column to your 10-billion-row `users` table, you have to run a database migration that might lock the table for hours.

In MongoDB, you just start writing documents with the new field.

```json
// Document 1
{
  "_id": "usr_123",
  "name": "Alice",
  "age": 28
}

// Document 2 (New schema)
{
  "_id": "usr_124",
  "name": "Bob",
  "age": 30,
  "twitter_handle": "@bob"
}
```
*Notice how Document 2 has a field that Document 1 doesn't have. The database doesn't care.*

---

## 3. Denormalization (The NoSQL Way)

In SQL, you **normalize** data across multiple tables and use `JOIN`s.
In Document databases, `JOIN`s are generally slow or unsupported. Instead, you **denormalize** by embedding data.

**Example: A Blog Post**
Instead of storing comments in a separate table, you embed the comments array directly inside the post document.

```json
{
  "_id": "post_99",
  "title": "Why I love NoSQL",
  "author": "Alice",
  "comments": [
    { "user": "Bob", "text": "Great article!" },
    { "user": "Charlie", "text": "I disagree." }
  ]
}
```
**Advantage:** Reading the post and all its comments takes exactly **1 disk read**. This makes read operations incredibly fast.

---

## 4. MongoDB vs DynamoDB

| Feature | MongoDB | Amazon DynamoDB |
| :--- | :--- | :--- |
| **Hosting** | Self-hosted or MongoDB Atlas | Fully managed AWS SaaS |
| **Querying** | Highly flexible, similar to SQL | Extremely rigid, requires partition keys |
| **Scale Model** | Replica Sets / Sharded Clusters | Auto-scaling partitions |
| **Best For** | Rapid prototyping, flexible data | Unpredictable, massive scale on AWS |

---

## 5. When to Avoid Document Databases

1. **You need strict ACID guarantees across multiple documents:** While modern MongoDB supports multi-document transactions, it is not optimized for them like PostgreSQL is.
2. **Your data is highly relational:** If you find yourself manually linking `user_id` across different collections and performing multiple queries to "join" them in your backend code, you should be using a Relational database.
3. **You don't want to enforce schema in your application code:** If the database doesn't enforce schema, your Node.js/Python code *must* validate the data before saving it, otherwise your database turns into a chaotic swamp of mismatched data.

---

*← [Relational (SQL) Databases](./02-relational-sql.md) · Next: [Key-Value Stores](./04-key-value-stores.md) →*

## Related

- [Software Architecture Patterns](../../clean-code/software-architecture/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Observability & Monitoring](../observability/README.md)
