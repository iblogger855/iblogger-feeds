# Presenting Technical Work to Non-Technical People

**Tags:** #english #professional #communication #presentations  
**Read Time:** ~5 min

> The goal is not to show how smart you are. The goal is to make the listener understand something they didn't understand before. These are different skills.

---

## The Fundamental Rule

**Lead with the outcome, not the mechanism.**

Non-technical stakeholders care about: time, money, risk, and user experience. They do not care about architecture, framework choices, or implementation details — unless those directly affect the things they care about.

```
BAD:  "We refactored the authentication module to use OAuth2 with
       JWT tokens and added Redis for session management."

GOOD: "We improved the login system. Users can now stay logged in
       for 7 days instead of 30 minutes, and the login process
       is now 40% faster."
```

---

## The Pyramid Structure

Start with the most important information. Add detail only if asked.

```
Level 1 — What changed and what it means for users/business
  └── Level 2 — How it works at a high level (if they ask)
        └── Level 3 — Technical details (only for technical audience)
```

**Example:**

> **Level 1:** "We built the payment feature. Users can now pay by card or QR code. It went live yesterday."
>
> **Level 2 (if asked):** "We integrated with Stripe for cards and ABA for local QR payments. Payments are processed in real-time."
>
> **Level 3 (for technical stakeholders only):** "Stripe handles the card flow via hosted fields — we're SAQ A compliant. ABA uses the KHQR standard. We have idempotency keys on all transactions to prevent double charges."

---

## Phrases That Bridge Technical and Non-Technical

| Technical term | Plain language version |
|:--------------|:----------------------|
| `Latency` | `How fast the page loads` / `Response time` |
| `Downtime` | `When the app is unavailable` |
| `Bug` | `A problem in the software` |
| `Deploy` | `Release to users` / `Go live` |
| `Refactor` | `Clean up the code without changing what it does` |
| `API` | `A connection between two systems` |
| `Database` | `Where we store the data` |
| `Cache` | `A shortcut that makes things faster` |
| `Authentication` | `Login / verifying who you are` |
| `Scope creep` | `The requirements growing beyond what was agreed` |

---

## Handling Questions You Can't Answer

| Situation | Phrase |
|:----------|:-------|
| You don't know the answer | `That's a good question — I don't have that data with me right now. I'll find out and get back to you by [date].` |
| The question is too technical for the room | `That's getting into technical detail — happy to explain offline. The short answer is [simple version].` |
| The question is out of scope | `That's outside this feature, but it's a valid concern. Let me take a note and we can address it separately.` |
| You need time to think | `Let me make sure I answer that properly — could I come back to you on that?` |

---

## Explaining a Problem or Delay

Non-technical managers and clients respond badly to technical excuses. Translate the problem into impact and action.

```
BAD:
"We had a race condition in the async job processor that caused
the payment webhook to process duplicate events."

GOOD:
"We found a bug that was causing some payments to be processed twice.
We fixed it within 4 hours of discovering it. No customers were
double-charged — our safety checks caught it. We've added monitoring
to detect this earlier in the future."
```

**Structure:**
1. What happened (plain language)
2. Who was affected (and how many)
3. What you did to fix it
4. What you're doing to prevent it

---

## Demo Structure

```
1. Context  — "This is the booking confirmation page."
2. Problem  — "Previously, users had to wait 10 seconds for confirmation."
3. Demo     — "Now, watch what happens when I click confirm..."
4. Result   — "Confirmation appears in under 1 second."
5. Q&A      — "Any questions?"
```

---

## Related

- [Standup and Meetings](./06-standup-and-meetings.md) — daily communication with your team
- [Active vs Passive Voice](../daily/05-active-vs-passive-voice.md) — writing clearly when presenting in documents
