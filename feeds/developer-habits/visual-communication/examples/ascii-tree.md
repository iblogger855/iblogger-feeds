# Example — ASCII: Tree Hierarchy

> **Use when:** Showing file structures, org charts, taxonomies, or any parent-child hierarchy in plain text.

**Tool:** ASCII | **Type:** Tree Hierarchy

---

## Example: Project File Structure

```
iblogger-feeds/
├── feeds/
│   ├── developer-habits/
│   │   ├── visual-communication/
│   │   │   ├── examples/          ← you are here
│   │   │   ├── 01-color-science.md
│   │   │   ├── 02-mermaid-diagram-catalog.md
│   │   │   └── README.md
│   │   └── explanation-strategies/
│   ├── clean-code/
│   │   ├── design-patterns/
│   │   ├── software-architecture/
│   │   └── README.md
│   ├── devops/
│   │   ├── cicd-pipelines/
│   │   ├── container-orchestration/
│   │   └── README.md
│   └── security/
│       ├── owasp-asvs-5.0/
│       └── README.md
├── _templates/
│   └── article-template.md
├── README.md
└── INDEX.md
```

---

## Example: Org Chart

```
CEO
├── CTO
│   ├── Engineering Manager
│   │   ├── Backend Team (5)
│   │   ├── Frontend Team (4)
│   │   └── DevOps Team (2)
│   └── Platform Team
│       ├── Infrastructure (3)
│       └── Security (2)
├── CPO
│   ├── Product Manager (3)
│   └── UX/Design (4)
└── COO
    ├── Operations (6)
    └── Support (8)
```

---

## Example: DNS Resolution Hierarchy

```
Root (.)
└── Top-Level Domains (TLD)
    ├── .com
    │   ├── google.com
    │   └── github.com
    ├── .io
    │   └── app.io
    └── .org
        └── wikipedia.org
```

---

## Tree Character Reference

| Pattern | Meaning |
| :--- | :--- |
| `├──` | Item with more siblings below |
| `└──` | Last item in group |
| `│   ` | Vertical continuation line |
| `    ` (4 spaces) | Indentation after `└──` |

**Quick rule:** After `└──`, use spaces (not `│`) for the next level's indent.

---

## Generate with `tree` Command

```bash
# Basic tree
tree my-project/

# Limit depth
tree -L 2 my-project/

# Show hidden files
tree -a my-project/

# Exclude node_modules
tree -I node_modules my-project/

# Directories only
tree -d my-project/
```
