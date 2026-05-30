# Example — Mermaid `quadrantChart`

> **Use when:** Comparing options across two independent dimensions — effort vs. impact, risk vs. value.

**Tool:** Mermaid | **Type:** quadrantChart

---

## Example: Feature Prioritization Matrix

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
quadrantChart
    title Feature Priority
    x-axis Low Effort --> High Effort
    y-axis Low Impact --> High Impact
    quadrant-1 Do First
    quadrant-2 Plan It
    quadrant-3 Drop It
    quadrant-4 Delegate
    Dark Mode: [0.2, 0.85]
    Search: [0.35, 0.9]
    Notifs: [0.55, 0.75]
    API v2: [0.75, 0.8]
    Themes: [0.15, 0.3]
    CSV Export: [0.45, 0.35]
    Admin UI: [0.8, 0.4]
    Onboard: [0.6, 0.55]
```

---

## Label Length Rules (prevents overflow)

| Element | Max Characters |
| :--- | :--- |
| Chart title | ≤ 20 chars |
| Axis labels (each side) | ≤ 15 chars |
| Quadrant labels | ≤ 15 chars |
| Point labels | ≤ 10 chars |

**Formula:** `Max point label = floor(chartWidth × 0.10)` — default chart is ~460px wide → ~10 chars max.

---

## Key Syntax

```
quadrantChart
    title My Title          ← ≤ 20 chars
    x-axis Low --> High     ← each side ≤ 15 chars
    y-axis Low --> High
    quadrant-1 TopRight     ← top-right quadrant label
    quadrant-2 TopLeft
    quadrant-3 BotLeft
    quadrant-4 BotRight
    Label: [x, y]           ← x, y in 0.0–1.0
```

---

**Avoid:** More than 8–10 data points. Exact numeric precision (use `xychart-beta`).
