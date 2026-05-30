# Writing Numbers and Units in Technical Docs

**Tags:** #english #daily #numbers #units #writing  
**Read Time:** ~4 min

> Numbers and units in technical writing must be unambiguous. "The response time improved 5x" means nothing without context. "Response time decreased from 800ms to 160ms (5× improvement)" is precise.

---

## Numbers: Spell Out or Use Digits?

| Rule | Example |
|:-----|:--------|
| Numbers 1–9: spell out in prose | `three services`, `five retries` |
| Numbers 10+: use digits | `12 endpoints`, `100 requests per second` |
| Numbers with units: always digits | `5 MB`, `3 seconds`, `8 workers` |
| Numbers starting a sentence: spell out | `Three services handle this.` — not `3 services handle this.` |
| Large numbers: use commas | `1,000,000 rows` — not `1000000 rows` |

---

## Time and Duration

| How to write | Correct | Avoid |
|:------------|:--------|:------|
| Milliseconds | `800ms` or `800 ms` | `800MS`, `800miliseconds` |
| Seconds | `3s` or `3 seconds` | `3sec` |
| Minutes | `5 min` or `5 minutes` | `5 mins` (informal) |
| Hours | `2h` or `2 hours` | `2hrs` |
| Days | `7 days` | `7d` (only in code/config) |

**In prose:** spell it out — `three seconds`, `five minutes`  
**In tables and code:** abbreviate — `3s`, `5min`, `2h`

---

## Data Sizes

Use the correct unit — don't mix SI and binary casually.

| Unit | Meaning | Use when |
|:-----|:--------|:---------|
| KB / MB / GB / TB | 1,000-based (SI) | Network speeds, storage marketing |
| KiB / MiB / GiB / TiB | 1,024-based (binary) | Memory, RAM, precise storage |

In practice: most technical writing uses **MB/GB** (even when technically meaning MiB/GiB). Be consistent within a document.

```
"The image must be under 10 MB."          ✓
"The service uses approximately 512 MB of RAM."  ✓
"Upload limit: 5MB"                       ✓ (no space is acceptable in UI)
```

---

## Performance Numbers — Always Include Context

A number without context is meaningless.

| Meaningless | Meaningful |
|:------------|:----------|
| `5× faster` | `Response time decreased from 800ms to 160ms (5× improvement)` |
| `reduced by 80%` | `Database queries reduced from 50 per request to 10 (80% reduction)` |
| `handles more load` | `Throughput increased from 200 req/s to 1,200 req/s` |

---

## Percentages

```
"Error rate dropped by 3%."               ✓ (relative change)
"Error rate is now 0.1%."                 ✓ (absolute value)
"Error rate dropped from 3.1% to 0.1%."  ✓ (best — shows both)
```

No space between the number and `%` in standard usage: `3%`, not `3 %`.

---

## Dates

Use ISO 8601 in technical documents — it is unambiguous internationally.

| Format | Example | Issue |
|:-------|:--------|:------|
| ISO 8601 ✓ | `2026-05-19` | Clear everywhere |
| US format ✗ | `05/19/2026` | Confused with EU format |
| EU format ✗ | `19/05/2026` | Confused with US format |
| Written out ✓ | `19 May 2026` | Clear, formal |

In code: always use ISO 8601.  
In prose documents: `19 May 2026` or `May 19, 2026`.

---

## Ranges

Use `–` (en dash) for ranges, not `-` (hyphen):

```
"Response times: 50–200ms"       ✓ (en dash)
"Response times: 50-200ms"       acceptable in code/Markdown
"Response times: 50 to 200ms"    ✓ (clearest in prose)
```

---

## Version Numbers

```
"Upgrade to Node.js 20.x"        ✓
"Requires PostgreSQL ≥ 15.0"     ✓
"Tested on Chrome 124 and above" ✓
```

---

## Related

- [Commonly Confused Words](./01-commonly-confused-words.md)
- [Technical Documentation](../technical/05-technical-documentation.md)
