# File Upload Defense Library

**Author:** ichamrong  
**Category:** Security & Architecture  
**Read Time:** ~2 min  

---

## The Danger of User Input

In cybersecurity, the golden rule is **Never Trust User Input**. While most developers apply this rule to text fields (preventing SQL Injection), they often forget it when dealing with File Uploads.

Allowing a user to upload a file (like an Avatar, a PDF resume, or a CSV) is the equivalent of allowing a stranger to hand you a sealed box and put it in your server room. If you do not open it, inspect it, and rebuild it safely, it will eventually destroy your system.

## The Library

| Vulnerability | Core Concept | Document |
| :--- | :--- | :--- |
| **1. The Polyglot** | Files that bypass validation by being multiple formats at once. | [View Guide](./01-polyglot-files.md) |
| **2. Non-Image Malware** | Using ClamAV & Sandboxes for PDFs and CSVs. | [View Guide](./02-malware-scanning-clamav.md) |

*(Note: Future modules may include Zip Bombs, XML External Entities (XXE), and Path Traversal).*

---

*Last updated: 2026-05-17*
