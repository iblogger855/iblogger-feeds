# Example — Mermaid `xychart-beta`

> **Use when:** Showing quantitative data trends over a category axis — benchmarks, request counts, latency over time.

**Tool:** Mermaid | **Type:** xychart-beta

---

## Example: API Latency Over 6 Months (Bar + Line)

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'xyChart': {'backgroundColor': '#1e1e1e', 'plotColorPalette': '#29b6f6'}, 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
xychart-beta
    title "P95 Latency (ms)"
    x-axis [Jan, Feb, Mar, Apr, May, Jun]
    y-axis "Latency (ms)" 0 --> 300
    bar  [145, 162, 138, 201, 175, 120]
    line [145, 162, 138, 201, 175, 120]
```

---

## Example: Weekly Deployment Frequency

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'xyChart': {'backgroundColor': '#1e1e1e', 'plotColorPalette': '#4caf50'}, 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } text, tspan { fill: #ffffff !important; stroke: none !important; }'}}%%
xychart-beta
    title "Deploys per Week"
    x-axis ["W1", "W2", "W3", "W4", "W5", "W6", "W7", "W8"]
    y-axis "Deployments" 0 --> 20
    bar  [4, 7, 5, 12, 9, 14, 8, 17]
```

---

## Key Syntax

```
xychart-beta
    title "Chart Title"
    x-axis [Label1, Label2, Label3]
    y-axis "Axis Label" minVal --> maxVal
    bar  [v1, v2, v3]     ← bar chart series
    line [v1, v2, v3]     ← line overlay (optional)
```

Multiple `bar` or `line` entries = multi-series chart.

---

**Avoid:** Categorical relationships (use `flowchart` or `mindmap`). Fewer than 3 data points (use a table instead).
