# Failure and Blame Idioms

**Tags:** #english #idioms #incidents #culture #post-mortem  
**Read Time:** ~4 min

> How a team talks about failure reveals its culture. These phrases appear in post-mortems, incident calls, and the conversations after things go wrong.

---

## "Throw under the bus"

Blame someone else — especially to protect yourself. Making someone else take the fall.

```
"Don't throw your teammates under the bus in the post-mortem. 
 Focus on the system failure."
"He threw the junior engineer under the bus in front of the client."
```

This is considered a serious breach of team trust. A good team never does this.

---

## "Blameless"

A culture where incidents are analysed without assigning personal fault — the focus is on fixing systems, not punishing people.

```
"We run blameless post-mortems. No one is here to point fingers."
"This is a blameless retrospective — we're looking for process improvements,
 not people to blame."
```

---

## "Own it"

Take full responsibility for a mistake — acknowledge it clearly without excuses.

```
"I made a mistake in the migration script. I own it.
 Here's what I'm doing to fix it and prevent it from happening again."
"The best thing you can do when something goes wrong is own it immediately."
```

---

## "Fall on the sword"

Accept blame for something — even at personal cost. A strong, public acknowledgement of responsibility.

```
"The TL fell on the sword and took responsibility for the missed deadline,
 even though it was a team issue."
```

---

## "Blame the tooling"

Attributing a failure to tools, libraries, or infrastructure rather than to code or process decisions — sometimes a deflection.

```
"It's easy to blame the tooling, but the real issue was 
 that we didn't test the upgrade before deploying."
```

---

## "Finger-pointing"

Multiple people blaming each other — nobody accepting responsibility.

```
"The incident call turned into finger-pointing between the backend 
 and DevOps teams. We need a blameless process."
```

---

## "My bad"

Informal: "my mistake" — a quick, casual acknowledgement of a small error.

```
"My bad — I pushed to the wrong branch."
"Oh, my bad. I misread the ticket."
```

Use in casual settings with teammates. Not appropriate in client communications or formal post-mortems.

---

## "Egg on your face"

To be embarrassed by a mistake — especially one that was visible to others.

```
"Deploying broken code to the demo environment left us with 
 egg on our faces in front of the client."
```

---

## "Lessons learned"

What the team will do differently as a result of the failure. The constructive output of a post-mortem.

```
"Let's end with lessons learned — what do we change 
 so this doesn't happen again?"
```

---

## "Action items"

Specific tasks assigned after a post-mortem or meeting — the concrete steps that come from lessons learned.

```
"Action item: Dara will add integration tests for the payment flow.
 Action item: Sophea will document the deployment runbook."
```

---

## "Near miss"

Something that almost went wrong but was caught before causing damage.

```
"We had a near miss yesterday — the migration script was about 
 to run on production before someone caught the config error."
```

---

## "Root cause" vs "Proximate cause"

**Proximate cause:** The immediate trigger — what directly caused the failure.  
**Root cause:** The underlying reason — why the trigger was able to cause failure.

```
Proximate: "The server ran out of memory."
Root cause: "There was no memory limit set on the container, 
             and no alert when it approached capacity."

"Don't just fix the proximate cause — find the root cause 
 or it will happen again."
```

---

## Related

- [Blameless Post-Mortems in Engineering Slang](./03-engineering-slang.md)
- [Positive and Negative Signals](./06-positive-and-negative-signals.md)
- [Giving Feedback](../professional/04-giving-feedback.md)
