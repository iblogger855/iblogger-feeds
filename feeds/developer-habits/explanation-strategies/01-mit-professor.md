# Strategy 1: The MIT Professor (First Principles)

**Audience:** Technically capable learners who want deep understanding, not just recipes.

**Goal:** Build intuition from the ground up. Show WHY before HOW.

**The Formula:**
```
1. State the PROBLEM in its most pure form
2. Reject all shortcuts and analogies (for now)
3. Derive the solution step by step from axioms
4. Show that the solution is the ONLY logical conclusion
5. Then show analogies and real-world cases
6. End with: what breaks this, and when NOT to use it
```

**Example — Explaining a Hash Table:**
> *"We want O(1) lookup. The only way to achieve O(1) is direct array indexing. So the question becomes: how do we turn an arbitrary key — a string, an object — into a valid array index? That's the entire problem of hashing. The hash function is the answer, and every other decision (collision handling, load factor, resizing) flows from that single requirement."*

**When to use it:** Technical blog posts, internal engineering docs, onboarding senior engineers, design documents.

**Signature move:** Start with "The only way to achieve X is Y. Therefore..."

---

## Related

- [← Back to Strategies](README.md)
- [02 - Feynman Technique](02-feynman-technique.md)
- [08 - Engineer Strategy](08-engineer-requirements-constraints-solution.md)
