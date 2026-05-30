# Shipping and Delivery Idioms

**Tags:** #english #idioms #deployment #release #shipping  
**Read Time:** ~4 min

> "Shipping" is the act of releasing software to real users. It has its own vocabulary — from the decision to release to the moment users have it in their hands.

---

## "Ship it"

Release it. Deploy to production. Stop perfecting and deliver.

```
"It's good enough — ship it."
"We've been polishing this for two weeks. Ship it and iterate."
```

---

## "Good enough to ship"

Meets the quality bar for release — not perfect, but ready for real users.

```
"Is this good enough to ship, or do we need another round of testing?"
"The core flow works and edge cases are handled — good enough to ship."
```

---

## "Polish later" / "Iterate"

Release now, improve after. The MVP mindset.

```
"Ship the basic version now and polish later based on feedback."
"We'll iterate on the UI after we see how users actually use it."
```

---

## "Soft launch"

Releasing to a small group of users first — not a full public release. Used to test in production without full exposure.

```
"We'll do a soft launch to internal users first, then open it up."
"The feature is live but we're in soft launch — only 5% of users can see it."
```

---

## "Dark launch" / "Shadow mode"

Running new code in production but not showing the results to users — used to test performance and behaviour under real load without risk.

```
"We dark launched the new recommendation engine — it runs alongside 
 the old one but we only show the old results for now."
```

---

## "Feature flag" / "Feature toggle"

A switch that enables or disables a feature without deploying new code. Allows releasing code that isn't visible yet.

```
"Put it behind a feature flag — we can ship the code now and 
 turn it on for specific users when ready."
"The feature is deployed but gated behind a flag — not live for users yet."
```

---

## "Rollout"

Gradually releasing a feature to increasing percentages of users.

```
"We'll do a phased rollout — 1% → 10% → 50% → 100% over two weeks."
"The rollout is paused at 10% while we investigate the error spike."
```

---

## "Rollback"

Reverting to the previous version after a bad deployment.

```
"We need to rollback — the error rate spiked after the deploy."
"Rolled back to v1.4.1 while we investigate."
```

---

## "Go live"

The moment a feature or product becomes available to real users.

```
"We go live on Tuesday at 9 AM."
"Everything is in place for go-live — just waiting for the final sign-off."
```

---

## "Release train"

A scheduled, fixed-cadence release process — code that is ready by a certain date gets included; code that isn't ready waits for the next one.

```
"We run a weekly release train — if your feature isn't merged by Wednesday,
 it misses this week's train."
```

---

## "Code freeze"

A period where no new code changes are allowed — usually just before a major release, to stabilise the build.

```
"Code freeze starts Thursday — get your PRs merged before then."
"We're in code freeze. Only critical bug fixes allowed."
```

---

## "Green build" / "Red build"

**Green:** CI pipeline passed — all tests and checks pass.  
**Red:** CI pipeline failed — something is broken.

```
"Don't merge on a red build."
"We've had a red build for 3 days — needs to be fixed before we can ship."
```

---

## "Hotfix"

An urgent fix deployed directly to production — bypassing the normal release process — to address a critical issue.

```
"We need a hotfix — the checkout page is broken for all users."
"Hotfix deployed at 14:32. Monitoring for 30 minutes."
```

---

## Related

- [Estimation and Planning Idioms](./08-estimation-and-planning.md)
- [Problem-Solving Idioms](./13-problem-solving.md)
- [Urgency and Priority Phrases](./05-urgency-and-priority-phrases.md)
