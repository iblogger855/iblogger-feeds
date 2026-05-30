# Engineering Slang Decoded

**Tags:** #english #idioms #engineering #dev-culture  
**Read Time:** ~6 min

> Software engineers have invented their own vocabulary. These terms appear in Slack, pull requests, and conversations — usually without explanation.

---

## Bikeshedding

**Origin:** Parkinson's Law of Triviality — a committee building a nuclear plant will spend most of its time debating the colour of the bike shed, because the bike shed is something everyone can have an opinion on.

**Meaning:** Spending too much time debating trivial details while ignoring the important ones.

```
"We spent 45 minutes in the PR bikeshedding over variable names.
 The actual architecture went unreviewed."

"Let's not bikeshed on the button colour — we need to decide the auth flow first."
```

---

## Yak Shaving

**Origin:** A Ren & Stimpy episode where a task leads to a chain of increasingly unrelated subtasks.

**Meaning:** A chain of prerequisite tasks that takes you further and further from your original goal.

```
"I spent the whole morning yak shaving — I went to fix a bug,
 then had to upgrade a library, which broke the build config,
 which required updating Node.js..."
```

---

## Rubber Duck Debugging

**Origin:** From "The Pragmatic Programmer" — the idea of explaining your code to a rubber duck.

**Meaning:** Solving a problem by explaining it out loud (to a person, a duck, or yourself). The act of explaining often reveals the answer.

```
"Can I rubber duck this with you? I just need to talk through the logic."
"I rubber ducked the problem and figured it out while explaining it."
```

---

## Dogfooding / Eating Your Own Dog Food

**Meaning:** Using your own product internally before releasing it to customers. Tests whether you trust your own work enough to use it yourself.

```
"We should dogfood this feature with the internal team for a week before release."
"The company eats its own dog food — all employees use the product daily."
```

---

## Boiling the Ocean

**Meaning:** Attempting to do an impossibly large task all at once. (Also in meetings — see [Meeting Idioms](./02-meeting-idioms.md))

```
"The v3 spec is trying to boil the ocean. We need to cut it in half."
```

---

## Greenfield vs Brownfield

**Greenfield:** Brand new project — no legacy constraints.  
**Brownfield:** Existing codebase — must work around what's already there.

```
"Lucky you — it's a greenfield project. You can choose the stack."
"It's a brownfield nightmare — we're working with a 10-year-old Rails app."
```

---

## Cargo Cult

**Origin:** After WWII, some Pacific island communities built fake airstrips hoping planes would land with cargo — mimicking the rituals without understanding them.

**Meaning:** Copying a practice (framework, pattern, process) without understanding why it works — and expecting the same results.

```
"This is cargo cult microservices — they split into 30 services
 but didn't solve the coupling problem that made them do it."
"Don't cargo cult Agile — understand why the ceremonies exist."
```

---

## Footgun

**Meaning:** A feature or design that makes it easy to accidentally hurt yourself (shoot yourself in the foot).

```
"This API is a footgun — it silently discards errors."
"Don't use mutable default arguments in Python — classic footgun."
```

---

## Paved Road / Golden Path

**Meaning:** The recommended, well-supported way of doing something in your organisation. Like a paved road — not the only path, but the easiest and safest.

```
"Use the paved road — deploy via the standard pipeline, not manually."
"Our golden path for new services is: Node.js + PostgreSQL + GitHub Actions."
```

---

## Thrashing

**Meaning:** Spending a lot of effort making changes that go back and forth without making progress. Also used in computer science for a system that spends all its time swapping memory.

```
"We've been thrashing on the architecture for three sprints — 
 we need to make a decision and commit."
```

---

## Toil

**Meaning:** (From SRE) Manual, repetitive work that could be automated. Considered waste.

```
"We have too much toil — every deploy requires 6 manual steps.
 Let's automate them."
```

---

## Blameless Post-Mortem

**Meaning:** An incident review focused on system failures and process improvements — not on blaming individuals. The goal is learning, not punishment.

```
"We do blameless post-mortems — the goal is to fix the system,
 not find someone to blame."
```

---

## Pager Duty / Being On-Call

**Meaning:** Being responsible for responding to production incidents outside of working hours.

```
"Are you on-call this week? Who's got pager duty?"
"The 3 AM alert woke up the on-call engineer."
```

---

## Bus Factor

**Meaning:** The minimum number of people who, if hit by a bus (unavailable), would cripple the project. A bus factor of 1 is dangerous — one person knows everything.

```
"The bus factor for this service is 1 — only Sophea understands it.
 We need to document it and cross-train."
```

---

## Related

- [Code Review Phrases](./01-code-review-phrases.md)
- [Meeting Idioms](./02-meeting-idioms.md)
- [Vocabulary for Developers](../daily/06-vocabulary-for-developers.md)
