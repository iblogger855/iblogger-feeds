# English for Standups and Meetings

**Tags:** #english #professional #meetings #standup #communication  
**Read Time:** ~5 min

> Meetings reward the people who speak clearly and concisely. Long, rambling updates waste everyone's time — including yours.

---

## Daily Standup

The three questions:

| Question | What to say |
|:---------|:------------|
| What did you do yesterday? | One sentence per task. Past tense. |
| What will you do today? | One sentence per task. Future tense. |
| Any blockers? | If yes: what is blocking you and who needs to help. If no: "No blockers." |

### Good standup update

```
Yesterday: I finished the payment webhook handler and wrote unit tests.

Today: I'm going to integrate it with the booking flow and do manual testing.

No blockers.
```

### Flagging a blocker in standup

```
I'm blocked on the KYC integration — I need access to the Onfido
sandbox API keys. Sophea, could we sync after standup?
```

---

## Sprint Planning

| Situation | Phrase |
|:----------|:-------|
| Asking for clarification | `Can you clarify what "done" looks like for this story?` |
| Raising a dependency | `This depends on [story/team] — do we have confirmation that will be ready?` |
| Flagging a risk | `I want to flag that this might take longer than estimated because [reason].` |
| Agreeing to an estimate | `I'm comfortable with 3 points — that feels right given [scope].` |
| Challenging an estimate | `I think 3 points might be optimistic — there's a database migration involved.` |
| Volunteering for a story | `I can take this one.` |

---

## Retrospectives

| Role | Phrase |
|:-----|:-------|
| Sharing what went well | `Something that worked really well was [X].` / `I want to highlight [X] — it made a real difference.` |
| Sharing what to improve | `One thing I found difficult was [X]. I think we could improve by [suggestion].` |
| Agreeing with someone | `I had the same experience with [X].` |
| Adding to someone's point | `Building on what [name] said — I also noticed [X].` |
| Proposing an action item | `Could we agree to [specific action] before next sprint?` |

---

## Sprint Review / Demo

```
Hi everyone — I'll be demoing [feature name] today.

[Context: what problem does this solve?]
Let me show you how it works.

[Walk through the happy path]

[Show edge case or error state if relevant]

That's the feature. Happy to answer any questions.
```

**Useful demo phrases:**
- `So here you can see...`
- `I'll walk you through the main flow.`
- `Let me show you what happens when [edge case].`
- `This is the before state, and now after the change...`
- `Any questions on this part before I move on?`

---

## General Meeting Phrases

### Starting a point
- `I'd like to raise something.`
- `Can I add something here?`
- `I have a question about [topic].`

### Agreeing
- `That makes sense.`
- `I agree with that approach.`
- `That's a good point.`

### Disagreeing
- `I see it a bit differently.`
- `I have a concern about that.`
- `Could we consider [alternative] instead?`

### Asking for clarification
- `Could you say more about [X]?`
- `What do you mean by [term]?`
- `Just to make sure I understood — you're saying [restate]?`

### Wrapping up your turn
- `That's all I have.`
- `Any questions?`
- `I'll follow up with details after the meeting.`

### Ending a discussion that's going in circles
- `I think we're aligned on the goal — should we take the details offline?`
- `Let's timebox this to 5 more minutes and then move on.`
- `Could [name] and [name] sync separately on this and bring a proposal back?`

---

## Tenses in Meetings

| When | Tense | Example |
|:-----|:------|:--------|
| Reporting what happened | Past simple | `I deployed the fix yesterday.` |
| Current status | Present continuous | `I'm working on the test coverage.` |
| Plans for today | Present continuous / going to | `I'm going to review the PR this afternoon.` / `I'll review the PR.` |
| Future plans with uncertainty | Might / planning to | `We might need to descope if the estimate grows.` |

---

## Related

- [Slack and Chat](./01-slack-and-chat.md) — async version of these conversations
- [Presenting Technical Work](./07-presenting-technical-work.md) — demos and technical presentations
