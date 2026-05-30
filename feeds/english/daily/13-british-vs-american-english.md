# British vs American English in Tech

**Tags:** #english #daily #spelling #british #american #consistency  
**Read Time:** ~5 min

> Most codebases and technical tools default to American English. But developers come from everywhere, and teams span continents. Knowing the differences helps you be consistent — and understand why your spell-checker is flagging words that look correct to you.

---

## Why It Matters

- **Consistency** — mixing `colour` and `color` in the same codebase looks careless
- **Spell-checkers** — VS Code, GitHub, and most tools default to American English
- **APIs and identifiers** — `serialize` vs `serialise` in method names has no right answer, but your team must pick one and stick to it
- **Documentation** — a global audience reads your docs; American spelling is more universally expected in tech

**Recommendation:** Default to **American English** in code, APIs, and technical documentation unless your team or organisation has explicitly chosen British.

---

## Spelling Differences

### -our vs -or

| British | American | In tech |
|:--------|:---------|:--------|
| colour | color | `color` (CSS, HTML, variable names) |
| behaviour | behavior | `behavior` (common in APIs, SDKs) |
| favour | favor | `favor` |
| honour | honor | `honor` |
| neighbour | neighbor | `neighbor` |
| labour | labor | `labor` |

```
// American — standard in most codebases
const defaultColor = '#ffffff';
const userBehavior = trackEvents();

// British — used in UK-based projects
const defaultColour = '#ffffff';
```

### -ise vs -ize

| British | American | In tech |
|:--------|:---------|:--------|
| serialise | serialize | `serialize` (JSON.serialize, etc.) |
| initialise | initialize | `initialize` |
| authorise | authorize | `authorize` (OAuth uses this) |
| recognise | recognize | `recognize` |
| organise | organize | `organize` |
| optimise | optimize | `optimize` |
| normalise | normalize | `normalize` |

**Note:** OAuth, JSON, and most major web standards use American `-ize` spellings. This makes American spelling the practical default for web development.

### -re vs -er

| British | American | In tech |
|:--------|:---------|:--------|
| centre | center | `center` (CSS: `text-align: center`) |
| fibre | fiber | `fiber` (Node.js Fiber, optical fiber) |
| metre | meter | `meter` (metrics, rate limiter) |
| litre | liter | `liter` |

### -ll vs -l (in conjugations)

| British | American | Example |
|:--------|:---------|:--------|
| cancelled | canceled | Event status: `canceled` |
| labelled | labeled | Git: `labeled` (GitHub uses this) |
| travelled | traveled | |
| modelling | modeling | ML: `modeling` |
| fulfil | fulfill | `fulfill` |
| instalment | installment | |

**GitHub, Jira, Linear** all use American spelling: `canceled`, `labeled`.

---

## Vocabulary Differences

Some words are completely different — not just spelled differently:

| British | American | Context |
|:--------|:---------|:--------|
| whilst | while | Use `while` in technical writing |
| amongst | among | Use `among` |
| maths | math | Use `math` in technical contexts |
| programme | program | Use `program` (a software program) |
| licence (noun) | license (noun and verb) | American: `license` for both |
| practise (verb) / practice (noun) | practice (both) | American: `practice` for both |

### licence vs license

**British:**
- `licence` = noun (a driving licence, a software licence)
- `practise` = verb (to practise a skill)
- `practice` = noun (a medical practice)

**American:**
- `license` = both noun and verb
- `practice` = both noun and verb

In tech: use **American** → `license` for everything.

```
✓  "This software is released under the MIT license."
✓  "Licensed under Apache 2.0."
```

---

## Punctuation Differences

### Quotation marks

**American:** Double quotes first, single quotes inside  
`"He said 'hello' to the server."`

**British:** Single quotes first, double inside  
`'He said "hello" to the server.'`

**In technical writing:** Use double quotes — they are standard in JSON, code examples, and most technical contexts.

### Full stop / Period with abbreviations

**British:** No period after abbreviations that end in the same letter: `Dr`, `Mr`, `St`  
**American:** Period after abbreviations: `Dr.`, `Mr.`, `St.`

**In tech docs:** Omit periods after abbreviations — it's cleaner.

---

## Which to Use: Decision Guide

| Context | Use |
|:--------|:----|
| Variable names, function names | American (`color`, `initialize`, `canceled`) |
| API field names | American (matches most major standards) |
| Documentation for global audience | American |
| npm/pip/maven package names | American |
| Internal docs for a UK/AU team | British if that's team standard |
| Open source project | American (more universally expected) |

---

## Making It Consistent

If your project has a mix, pick one and standardise. Add a note to the CONTRIBUTING.md:

```markdown
## Language Standard
We use American English spelling throughout the codebase and documentation.
Examples: `color` (not `colour`), `serialize` (not `serialise`), 
`canceled` (not `cancelled`).
```

---

## Related

- [Spelling Traps in Tech](./09-spelling-traps-in-tech.md)
- [Commonly Confused Words](./01-commonly-confused-words.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
