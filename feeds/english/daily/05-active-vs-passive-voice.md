# Active vs Passive Voice

**Tags:** #english #daily #grammar #writing #clarity  
**Read Time:** ~4 min

> Active voice is almost always clearer and shorter than passive voice. Use it by default. Use passive only when it is genuinely the better choice.

---

## The Difference

**Active voice:** Subject → Verb → Object  
The subject does the action.

**Passive voice:** Object → "to be" + Past Participle → (by Subject)  
The action happens to the subject. The doer is often hidden.

```
ACTIVE:   "The deployment script deleted the database."
PASSIVE:  "The database was deleted by the deployment script."
PASSIVE:  "The database was deleted."  (doer hidden — worse)
```

---

## Why Active Is Usually Better

| Active | Passive | Active wins because |
|:-------|:--------|:--------------------|
| "The CI pipeline failed the build." | "The build was failed by the CI pipeline." | Shorter, clearer subject |
| "You need to set the DATABASE_URL." | "The DATABASE_URL needs to be set." | Clear who must act |
| "We found a bug in the auth flow." | "A bug was found in the auth flow." | Accountability is clear |
| "The cache stores user sessions." | "User sessions are stored by the cache." | More natural reading order |

---

## When Passive Voice Is Correct

Passive is the right choice when:

**1. The doer is unknown or irrelevant**
```
"The server was compromised sometime between 02:00 and 06:00 UTC."
(We don't know who did it — passive is appropriate)
```

**2. The object is more important than the subject**
```
"Passwords are hashed using bcrypt before storage."
(The important thing is what happens to passwords, not who hashes them)
```

**3. In formal or scientific writing where convention expects it**
```
"The experiment was conducted under controlled conditions."
```

**4. To avoid blaming or sounding accusatory**
```
"The deploy was pushed without running tests."
(Better than: "You pushed without running tests" in a post-mortem)
```

---

## Spotting Passive Voice

Look for:
- `was/were/is/are/been` + past participle (`-ed`, `-en`)
- Optional `by` phrase

```
"The error was logged."              ← passive (logged by what?)
"The service logs the error."        ← active ✓

"Users are notified by the system."  ← passive
"The system notifies users."         ← active ✓

"The migration should be run."       ← passive (by whom?)
"Run the migration."                 ← active (imperative) ✓
```

---

## Technical Writing Patterns

### Documentation (use active)
```
✗  "The configuration file is read by the application on startup."
✓  "The application reads the configuration file on startup."

✗  "A token is generated and returned to the client."
✓  "The service generates a token and returns it to the client."
```

### Instructions (use imperative — even more direct than active)
```
✗  "The user should click the confirm button."
✗  "The confirm button needs to be clicked."
✓  "Click the confirm button."
```

### Error messages (avoid passive — say who failed)
```
✗  "The request was rejected."
✓  "We couldn't process your request."  (or)  "The server rejected the request."
```

---

## Quick Fix Guide

| Passive version | Active fix |
|:----------------|:-----------|
| `was deployed` | `[team/CI] deployed` |
| `was configured` | `[you/the admin] configure` |
| `is not supported` | `[system] does not support` |
| `should be noted` | `Note that` |
| `it was decided` | `[who] decided` |
| `is required` | `[system/you] requires/require` |

---

## Related

- [Tense in Documentation](./04-tense-in-documentation.md)
- [Commonly Confused Words](./01-commonly-confused-words.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
