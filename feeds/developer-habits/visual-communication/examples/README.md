# Diagram Examples

One file per diagram type. Each file contains a working example, syntax reference, and when-to-use guidance.

**Author:** ichamrong | **Tags:** #diagrams #mermaid #icepanel #ascii #plantuml #drawio

---

## Mermaid (11 types)

Renders natively in GitHub, GitLab, Notion, Obsidian, Confluence (plugin), and most modern Markdown renderers.

| File | Diagram Type | Best For |
| :--- | :--- | :--- |
| [mermaid-flowchart.md](mermaid-flowchart.md) | `flowchart` | Decisions, pipelines, process logic |
| [mermaid-sequence-diagram.md](mermaid-sequence-diagram.md) | `sequenceDiagram` | API flows, actor interactions over time |
| [mermaid-class-diagram.md](mermaid-class-diagram.md) | `classDiagram` | OOP structure, design patterns, domain model |
| [mermaid-state-diagram.md](mermaid-state-diagram.md) | `stateDiagram-v2` | Object lifecycle, state machines |
| [mermaid-er-diagram.md](mermaid-er-diagram.md) | `erDiagram` | Database schema, data relationships |
| [mermaid-quadrant-chart.md](mermaid-quadrant-chart.md) | `quadrantChart` | Trade-off matrix, effort vs. impact |
| [mermaid-mindmap.md](mermaid-mindmap.md) | `mindmap` | Brainstorming, concept taxonomy |
| [mermaid-pie.md](mermaid-pie.md) | `pie` | Parts of a whole (≤ 6 slices) |
| [mermaid-xychart.md](mermaid-xychart.md) | `xychart-beta` | Bar and line charts, quantitative trends |
| [mermaid-timeline.md](mermaid-timeline.md) | `timeline` | Historical milestones, roadmaps |
| [mermaid-gitgraph.md](mermaid-gitgraph.md) | `gitgraph` | Git branching strategies |

---

## IcePanel — C4 Model (4 levels)

IcePanel uses the C4 model: four levels of abstraction for software architecture documentation.

| File | C4 Level | Best For |
| :--- | :--- | :--- |
| [icepanel-system-context.md](icepanel-system-context.md) | Level 1 — System Context | Your system + users + external systems (30,000 ft view) |
| [icepanel-container.md](icepanel-container.md) | Level 2 — Container | Deployable units: apps, APIs, databases, queues |
| [icepanel-component.md](icepanel-component.md) | Level 3 — Component | Internal structure of one container |
| [icepanel-code.md](icepanel-code.md) | Level 4 — Code | Classes, interfaces (rarely needed) |

---

## ASCII (6 types)

Works everywhere: code comments, commit messages, terminal output, Slack, plain-text emails, ADRs.

| File | Type | Best For |
| :--- | :--- | :--- |
| [ascii-box-line.md](ascii-box-line.md) | Box-and-Line Architecture | System components and connections |
| [ascii-tree.md](ascii-tree.md) | Tree Hierarchy | File structure, org charts, taxonomies |
| [ascii-table.md](ascii-table.md) | Table | Comparisons, reference data, decision matrices |
| [ascii-swimlane.md](ascii-swimlane.md) | Swimlane | Multi-actor process flows, handoffs between teams |
| [ascii-timeline.md](ascii-timeline.md) | Timeline | Incident timelines, roadmaps, sprint schedules |
| [ascii-network-topology.md](ascii-network-topology.md) | Network Topology | Infrastructure layout, cloud architecture, network zones |

---

## Other Tools

| File | Tool | Best For |
| :--- | :--- | :--- |
| [plantuml.md](plantuml.md) | PlantUML | Fine-grained layout control, enterprise docs, deployment diagrams |
| [drawio.md](drawio.md) | draw.io / diagrams.net | Visual drag-and-drop, AWS/GCP/Azure shape libraries, Confluence |
| [lucidchart.md](lucidchart.md) | Lucidchart | Enterprise collaboration, Jira/Confluence integration, presentations |
| [excalidraw.md](excalidraw.md) | Excalidraw | Hand-drawn whiteboarding, brainstorming, informal sketches |

---

## Quick Decision Guide

```
Is this for a code comment, commit message, or terminal?
  → ASCII

Does the reader see rendered Markdown (GitHub, Notion, Confluence)?
  → Mermaid (text-based, version-controlled, fast)

Do you need precise visual layout or drag-and-drop?
  → draw.io (free) or Lucidchart (enterprise)

Is this a whiteboard session or early brainstorm?
  → Excalidraw

Do you need fine-grained control or enterprise Java ecosystem?
  → PlantUML

Is this a software architecture document using C4 model?
  → IcePanel
```

---

## Related

- [02 - Mermaid Diagram Catalog](../02-mermaid-diagram-catalog.md) — Decision tree + all 11 types explained
- [03 - Mermaid Wrap & Anti-Collapse](../03-mermaid-wrap-anti-collapse.md) — Overflow and layout collapse fixes
- [05 - ASCII Diagrams](../05-ascii-diagrams.md) — ASCII sizing formulas and cheat sheet
