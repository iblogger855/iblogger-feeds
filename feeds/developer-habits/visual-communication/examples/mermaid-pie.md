# Example — Mermaid `pie`

> **Use when:** Showing how a whole is divided into parts. Simple, no axes needed.

**Tool:** Mermaid | **Type:** pie

---

## Example: Infrastructure Cost Breakdown

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
pie title Monthly Infra Cost
    "Compute (EC2/GKE)" : 42
    "Database (RDS/PG)" : 23
    "Storage (S3/GCS)" : 11
    "CDN & Egress" : 9
    "Monitoring" : 8
    "Other" : 7
```

---

## Example: API Error Distribution

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#b71c1c', 'primaryTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
pie title API Errors (Last 30 Days)
    "400 Bad Request" : 51
    "401 Unauthorized" : 22
    "429 Rate Limited" : 14
    "500 Server Error" : 9
    "503 Unavailable" : 4
```

---

## Key Syntax

```
pie title My Title
    "Label A" : 45
    "Label B" : 30
    "Label C" : 25
```

Values are relative weights — they do not need to sum to 100.

---

**Rule of thumb:** More than 6 slices → use `xychart-beta` bar chart instead. The human eye can't reliably compare more than 5–6 pie slices.
