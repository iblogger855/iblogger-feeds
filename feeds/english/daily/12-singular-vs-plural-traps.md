# Singular vs Plural Traps in Technical Writing

**Tags:** #english #daily #grammar #agreement #writing  
**Read Time:** ~5 min

> Some words look plural but are singular. Some look singular but are plural. Some go both ways. These traps appear constantly in technical documentation and cause agreement errors that make writing look unprofessional.

---

## data — singular or plural?

**Technically:** `data` is the plural of `datum` — so it should take a plural verb.  
**In practice:** In technology writing, `data` is treated as singular (uncountable mass noun). This is now the accepted standard in technical contexts.

```
✓  "The data is stored in PostgreSQL."        ← technical standard
✓  "The data shows a clear trend."
✗  "The data are stored in PostgreSQL."       ← technically correct but sounds odd in tech
```

**Use singular** in code, documentation, APIs, and technical discussion.  
The plural usage `data are` appears mainly in academic and scientific writing.

---

## criteria vs criterion

**criterion** = singular (one standard or rule)  
**criteria** = plural (multiple standards or rules)

```
✓  "The main criterion for approval is test coverage above 80%."
✓  "The acceptance criteria are defined in the ticket."
✗  "The criteria is not met."     ← criteria is plural — use "are"
✗  "The criterion are unclear."   ← criterion is singular — use "is"
```

---

## The team is / The team are

In **American English**: collective nouns (team, group, company, committee) take a **singular** verb.  
In **British English**: they can take either, depending on whether you think of the group as one unit or individuals.

```
American:  "The team is deploying the fix."          ← singular
British:   "The team are deploying the fix."          ← also correct
```

**Recommendation:** Use singular in technical documentation — it's unambiguous and internationally readable.

```
✓  "The DevOps team is responsible for the pipeline."
✓  "The company is migrating to AWS."
✓  "The committee has approved the change."
```

---

## a number of / the number of

**a number of** = plural (means "several" or "many")  
**the number of** = singular (refers to the count itself)

```
✓  "A number of services are affected."    ← plural: several services
✓  "The number of services is three."      ← singular: the count is three
✗  "A number of services is affected."
✗  "The number of services are three."
```

---

## none — singular or plural?

Depends on what follows.

**none of + uncountable noun** → singular  
**none of + plural countable noun** → both are acceptable; singular is safer

```
✓  "None of the data is missing."           ← uncountable → singular
✓  "None of the tests pass."                ← plural → plural (common in speech)
✓  "None of the tests passes."              ← plural → singular (more formal)
```

In technical documentation, use singular for consistency.

---

## each / every — always singular

```
✓  "Each service has its own database."
✓  "Every request is logged."
✗  "Each service have their own database."
✗  "Every request are logged."
```

---

## either / neither — singular (in formal writing)

```
✓  "Neither option is ideal."
✓  "Either approach works."
✗  "Neither option are ideal."
```

---

## Tricky plurals

### Words that look singular but are plural
| Word | Singular/Plural | Example |
|:-----|:----------------|:--------|
| `data` | Treated as singular in tech | "The data is..." |
| `software` | Always singular (uncountable) | "The software is installed." |
| `information` | Always singular (uncountable) | "The information is correct." |
| `feedback` | Always singular (uncountable) | "The feedback was helpful." |
| `news` | Always singular (looks plural) | "The news is good." |
| `metadata` | Treated as singular in tech | "The metadata is attached." |

### Words that look plural but are actually singular
| Word | Note | Example |
|:-----|:-----|:--------|
| `series` | Singular and plural are the same | "A series of errors was logged." / "Three series were analysed." |
| `means` | Can be singular or plural | "A means of authentication is required." |
| `status` | Singular — `statuses` is the plural | "The status is active." / "The statuses are shown below." |

### Latin/Greek plurals in tech
| Singular | Plural |
|:---------|:-------|
| `index` | `indexes` (tech) or `indices` (maths) |
| `matrix` | `matrices` |
| `datum` | `data` |
| `criterion` | `criteria` |
| `appendix` | `appendices` or `appendixes` |
| `vertex` | `vertices` |
| `schema` | `schemas` (tech) or `schemata` (academic) |

In tech writing, use the anglicised plural (`indexes`, `schemas`) — it's clearer and more widely understood.

---

## Subject-verb agreement with long sentences

When the subject and verb are far apart, it's easy to agree with the wrong noun.

```
✗  "The list of errors that were found in the last deployment are significant."
✓  "The list of errors that were found in the last deployment is significant."
   (subject = "list" → singular → "is")

✗  "The team, along with the DevOps engineers, are responsible."
✓  "The team, along with the DevOps engineers, is responsible."
   ("along with" is a phrase, not part of the subject → "team" is singular → "is")
```

---

## Related

- [Commonly Confused Words](./01-commonly-confused-words.md)
- [Active vs Passive Voice](./05-active-vs-passive-voice.md)
- [British vs American English in Tech](./13-british-vs-american-english.md)
