# Example — Mermaid `timeline`

> **Use when:** Showing events along a time axis with periods and milestones.

**Tool:** Mermaid | **Type:** timeline

---

## Example: Product Roadmap Q1–Q4

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
timeline
    title Product Roadmap 2025
    section Q1 — Foundation
        Jan : Auth system v2
            : API rate limiting
        Feb : Multi-tenant DB schema
        Mar : CI/CD pipeline overhaul
    section Q2 — Growth
        Apr : Mobile app beta
            : Analytics dashboard
        May : Billing integration (Stripe)
        Jun : Public API v1 launch
    section Q3 — Scale
        Jul : Kubernetes migration
        Aug : Search engine (Elasticsearch)
        Sep : GDPR compliance audit
    section Q4 — Stability
        Oct : Performance optimization
        Nov : SOC 2 Type II prep
        Dec : Year-end security review
```

---

## Example: History of Version Control

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#4a148c', 'primaryTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
timeline
    title History of Version Control
    section Centralized Era
        1972 : SCCS (Source Code Control System)
        1982 : RCS (Revision Control System)
        1990 : CVS released
        2000 : Subversion (SVN)
    section Distributed Era
        2005 : Git created by Linus Torvalds
            : Mercurial released
        2008 : GitHub launched
        2011 : GitLab launched
        2012 : Bitbucket adds Git support
```

---

## Key Syntax

```
timeline
    title My Title
    section Period Name
        Label : Event description
              : Second event (same label = same time point)
        Label2 : Another event
```

---

**Avoid:** Non-chronological data. Use `flowchart` if events have causal branches, not just time order.
