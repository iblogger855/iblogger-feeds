# Writing Professional Emails

**Tags:** #english #professional #communication #email  
**Read Time:** ~6 min

> A professional email has one job: make it easy for the recipient to understand what you need and take action. Everything else is noise.

---

## Basic Structure

```
Subject: [Clear, specific — what is this email about?]

Hi [Name],

[One sentence of context — why are you writing?]

[The main point — what do you need or want to say?]

[Next step — what should they do, and by when?]

Best regards,
[Your name]
```

---

## Subject Lines

The subject line is the most important sentence. If it's vague, your email gets ignored.

| Bad subject | Good subject |
|:------------|:------------|
| `Question` | `Question about the payment API rate limits` |
| `Following up` | `Following up on the deployment approval — needed by Friday` |
| `Update` | `Update: staging is ready for QA review` |
| `Issue` | `Issue with user login on iOS 17 — affecting 3 users` |
| `Hey` | Never use this as a subject |

**Rules for subject lines:**
- Be specific — name the project, feature, or person involved
- Include urgency if relevant: `[Action needed]`, `[By Friday]`
- Keep it under 60 characters so it doesn't get cut off on mobile

---

## Openings

| Situation | Opening |
|:----------|:--------|
| First email to someone | `Hi [Name], I'm [your name] from the [team] team.` |
| Regular colleague | `Hi [Name],` |
| Formal (client, senior leader) | `Dear [Name],` |
| Following up | `Hi [Name], I'm following up on my email from [date].` |
| Replying | `Thanks for getting back to me.` / `Thank you for the update.` |

---

## Common Email Types

### Requesting something
```
Hi Sophea,

I'm working on the payment integration and I need access to the
ABA sandbox credentials to run local tests.

Could you share them (or point me to where they're stored) when
you have a moment? I need them by Thursday to stay on schedule.

Thanks,
Dara
```

### Giving an update
```
Hi team,

Quick update on the appointment booking feature (BK-2025-1001):

- Backend API: complete and deployed to staging ✓
- Frontend integration: in progress — expected Friday
- QA: can start on the backend endpoints now

Let me know if you have any questions.

Dara
```

### Reporting a problem
```
Subject: Issue with payment webhook — some transactions not recording

Hi Makara,

I've found an issue with the payment webhook handler. Some successful
Stripe payments are not being recorded in the database — about 5% of
transactions in the last 24 hours.

I've identified the cause: the webhook signature validation is failing
for transactions over $1,000 due to a precision issue in the amount
comparison.

I'm working on a fix now and expect to deploy to staging by 3 PM today.
I'll send another update once it's deployed.

Let me know if you need anything from me in the meantime.

Dara
```

---

## Phrases for Common Situations

### Making a request
- `Could you please...`
- `I would appreciate it if you could...`
- `Would it be possible to...`
- `I need your help with...`

### Setting a deadline politely
- `Could you let me know by [date]?`
- `I need this by [date] to stay on schedule.`
- `Any response before [date] would be very helpful.`

### Following up
- `I wanted to follow up on my email from [date].`
- `Just checking in — has there been any update on [topic]?`
- `I understand you may be busy — whenever you have a moment would be great.`

### Apologising
- `I apologise for the delay in getting back to you.`
- `I'm sorry for the confusion.`
- `I apologise for any inconvenience this has caused.`

### Closing
- `Please let me know if you have any questions.`
- `I look forward to hearing from you.`
- `Thank you for your time.`
- `Happy to discuss further if needed.`

---

## Tone Levels

| Recipient | Tone | Sign-off |
|:----------|:-----|:---------|
| Close teammate | Informal | `Thanks, [name]` |
| Manager | Friendly but professional | `Best regards, [name]` |
| Client | Professional | `Kind regards, [name]` |
| Senior executive | Formal | `Yours sincerely, [name]` |

---

## Things to Avoid

| Avoid | Why |
|:------|:----|
| `As per my last email` | Sounds passive-aggressive |
| `To whom it may concern` | Too cold — find the person's name |
| `Please revert` | In British/South Asian English this means "reply" but confuses others — use "Please reply" |
| Very long emails | Break into bullets; put the most important thing first |
| No clear ask | Every email should have one clear request or action |
| CC-ing everyone | Only CC people who actually need to act or be informed |

---

## Related

- [Slack and Chat](./01-slack-and-chat.md) — informal written communication
- [Pushing Back Politely](./05-pushing-back-politely.md) — how to say no or disagree in writing
