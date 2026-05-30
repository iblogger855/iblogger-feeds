# Explanation Strategies

> **The measure of understanding is not what you know — it's whether you can make someone else understand.**

There are many ways to explain something complex. The right strategy depends on your **audience** and your **goal**.

```mermaid
%%{init: {'theme': 'dark', 'quadrantChart': {'chartWidth': 640, 'chartHeight': 540, 'pointRadius': 4, 'pointLabelFontSize': 11}, 'themeVariables': {'quadrantPoint': '#4caf50', 'quadrantPointTextFill': '#ffffff', 'quadrantTitleFill': '#e0e0e0', 'quadrantLabelFill': '#e0e0e0', 'quadrantInternalBorderStrokeFill': '#2e7d32', 'quadrantExternalBorderStrokeFill': '#1b5e20', 'quadrant1Fill': '#01579b22', 'quadrant2Fill': '#1b5e2022', 'quadrant3Fill': '#37474f22', 'quadrant4Fill': '#4a148c22',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
quadrantChart
    title Explanation Styles
    x-axis Informal --> Formal
    y-axis Expert --> Beginner
    quadrant-1 Frml+Begin
    quadrant-2 Infm+Begin
    quadrant-3 Infm+Exprt
    quadrant-4 Frml+Exprt
    ELI5: [0.12, 0.84]
    Feynman: [0.32, 0.74]
    Analogy: [0.44, 0.60]
    Storytell: [0.18, 0.40]
    Socratic: [0.58, 0.84]
    MIT Prof: [0.82, 0.72]
    Journalist: [0.72, 0.56]
    RubberDuck: [0.36, 0.28]
    Engineer: [0.84, 0.18]
    Parable: [0.28, 0.62]
```

---

## Strategies

| # | Strategy | Best For |
| :--- | :--- | :--- |
| [01](01-mit-professor.md) | **MIT Professor** | Deep learners, technical docs |
| [02](02-feynman-technique.md) | **Feynman Technique** | Self-check, teaching prep |
| [03](03-eli5.md) | **ELI5** | Non-technical, first contact |
| [04](04-analogy-bridge.md) | **Analogy Bridge** | Cross-domain learners |
| [05](05-socratic-method.md) | **Socratic Method** | Mentoring, code review |
| [06](06-journalist-inverted-pyramid.md) | **Journalist** | Busy readers, postmortems |
| [07](07-storyteller-narrative-arc.md) | **Storyteller** | Talks, blog posts, retros |
| [08](08-engineer-requirements-constraints-solution.md) | **Engineer** | Design docs, ADRs |
| [09](09-the-parable.md) | **The Parable** | Cognitive biases, psychology, ethics |

---

## Choosing the Right Strategy

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#1b5e20', 'primaryTextColor': '#fff', 'lineColor': '#4caf50', 'secondaryColor': '#01579b', 'tertiaryColor': '#4a148c',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
flowchart TD
    classDef q    fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef ans  fill:#1b5e20,stroke:#003300,color:#fff
    classDef alt  fill:#01579b,stroke:#003c8f,color:#fff

    A{Who is<br/>your audience?}:::q

    A --> B[Technical —<br/>strong background]:::q
    A --> C[Technical —<br/>learning the topic]:::q
    A --> D[Non-technical<br/>stakeholder]:::q
    A --> E[Yourself —<br/>checking understanding]:::q

    B --> B1{What is<br/>your goal?}:::q
    B1 -- Justify design --> B2[Engineer Strategy]:::ans
    B1 -- Build intuition --> B3[MIT Professor]:::ans
    B1 -- Via discovery --> B4[Socratic Method]:::ans

    C --> C1{How do they<br/>learn best?}:::q
    C1 -- Via analogy --> C2[Analogy Bridge]:::ans
    C1 -- Via narrative --> C3[Storyteller]:::ans
    C1 -- Via questions --> C4[Socratic Method]:::ans

    D --> D1{How much<br/>time do they have?}:::q
    D1 -- 30 seconds --> D2[Journalist — lede first]:::ans
    D1 -- 5 minutes --> D3[ELI5 — one analogy]:::ans
    D1 -- 30 minutes --> D4[Storyteller — narrative]:::ans

    E --> E1[Feynman Technique]:::ans
```

---

## The Meta-Rule

> **No single strategy works for all audiences.**  
> The best communicators carry all of these as tools and switch fluently between them — even mid-explanation. Start with ELI5 to build trust, shift to MIT Professor for depth, close with Engineer to justify the trade-offs.

---

## Summary

| Strategy | Best For | Signature |
| :--- | :--- | :--- |
| **MIT Professor** | Deep learners, technical docs | "The only way to achieve X is Y, therefore..." |
| **Feynman** | Self-check, teaching prep | "Explain without the word X" |
| **ELI5** | Non-technical, first contact | "Think of it like..." |
| **Analogy Bridge** | Cross-domain learners | "X in A is exactly Y in B, because both..." |
| **Socratic** | Mentoring, code review | Never state — always ask |
| **Journalist** | Busy readers, postmortems | Most important sentence first |
| **Storyteller** | Talks, blog posts, retros | Hero → villain → conflict → resolution |
| **Engineer** | Design docs, ADRs | Requirements → constraints → elimination |
| **The Parable** | Cognitive biases, ethics, psychology | Tell story → pause → "why?" → debrief |

---

## Related

- [Visual Communication Guide](../README.md)
- [Developer Habits](../../README.md)
- [Mental Models & Concepts](../../../../concepts/README.md)
