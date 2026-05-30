# Spelling Traps in Technical Writing

**Tags:** #english #daily #spelling #writing  
**Read Time:** ~5 min

> These are the words that developers misspell constantly — in commit messages, PR descriptions, documentation, and Slack. A spell-checker catches some of them, but not the ones that are valid words spelled wrong.

---

## Words Developers Misspell Most

### separate ✓ vs seperate ✗

```
✓  "The concerns are separate."
✓  "We need to separate the auth logic from the controller."
✗  "seperate"  ← very common mistake
```

**Memory trick:** There's "a rat" in sepa**rat**e.

---

### occurrence ✓ vs occurence / occurance ✗

```
✓  "This is a rare occurrence."
✓  "Log every occurrence of this event."
✗  "occurence"
✗  "occurance"
```

**Rule:** occur → occurring → occurrence (double the r, -ence not -ance)

---

### necessary ✓ vs neccessary / necesary ✗

```
✓  "Is this change necessary?"
✗  "neccessary"
✗  "necesary"
```

**Memory trick:** One Collar, two Socks → 1 C, 2 S → ne**c**e**ss**ary

---

### receive ✓ vs recieve ✗

```
✓  "The service will receive the webhook."
✗  "recieve"
```

**Rule:** i before e, except after c → rec**ei**ve

---

### accommodate ✓ vs accomodate ✗

```
✓  "The system can accommodate 10,000 concurrent users."
✗  "accomodate"
```

**Rule:** double c, double m → ac**c**om**m**odate

---

### privilege ✓ vs priviledge / privelege ✗

```
✓  "This endpoint requires admin privilege."
✗  "priviledge"
✗  "privelege"
```

---

### environment ✓ vs enviroment ✗

```
✓  "Set the environment variable."
✓  "The staging environment is ready."
✗  "enviroment"  ← missing the n
```

---

### maintenance ✓ vs maintainance / maintenence ✗

```
✓  "Schedule maintenance for Sunday."
✗  "maintainance"
✗  "maintenence"
```

---

### override ✓ vs overide ✗

```
✓  "Override the default configuration."
✗  "overide"
```

---

### parameter ✓ vs paramater / perameter ✗

```
✓  "Pass the user ID as a parameter."
✗  "paramater"
✗  "perameter"
```

---

## Words That Are Often the Wrong Word

### cancelled vs canceled

Both are correct — it depends on which English you use:
- **British English:** `cancelled` (double l)
- **American English:** `canceled` (single l)

Be consistent within a codebase. Most JavaScript/TypeScript projects follow American English → `canceled`.

```
// American
"The booking was canceled."
// British
"The booking was cancelled."
```

### null vs nil vs None vs undefined

These are not interchangeable — they are language-specific:

| Language | "No value" |
|:---------|:---------|
| JavaScript / TypeScript | `null`, `undefined` |
| Java / C# / PHP | `null` |
| Ruby | `nil` |
| Python | `None` |
| Go | `nil` |
| SQL | `NULL` |

When writing documentation, use the correct term for the language being discussed.

---

### boolean vs Boolean

- **Lowercase `boolean`** — the primitive type in Java, TypeScript, JavaScript
- **Uppercase `Boolean`** — the wrapper class in Java; also the general concept in writing

In general English writing: `"a boolean value"` (lowercase).  
In Java code: `Boolean` for the wrapper, `boolean` for the primitive.

---

## Commonly Confused Technical Spellings

| Wrong | Right |
|:------|:------|
| `authoriztion` | `authorization` |
| `authentification` | `authentication` |
| `permision` | `permission` |
| `repositry` | `repository` |
| `dependancy` | `dependency` |
| `excecute` | `execute` |
| `arguement` | `argument` |
| `succesful` | `successful` |
| `existance` | `existence` |
| `persistance` | `persistence` |
| `inheritence` | `inheritance` |
| `instanciate` | `instantiate` |
| `syncronous` | `synchronous` |
| `asyncronous` | `asynchronous` |
| `retreive` | `retrieve` |
| `occured` | `occurred` |
| `refered` | `referred` |
| `commited` | `committed` |

---

## Related

- [British vs American English in Tech](./13-british-vs-american-english.md)
- [Commonly Confused Words](./01-commonly-confused-words.md)
- [Vocabulary for Developers](./06-vocabulary-for-developers.md)
