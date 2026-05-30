# MCP: The Engineer's Guide to Supercharging AI in Development

**Author:** ichamrong  
**Date:** 2026-05-16  
**Tags:** #mcp #ai-tools #claude #cursor #productivity #devtools #automation  
**Category:** Developer Habits  
**Read Time:** ~45 min  

---

## 📌 Table of Contents
- [What Is MCP?](#what-is-mcp)
- [How MCP Works](#how-mcp-works)
- [Setting Up MCP](#setting-up-mcp)
  - [For Claude Desktop](#for-claude-desktop)
  - [For Claude Code CLI](#for-claude-code-cli)
  - [For Cursor](#for-cursor)
- [The Essential MCP Server Stack](#the-essential-mcp-server-stack)
  - [Tier 1 — Start With These](#tier-1-start-with-these)
  - [Tier 2 — Add for Your Stack](#tier-2-add-for-your-stack)
  - [Tier 3 — Project Management](#tier-3-project-management)
- [Use Cases: What You Can Actually Do](#use-cases-what-you-can-actually-do)
  - [1. Codebase Exploration Without Reading](#1-codebase-exploration-without-reading)
  - [2. Automated Code Review](#2-automated-code-review)
  - [3. Issue Triage and Sprint Planning](#3-issue-triage-and-sprint-planning)
  - [4. Database-Aware Development](#4-database-aware-development)
  - [5. Living Documentation](#5-living-documentation)
  - [6. Incident Response](#6-incident-response)
  - [7. Dependency & Library Help](#7-dependency-library-help)
  - [8. Infrastructure Management](#8-infrastructure-management)
- [MCP Prompt Patterns](#mcp-prompt-patterns)
  - [The Investigate Pattern](#the-investigate-pattern)
  - [The Act-and-Report Pattern](#the-act-and-report-pattern)
  - [The Refactor Pattern](#the-refactor-pattern)
  - [The Review Pattern](#the-review-pattern)
  - [The Sync Pattern](#the-sync-pattern)
- [Building Your Own MCP Server](#building-your-own-mcp-server)
  - [Python Example — Internal Metrics Server](#python-example-internal-metrics-server)
  - [TypeScript / Node Example — Jira + Slack Bridge](#typescript-node-example-jira-slack-bridge)
- [Security Rules for MCP](#security-rules-for-mcp)
- [MCP vs Traditional Integrations](#mcp-vs-traditional-integrations)
- [The MCP Development Workflow](#the-mcp-development-workflow)
- [Quick Setup Checklist](#quick-setup-checklist)
- [Advanced MCP Orchestration Patterns](#advanced-mcp-orchestration-patterns)
  - [Pattern 1 — Conditional Branch Execution](#pattern-1-conditional-branch-execution)
  - [Pattern 2 — Cross-System Sync](#pattern-2-cross-system-sync)
  - [Pattern 3 — Scheduled Intelligence (via Claude Code)](#pattern-3-scheduled-intelligence-via-claude-code)
  - [Pattern 4 — Multi-Repo Intelligence](#pattern-4-multi-repo-intelligence)
  - [Pattern 5 — Test-First Development Loop](#pattern-5-test-first-development-loop)
- [Debugging MCP Servers](#debugging-mcp-servers)
  - [Checking Server Status](#checking-server-status)
  - [Common Failure Modes](#common-failure-modes)
  - [Testing a Server Manually](#testing-a-server-manually)
  - [Logging in Custom Servers](#logging-in-custom-servers)
- [MCP in CI/CD Pipelines](#mcp-in-cicd-pipelines)
  - [GitHub Actions — Automated PR Review](#github-actions-automated-pr-review)
  - [GitHub Actions — Auto-Documentation Sync](#github-actions-auto-documentation-sync)
  - [CI Best Practices for MCP](#ci-best-practices-for-mcp)
- [Team Adoption Playbook](#team-adoption-playbook)
  - [Week 1: Individual Exploration (No Team Buy-In Needed)](#week-1-individual-exploration-no-team-buy-in-needed)
  - [Week 2: Show, Don't Tell](#week-2-show-dont-tell)
  - [Week 3: Team Config Standardization](#week-3-team-config-standardization)
  - [`CLAUDE.md` — The Project Intelligence File](#claudemd-the-project-intelligence-file)
  - [Measuring Adoption Success](#measuring-adoption-success)
- [Common Pitfalls and How to Avoid Them](#common-pitfalls-and-how-to-avoid-them)
  - [Pitfall 1 — Giving Too Much Access Too Fast](#pitfall-1-giving-too-much-access-too-fast)
  - [Pitfall 2 — Letting the AI Write Directly to Main](#pitfall-2-letting-the-ai-write-directly-to-main)
  - [Pitfall 3 — Context Window Bloat](#pitfall-3-context-window-bloat)
  - [Pitfall 4 — Stale Tool Assumptions](#pitfall-4-stale-tool-assumptions)
  - [Pitfall 5 — No Rollback Plan](#pitfall-5-no-rollback-plan)
  - [Pitfall 6 — Prompt Drift in Long Sessions](#pitfall-6-prompt-drift-in-long-sessions)
- [Real-World MCP Recipes](#real-world-mcp-recipes)
  - [Recipe 1 — Daily Standup Brief](#recipe-1-daily-standup-brief)
  - [Recipe 2 — Pre-Merge Checklist](#recipe-2-pre-merge-checklist)
  - [Recipe 3 — Dependency Audit](#recipe-3-dependency-audit)
  - [Recipe 4 — Onboarding a New Codebase](#recipe-4-onboarding-a-new-codebase)
  - [Recipe 5 — Performance Regression Hunt](#recipe-5-performance-regression-hunt)
  - [Recipe 6 — Release Notes Generator](#recipe-6-release-notes-generator)
  - [Recipe 7 — Security Audit](#recipe-7-security-audit)
  - [Recipe 8 — Test Gap Analysis](#recipe-8-test-gap-analysis)
- [The Bigger Picture: Where MCP Is Heading](#the-bigger-picture-where-mcp-is-heading)
- [Beyond Tools: Resources and Prompts](#beyond-tools-resources-and-prompts)
  - [The Three MCP Primitives](#the-three-mcp-primitives)
  - [Resources — URI-Addressable Context](#resources-uri-addressable-context)
  - [Prompts — Reusable AI Workflows](#prompts-reusable-ai-workflows)
- [Performance Tuning Your MCP Setup](#performance-tuning-your-mcp-setup)
  - [1. Scope Every Tool Call](#1-scope-every-tool-call)
  - [2. Use Pagination for Large Data Sets](#2-use-pagination-for-large-data-sets)
  - [3. Run Servers Locally, Not Over Network](#3-run-servers-locally-not-over-network)
  - [4. Cache Expensive Reads in Custom Servers](#4-cache-expensive-reads-in-custom-servers)
  - [5. Parallel Tool Calls](#5-parallel-tool-calls)
- [MCP with Local LLMs (Ollama)](#mcp-with-local-llms-ollama)
  - [Setup: Ollama + MCP](#setup-ollama-mcp)
  - [When to Use Local LLMs with MCP](#when-to-use-local-llms-with-mcp)
  - [Practical Hybrid Approach](#practical-hybrid-approach)
- [Enterprise Governance for MCP](#enterprise-governance-for-mcp)
  - [The Three-Tier Governance Model](#the-three-tier-governance-model)
  - [Internal MCP Server Registry](#internal-mcp-server-registry)
  - [Audit Logging](#audit-logging)
- [The MCP Mental Model: Shifting How You Think](#the-mcp-mental-model-shifting-how-you-think)
  - [Before MCP: You Are the Integration Layer](#before-mcp-you-are-the-integration-layer)
  - [After MCP: The AI Is the Integration Layer](#after-mcp-the-ai-is-the-integration-layer)
  - [The Right Mental Model: MCP as a Capability Stack](#the-right-mental-model-mcp-as-a-capability-stack)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Summary: Your MCP Action Plan](#summary-your-mcp-action-plan)
- [References](#references)
- [📚 Cross-References & Related Reading](#cross-references-related-reading)

---

## 📋 Table of Contents

- [What Is MCP?](#what-is-mcp)
- [How MCP Works](#how-mcp-works)
- [Setting Up MCP](#setting-up-mcp)
  - [For Claude Desktop](#for-claude-desktop)
  - [For Claude Code CLI](#for-claude-code-cli)
  - [For Cursor](#for-cursor)
- [The Essential MCP Server Stack](#the-essential-mcp-server-stack)
- [Use Cases: What You Can Actually Do](#use-cases-what-you-can-actually-do)
- [MCP Prompt Patterns](#mcp-prompt-patterns)
- [Building Your Own MCP Server](#building-your-own-mcp-server)
- [Security Rules for MCP](#security-rules-for-mcp)
- [MCP vs Traditional Integrations](#mcp-vs-traditional-integrations)
- [The MCP Development Workflow](#the-mcp-development-workflow)
- [Quick Setup Checklist](#quick-setup-checklist)
- [Advanced MCP Orchestration Patterns](#advanced-mcp-orchestration-patterns)
- [Debugging MCP Servers](#debugging-mcp-servers)
- [MCP in CI/CD Pipelines](#mcp-in-cicd-pipelines)
- [Team Adoption Playbook](#team-adoption-playbook)
- [Common Pitfalls and How to Avoid Them](#common-pitfalls-and-how-to-avoid-them)
- [Real-World MCP Recipes](#real-world-mcp-recipes)
- [The Bigger Picture: Where MCP Is Heading](#the-bigger-picture-where-mcp-is-heading)
- [Beyond Tools: Resources and Prompts](#beyond-tools-resources-and-prompts)
- [Performance Tuning Your MCP Setup](#performance-tuning-your-mcp-setup)
- [MCP with Local LLMs (Ollama)](#mcp-with-local-llms-ollama)
- [Enterprise Governance for MCP](#enterprise-governance-for-mcp)
- [The MCP Mental Model: Shifting How You Think](#the-mcp-mental-model-shifting-how-you-think)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Summary: Your MCP Action Plan](#summary-your-mcp-action-plan)
- [References](#references)

---

## What Is MCP?

> **MCP (Model Context Protocol)** is an open standard by Anthropic that lets AI models connect to external tools, data sources, and services — turning a chatbot into a development environment that can read your files, query your database, call your APIs, and manage your repos.

Think of it like this:

```
Without MCP:                      With MCP:
┌─────────────────┐               ┌─────────────────┐     ┌──────────────┐
│   You (human)   │               │   You (human)   │     │  Filesystem  │
│  copy-pastes    │               │                 │     │  Database    │
│  code manually  │               │   AI model      │────▶│  GitHub API  │
│  into the chat  │               │   (Claude etc.) │     │  Jira/Linear │
│                 │               │                 │     │  Docker      │
│   AI responds   │               │   acts directly │     │  Browser     │
└─────────────────┘               └─────────────────┘     └──────────────┘
```

The difference: without MCP, you are the context window. With MCP, the AI reaches out and grabs context itself.

---

## How MCP Works

```mermaid
%%{init: {
  'theme': 'dark',
  'themeVariables': {
    'actorBkg':            '#01579b',
    'actorBorder':         '#003c8f',
    'actorTextColor':      '#ffffff',
    'signalColor':         '#29b6f6',
    'signalTextColor':     '#ffffff',
    'noteBkgColor':        '#37474f',
    'noteBorderColor':     '#263238',
    'noteTextColor':       '#ffffff',
    'activationBkgColor':  '#1b5e20',
    'activationBorderColor': '#003300',
    'labelBoxBkgColor':    '#2d2d2d',
    'labelTextColor':      '#ffffff',
    'loopTextColor':       '#ffffff',
    'background': '#1e1e1e'
  },
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
sequenceDiagram
    participant U as You
    participant AI as AI Client
    participant MH as MCP Host
    participant S1 as Filesystem Server
    participant S2 as GitHub Server
    participant S3 as Postgres Server

    U->>AI: Find all TODOs<br/>& open an issue
    AI->>MH: Request available tools
    MH-->>AI: [read_file, search_files,<br/>create_issue]
    AI->>S1: search_files(pattern="TODO")
    S1-->>AI: [auth.ts:42, order.ts:87]
    AI->>S1: read_file(auth.ts,<br/>lines=40-45)
    S1-->>AI: TODO: add rate limiting
    AI->>S2: create_issue(title,<br/>body, labels)
    S2-->>AI: issue #234 created
    AI-->>U: Found 2 TODOs,<br/>issue #234 opened
```

**Three components:**

| Component | Role | Example |
| :--- | :--- | :--- |
| **MCP Client** | The AI that uses tools | Claude, Cursor, Claude Code CLI |
| **MCP Host** | Manages connections | Claude Desktop, Claude Code runtime |
| **MCP Server** | Exposes tools/resources | `filesystem`, `github`, `postgres` |

The protocol is JSON-RPC over stdio or HTTP. You don't need to understand the protocol — you just configure which servers to run and the AI does the rest.

---

## Setting Up MCP

### For Claude Desktop

Config file: `~/.claude/claude_desktop_config.json` (macOS/Linux) or `%APPDATA%\Claude\claude_desktop_config.json` (Windows)

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/your/project/path"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_your_token_here"
      }
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres", "postgresql://user:pass@localhost/mydb"]
    }
  }
}
```

Restart Claude Desktop after saving — servers appear as tool icons in the chat UI.

### For Claude Code CLI

Claude Code reads MCP config from `.claude/settings.json` in your project or `~/.claude/settings.json` globally:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_your_token" }
    }
  }
}
```

### For Cursor

Cursor → Settings → MCP (or edit `~/.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/your/project"]
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

---

## The Essential MCP Server Stack

These are the most useful servers for everyday development:

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#1b5e20', 'primaryTextColor': '#fff', 'lineColor': '#4caf50', 'clusterBkg': '#1a2a1a',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef core    fill:#1b5e20,stroke:#003300,color:#fff
    classDef data    fill:#01579b,stroke:#003c8f,color:#fff
    classDef infra   fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef pm      fill:#e65100,stroke:#bf360c,color:#fff
    classDef web     fill:#37474f,stroke:#263238,color:#fff

    AI[AI Client<br/>Claude / Cursor]

    AI --> C1[filesystem<br/>Read/write files]:::core
    AI --> C2[git<br/>Git operations]:::core
    AI --> C3[github<br/>Issues, PRs, repos]:::core
    AI --> C4[context7<br/>Library docs]:::core

    AI --> D1[postgres<br/>Query DB]:::data
    AI --> D2[sqlite<br/>Local DB]:::data
    AI --> D3[memory<br/>Persistent notes]:::data

    AI --> I1[docker<br/>Container mgmt]:::infra
    AI --> I2[fetch<br/>HTTP requests]:::infra
    AI --> I3[brave-search<br/>Web search]:::infra

    AI --> P1[linear<br/>Issue tracking]:::pm
    AI --> P2[atlassian<br/>Jira + Confluence]:::pm
    AI --> P3[slack<br/>Send messages]:::pm

    AI --> W1[puppeteer<br/>Browser control]:::web
    AI --> W2[playwright<br/>E2E testing]:::web
```

### Tier 1 — Start With These

| Server | Install | What It Does |
| :--- | :--- | :--- |
| `filesystem` | `@modelcontextprotocol/server-filesystem` | Read, write, search files in your project |
| `github` | `@modelcontextprotocol/server-github` | Create issues, PRs, comments; search code |
| `git` | `@modelcontextprotocol/server-git` | git log, diff, blame, status, commit |
| `context7` | `@upstash/context7-mcp` | Instant docs for any library (React, Next.js, etc.) |
| `memory` | `@modelcontextprotocol/server-memory` | AI remembers facts between sessions |

### Tier 2 — Add for Your Stack

| Server | Install | What It Does |
| :--- | :--- | :--- |
| `postgres` | `@modelcontextprotocol/server-postgres` | Query your database, describe schema |
| `sqlite` | `@modelcontextprotocol/server-sqlite` | Same for SQLite |
| `fetch` | `@modelcontextprotocol/server-fetch` | Make HTTP requests to any API |
| `brave-search` | `@modelcontextprotocol/server-brave-search` | Web search with Brave API |
| `docker` | `@modelcontextprotocol/server-docker` | List/start/stop containers, view logs |

### Tier 3 — Project Management

| Server | Install | What It Does |
| :--- | :--- | :--- |
| `linear` | `@linear/mcp-server` | Create/update Linear issues and projects |
| `atlassian` | Plugin via Claude marketplace | Jira tickets + Confluence pages |
| `slack` | Plugin via Claude marketplace | Post to channels, search messages |
| `firebase` | Plugin via Claude marketplace | Manage Firebase projects and deploy |

---

## Use Cases: What You Can Actually Do

### 1. Codebase Exploration Without Reading

**Problem:** New to a codebase. Don't know where anything is.

**With MCP (`filesystem` + `git`):**

```
"List all files in the src/ directory,
then show me the git log for the last 10 commits,
then find where UserService is defined and
summarize what it does."
```

The AI reads the files, traces the call graph, and gives you a mental model in seconds. No searching, no tab-switching.

---

### 2. Automated Code Review

**Problem:** Code review is slow and inconsistent.

**With MCP (`filesystem` + `github`):**

```
"Read the diff of PR #142 on github.com/myorg/myrepo.
Review it for:
1. Security vulnerabilities (OWASP Top 10)
2. Missing error handling
3. N+1 query patterns
4. Naming inconsistencies with the rest of the codebase
Post your review as a GitHub PR comment."
```

The AI reads the actual PR diff, compares with the existing codebase style, and posts a structured review — all without you copying anything.

---

### 3. Issue Triage and Sprint Planning

**Problem:** Backlog is a mess. Hard to prioritize.

**With MCP (`github` or `linear`):**

```
"Look at all open GitHub issues with label 'bug'.
Group them by affected component (auth, payments, orders).
For each group, identify which issue appears most often
in user complaints. Create a priority-sorted list
and add it as a comment on issue #200 (our sprint planning issue)."
```

---

### 4. Database-Aware Development

**Problem:** Writing queries without knowing the schema leads to mistakes.

**With MCP (`postgres`):**

```
"Describe the schema of the orders table
and its foreign key relationships.
Then write a query that finds all orders
placed in the last 30 days where the payment
failed but the order status is still 'pending'.
Show me the query and explain why it's correct."
```

The AI knows your actual schema — no more guessing column names.

---

### 5. Living Documentation

**Problem:** Docs go stale the moment code changes.

**With MCP (`filesystem` + `git`):**

```
"Compare the current UserService.java
with its state 30 days ago using git.
Identify what changed in the public API.
Update the README section about UserService
to reflect the current behavior."
```

---

### 6. Incident Response

**Problem:** Production is down. You're scrambling.

**With MCP (`filesystem` + `github` + `fetch`):**

```
"1. Fetch the last 50 lines of /var/log/app/error.log
2. Search the codebase for the exception class name in the logs
3. Find the git commit that last modified that file
4. Open a GitHub issue titled 'Incident 2026-05-16: [error name]'
   with the log excerpt, the responsible commit, and a link
   to the file"
```

One command. The AI investigates and creates the incident record.

---

### 7. Dependency & Library Help

**Problem:** Library docs are outdated in the AI's training data.

**With MCP (`context7`):**

Context7 fetches real-time, version-specific documentation before answering.

```
"Using context7, show me the current API for
React Query v5's useInfiniteQuery hook.
Then refactor this component [paste component]
to use the correct v5 syntax."
```

Context7 resolves the library, fetches current docs, and the AI gives you answers that match your actual installed version — not what it learned 18 months ago.

---

### 8. Infrastructure Management

**With MCP (`docker` + `filesystem`):**

```
"List all running Docker containers.
For any container using more than 500MB RAM,
show me its docker-compose.yml entry.
Suggest memory limits I should add."
```

```
"My postgres container keeps crashing.
Fetch its last 100 log lines,
identify the error pattern,
and write a fix to the docker-compose.yml."
```

---

## MCP Prompt Patterns

These patterns work across any AI client that supports MCP:

### The Investigate Pattern
```
"Look at [file/repo/database/logs].
Find [problem/pattern/anomaly].
Explain what you found."
```

### The Act-and-Report Pattern
```
"[Do action X].
Then [do action Y based on the result].
Report what you did and what changed."
```

### The Refactor Pattern
```
"Read [file].
The current implementation has [problem].
Refactor it to [goal].
Write the updated file.
Then run git diff to show what changed."
```

### The Review Pattern
```
"Read [PR/branch/file].
Review it for [criteria].
Post a comment on [GitHub issue/PR/Slack] with your findings."
```

### The Sync Pattern
```
"Read [source of truth: DB schema / API spec / codebase].
Compare it with [documentation / tests / other file].
List everything that is out of sync.
Update [the outdated file] to match."
```

---

## Building Your Own MCP Server

When no existing server fits your use case, you can build one. An MCP server is just a process that speaks JSON-RPC. The SDK makes it straightforward.

### Python Example — Internal Metrics Server

```python
# metrics_mcp_server.py
from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import Tool, TextContent
import httpx

app = Server("metrics-server")

@app.list_tools()
async def list_tools():
    return [
        Tool(
            name="get_service_latency",
            description="Get p50/p95/p99 latency for a service in the last N minutes",
            inputSchema={
                "type": "object",
                "properties": {
                    "service": {"type": "string", "description": "Service name"},
                    "minutes": {"type": "integer", "description": "Lookback window"},
                },
                "required": ["service", "minutes"]
            }
        ),
        Tool(
            name="get_error_rate",
            description="Get current error rate percentage for a service",
            inputSchema={
                "type": "object",
                "properties": {"service": {"type": "string"}},
                "required": ["service"]
            }
        )
    ]

@app.call_tool()
async def call_tool(name: str, arguments: dict):
    if name == "get_service_latency":
        # Replace with your actual metrics API (Datadog, Prometheus, etc.)
        async with httpx.AsyncClient() as client:
            resp = await client.get(
                f"http://prometheus:9090/api/v1/query",
                params={"query": f'histogram_quantile(0.95, rate(http_request_duration_seconds_bucket{{service="{arguments["service"]}"}}[{arguments["minutes"]}m]))'}
            )
            data = resp.json()
            value = data["data"]["result"][0]["value"][1] if data["data"]["result"] else "no data"
            return [TextContent(type="text", text=f"p95 latency for {arguments['service']}: {value}s")]

    if name == "get_error_rate":
        # Replace with your metrics query
        return [TextContent(type="text", text=f"Error rate for {arguments['service']}: 0.3%")]

async def main():
    async with stdio_server() as (read_stream, write_stream):
        await app.run(read_stream, write_stream, app.create_initialization_options())

if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
```

**Register in config:**
```json
{
  "mcpServers": {
    "metrics": {
      "command": "python3",
      "args": ["/path/to/metrics_mcp_server.py"]
    }
  }
}
```

**Now you can ask:**
```
"Get the p95 latency for the payment-service
over the last 30 minutes.
If it's above 500ms, open a GitHub issue."
```

### TypeScript / Node Example — Jira + Slack Bridge

```typescript
// custom-pm-server.ts
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

const server = new Server(
  { name: "custom-pm", version: "1.0.0" },
  { capabilities: { tools: {} } }
);

server.setRequestHandler("tools/list", async () => ({
  tools: [
    {
      name: "create_jira_and_notify",
      description: "Create a Jira ticket and post Slack notification",
      inputSchema: {
        type: "object",
        properties: {
          summary: { type: "string" },
          description: { type: "string" },
          priority: { type: "string", enum: ["Low", "Medium", "High", "Critical"] },
          slack_channel: { type: "string" }
        },
        required: ["summary", "description", "priority", "slack_channel"]
      }
    }
  ]
}));

server.setRequestHandler("tools/call", async (request) => {
  const { name, arguments: args } = request.params;

  if (name === "create_jira_and_notify") {
    // Create Jira ticket
    const jiraResp = await fetch(`${process.env.JIRA_URL}/rest/api/3/issue`, {
      method: "POST",
      headers: {
        "Authorization": `Basic ${Buffer.from(`${process.env.JIRA_EMAIL}:${process.env.JIRA_TOKEN}`).toString("base64")}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        fields: {
          project: { key: process.env.JIRA_PROJECT },
          summary: args.summary,
          description: { type: "doc", version: 1, content: [{ type: "paragraph", content: [{ type: "text", text: args.description }] }] },
          issuetype: { name: "Bug" },
          priority: { name: args.priority }
        }
      })
    });
    const jiraIssue = await jiraResp.json();

    // Post Slack notification
    await fetch("https://slack.com/api/chat.postMessage", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${process.env.SLACK_TOKEN}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        channel: args.slack_channel,
        text: `🐛 *${args.priority} Issue Created*: <${process.env.JIRA_URL}/browse/${jiraIssue.key}|${jiraIssue.key}> — ${args.summary}`
      })
    });

    return {
      content: [{ type: "text", text: `Created ${jiraIssue.key} and notified #${args.slack_channel}` }]
    };
  }
});

const transport = new StdioServerTransport();
await server.connect(transport);
```

---

## Security Rules for MCP

MCP gives the AI real access to real systems. Treat it like you treat API keys.

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#b71c1c', 'primaryTextColor': '#fff', 'lineColor': '#ef5350', 'clusterBkg': '#2a1a1a',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
flowchart TD
    classDef danger fill:#b71c1c,stroke:#7f0000,color:#fff
    classDef ok     fill:#1b5e20,stroke:#003300,color:#fff
    classDef warn   fill:#e65100,stroke:#bf360c,color:#fff

    A[MCP Server Access]

    A --> B[Filesystem]:::warn
    A --> C[Database]:::danger
    A --> D[GitHub]:::warn
    A --> E[Slack / Email]:::danger

    B --> B1[✓ Limit to<br/>project dir only]:::ok
    B --> B2[✗ Never give<br/>/ root access]:::danger

    C --> C1[✓ Read-only<br/>replica user]:::ok
    C --> C2[✗ Never use<br/>admin user]:::danger

    D --> D1[✓ Fine-grained<br/>token per repo]:::ok
    D --> D2[✗ Never use<br/>org-wide token]:::danger

    E --> E1[✓ Bot token with<br/>specific channels]:::ok
    E --> E2[✗ Never use<br/>personal token]:::danger
```

**The five MCP security rules:**

```
1. MINIMUM SCOPE
   Filesystem server: point to /project, not /home or /
   GitHub token: fine-grained, only the repos you need
   DB user: CREATE USER mcp_reader WITH readonly privileges

2. SEPARATE CREDENTIALS
   Never reuse your personal tokens for MCP servers
   Create dedicated service accounts for each server

3. NO PRODUCTION WRITE ACCESS
   Dev/staging DBs: read + write OK
   Production DB: read-only replica only
   Production infra: NEVER give MCP write access

4. REVIEW BEFORE DESTRUCTIVE ACTIONS
   For any tool that deletes, modifies, or publishes:
   ask the AI to show you the action first, then confirm

5. ROTATE REGULARLY
   MCP credentials in config files get committed accidentally
   Use environment variables, not hardcoded secrets
   Add claude_desktop_config.json to .gitignore
```

---

## MCP vs Traditional Integrations

| Approach | Setup Time | Flexibility | Maintenance | Context Awareness |
| :--- | :--- | :--- | :--- | :--- |
| Copy-paste into chat | 0 min | None | None | Manual |
| Shell scripts | Hours | Fixed | High | None |
| Custom API integrations | Days | Medium | High | None |
| **MCP** | **Minutes** | **Dynamic** | **Low** | **Full** |

The MCP advantage isn't just convenience — it's **context awareness**. A shell script that creates a GitHub issue can't read your codebase to write a good description. An MCP-powered AI can.

---

## The MCP Development Workflow

```
Daily development loop with MCP active:

┌─────────────────────────────────────────────┐
│  Morning standup                            │
│  "Show me open PRs assigned to me           │
│   and any failing CI runs"      [github]    │
│                                             │
│  During coding                              │
│  "How does this library method work?"       │
│                                 [context7]  │
│  "What does our UserRepo.save() do?"        │
│                              [filesystem]   │
│                                             │
│  Code review                                │
│  "Review PR #142 and post comment"          │
│                                 [github]    │
│                                             │
│  Bug investigation                          │
│  "Search logs for OOM errors today"         │
│                              [filesystem]   │
│  "Which query is causing slow response?"    │
│                                [postgres]   │
│                                             │
│  End of day                                 │
│  "Create issue for the TODO I left in       │
│   auth.ts line 42"             [github]     │
└─────────────────────────────────────────────┘
```

---

## Quick Setup Checklist

```
□ 1. Install Node.js (MCP servers use npx)
      node --version  →  v18+ required

□ 2. Get your tokens:
      GitHub:   Settings → Developer settings → Personal access tokens
      Postgres: CREATE USER mcp_user WITH PASSWORD '...' readonly
      Jira:     Profile → Manage account → Security → API tokens
      Slack:    api.slack.com/apps → Create app → Bot token

□ 3. Create config file:
      Claude Desktop: ~/.claude/claude_desktop_config.json
      Claude Code:    .claude/settings.json
      Cursor:         ~/.cursor/mcp.json

□ 4. Add filesystem server first (safest, no credentials):
      Restart app, verify tool icons appear in UI

□ 5. Test with a safe read-only prompt:
      "List the files in the src/ directory"

□ 6. Add one server at a time, test each before adding next

□ 7. Add config file to .gitignore if it contains tokens:
      echo "claude_desktop_config.json" >> .gitignore
```

---

## Advanced MCP Orchestration Patterns

Once you have the basics working, MCP becomes exponentially more powerful when you chain tools together into multi-step workflows. These patterns move MCP from "useful" to "I can't imagine going back."

### Pattern 1 — Conditional Branch Execution

```
"Check the current error rate for the payment-service [metrics].
If it is above 2%, do the following:
  1. Fetch the last 200 lines of /var/log/payment-service/error.log [filesystem]
  2. Search the codebase for the top exception class found in the logs [filesystem]
  3. Find the git commit that last touched that file [git]
  4. Create a GitHub incident issue with: the error rate, the log excerpt,
     the responsible commit hash, and the file path [github]
  5. Post a summary to #alerts on Slack [slack]
If the error rate is below 2%, just reply 'All good.'"
```

This is a **conditional workflow** — the AI evaluates state and chooses a branch. No scripting required.

---

### Pattern 2 — Cross-System Sync

```
"Read the OpenAPI spec at /api/openapi.yaml [filesystem].
List all endpoints defined there.
Then search the codebase in /src/controllers/ for each endpoint [filesystem].
For any endpoint in the spec that has no matching controller file,
  - Add it to a markdown table: | Endpoint | HTTP Method | Missing Since (git blame) |
  - Create a GitHub issue titled 'Missing controller: [endpoint]' [github]
Write the full table to /docs/api-gaps.md [filesystem]."
```

One prompt audits your entire API contract automatically.

---

### Pattern 3 — Scheduled Intelligence (via Claude Code)

You can run Claude Code as a cron job with an MCP-enabled prompt to get automated daily engineering reports:

```bash
# crontab -e
0 9 * * 1-5 claude -p "
  Check all open GitHub PRs older than 3 days [github].
  For each: get the author, title, and number of review comments.
  Format as a markdown table.
  Post the table to the #dev-standup Slack channel [slack]
  with the message 'Good morning! Here are PRs needing attention:'
" >> /var/log/mcp-standup.log 2>&1
```

Your team gets an automated daily PR digest every weekday at 9 AM — no Jira dashboard required.

---

### Pattern 4 — Multi-Repo Intelligence

```
"I need to understand how authentication flows across our microservices.
List all repositories in the 'myorg' GitHub org [github].
For each repo that contains a file named auth.ts or auth.py [github]:
  - Read that file [filesystem or github]
  - Extract: what auth strategy is used (JWT / OAuth / session)
  - Note any hardcoded secrets or TODO comments
Compile a summary table: | Repo | Auth Strategy | Issues Found |
Then open one consolidated GitHub issue in myorg/security-review
listing every issue found."
```

This is an org-wide security audit in a single prompt.

---

### Pattern 5 — Test-First Development Loop

```
"Read the failing test in /tests/payment/refund_test.py [filesystem].
Understand what the test expects.
Find the current implementation of the refund() function [filesystem].
Identify why the test is failing.
Write a fix to the implementation file.
Run 'python -m pytest tests/payment/refund_test.py -v' [terminal / filesystem].
If the test still fails, iterate up to 3 times.
Once passing, run git diff and show me what changed."
```

The AI becomes a TDD pair programmer — it doesn't stop until the tests are green.

---

## Debugging MCP Servers

MCP servers can fail silently. Here's how to diagnose issues quickly.

### Checking Server Status

**Claude Desktop** shows server status in the UI — look for the tool count in the bottom-left of the chat. If it shows 0 tools or a red indicator, a server failed to start.

**Claude Code CLI** — run with verbose logging:

```bash
claude --mcp-debug
```

This prints JSON-RPC messages exchanged with each server, which reveals exactly which tool calls succeed or fail.

---

### Common Failure Modes

```
┌──────────────────────────────────────────────────────────────────┐
│  SYMPTOM                  LIKELY CAUSE           FIX             │
├──────────────────────────────────────────────────────────────────┤
│  Tools not appearing      Server didn't start    Check command   │
│  in the UI                (bad path, no node)    path & deps     │
│                                                                  │
│  "Permission denied"      Filesystem path        Expand allowed  │
│  errors                   not whitelisted        directories     │
│                                                                  │
│  "Unauthorized" on        Wrong or expired       Rotate your     │
│  GitHub/Jira calls        API token              token           │
│                                                                  │
│  DB queries fail          Wrong connection       Check port,     │
│                           string                 user, pw        │
│                                                                  │
│  Server crashes on        Bug in custom          Add try/catch,  │
│  certain tool calls       server code            log errors      │
│                                                                  │
│  Slow responses           Tool fetching too      Limit data      │
│                           much data              (add LIMIT,     │
│                                                   line ranges)   │
└──────────────────────────────────────────────────────────────────┘
```

---

### Testing a Server Manually

You can test any MCP server with `npx @modelcontextprotocol/inspector`:

```bash
npx @modelcontextprotocol/inspector \
  npx -y @modelcontextprotocol/server-filesystem /your/project
```

This opens a browser UI where you can call tools directly and see raw responses — essential for debugging custom servers before connecting them to an AI client.

---

### Logging in Custom Servers

Always write logs to **stderr**, not stdout. MCP communication happens on stdout — anything you write there will corrupt the protocol.

**Python:**
```python
import sys
import logging

logging.basicConfig(stream=sys.stderr, level=logging.DEBUG)
logger = logging.getLogger(__name__)

@app.call_tool()
async def call_tool(name: str, arguments: dict):
    logger.debug(f"Tool called: {name}, args: {arguments}")
    try:
        result = await do_work(name, arguments)
        logger.debug(f"Tool succeeded: {result}")
        return result
    except Exception as e:
        logger.error(f"Tool failed: {e}", exc_info=True)
        raise
```

**TypeScript:**
```typescript
server.setRequestHandler("tools/call", async (request) => {
  process.stderr.write(`[MCP] Tool called: ${request.params.name}\n`);
  try {
    const result = await handleTool(request.params);
    process.stderr.write(`[MCP] Tool succeeded\n`);
    return result;
  } catch (error) {
    process.stderr.write(`[MCP] Tool failed: ${error}\n`);
    throw error;
  }
});
```

Read the logs with:
```bash
# Claude Desktop logs on macOS
tail -f ~/Library/Logs/Claude/mcp-server-*.log
```

---

## MCP in CI/CD Pipelines

MCP isn't limited to your local machine. You can run Claude Code with MCP in GitHub Actions, GitLab CI, or any CI system to automate engineering tasks at scale.

### GitHub Actions — Automated PR Review

```yaml
# .github/workflows/ai-review.yml
name: AI Code Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  ai-review:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install Claude Code
        run: npm install -g @anthropic-ai/claude-code

      - name: Configure MCP servers
        run: |
          mkdir -p .claude
          cat > .claude/settings.json << 'EOF'
          {
            "mcpServers": {
              "filesystem": {
                "command": "npx",
                "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
              },
              "github": {
                "command": "npx",
                "args": ["-y", "@modelcontextprotocol/server-github"],
                "env": {
                  "GITHUB_PERSONAL_ACCESS_TOKEN": "${{ secrets.GITHUB_TOKEN }}"
                }
              }
            }
          }
          EOF

      - name: Run AI review
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          PR_NUMBER: ${{ github.event.pull_request.number }}
          REPO: ${{ github.repository }}
        run: |
          claude -p "
          Read the diff of PR #${PR_NUMBER} in ${REPO} [github].
          Review for:
          1. Security issues (OWASP Top 10)
          2. Missing error handling
          3. Breaking API changes
          4. Test coverage gaps
          Post your findings as a PR review comment on PR #${PR_NUMBER} [github].
          Use bullet points. Be specific with file:line references.
          "
```

---

### GitHub Actions — Auto-Documentation Sync

```yaml
# .github/workflows/doc-sync.yml
name: Sync Docs on Merge

on:
  push:
    branches: [main]
    paths:
      - 'src/**/*.ts'
      - 'src/**/*.py'

jobs:
  sync-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Update API documentation
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
        run: |
          claude -p "
          List all files changed in the last commit [git].
          For each changed file in src/:
            - Read the file [filesystem]
            - Find the corresponding doc in docs/ [filesystem]
            - If the doc is outdated relative to the code, update it
            - If no doc exists, create one
          Then run: git add docs/ && git commit -m 'docs: auto-sync from source [skip ci]'
          "
```

---

### CI Best Practices for MCP

```
✓ Use GitHub Actions secrets for all tokens — never hardcode
✓ Create a dedicated CI bot account (not a personal token)
✓ Give the CI bot read-only access unless it must write (e.g., post comments)
✓ Pin MCP server versions in CI (use exact npm versions, not -y latest)
✓ Add timeout limits to Claude commands (--timeout 300)
✓ Gate AI actions behind approval for destructive operations
✗ Don't give CI MCP access to production databases
✗ Don't let CI auto-merge PRs based on AI review alone
```

---

## Team Adoption Playbook

Introducing MCP to a skeptical team requires the right rollout strategy. Here's what works.

### Week 1: Individual Exploration (No Team Buy-In Needed)

Start solo. Add `filesystem` + `github` to your personal setup. Use it for 5 days on real tasks:

```
Day 1: "Explore the codebase I just joined" [filesystem + git]
Day 2: "Review this PR and summarize the changes" [github]
Day 3: "Find all places where we make HTTP calls without timeout" [filesystem]
Day 4: "Create GitHub issues for all TODO comments in the payment module" [filesystem + github]
Day 5: "Generate a changelog for this sprint from merged PRs" [github]
```

Keep a personal log of time saved. You'll need the data.

---

### Week 2: Show, Don't Tell

Run a 20-minute demo for your team. Use a real task from your actual codebase, not a toy example. Pick one that's immediately recognizable as valuable:

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#4a148c', 'primaryTextColor': '#fff', 'lineColor': '#9c27b0', 'clusterBkg': '#1a1a2a',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
flowchart LR
    classDef step fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef good fill:#1b5e20,stroke:#003300,color:#fff

    A["🔴 Real problem<br/>team faces daily"]:::step
    B["🔧 Live MCP demo<br/>actual codebase"]:::step
    C["⏱ Time taken:<br/>before vs. after"]:::step
    D["🙋 Q&A + let<br/>them try it<br/>live"]:::step
    E["📋 Share config<br/>template to copy"]:::good

    A --> B --> C --> D --> E
```

**High-impact demo topics:**
- Instant codebase onboarding for a new joiner (read + summarize key files)
- Automated PR description generation from git diff
- Finding all API calls without auth headers across the repo
- Live schema-aware SQL query writing

---

### Week 3: Team Config Standardization

Create a shared MCP config file in the repo. Let each engineer opt in by copying it:

```
project-root/
├── .claude/
│   ├── settings.json          # Team-shared MCP config (committed)
│   ├── settings.local.json    # Personal overrides (gitignored)
│   └── CLAUDE.md              # Project context for the AI
└── .gitignore                 # Must include settings.local.json
```

**`.claude/settings.json`** (committed — no secrets):
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest", "."]
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

**`.claude/settings.local.json`** (gitignored — personal tokens):
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github@latest"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_your_personal_token"
      }
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres@latest",
               "postgresql://mcp_reader:pass@localhost/mydb"]
    }
  }
}
```

---

### `CLAUDE.md` — The Project Intelligence File

One of MCP's most underused features is `CLAUDE.md`. Place this file in your project root and Claude reads it automatically at the start of every session. It's the AI's briefing document.

```markdown
# Project: PaymentService

## Architecture
- Language: Java 21 + Spring Boot 3.2
- DB: PostgreSQL 16 (read replica at postgres-read:5432)
- Message queue: Kafka (payment.events, refund.events topics)
- Auth: JWT via gateway, user ID in X-User-Id header

## Key Files
- src/main/java/com/myco/payment/PaymentService.java — core logic
- src/main/java/com/myco/payment/RefundProcessor.java — refund flow
- docs/api/openapi.yaml — API contract (source of truth)
- .env.example — environment variable reference

## Conventions
- Services are named *Service.java
- DTOs are in com.myco.payment.dto.*
- All DB queries go through Repository classes (never raw JPA in services)
- Error handling: throw PaymentException with PaymentErrorCode enum

## Current Sprint Focus
- Implementing split-payment support (see GitHub issue #445)
- Migration from PaymentV1 to PaymentV2 API (breaking changes in v2)

## Do Not Touch
- LegacyPaymentAdapter.java — kept for backward compat, will be removed in Q3
- The 'transactions' table — schema locked, migration in progress
```

With `CLAUDE.md` in place, you don't have to re-explain your project in every session. The AI arrives already oriented.

---

### Measuring Adoption Success

Track these metrics to prove ROI to your team lead or engineering manager:

| Metric | How to Measure |
| :--- | :--- |
| PR review turnaround time | GitHub API: time from PR opened → first review |
| Time to onboard new engineers | Survey: days until first solo PR |
| Documentation freshness | % of docs updated within 7 days of code change |
| Bug escape rate | Bugs found in prod vs. caught in PR review |
| Time on boilerplate tasks | Self-reported: hours/week on repetitive work |

---

## Common Pitfalls and How to Avoid Them

These are the mistakes most teams make in the first month of MCP adoption.

### Pitfall 1 — Giving Too Much Access Too Fast

**What happens:** You give filesystem access to `/`, the AI reads your SSH keys, AWS credentials, or `.env` files with real secrets.

**Fix:**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y", "@modelcontextprotocol/server-filesystem",
        "/Users/chamrong/projects/myapp",   ← specific project dir only
        "/Users/chamrong/projects/myapp/docs"
      ]
    }
  }
}
```

Always scope the filesystem server to the minimum directory needed.

---

### Pitfall 2 — Letting the AI Write Directly to Main

**What happens:** You ask the AI to "fix the bug and update the file." It edits production-branch files without a PR. The change ships unreviewed.

**Fix — always use a branch workflow:**
```
"Create a new git branch named 'fix/refund-calculation' [git].
Make the fix to RefundProcessor.java [filesystem].
Commit with message 'fix: correct refund amount calculation' [git].
Open a GitHub PR from that branch to main [github]."
```

Never let MCP write directly to main without a PR review.

---

### Pitfall 3 — Context Window Bloat

**What happens:** You ask the AI to "read all files in the repo." It reads 500 files, fills the context window, and either hallucinates or truncates important content.

**Fix — be specific about scope:**
```
# BAD
"Read the entire codebase and find security issues"

# GOOD
"Search for all uses of exec() and eval() in the src/ directory [filesystem].
For each occurrence, read the 10 lines around it and assess the risk.
Limit to the top 20 highest-risk findings."
```

Use `search_files` to narrow scope before `read_file`. Think like a surgeon, not a vacuum.

---

### Pitfall 4 — Stale Tool Assumptions

**What happens:** The AI "knows" a library from its training data and ignores what `context7` would fetch. It uses deprecated APIs.

**Fix — explicitly invoke context7 when working with libraries:**
```
# BAD (relies on training data)
"Write a React Query hook for paginated data"

# GOOD (forces current docs)
"Using context7, fetch the current React Query v5 docs for useInfiniteQuery.
Then write a hook for paginated API calls using the correct v5 syntax."
```

---

### Pitfall 5 — No Rollback Plan

**What happens:** The AI writes 15 files, something breaks, and you can't easily undo it.

**Fix — always start a git checkpoint:**
```
# Before any large AI-driven change:
"Before making any changes, run: git stash && git checkout -b ai/refactor-session-$(date +%Y%m%d) [git].
Now proceed with the refactor.
At the end, run git diff HEAD~1 to show all changes [git]."
```

Or simply run `git stash` manually before large AI sessions.

---

### Pitfall 6 — Prompt Drift in Long Sessions

**What happens:** In a long conversation, the AI "forgets" early constraints and starts making different choices — different naming conventions, different error handling patterns — than it started with.

**Fix — anchor constraints in `CLAUDE.md` and re-state them for large tasks:**
```
"Referring to the conventions in CLAUDE.md:
- All services must extend BaseService
- Errors must use PaymentErrorCode enum
- No raw SQL: use repositories only

Implement the split-payment feature [filesystem].
After each file you write, confirm it follows the above conventions."
```

---

## Real-World MCP Recipes

A curated collection of copy-paste-ready prompts for common engineering situations.

### Recipe 1 — Daily Standup Brief
```
"Generate my standup update:
1. Show me commits I made in the last 24 hours [git]
2. Show PRs I opened or commented on [github]
3. Show any issues assigned to me that changed status [github]
Format as a concise bullet-point standup: what I did, what I'm doing next, any blockers."
```

---

### Recipe 2 — Pre-Merge Checklist
```
"Before I merge PR #[NUM] on [org/repo]:
1. Verify all CI checks passed [github]
2. Confirm the PR has at least 1 approval [github]
3. Check if any files changed are also changed in another open PR (conflict risk) [github]
4. Read the diff and confirm no TODO/FIXME/console.log/debugger statements remain [github]
5. Verify the PR description is complete (has a What/Why/How section) [github]
Report each check as ✓ or ✗ with a reason."
```

---

### Recipe 3 — Dependency Audit
```
"Read package.json (or requirements.txt / pom.xml) [filesystem].
For each dependency:
1. Search the codebase to confirm it is actually used [filesystem]
2. Flag any dependency that is listed but not imported anywhere
3. Flag any dependency that is a security risk (using brave-search [brave-search])
Output: a markdown table with | Package | Used? | Risk? | Recommendation |"
```

---

### Recipe 4 — Onboarding a New Codebase
```
"I just joined this project. Help me understand it in 10 minutes.
1. Read the README [filesystem]
2. List the top-level directory structure [filesystem]
3. Find the main entry point (main.go / index.ts / Application.java) [filesystem]
4. Read the last 20 git commits and summarize recent work [git]
5. List open GitHub issues labeled 'good-first-issue' [github]
Give me: architecture overview, key files map, recent context, where to start."
```

---

### Recipe 5 — Performance Regression Hunt
```
"We have a performance regression. Here's what I know: [describe symptom].
1. Search git log for commits in the last 2 weeks that touched [affected module] [git]
2. For the 3 most recent commits, read the diff [git]
3. Query the DB for slow queries (>500ms) in the last hour [postgres]
4. Read the current implementation of [affected function] [filesystem]
Identify the most likely cause and suggest a fix."
```

---

### Recipe 6 — Release Notes Generator
```
"Generate release notes for v[X.Y.Z]:
1. Get all commits between tag v[X.Y.0] and HEAD [git]
2. Group by type: Features (feat:), Bug Fixes (fix:), Breaking Changes (BREAKING:)
3. For each commit, read the associated GitHub PR (if linked) for more context [github]
4. Write the release notes in the style of our existing CHANGELOG.md [filesystem]
5. Append the new section to CHANGELOG.md [filesystem]"
```

---

### Recipe 7 — Security Audit
```
"Run a security audit on the authentication module:
1. Find all files in src/ that handle auth, tokens, or passwords [filesystem]
2. Read each file [filesystem]
3. Check for:
   - Hardcoded secrets or API keys
   - JWT tokens without expiry
   - Passwords stored in plain text or with weak hashing
   - Missing CORS / rate limiting
   - SQL injection risks (string interpolation in queries)
4. For each finding, note the file, line range, risk level (Critical/High/Medium)
5. Create one GitHub issue per Critical or High finding [github]"
```

---

### Recipe 8 — Test Gap Analysis
```
"Analyze test coverage gaps:
1. List all files in src/ [filesystem]
2. List all files in tests/ [filesystem]
3. For each source file, find its corresponding test file
4. For source files with no tests, read the file and generate a list of
   what should be tested (public methods, edge cases, error paths)
5. Create GitHub issues for the top 5 most critical missing test files [github]
Output a coverage map table: | Source File | Has Tests? | Risk if Untested |"
```

---

## The Bigger Picture: Where MCP Is Heading

MCP was released by Anthropic in November 2024. As of mid-2026, the ecosystem has grown to thousands of servers and is being adopted by every major AI coding tool — Cursor, Windsurf, GitHub Copilot, JetBrains AI, and others.

The trajectory is clear:

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#fff', 'lineColor': '#29b6f6',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
timeline
    title MCP Adoption
    2024 Q4 : MCP open standard by Anthropic
             : filesystem, github, postgres servers
    2025 Q1  : Cursor adds MCP support
             : 500+ community servers
    2025 Q2  : Claude Code CLI released
             : Enterprise adoption begins
    2025 Q4  : GitHub Copilot adds MCP
             : JetBrains AI integrates MCP
    2026 Q1  : MCP becomes de facto standard
             : All major IDEs integrated
    2026 Q2  : Enterprise MCP registries
             : Internal server ecosystems
```

**What this means for you:**

- MCP skills are **transferable** — the same config works across Claude, Cursor, Copilot, and future tools
- The server ecosystem means you rarely need to build your own — someone has already written the server you need
- **MCP is becoming the API layer for AI** the same way REST became the API layer for web services

The engineers who build fluency with MCP now will have a structural advantage as the ecosystem matures. The tools will keep getting better; your ability to leverage them is the variable.

---

## Beyond Tools: Resources and Prompts

Most engineers only discover MCP's **Tools** primitive — the ability to call functions like `read_file` or `create_issue`. But MCP has two other primitives that unlock entirely different capabilities.

### The Three MCP Primitives

```
┌─────────────────────────────────────────────────────────────────────┐
│  PRIMITIVE    WHAT IT IS                   EXAMPLE USE CASE         │
├─────────────────────────────────────────────────────────────────────┤
│  Tools        Functions the AI calls       read_file, create_issue  │
│               (with arguments)             query_db, send_message   │
│                                                                     │
│  Resources    URI-addressable data the     file://src/main.java     │
│               AI can read like context     db://schema/orders       │
│                                            git://log/last-30-days   │
│                                                                     │
│  Prompts      Pre-built prompt templates   "review-pr" template     │
│               the AI can invoke by name    "generate-changelog"     │
│                                            "explain-architecture"   │
└─────────────────────────────────────────────────────────────────────┘
```

---

### Resources — URI-Addressable Context

Resources let an MCP server expose data that the AI can pull into its context window by URI — without having to call a tool. Think of them as "live documents" the AI can reference.

**Example: exposing your architecture doc as a resource:**

```python
# In your custom MCP server
@app.list_resources()
async def list_resources():
    return [
        Resource(
            uri="docs://architecture/overview",
            name="Architecture Overview",
            description="Current system architecture, component relationships, and decision log",
            mimeType="text/markdown"
        ),
        Resource(
            uri="db://schema/current",
            name="Live DB Schema",
            description="Current PostgreSQL schema for all tables",
            mimeType="text/plain"
        ),
        Resource(
            uri="metrics://dashboard/slo",
            name="Current SLO Status",
            description="Real-time SLO compliance for all services",
            mimeType="application/json"
        )
    ]

@app.read_resource()
async def read_resource(uri: str):
    if uri == "docs://architecture/overview":
        with open("/docs/architecture.md") as f:
            return [TextResourceContents(uri=uri, text=f.read(), mimeType="text/markdown")]

    if uri == "db://schema/current":
        async with db_pool.acquire() as conn:
            rows = await conn.fetch("""
                SELECT table_name, column_name, data_type
                FROM information_schema.columns
                WHERE table_schema = 'public'
                ORDER BY table_name, ordinal_position
            """)
            schema_text = "\n".join(f"{r['table_name']}.{r['column_name']}: {r['data_type']}" for r in rows)
            return [TextResourceContents(uri=uri, text=schema_text, mimeType="text/plain")]
```

Now the AI can reference `db://schema/current` as context before writing any query — automatically using the real schema without you pasting it.

---

### Prompts — Reusable AI Workflows

Prompts let you define named, parameterized prompt templates inside your MCP server. Your team can invoke these by name instead of typing long prompts from scratch.

**Example: a team-standard PR review prompt:**

```python
@app.list_prompts()
async def list_prompts():
    return [
        Prompt(
            name="review-pr",
            description="Perform a structured code review on a GitHub PR",
            arguments=[
                PromptArgument(name="pr_number", description="PR number", required=True),
                PromptArgument(name="repo", description="org/repo format", required=True),
                PromptArgument(name="focus", description="security|performance|style|all", required=False)
            ]
        ),
        Prompt(
            name="generate-adr",
            description="Generate an Architecture Decision Record for a technical decision",
            arguments=[
                PromptArgument(name="decision", description="The decision being made", required=True),
                PromptArgument(name="context", description="Why this decision is needed", required=True)
            ]
        )
    ]

@app.get_prompt()
async def get_prompt(name: str, arguments: dict):
    if name == "review-pr":
        focus = arguments.get("focus", "all")
        focus_instructions = {
            "security": "Focus exclusively on OWASP Top 10, injection risks, and auth issues.",
            "performance": "Focus on N+1 queries, memory leaks, and algorithmic complexity.",
            "style": "Focus on naming, consistency with the codebase, and readability.",
            "all": "Review for security (OWASP Top 10), performance, missing error handling, and style."
        }.get(focus, "Review for all issue categories.")

        return GetPromptResult(
            description=f"Review PR #{arguments['pr_number']}",
            messages=[
                PromptMessage(
                    role="user",
                    content=TextContent(type="text", text=f"""
Read the diff of PR #{arguments['pr_number']} in {arguments['repo']}.
{focus_instructions}
For each issue found:
- State the file and line number
- Explain the problem clearly
- Suggest the specific fix

Post your review as a GitHub PR comment on PR #{arguments['pr_number']}.
End with a summary: APPROVE / REQUEST CHANGES / COMMENT.
                    """.strip())
                )
            ]
        )
```

Teams can then trigger this with `/review-pr 142 myorg/backend focus=security` — no copy-pasting, no inconsistency.

---

## Performance Tuning Your MCP Setup

MCP can be slow if you're not careful about how tools fetch data. These optimizations matter at scale.

### 1. Scope Every Tool Call

The single biggest performance win: never fetch more data than you need.

```
# SLOW — reads entire 50,000-line codebase
"Read all files in the project and find auth issues"

# FAST — targeted search first, then read only what's relevant
"Search for 'password' and 'token' and 'secret' across all .ts files.
For each match found, read only the 20 lines surrounding it."
```

The difference: seconds vs. minutes, and better answers because the context window isn't polluted.

---

### 2. Use Pagination for Large Data Sets

When querying databases or listing large directories, always add limits:

```
"List the 10 most recent orders in the orders table [postgres].
If you need more, ask me before fetching additional rows."

"List files in /src — show only directory names at the top level first.
I'll ask you to drill into specific directories."
```

---

### 3. Run Servers Locally, Not Over Network

Prefer stdio-based MCP servers (local process) over HTTP-based ones when latency matters. The filesystem and git servers run locally in milliseconds. HTTP-based servers add network round-trips for every tool call.

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
      // ✓ stdio: runs locally, zero network overhead
    },
    "remote-api": {
      "url": "https://my-mcp-server.example.com/mcp"
      // ↑ HTTP: adds latency per tool call — use only when necessary
    }
  }
}
```

---

### 4. Cache Expensive Reads in Custom Servers

If your custom server fetches from a slow external API, cache responses:

```python
import asyncio
from functools import lru_cache
from datetime import datetime, timedelta

_cache: dict = {}
_cache_ttl: dict = {}

async def get_with_cache(key: str, fetch_fn, ttl_seconds: int = 60):
    now = datetime.now()
    if key in _cache and _cache_ttl[key] > now:
        return _cache[key]

    result = await fetch_fn()
    _cache[key] = result
    _cache_ttl[key] = now + timedelta(seconds=ttl_seconds)
    return result

@app.call_tool()
async def call_tool(name: str, arguments: dict):
    if name == "get_slo_status":
        service = arguments["service"]
        return await get_with_cache(
            f"slo:{service}",
            lambda: fetch_slo_from_datadog(service),
            ttl_seconds=30  # Cache SLO data for 30 seconds
        )
```

---

### 5. Parallel Tool Calls

Modern MCP clients can execute multiple tool calls in parallel. Structure your prompts to take advantage of this:

```
# Sequential (slow — each waits for the previous)
"First, read auth.ts. Then read orders.ts. Then read payments.ts."

# Parallel (fast — AI fires all three simultaneously)
"Read auth.ts, orders.ts, and payments.ts simultaneously.
Then compare how each handles error responses."
```

Claude and Cursor both support parallel tool execution — phrasing matters.

---

## MCP with Local LLMs (Ollama)

You don't need to send your code to Anthropic's servers to use MCP. The protocol is model-agnostic — you can run it entirely on your own machine with a local LLM via Ollama.

### Setup: Ollama + MCP

```bash
# 1. Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 2. Pull a code-capable model
ollama pull qwen2.5-coder:32b   # 32B — best for code tasks
# or
ollama pull codellama:13b        # 13B — faster, lighter

# 3. Install an MCP-compatible local AI client
npm install -g @modelcontextprotocol/client-cli
```

### When to Use Local LLMs with MCP

| Scenario | Use Cloud (Claude) | Use Local (Ollama) |
| :--- | :---: | :---: |
| Sending proprietary code off-device | ✗ | ✓ |
| Air-gapped / offline environment | ✗ | ✓ |
| Maximum reasoning quality needed | ✓ | ✗ |
| High-volume repetitive tasks | ✗ (cost) | ✓ |
| Regulated industry (healthcare, finance) | Depends | ✓ |
| Fast iteration / best-in-class output | ✓ | ✗ |

### Practical Hybrid Approach

Use local models for **bulk/repetitive** tasks, cloud models for **complex reasoning**:

```
Local Ollama tasks (fast, free, private):
  - "Scan all 300 files for hardcoded secrets"
  - "Add JSDoc comments to every function in utils/"
  - "Convert all var declarations to const/let in legacy/"

Cloud Claude tasks (complex, context-heavy):
  - "Redesign this auth system to support OAuth2 + SAML"
  - "Debug why this race condition occurs under load"
  - "Architect the migration from monolith to microservices"
```

---

## Enterprise Governance for MCP

For organizations deploying MCP across multiple teams, ad-hoc configuration quickly becomes ungovernable. Here's a framework for managing MCP at scale.

### The Three-Tier Governance Model

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#1a237e', 'primaryTextColor': '#fff', 'lineColor': '#3f51b5', 'clusterBkg': '#1a1a2e',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
graph TD
    classDef platform fill:#1a237e,stroke:#283593,color:#fff
    classDef team     fill:#1b5e20,stroke:#2e7d32,color:#fff
    classDef dev      fill:#4a148c,stroke:#6a1b9a,color:#fff

    P["🏢 Platform Team<br/>Org-wide MCP servers<br/>Security policies<br/>Internal registry"]:::platform

    P --> T1["👥 Backend Team<br/>filesystem, git,<br/>github, postgres<br/>+ metrics-server"]:::team

    P --> T2["👥 Frontend Team<br/>filesystem, git,<br/>github, context7<br/>+ design-tokens"]:::team

    P --> T3["👥 Data Team<br/>postgres, sqlite,<br/>filesystem<br/>+ dbt, airflow"]:::team

    T1 --> D1["👤 Individual Dev<br/>Personal tokens<br/>Local overrides<br/>settings.local.json"]:::dev
    T2 --> D1
    T3 --> D1
```

---

### Internal MCP Server Registry

Large teams should maintain a private registry of approved, vetted MCP servers — similar to a private npm registry. This prevents every developer from pulling arbitrary servers from the internet.

**Registry structure:**

```
internal-mcp-registry/
├── registry.json              # Approved servers catalog
├── servers/
│   ├── metrics-server/        # Internal Datadog/Prometheus bridge
│   │   ├── Dockerfile
│   │   ├── index.ts
│   │   └── README.md
│   ├── jira-bridge/           # Custom Jira integration
│   ├── deployment-server/     # Kubernetes deployment tools
│   └── compliance-checker/    # SOC2/GDPR compliance tools
└── policies/
    ├── approved-external.json  # Vetted public npm servers
    └── forbidden-actions.md    # Things MCP must never do
```

**`registry.json`:**
```json
{
  "version": "1.0",
  "approved": [
    {
      "name": "filesystem",
      "package": "@modelcontextprotocol/server-filesystem",
      "version": "0.6.2",
      "scope": "project-dir-only",
      "requiresApproval": false
    },
    {
      "name": "github",
      "package": "@modelcontextprotocol/server-github",
      "version": "0.6.2",
      "tokenScope": "fine-grained-per-repo",
      "requiresApproval": false
    },
    {
      "name": "postgres",
      "package": "@modelcontextprotocol/server-postgres",
      "version": "0.6.2",
      "restriction": "read-replica-only",
      "requiresApproval": true,
      "approver": "data-platform-team"
    },
    {
      "name": "metrics",
      "package": "internal:metrics-server",
      "version": "2.1.0",
      "source": "https://registry.internal.mycompany.com/mcp/metrics-server",
      "requiresApproval": false
    }
  ],
  "forbidden": [
    "Any server with filesystem access to / or /home",
    "Any server with production database write access",
    "Any server that proxies requests through an external third-party"
  ]
}
```

---

### Audit Logging

For regulated industries, every MCP tool call should be logged for audit purposes. Add an audit middleware to your Claude Code or custom server setup:

```python
# audit_middleware.py
import json
import datetime
import hashlib

class MCPAuditLogger:
    def __init__(self, log_path: str, user_id: str):
        self.log_path = log_path
        self.user_id = user_id

    def log_tool_call(self, tool_name: str, arguments: dict, result_summary: str):
        entry = {
            "timestamp": datetime.datetime.utcnow().isoformat() + "Z",
            "user_id": self.user_id,
            "tool": tool_name,
            "arguments_hash": hashlib.sha256(
                json.dumps(arguments, sort_keys=True).encode()
            ).hexdigest()[:16],  # Hash args, don't log raw values (may contain secrets)
            "arguments_summary": self._summarize_args(tool_name, arguments),
            "result_summary": result_summary[:200]  # Truncate for log size
        }
        with open(self.log_path, "a") as f:
            f.write(json.dumps(entry) + "\n")

    def _summarize_args(self, tool: str, args: dict) -> str:
        if tool == "read_file":
            return f"file={args.get('path', 'unknown')}"
        if tool == "create_issue":
            return f"title={args.get('title', '')[:50]}"
        if tool == "query":
            return f"query_length={len(args.get('query', ''))}"
        return f"args_count={len(args)}"
```

Sample audit log output:
```json
{"timestamp":"2026-05-16T09:14:22Z","user_id":"chamrong","tool":"read_file","arguments_hash":"a3f8c12d","arguments_summary":"file=src/auth/JwtService.java","result_summary":"JWT token validation logic, 142 lines"}
{"timestamp":"2026-05-16T09:14:28Z","user_id":"chamrong","tool":"create_issue","arguments_hash":"b7e2a981","arguments_summary":"title=Security: missing rate limiting on /auth/login","result_summary":"Issue #287 created successfully"}
```

---

## The MCP Mental Model: Shifting How You Think

The deepest change MCP introduces isn't tooling — it's a shift in how you approach problems.

### Before MCP: You Are the Integration Layer

```
Problem appears
    → You search Google / StackOverflow
    → You open 8 browser tabs
    → You find the code you need
    → You copy it into your editor
    → You paste the error into ChatGPT
    → You paste the answer back into your editor
    → You look up the library docs
    → You check what the schema looks like
    → You finally write the solution

Time: 45–90 minutes of context switching
```

### After MCP: The AI Is the Integration Layer

```
Problem appears
    → You describe it to the AI in one message
    → AI reads your codebase [filesystem]
    → AI checks git history [git]
    → AI reads library docs [context7]
    → AI queries the schema [postgres]
    → AI writes the solution directly to the file [filesystem]
    → AI opens the PR [github]

Time: 5–15 minutes, you stay in flow
```

The leverage comes from this: **you stop being the bottleneck between information sources**. The AI navigates between them instantly while you think at a higher level.

---

### The Right Mental Model: MCP as a Capability Stack

Think of MCP not as "AI with tools" but as a **capability stack** you build up over time:

```
Level 0 — No MCP
  AI knows what was in its training data. Nothing else.

Level 1 — filesystem + git
  AI knows your current codebase, your history, your changes.
  [10-minute setup. Start here.]

Level 2 — + github + context7
  AI can act on your repo. AI knows current library APIs.
  [30-minute setup. Do this in week 1.]

Level 3 — + postgres + fetch
  AI understands your live data. AI can call external APIs.
  [1-hour setup. Do this in week 2.]

Level 4 — + custom servers (metrics, jira, slack, deploy)
  AI understands your entire operational context.
  AI can participate in incidents, standups, and planning.
  [Ongoing build. This is the moat.]

Level 5 — CI/CD + scheduled intelligence
  AI works autonomously in the background.
  PR reviews happen automatically.
  Docs sync on merge.
  Standups write themselves.
  [This is where the compounding begins.]
```

Most engineers stop at Level 1 or 2. The compounding value lives at Levels 4 and 5.

---

## Frequently Asked Questions

**Q: Does MCP send my code to Anthropic?**
A: When using Claude (cloud), yes — your code is sent to Anthropic's servers as part of the AI context. Use local LLMs (Ollama) if your codebase cannot leave your infrastructure. Anthropic's [privacy policy](https://www.anthropic.com/privacy) applies to all Claude API usage.

---

**Q: Can MCP servers access the internet by default?**
A: No. Each server only accesses what its implementation allows. The `filesystem` server can only read files. The `github` server can only call the GitHub API. The `fetch` server can make HTTP requests — only add that one if you explicitly need it.

---

**Q: What if an MCP server has a bug and deletes a file?**
A: This is why you use `git` with MCP. Every AI-driven change should be on a branch and go through a PR. Before any large refactor, run `git stash` manually. Treat AI-generated changes with the same skepticism as junior developer PRs.

---

**Q: How do I prevent the AI from taking actions I didn't intend?**
A: Three practices:
1. Use the **Investigate → Propose → Confirm** pattern: ask the AI to *show* you what it would do, then confirm before it executes.
2. Limit write access: give filesystem read-only for exploration, only grant write when you're actively editing.
3. Use `CLAUDE.md` to explicitly state: "Do not delete any files without explicit confirmation."

---

**Q: Are there MCP servers for [specific tool I use]?**
A: Check [mcp.so](https://mcp.so) and [github.com/punkpeye/awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers). The ecosystem has 2,000+ community servers as of mid-2026. If yours isn't there, building one takes ~50 lines of Python.

---

**Q: Does MCP work with VS Code?**
A: Yes. GitHub Copilot (VS Code extension) supports MCP as of early 2026. The Cline extension for VS Code also has native MCP support. Configuration varies by extension — check each extension's docs for the config file location.

---

**Q: What's the difference between MCP and function calling / tool use?**
A: MCP *uses* function calling under the hood — it's the transport layer. The difference is standardization: MCP defines a universal protocol so any server works with any client. Without MCP, each AI tool had its own proprietary plugin format. MCP is to AI tools what USB-C is to device connectors.

---

## Summary: Your MCP Action Plan

```
┌─────────────────────────────────────────────────────────────────────┐
│  THIS WEEK                                                          │
│  □ Add filesystem + github servers to Claude Desktop or Cursor      │
│  □ Test with "explore this codebase" and "review this PR"          │
│  □ Add .gitignore entry for config files containing tokens          │
│                                                                     │
│  THIS MONTH                                                         │
│  □ Add context7 + git + postgres to your stack                     │
│  □ Create CLAUDE.md in your main project                           │
│  □ Run one team demo with a real codebase task                     │
│  □ Commit shared settings.json (no secrets) to the repo            │
│                                                                     │
│  THIS QUARTER                                                       │
│  □ Build one custom MCP server for your team's specific toolchain  │
│  □ Set up one GitHub Actions workflow using Claude Code + MCP      │
│  □ Establish team MCP governance (approved servers list)           │
│  □ Measure: time saved per engineer per week                       │
│                                                                     │
│  THE COMPOUNDING HORIZON                                            │
│  □ Scheduled intelligence (cron + Claude Code)                     │
│  □ Internal MCP server registry                                    │
│  □ Audit logging for compliance                                    │
│  □ AI-assisted incident response as standard practice              │
└─────────────────────────────────────────────────────────────────────┘
```

The engineers adopting MCP deeply today are building a workflow advantage that will compound for years. Start with one server. Add one more each week. In a month, you won't recognize your old workflow.

---

## References

- **MCP Specification** — https://modelcontextprotocol.io
- **Official MCP Servers** — https://github.com/modelcontextprotocol/servers
- **MCP Inspector (Debug Tool)** — `npx @modelcontextprotocol/inspector`
- **MCP Python SDK** — `pip install mcp`
- **MCP TypeScript SDK** — `npm install @modelcontextprotocol/sdk`
- **Context7 MCP** — https://github.com/upstash/context7
- **Claude Code CLI** — https://claude.ai/code
- **MCP Server Registry** — https://mcp.so
- **Awesome MCP Servers** — https://github.com/punkpeye/awesome-mcp-servers
- **Claude Desktop Logs (macOS)** — `~/Library/Logs/Claude/`
- **Ollama (Local LLMs)** — https://ollama.ai
- **Anthropic Privacy Policy** — https://www.anthropic.com/privacy
- **MCP GitHub Discussion** — https://github.com/modelcontextprotocol/servers/discussions

---

---

## 📚 Cross-References & Related Reading
- **Agile & Process:** [DoR vs DoD](../management/dor-and-dod-guide.md) | [SDLC Comparison Matrix](../management/sdlc-05-comparison-matrix.md) | [What is SDLC?](../management/sdlc-00-what-is-sdlc.md)
- **Documentation & Flow:** [Visual Communication Guide](./visual-communication-guide.md) | [Fast Documentation](./fast-documentation-workflow.md) | [MCP Guide](./mcp-development-guide.md)

---

**Share this post:** [Share on LinkedIn](#) | [Discuss](#)

*Last updated: 2026-05-16*

## Related

- [Career Paths](../concepts/career-paths/README.md)
- [Mental Models & Concepts](../concepts/README.md)
- [Management & SDLC](../management/README.md)
