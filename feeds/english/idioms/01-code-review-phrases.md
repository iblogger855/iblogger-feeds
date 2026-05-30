# Code Review Phrases Decoded

**Tags:** #english #idioms #code-review #communication  
**Read Time:** ~5 min

> Code review has its own language. Native speakers write comments that sound perfectly clear to them but are completely opaque to someone who learned English from a textbook.

---

## LGTM

**Looks Good To Me**  
The reviewer approves. "This is ready to merge."

```
"LGTM! Nice work on the caching logic."
```

Variants: `LGTM 🚢`, `LGTM with nits` (approved but with minor optional suggestions)

---

## nit / nitpick

A very minor, optional suggestion. From "nitpicking" — like picking small insects from hair. The implication: "I noticed this small thing, but don't feel obligated to fix it."

```
"nit: could rename `data` to `userData` for clarity"
"Nit: extra blank line here"
```

If a comment starts with `nit:`, you can ignore it and still merge.

---

## this smells / code smell

Something feels wrong, but you can't point to a specific bug. It's a warning sign that the design might be poor.

```
"This smells a bit — having 8 parameters might mean this function is doing too much."
"There's a code smell here — this pattern usually leads to tight coupling."
```

Origin: from the phrase "if it smells bad, it probably is bad."

---

## reinventing the wheel

Building something from scratch that already exists as a library or standard solution.

```
"Are we reinventing the wheel here? I think lodash already handles this."
"Let's not reinvent the wheel — there are mature libraries for date parsing."
```

---

## magic number / magic string

A hard-coded value with no explanation of what it means.

```
"This is a magic number — what does 86400 represent? Add a constant: SECONDS_IN_A_DAY."
"Magic string — move 'active' to a status enum."
```

---

## happy path

The normal, expected flow where nothing goes wrong.

```
"This only handles the happy path — what happens when the user is not found?"
"The happy path works, but we need to test the error states."
```

---

## guard clause / guard against

A check at the beginning of a function that returns early if a condition is invalid. "Guarding against" means protecting the rest of the code from a bad state.

```
"Add a guard clause at the top — return early if `userId` is null."
"We need to guard against empty arrays here."
```

---

## single responsibility / doing too much

A function or class that handles more than one concern.

```
"This function is doing too much — it fetches data, transforms it, and sends the email. Split it up."
"Single responsibility: this class should only handle auth, not billing."
```

---

## tight coupling / loosely coupled

**Tight coupling:** components depend heavily on each other's internals — hard to change one without breaking the other.  
**Loosely coupled:** components interact through interfaces — easier to change independently.

```
"This is too tightly coupled — the controller is directly importing the database model."
"We want loosely coupled services that communicate through the API."
```

---

## green field vs brown field

**Green field:** starting from scratch, no existing code  
**Brown field:** working in an existing codebase with constraints

```
"This is a green field project — we can choose the stack freely."
"It's a brown field situation — we have to work with the legacy auth system."
```

---

## Other Common Phrases

| Phrase | Meaning |
|:-------|:--------|
| `can you walk me through this?` | Explain how this works |
| `what's the intent here?` | What were you trying to do? |
| `is this tested?` | Do tests cover this? |
| `this could bite us later` | This will cause problems in the future |
| `left as an exercise` | Not implemented — the reader should figure it out |
| `drive-by comment` | A quick comment from someone not assigned as a reviewer |
| `rubber stamp` | Approving without really reviewing |
| `blocking comment` | A comment that must be resolved before merge |
| `non-blocking` | A suggestion that doesn't block merge |

---

## Related

- [Engineering Slang](./03-engineering-slang.md)
- [Giving Feedback](../professional/04-giving-feedback.md) — how to write review comments that are clear and kind
