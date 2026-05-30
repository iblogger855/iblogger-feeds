# Example — draw.io (diagrams.net)

> **Use when:** You need a visual drag-and-drop diagramming tool with rich shape libraries, real-time collaboration, and export to PNG/SVG/PDF. draw.io (also called diagrams.net) is free, browser-based, and integrates with Confluence, GitHub, GitLab, Google Drive, and VS Code.

**Tool:** draw.io / diagrams.net | **Format:** XML (`.drawio`), exportable to PNG, SVG, PDF

---

## Access

| Method | URL / Command |
| :--- | :--- |
| Web browser | https://app.diagrams.net |
| VS Code extension | "Draw.io Integration" by Henning Dieterichs |
| Desktop app | Download from diagrams.net/desktop |
| Confluence plugin | diagrams.net for Confluence |
| GitHub integration | Commit `.drawio` files → rendered as image in PR |

---

## Example: draw.io XML (System Context Diagram)

Save as `architecture.drawio` and open in draw.io or VS Code extension.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mxGraphModel background="#1e1e1e">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />

    <!-- Customer (Person) -->
    <mxCell id="2" value="Customer"
      style="shape=mxgraph.c4.person2;fillColor=#01579b;strokeColor=#003c8f;fontColor=#ffffff;fontSize=14;fontStyle=1;"
      vertex="1" parent="1">
      <mxGeometry x="80" y="160" width="120" height="120" as="geometry" />
    </mxCell>

    <!-- System boundary -->
    <mxCell id="3" value="E-Commerce Platform [System]"
      style="points=[[0,0],[0.25,0],[0.5,0],[0.75,0],[1,0],[1,0.25],[1,0.5],[1,0.75],[1,1],[0.75,1],[0.5,1],[0.25,1],[0,1],[0,0.75],[0,0.5],[0,0.25]];
             shape=mxgraph.c4.system;fillColor=#1b5e20;strokeColor=#003300;fontColor=#ffffff;fontSize=14;fontStyle=1;"
      vertex="1" parent="1">
      <mxGeometry x="280" y="120" width="240" height="200" as="geometry" />
    </mxCell>

    <!-- Stripe (External System) -->
    <mxCell id="4" value="Stripe&#xa;[External System]&#xa;Payment processing"
      style="shape=mxgraph.c4.system;fillColor=#37474f;strokeColor=#263238;fontColor=#ffffff;fontSize=12;"
      vertex="1" parent="1">
      <mxGeometry x="600" y="80" width="160" height="100" as="geometry" />
    </mxCell>

    <!-- SendGrid (External System) -->
    <mxCell id="5" value="SendGrid&#xa;[External System]&#xa;Email delivery"
      style="shape=mxgraph.c4.system;fillColor=#37474f;strokeColor=#263238;fontColor=#ffffff;fontSize=12;"
      vertex="1" parent="1">
      <mxGeometry x="600" y="240" width="160" height="100" as="geometry" />
    </mxCell>

    <!-- Arrow: Customer → System -->
    <mxCell id="6" value="Browses and purchases&#xa;[HTTPS]"
      style="edgeStyle=orthogonalEdgeStyle;fillColor=#29b6f6;strokeColor=#29b6f6;fontColor=#ffffff;fontSize=11;"
      edge="1" source="2" target="3" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>

    <!-- Arrow: System → Stripe -->
    <mxCell id="7" value="Charges payment&#xa;[HTTPS / Stripe API]"
      style="edgeStyle=orthogonalEdgeStyle;fillColor=#29b6f6;strokeColor=#29b6f6;fontColor=#ffffff;fontSize=11;"
      edge="1" source="3" target="4" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>

    <!-- Arrow: System → SendGrid -->
    <mxCell id="8" value="Sends emails&#xa;[HTTPS / SendGrid API]"
      style="edgeStyle=orthogonalEdgeStyle;fillColor=#29b6f6;strokeColor=#29b6f6;fontColor=#ffffff;fontSize=11;"
      edge="1" source="3" target="5" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>

  </root>
</mxGraphModel>
```

---

## Key draw.io Shape Libraries for Engineering

| Library | Shapes | Enable via |
| :--- | :--- | :--- |
| C4 Model | Person, System, Container, Component | Extras → Edit Diagram → C4 |
| AWS Architecture | EC2, S3, RDS, Lambda, VPC | Search "AWS" in shape panel |
| GCP Architecture | GKE, Cloud SQL, Pub/Sub, GCS | Search "GCP" |
| Azure Architecture | AKS, Cosmos DB, Functions | Search "Azure" |
| Network | Firewall, Router, Switch, Server | Network shapes panel |
| Flowchart | Decision, Process, Terminal | Default shapes |
| UML | Class, Sequence, Activity | UML shapes panel |

---

## draw.io Workflow Tips

1. **Version control:** Commit `.drawio` files to git — they're XML and diff cleanly
2. **GitHub preview:** GitHub renders `.drawio` files as images in PRs automatically
3. **Export:** File → Export As → PNG/SVG for embedding in docs
4. **Confluence:** Use the diagrams.net Confluence macro for live-edited embedded diagrams
5. **VS Code:** Install "Draw.io Integration" to edit `.drawio` files directly in the editor

---

## draw.io vs Mermaid — When to Choose

| Factor | draw.io | Mermaid |
| :--- | :--- | :--- |
| Input method | Visual drag-and-drop | Text / code |
| Version control | XML (diffable but verbose) | Markdown (clean diff) |
| Collaboration | Real-time (browser) | Git workflow |
| Shape libraries | Massive (AWS, GCP, Azure, C4) | Limited |
| Best for | Complex visual diagrams, presentations | Docs-as-code, README files |
