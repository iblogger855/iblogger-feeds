# 🐛 Error Tracking & Crash Reporting

A comprehensive series exploring modern error tracking, crash reporting, and client-side observability platforms like Sentry, Bugsnag, and Rollbar.

---

## 📖 Table of Contents

- [What Is Error Tracking?](#what-is-error-tracking)
- [📚 Module Index](#module-index)
- [The Error Tracking Landscape](#the-error-tracking-landscape)

---

## What Is Error Tracking?

While traditional backend observability (logs, metrics, traces) tells you about the health of your *infrastructure* and *services*, **Error Tracking** focuses on the *application code* and the *user experience*. 

Error tracking tools automatically capture unhandled exceptions, crashes, and performance bottlenecks, grouping them into actionable issues with full stack traces, local variables, and breadcrumbs of what the user did right before the crash.

| Concept | Traditional Logging (ELK, Loki) | Error Tracking (Sentry, Bugsnag) |
| :--- | :--- | :--- |
| **Focus** | Infrastructure and application streams | Application crashes and unhandled exceptions |
| **Data Structure** | Chronological lines of text / JSON | Grouped issues by stack trace signature |
| **Key Metric** | Log volume | Crash-free sessions |
| **Context** | Server state, request IDs | Device state, OS, battery, breadcrumbs |

---

## 📚 Module Index

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [Error Tracking Comparison Matrix](./01-error-tracking-comparison.md) | Reference | ~10 min | Sentry, Bugsnag, Rollbar, LogRocket |

---

## The Error Tracking Landscape

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#b71c1c', 'primaryTextColor': '#fff', 'lineColor': '#ef5350', 'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef sen  fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef bug  fill:#01579b,stroke:#003c8f,color:#fff
    classDef rol  fill:#1b5e20,stroke:#003300,color:#fff
    classDef log  fill:#e65100,stroke:#bf360c,color:#fff

    subgraph PLATFORM["Error & UX Tracking"]
        SEN["Sentry<br/>(Industry Standard,<br/>Full-Stack)"]:::sen
        BUG["Bugsnag<br/>(Mobile First,<br/>Stability Scores)"]:::bug
        ROL["Rollbar<br/>(Workflow &<br/>CI/CD Focused)"]:::rol
        LOG["LogRocket<br/>(Session Replay,<br/>Frontend UX)"]:::log
    end
```
