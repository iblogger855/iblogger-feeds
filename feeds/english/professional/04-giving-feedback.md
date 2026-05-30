# Giving Feedback in English

**Tags:** #english #professional #feedback #code-review #communication  
**Read Time:** ~5 min

> Feedback is a gift — but only if the recipient can receive it. Vague, blunt, or poorly framed feedback gets ignored or causes conflict. Clear, specific, kind feedback actually changes behaviour.

---

## The SBI Framework

**Situation — Behaviour — Impact**

| Part | What to say | Example |
|:-----|:------------|:--------|
| **Situation** | When/where did this happen? | "In the code review for BK-2025-1042..." |
| **Behaviour** | What specifically did they do? | "...the PR description had no steps to test the change." |
| **Impact** | What effect did it have? | "I spent 15 minutes trying to figure out how to verify the fix, which slowed down the review." |

**Full example:**
> "In the code review for BK-2025-1042, the PR description had no steps to test the change. I spent 15 minutes trying to figure out how to verify the fix, which slowed down the review. It would help a lot if you added a 'How to Test' section to future PRs."

---

## Code Review Comment Levels

| Level | Label | When to use |
|:------|:------|:------------|
| Must fix | `[MUST]` | Blocks merge — bug, security issue, wrong approach |
| Should fix | `[SHOULD]` | Strong suggestion — will cause problems later if not addressed |
| Optional | `[NIT]` | Minor style, personal preference — take it or leave it |

**Examples:**

```
[MUST] This will throw a NullPointerException when `user` is null —
we need a null check here before accessing `user.getId()`.

[SHOULD] This query runs on every request. Consider caching the result
since the data changes infrequently.

[NIT] Personal preference — I find `isEmpty()` more readable than
`size() == 0`, but either is fine.
```

---

## Phrases for Code Review Comments

### Asking a question (softer than telling)
- `I'm not sure I understand this — could you explain why we need X here?`
- `What's the reason for this approach? I'm wondering if Y might also work.`
- `Is this intentional? I expected to see X here.`

### Making a suggestion
- `Consider using X instead — it handles the edge case where Y.`
- `One option would be to extract this into a separate function.`
- `This might be cleaner as a switch statement — what do you think?`

### Pointing out a required fix
- `This needs to be fixed before merging — [explain the problem].`
- `This will break when [edge case] — we need to handle that.`
- `Security concern: this exposes [what] to [who]. We need to [fix].`

### Acknowledging good work
- `Nice approach here — I hadn't thought of doing it this way.`
- `This is much cleaner than the previous implementation.`
- `Good catch — I missed this in the spec.`

---

## Giving Feedback in 1-on-1s

Use the same SBI structure but add a **suggestion** at the end.

```
[Situation]  "In last week's sprint planning..."
[Behaviour]  "...you gave estimates without asking any clarifying questions."
[Impact]     "The stories turned out to be much larger than estimated,
              which affected our velocity."
[Suggestion] "Next time, could you ask at least two questions before
              committing to an estimate? Something like 'What are the
              acceptance criteria?' helps a lot."
```

---

## Receiving Feedback

When someone gives you feedback, your first job is to **understand it**, not defend yourself.

| Response | Effect |
|:---------|:-------|
| `Can you give me an example?` | Shows you're listening and want to understand |
| `I hadn't thought of it that way — let me think about that.` | Open and non-defensive |
| `Thank you — I'll work on that.` | Closes the loop professionally |
| `But I did it because...` (immediate defence) | Shuts down the conversation |
| Silence / no response | Makes the person feel ignored |

---

## What to Avoid

| Avoid | Why | Better |
|:------|:----|:-------|
| `This is wrong` | Feels like an attack | `I think there might be an issue here — [explain]` |
| `Why did you do it like this?` | Sounds accusatory | `I'm curious about the approach — what was the thinking?` |
| Vague comments like `this could be better` | Not actionable | Say what specifically and how |
| Only negative feedback | Demoralising | Balance with what's working well |
| Feedback in public when it's personal | Embarrassing | Private message or 1-on-1 |

---

## Related

- [Pushing Back Politely](./05-pushing-back-politely.md) — when you're on the receiving end of a decision you disagree with
- [Code Review & PR Flow](../../procedures/software-delivery/04-code-review-and-pr.md) — the team's code review standard
