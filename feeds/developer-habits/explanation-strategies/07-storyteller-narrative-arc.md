# Strategy 7: The Storyteller (Narrative Arc)

**Audience:** Anyone — humans are wired for stories.

**Goal:** Make abstract problems memorable by giving them characters, conflict, and resolution.

**The Formula:**
```
Hero:       The system / team / developer facing the problem
Villain:    The bug / scale problem / bad design
Conflict:   What goes wrong and why
Stakes:     What fails if this isn't solved
Resolution: The pattern / technique / insight that saves the day
Lesson:     The principle extracted from the story
```

**Example — Explaining the Observer Pattern:**
> *"Picture a stock trading desk in 2007. The stock price of AAPL changes. Someone manually has to call the portfolio manager. And the risk desk. And the compliance officer. And the news feed. Every time. For every stock.*
> *Then one day, the portfolio manager is on vacation and doesn't get the call. The desk loses $2M.*
> *The solution: instead of calling everyone manually, every interested party subscribes to the stock. When the price changes, it broadcasts automatically. No one is missed. No one has to remember the list.*
> *That's the Observer pattern. The stock is the Subject. The portfolio manager, risk desk, and compliance officer are Observers."*

**When to use it:** Conference talks, blog posts, team retrospectives, explaining why a legacy pattern exists.

**Signature move:** Always start with a human consequence, not a technical description.

---

## Related

- [← Back to Strategies](README.md)
- [04 - Analogy Bridge](04-analogy-bridge.md)
- [06 - Journalist](06-journalist-inverted-pyramid.md)
