# Problem-Solving Idioms

**Tags:** #english #idioms #debugging #architecture #decisions  
**Read Time:** ~5 min

> When engineers talk about solving problems, they use a rich vocabulary of metaphors. These phrases appear in architecture discussions, incident calls, and code reviews.

---

## "Silver bullet"

A single solution that magically fixes everything. Usually used in the negative — to warn against looking for one.

```
"There's no silver bullet here — we need to fix the data model,
 the caching layer, and the deployment process."
"Microservices aren't a silver bullet. They solve some problems 
 and introduce others."
```

---

## "Band-aid fix" / "Plaster over"

A temporary fix that covers the symptom without addressing the root cause. From a bandage — it stops the bleeding but doesn't heal the wound.

```
"Adding a retry is a band-aid fix. The real problem is 
 the network instability."
"We've been plastering over this for months. We need to fix 
 the underlying architecture."
```

---

## "Duct tape solution"

A quick, improvised fix that holds things together — barely. Works for now, but nobody is proud of it.

```
"This is a duct tape solution — it'll get us through the launch,
 but we need to rebuild it properly next sprint."
```

---

## "Nuclear option"

The most extreme possible solution — effective but drastic, with large collateral impact.

```
"We could restart the entire cluster — that's the nuclear option.
 Let's try restarting just the affected pods first."
"Wiping the database is the nuclear option. Let's explore 
 every alternative first."
```

---

## "Kick the can down the road"

Postpone dealing with a problem — putting it off for future you or a future team to handle.

```
"Adding more cache is just kicking the can down the road.
 We need to fix the slow queries."
"We've been kicking this technical debt down the road for two years. 
 It's time to address it."
```

---

## "Punt"

Deliberately defer something to later — a conscious choice, not avoidance. (Less negative than "kick the can".)

```
"Let's punt the internationalisation to v2 — it's not needed for launch."
"I'm going to punt this to next sprint when I have more context."
```

---

## "Low-hanging fruit"

Easy problems to fix that give quick wins with minimal effort. (Also in [Meeting Idioms](./02-meeting-idioms.md))

```
"Before we tackle the big refactor, let's pick the low-hanging fruit — 
 those three slow queries are obvious wins."
```

---

## "Whack-a-mole"

Fixing problems that keep reappearing in different forms — you fix one, another pops up. Suggests a missing root cause fix.

```
"We've been playing whack-a-mole with these null pointer exceptions.
 We need to fix the data validation at the source."
```

---

## "Boiling the frog"

A gradual deterioration that nobody notices until it's too late — like a frog in slowly heating water that never jumps out.

```
"Tech debt is a boiling frog situation — each small shortcut 
 seems fine, but over two years you end up with an unmaintainable system."
```

---

## "Rabbit hole"

An investigation that goes deeper and deeper, taking much longer than expected.

```
"I went down a rabbit hole debugging this and lost 3 hours.
 I'm stepping back to reassess."
"Be careful — the legacy auth code is a rabbit hole.
 Timebox yourself to 2 hours."
```

---

## "Yak shaving"

A chain of prerequisite tasks that takes you further from your original goal. (See also [Engineering Slang](./03-engineering-slang.md))

```
"I started trying to add a field to the API and ended up 
 yak shaving — updating the ORM, then the migration tool, 
 then the CI config. Lost a whole day."
```

---

## "Work around" vs "Fix"

**Workaround:** A way to avoid the problem without solving it.  
**Fix:** Solving the root cause.

```
"For now, add a workaround — check for null before calling the method.
 The real fix is to prevent nulls from entering the system at all."
```

---

## "Address" vs "Resolve"

**Address:** Take action on — may be partial or temporary.  
**Resolve:** Fully fix — the problem is gone.

```
"This PR addresses the memory leak but doesn't fully resolve it — 
 there's still a slow leak we need to track down."
```

---

## "Two birds, one stone"

Solving two problems with a single action.

```
"If we refactor the payment module, we can fix the bug 
 and improve performance — two birds, one stone."
```

---

## "Back of the envelope"

A quick, rough calculation — not precise but good enough to inform a decision. From doing quick maths on the back of an envelope.

```
"Back of the envelope: if we have 10,000 users and 5 API calls 
 each per day, that's 50,000 calls — well within our rate limit."
```

---

## Related

- [Estimation and Planning Idioms](./08-estimation-and-planning.md)
- [Engineering Slang](./03-engineering-slang.md)
- [Failure and Blame Idioms](./09-failure-and-blame.md)
