# Writing Error Messages

**Tags:** #english #technical #ux #api #writing  
**Read Time:** ~5 min

> A good error message tells you what went wrong, why it went wrong, and what to do next. Most error messages only do the first part — if any.

---

## The Three Parts of a Good Error Message

| Part | Question it answers | Example |
|:-----|:-------------------|:--------|
| **What** | What happened? | "Your session has expired." |
| **Why** | Why did it happen? | "You were inactive for 30 minutes." |
| **Next** | What should you do? | "Please log in again to continue." |

Most errors only say "what." Adding "why" and "next" makes the difference between a user who fixes the problem and a user who files a support ticket.

---

## User-Facing Error Messages

### Bad vs Good

| Bad | Good |
|:----|:-----|
| `Error 401` | `Your session has expired. Please log in again.` |
| `Invalid input` | `Phone number must be 9 digits and start with 0.` |
| `Something went wrong` | `We couldn't process your payment. Your card was not charged. Please try again or use a different card.` |
| `Not found` | `We couldn't find that booking. It may have been cancelled or the link may have expired.` |
| `Request failed` | `We're having trouble connecting right now. Please check your internet connection and try again.` |

### Rules

- **Write in plain language** — no HTTP status codes, no stack traces, no technical jargon
- **Never blame the user** — `Invalid request` feels like an accusation; `We couldn't complete that request` is neutral
- **Be specific** — `Password must be at least 8 characters` is better than `Invalid password`
- **Tell them what to do next** — always end with an action when possible
- **Keep it short** — one or two sentences maximum

---

## API Error Messages (for developers)

API errors are for developers, not end users. They can be more technical — but they must still be actionable.

```json
// Bad
{
  "error": "Bad request"
}

// Good
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "The 'amount' field must be a positive integer in cents.",
    "field": "amount",
    "received": -500,
    "docs": "https://api.example.com/docs/errors#VALIDATION_ERROR"
  }
}
```

### What a good API error includes

| Field | Purpose | Example |
|:------|:--------|:--------|
| `code` | Machine-readable error type | `INVALID_CARD_NUMBER` |
| `message` | Human-readable explanation | `"The card number is not valid."` |
| `field` | Which field caused the error (if applicable) | `"card.number"` |
| `docs` | Link to documentation about this error | `"https://..."` |

---

## Validation Error Phrases

| Situation | Phrase |
|:----------|:-------|
| Required field missing | `[Field] is required.` |
| Wrong format | `[Field] must be in [format] format. Example: ...` |
| Too short | `[Field] must be at least [N] characters.` |
| Too long | `[Field] cannot be longer than [N] characters.` |
| Out of range | `[Field] must be between [min] and [max].` |
| Already taken | `This [email/username] is already registered.` |
| Invalid option | `[Field] must be one of: [list of valid values].` |

---

## Error Messages for Different States

| State | Message pattern |
|:------|:---------------|
| Network failure | `We couldn't connect. Please check your connection and try again.` |
| Server error (5xx) | `Something went wrong on our end. We've been notified. Please try again in a moment.` |
| Not found (404) | `We couldn't find [thing]. It may have been deleted or the link may be incorrect.` |
| Unauthorized (401) | `You need to log in to do that.` |
| Forbidden (403) | `You don't have permission to [action]. Contact your admin if you think this is a mistake.` |
| Timeout | `That took too long. Please try again. If the problem continues, contact support.` |
| Rate limited | `You've made too many requests. Please wait [N] seconds before trying again.` |

---

## What to Avoid

| Avoid | Why | Instead |
|:------|:----|:--------|
| Technical codes to end users | Users don't know what 422 means | Translate to plain language |
| "Oops!" | Sounds dismissive for serious errors | Just describe what happened |
| Stack traces to end users | Security risk + confusing | Log internally, show generic message |
| "Please try again later" with no time frame | Unhelpful | "Please try again in a few minutes." |
| Passive voice that hides the problem | "An error was encountered" — by what? | "We couldn't process your request." |

---

## Related

- [Technical Documentation](./05-technical-documentation.md) — documentation for developers
- [Vocabulary for Developers](../daily/06-vocabulary-for-developers.md) — words used in error states
