# Example — Lucidchart

> **Use when:** You need enterprise-grade collaborative diagramming with real-time co-editing, Jira/Confluence/Google Workspace integration, and professional presentation output.

**Tool:** Lucidchart | **Format:** Web-based (proprietary), exportable to PNG, SVG, PDF, Visio

---

## Access

| Method | Notes |
| :--- | :--- |
| Web browser | lucidchart.com — sign in with Google/Outlook/SSO |
| Confluence plugin | Lucidchart Diagrams for Confluence |
| Jira integration | Embed diagrams in Jira issues |
| Google Workspace | Lucidchart for Google Docs/Slides |
| VS Code | Lucidchart VS Code extension (view only) |
| Import | Supports Visio (.vsdx), draw.io (.drawio) |

---

## Lucidchart Shape Libraries for Engineers

| Library | Use for |
| :--- | :--- |
| **AWS Architecture** | EC2, Lambda, S3, RDS, VPC, CloudFront |
| **GCP Architecture** | GKE, Cloud Run, Pub/Sub, BigQuery |
| **Azure Architecture** | AKS, Functions, CosmosDB, Service Bus |
| **C4 Model** | Context, Container, Component, Person |
| **Network Diagrams** | Routers, firewalls, switches, servers |
| **UML** | Class, sequence, activity, use case |
| **ERD** | Entity-relationship tables with cardinality |
| **Flowchart** | Decision, process, terminal, data |
| **BPMN** | Business process modeling notation |

---

## Example: System Context (Lucidchart Structured Data Import)

Lucidchart supports importing diagrams from CSV or JSON. This JSON describes a System Context diagram:

```json
{
  "title": "E-Commerce Platform — System Context",
  "nodes": [
    {
      "id": "customer",
      "label": "Customer",
      "type": "person",
      "description": "Buys products online",
      "shape": "C4 Person",
      "color": "#01579b"
    },
    {
      "id": "ecommerce",
      "label": "E-Commerce Platform",
      "type": "system",
      "description": "Handles catalog, orders, payments, fulfillment",
      "shape": "C4 System",
      "color": "#1b5e20"
    },
    {
      "id": "stripe",
      "label": "Stripe",
      "type": "external",
      "description": "Payment processing",
      "shape": "C4 System External",
      "color": "#37474f"
    },
    {
      "id": "sendgrid",
      "label": "SendGrid",
      "type": "external",
      "description": "Email delivery",
      "shape": "C4 System External",
      "color": "#37474f"
    }
  ],
  "edges": [
    {
      "from": "customer",
      "to": "ecommerce",
      "label": "Browses and purchases",
      "technology": "HTTPS"
    },
    {
      "from": "ecommerce",
      "to": "stripe",
      "label": "Charges payment",
      "technology": "HTTPS / Stripe API"
    },
    {
      "from": "ecommerce",
      "to": "sendgrid",
      "label": "Sends order emails",
      "technology": "HTTPS / SendGrid API"
    }
  ]
}
```

---

## Lucidchart Collaboration Features

| Feature | How to use |
| :--- | :--- |
| **Real-time co-editing** | Share link → multiple users edit simultaneously |
| **Comments** | Right-click any shape → Add comment |
| **Version history** | File → Version History → restore any version |
| **Presentation mode** | View → Present (slides through the diagram) |
| **Conditional formatting** | Format shapes by data (status, owner, priority) |
| **Linked diagrams** | Click a shape to drill into a child diagram |

---

## Export for Documentation

```
File → Export As:
  ├── PNG (for Confluence, Notion, Slack)
  ├── SVG (for web, scales perfectly)
  ├── PDF (for presentations, print)
  └── Visio (.vsdx) (for Microsoft ecosystem handoff)
```

---

## Lucidchart vs draw.io — When to Choose

| Factor | Lucidchart | draw.io |
| :--- | :--- | :--- |
| Cost | Paid (free tier limited) | Free and open-source |
| Collaboration | Best-in-class real-time | Good (via browser) |
| Enterprise SSO | Yes | Limited |
| Jira integration | Native | Via plugin |
| Offline / VS Code | Limited | Full VS Code extension |
| Best for | Enterprise teams, stakeholder presentations | Open-source teams, docs-as-code |
