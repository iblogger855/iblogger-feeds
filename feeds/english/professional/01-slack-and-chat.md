# Writing Slack Messages

**Tags:** #english #professional #communication #slack  
**Read Time:** ~5 min

> Slack messages are permanent. They are searched, screenshot, and read by people who weren't in the original conversation. Write accordingly.

---

## The Core Principle

Slack is async. The person you're messaging may not read it for 2 hours. Write so they can **understand and act** without asking you follow-up questions.

```
BAD:  "hey can you help"
GOOD: "Hey Sophea — I'm getting a 403 on POST /api/bookings even with a
       valid JWT. I checked the role middleware and the token has the
       correct scope. Could you take a look when you have a moment?
       Ticket: BK-2025-1042"
```

---

## Message Structure for Requests

```
[Greeting] + [Context] + [Specific request] + [Why it matters / urgency]
```

| Part | Example |
|:-----|:--------|
| Greeting | `Hey Dara,` |
| Context | `I'm working on the payment flow (BK-2025-1001).` |
| Specific request | `Could you review the Stripe webhook handler I pushed?` |
| Urgency | `It's blocking the QA deployment — hoping to merge today.` |

---

## Common Situations

### Asking for a review
```
Hey [name], could you review [PR link] when you get a chance?
It's [1-2 sentence description]. No rush — [by when] works.
```

### Reporting a bug to a teammate
```
Hey, I found something odd in [area]. When [specific action],
[what happens] instead of [what should happen].
Steps to reproduce: [1, 2, 3]
Could be related to [your recent change]? Happy to pair on it.
```

### Flagging a blocker
```
Heads up — I'm blocked on [what] because [reason].
I need [X] from [person/team] to continue.
Is there someone who can help me with this today?
```

### Notifying the team of a deploy
```
🚀 Deployed v1.4.2 to staging.
Includes: [bullet list of changes]
QA can start testing BK-2025-1001 and BK-2025-1008.
Known issue: [if any]
```

### Asking a quick question
```
Quick question — does [system] support [X]?
Context: I'm trying to [goal] and want to make sure before I implement it.
```

---

## Tone Guide

| Situation | Tone | Example |
|:----------|:-----|:--------|
| Normal request | Friendly, direct | `Could you take a look at this?` |
| Urgent issue | Clear, calm | `This is blocking the release — I need help ASAP.` |
| Something went wrong | Factual, not defensive | `I found a bug in the code I shipped yesterday. Here's what happened and what I'm doing to fix it.` |
| Disagreeing | Respectful | `I see it differently — here's my thinking. Happy to discuss.` |
| Thanking someone | Genuine, brief | `Thanks so much — that saved me a lot of time.` |

---

## Things That Sound Rude (Even If You Don't Mean It)

| Sounds rude | Better version |
|:------------|:--------------|
| `why did you do it this way` | `I'm curious about the approach here — what was the thinking?` |
| `this is wrong` | `I think there might be an issue here — [explain]` |
| `when will this be done` | `Is there an ETA on this? Asking so I can plan the next step.` |
| `did you read my message` | `Just following up in case this got buried 🙂` |
| `this is urgent` (no context) | `This is blocking [what] — could you prioritise it?` |
| `ok` (one word reply to complex message) | Add acknowledgement: `Got it — I'll take a look today.` |

---

## Formatting in Slack

- Use **bold** for the most important word in a long message: `The issue is with **staging only** — production is fine.`
- Use `` `code` `` for filenames, commands, and error messages: `The error is \`INVALID_TOKEN\``
- Use code blocks for logs and multi-line output
- Use bullet points for lists of items — don't write a wall of text
- Use threads for follow-up discussion — keep the main channel clean

---

## Related

- [Emails](./02-emails.md) — longer, more formal written communication
- [Asking for Help](./03-asking-for-help.md) — how to frame questions clearly
