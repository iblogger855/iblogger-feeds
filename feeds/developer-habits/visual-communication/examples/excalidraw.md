# Example — Excalidraw

> **Use when:** You want fast, hand-drawn style diagrams for whiteboarding, brainstorming, or informal technical communication. Excalidraw is free, open-source, and works in the browser with zero setup.

**Tool:** Excalidraw | **Format:** JSON (`.excalidraw`), exportable to PNG, SVG

---

## Access

| Method | Notes |
| :--- | :--- |
| Web browser | excalidraw.com — no login required |
| VS Code extension | "Excalidraw" by Excalidraw — edit `.excalidraw` files |
| Self-hosted | Open-source, deployable on any server |
| Obsidian plugin | Excalidraw plugin for Obsidian |
| Notion embed | Paste shareable link |

---

## When Excalidraw Wins

Excalidraw's hand-drawn aesthetic signals "this is a sketch, not a spec" — useful for:

- **Whiteboarding sessions** — fast, expressive, collaborative
- **Early architecture exploration** — before committing to a formal diagram
- **Explaining an idea in Slack/Notion** — informal and approachable
- **Meeting notes with visuals** — quick diagrams during a call

Avoid Excalidraw for: formal documentation, compliance artifacts, client-facing presentations. Use draw.io or Lucidchart instead.

---

## Example: Excalidraw JSON (Architecture Sketch)

Save as `sketch.excalidraw` and open in excalidraw.com or VS Code extension.

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [
    {
      "type": "rectangle",
      "id": "client",
      "x": 60, "y": 100, "width": 120, "height": 60,
      "strokeColor": "#1971c2",
      "backgroundColor": "#e7f5ff",
      "fillStyle": "solid",
      "roughness": 1,
      "label": { "text": "Client\n(Browser)" }
    },
    {
      "type": "arrow",
      "id": "arrow1",
      "points": [[0,0],[120,0]],
      "x": 180, "y": 130,
      "strokeColor": "#1971c2",
      "label": { "text": "HTTPS" }
    },
    {
      "type": "rectangle",
      "id": "api",
      "x": 300, "y": 100, "width": 140, "height": 60,
      "strokeColor": "#2f9e44",
      "backgroundColor": "#ebfbee",
      "fillStyle": "solid",
      "roughness": 1,
      "label": { "text": "API Gateway\n(Kong)" }
    },
    {
      "type": "arrow",
      "id": "arrow2",
      "points": [[0,0],[0,80]],
      "x": 370, "y": 160,
      "strokeColor": "#2f9e44",
      "label": { "text": "route" }
    },
    {
      "type": "rectangle",
      "id": "service",
      "x": 300, "y": 260, "width": 140, "height": 60,
      "strokeColor": "#e67700",
      "backgroundColor": "#fff9db",
      "fillStyle": "solid",
      "roughness": 1,
      "label": { "text": "Order Service\n(Node.js)" }
    },
    {
      "type": "arrow",
      "id": "arrow3",
      "points": [[0,0],[120,0]],
      "x": 440, "y": 290,
      "strokeColor": "#e67700",
      "label": { "text": "SQL" }
    },
    {
      "type": "ellipse",
      "id": "db",
      "x": 560, "y": 260, "width": 120, "height": 60,
      "strokeColor": "#9c36b5",
      "backgroundColor": "#f8f0fc",
      "fillStyle": "solid",
      "roughness": 1,
      "label": { "text": "PostgreSQL" }
    }
  ],
  "appState": {
    "viewBackgroundColor": "#ffffff",
    "gridSize": null
  }
}
```

---

## Excalidraw Collaboration

| Feature | How to use |
| :--- | :--- |
| **Live collaboration** | Share → Copy link → others join in real-time |
| **Export PNG/SVG** | Menu → Export → PNG or SVG |
| **Embed in Notion** | Share → Get shareable link → embed in Notion |
| **Libraries** | excalidraw.com/libraries — AWS, Azure, GCP, C4 shape packs |

---

## Excalidraw Libraries for Engineering

Download from excalidraw.com/libraries:

| Library | Shapes |
| :--- | :--- |
| AWS Architecture | EC2, S3, Lambda, RDS, CloudFront |
| Software Architecture | Microservices, databases, queues |
| C4 Model | Person, System, Container, Component |
| Network | Routers, switches, firewalls |
| UI Wireframes | Buttons, inputs, modals, nav bars |

---

## Excalidraw vs Mermaid — When to Choose

| Factor | Excalidraw | Mermaid |
| :--- | :--- | :--- |
| Input method | Visual mouse/touch drawing | Text / code |
| Aesthetic | Hand-drawn, informal | Clean, professional |
| Collaboration | Real-time URL sharing | Git workflow |
| Reproducibility | Manual re-draw to change | Edit source text |
| Best for | Brainstorming, whiteboarding | Docs-as-code, README |
