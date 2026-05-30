# 🖥️ Rendering Strategies (SPA vs SSR)

> **Series:** Clean Code › Frontend Architecture · **Level:** Fundamental · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. The Evolution of Rendering](#1-the-evolution-of-rendering)
- [2. Single Page Applications (SPA)](#2-single-page-applications-spa)
- [3. Server-Side Rendering (SSR)](#3-server-side-rendering-ssr)
- [4. Static Site Generation (SSG)](#4-static-site-generation-ssg)

---


```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6', 'background': '#1e1e1e'}, 'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }' }}%%
sequenceDiagram
    participant User
    participant Browser
    participant Server
    
    Note over Browser,Server: SPA (React)
    Browser->>Server: GET /
    Server-->>Browser: Empty HTML + 5MB JS
    Browser->>Browser: React mounts (Slow)
    Browser-->>User: Screen Visible
    
    Note over Browser,Server: SSR (Next.js)
    Browser->>Server: GET /
    Server->>Server: React renders to HTML
    Server-->>Browser: Fully Painted HTML
    Browser-->>User: Screen Visible (Instant)
```

## 1. The Evolution of Rendering

How does a blank white browser screen turn into a fully functioning web application? Where does the HTML come from? 
The answer to this question completely dictates your user's experience, your server costs, and your Google SEO rankings.

---

## 2. Single Page Applications (SPA)

The modern era of frontend (React, Vue, Angular) began with the **SPA**. 
When a user visits your site, the server sends a completely empty HTML file (`<div id="root"></div>`) and a massive JavaScript bundle (e.g., `bundle.js`). The browser downloads the JS, executes it, and draws the entire UI in the browser.

**Pros:**
- **Incredible UX:** Once loaded, clicking links feels instant because there are no page refreshes. The app feels like a native mobile app.
- **Cheap Servers:** You can host an SPA on a free AWS S3 bucket. You don't need expensive Node.js servers to render HTML.

**Cons:**
- **Terrible SEO:** Google's web crawler historically struggled to read SPAs because it saw an empty `<div>` and didn't wait for the JavaScript to execute.
- **Slow First Load:** Users stare at a blank white screen (or a spinning loader) for 3 seconds while waiting for the massive JavaScript bundle to download and execute.

---

## 3. Server-Side Rendering (SSR)

To fix the SEO and slow loading issues of SPAs, frameworks like **Next.js** and **Nuxt.js** brought back **SSR**.
When a user visits the URL, a Node.js server executes the React code *on the server*, generates the fully formed HTML string, and sends it to the browser. The browser immediately paints the beautiful UI on the screen.

Then, in the background, React "hydrates" the page, attaching event listeners (like `onClick`) to make the static HTML interactive.

**Pros:**
- **Perfect SEO:** Web crawlers instantly read the fully rendered HTML.
- **Fast First Paint:** Users see the UI almost instantly.

**Cons:**
- **Expensive:** You must pay for expensive Node.js servers to calculate React HTML for every single incoming request.
- **TTFB (Time to First Byte):** If your database is slow, the server hangs, and the user stares at a white screen waiting for the server to finish rendering.

---

## 4. Static Site Generation (SSG)

What if a page never changes (like a Blog Post or a Marketing landing page)? Why run expensive SSR for every user?

**SSG** renders the React HTML *at Build Time*. When you run `npm run build` in your CI/CD pipeline, Next.js queries the database, generates 500 HTML files (one for every blog post), and uploads them to a global CDN.

**Pros:**
- **The Ultimate Speed:** The user downloads pre-built HTML from a CDN edge node physically located in their city. It loads in milliseconds.

**Cons:**
- **Stale Data:** If you fix a typo in a blog post, the fix won't show up on the website until you trigger a completely new 10-minute CI/CD build pipeline to regenerate all the HTML files. *(Modern frameworks solve this via Incremental Static Regeneration - ISR).*

### Strategic Recommendation
- **SPA:** Internal corporate dashboards behind a login screen (where SEO doesn't matter).
- **SSR:** E-commerce product pages where prices change every 5 seconds.
- **SSG:** Blogs, Documentation, Marketing sites.

## 🔗 External References & Required Reading
- **React Docs:** [Server Components (RSC)](https://react.dev/learn/start-a-new-react-project#nextjs)
- **Next.js Docs:** [Rendering Fundamentals](https://nextjs.org/docs/app/building-your-application/rendering)

---

*← [Back to Series Overview](../README.md)*

## Related

- [Design Patterns](../../design-patterns/README.md)
- [Software Architecture Patterns](../../software-architecture/README.md)
- [Observability & Monitoring](../../../devops/observability/README.md)
- [Build Tools & CI/CD](../../../devops/cicd-pipelines/README.md)
