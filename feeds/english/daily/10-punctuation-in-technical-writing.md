# Punctuation in Technical Writing

**Tags:** #english #daily #grammar #punctuation #writing  
**Read Time:** ~5 min

> Most punctuation errors in technical writing come from four marks: the colon, the semicolon, the dash, and the hyphen. Getting these right makes your writing look precise and professional.

---

## Colon ( : )

A colon introduces something — a list, an explanation, or a result.

### Introducing a list
```
"The pipeline runs three checks: lint, tests, and security scan."
"You need to configure three things: the database URL, the API key, and the port."
```

### Introducing an explanation
```
"There is one reason this fails: the token has already expired."
"The fix is simple: add a null check before accessing the user object."
```

### Rules
- The text before the colon must be a complete sentence (subject + verb).
- Do not put a colon after "such as", "including", or "for example."

```
✓  "Three services are affected: auth, payments, and notifications."
✗  "The affected services include: auth, payments, and notifications."
   (remove the colon — "include" already introduces the list)
```

---

## Semicolon ( ; )

A semicolon connects two complete sentences that are closely related — stronger than a comma, weaker than a full stop.

```
"The cache reduces load on the database; the database handles only cache misses."
"The test passed locally; however, CI is failing."
"Deploy to staging first; then run the smoke tests."
```

### When to use it
- Two sentences so closely related they feel like one thought
- Before "however", "therefore", "thus", "consequently" when they connect two clauses
- In lists where the items themselves contain commas

```
"The affected services are: auth, for login and token refresh; payments, 
 for all transaction processing; and notifications, for email and push."
```

---

## Em Dash ( — )

The em dash is a long dash. It adds emphasis, sets off a parenthetical comment, or introduces a conclusion — like this.

```
"The issue was caused by one thing — a missing index."
"All three environments — dev, staging, and production — are affected."
"We have two options: fix it now — which takes 2 hours — or roll back."
```

### How to type it
- Mac: `Option + Shift + -`
- Windows: `Alt + 0151`
- Markdown: `--` in some renderers, or just paste the `—` character

### Em dash vs colon
Both can introduce a conclusion. The em dash is more emphatic and conversational:
```
"The root cause was a missing index."           ← neutral
"The root cause was one thing — a missing index." ← emphatic
```

---

## En Dash ( – )

The en dash is medium length. It is used for ranges.

```
"Response time: 50–200ms"
"Affects versions 1.2–1.8"
"Monday–Friday"
```

In Markdown documents, a hyphen (`-`) is commonly used for ranges and is acceptable.

---

## Hyphen ( - )

The hyphen joins compound words and modifiers.

### Compound modifiers before a noun
```
"A well-documented API"        ← hyphen because it modifies the noun together
"The API is well documented."  ← no hyphen after the noun
"A real-time update"
"The update is real time."
"A high-performance database"
"The database is high performance."
```

### Common hyphenated tech terms
```
built-in          roll-back (noun) / roll back (verb)
set-up (noun)     set up (verb)
log-in (noun)     log in (verb)
trade-off         sign-in
end-to-end        two-factor authentication
read-only         write-once
```

### No hyphen needed
```
"The API is publicly accessible."  ← adverb + adjective, no hyphen
"A highly available system."       ← same: "highly" is an adverb
```

---

## Apostrophe ( ' )

### Possession
```
"The service's response time"      ← singular
"The services' configurations"     ← plural (ends in s)
"The team's decision"
```

### Contraction (informal writing only)
```
"It's" = "it is"    ← fine in Slack, avoid in formal docs
"Don't" = "do not"  ← fine in instructions, avoid in formal reports
```

### Never use apostrophe for plurals
```
✓  "Three APIs are affected."
✗  "Three API's are affected."

✓  "The 1990s were a different era."
✗  "The 1990's were a different era."
```

---

## Comma ( , )

### Oxford comma — use it in technical writing
The Oxford comma is the comma before "and" in a list of three or more items. In technical writing, always use it — it prevents ambiguity.

```
✓  "The system handles authentication, authorisation, and session management."
✗  "The system handles authentication, authorisation and session management."
   (ambiguous — is "authorisation and session management" one thing?)
```

### After introductory phrases
```
✓  "In most cases, the cache handles this."
✓  "After the migration, restart the service."
✓  "However, there is an edge case."
```

---

## Related

- [Active vs Passive Voice](./05-active-vs-passive-voice.md)
- [Sentence Connectors](./07-sentence-connectors.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
