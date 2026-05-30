# Example — ASCII: Timeline

> **Use when:** Showing events, milestones, or phases along a time axis in plain text.

**Tool:** ASCII | **Type:** Timeline

---

## Example: Incident Timeline

```
2026-05-21  Timeline: Database Connection Pool Exhaustion

00:00 ──────────────────────────────────────────────────────────────────
         [NORMAL] All services healthy, p95 latency < 80ms

02:34 ──── ⚠ ALERT ─────────────────────────────────────────────────────
         [DEGRADED] DB connection errors spike (5xx rate 2%)
         Error: "remaining connection slots reserved for non-replication"

02:37 ──── 📟 ON-CALL PAGED ─────────────────────────────────────────────
         SRE team receives PagerDuty alert

02:41 ──── 🔍 INVESTIGATION ─────────────────────────────────────────────
         On-call confirms pool exhaustion in pg_stat_activity
         max_connections = 100, active = 100, waiting = 47

02:49 ──── 🔧 MITIGATION ────────────────────────────────────────────────
         PgBouncer max_client_conn raised from 50 → 200
         Stale connections killed manually

02:52 ──── ✅ RECOVERY ──────────────────────────────────────────────────
         5xx rate drops to 0%, latency returns to < 80ms

03:30 ──── 📝 POSTMORTEM ────────────────────────────────────────────────
         Root cause: new batch job opened connections without closing
         Fix: connection cleanup added, PgBouncer limit permanently raised

00:00 ──────────────────────────────────────────────────────────────────
```

---

## Example: Sprint Timeline

```
Week 1          Week 2          Week 3          Week 4
│               │               │               │
├── Planning ───┤               │               │
│               ├── Dev Sprint──┤               │
│               │               ├── QA & Fix ──┤
│               │               │               ├── Release
│               │               │               │
▼               ▼               ▼               ▼
Jan 6           Jan 13          Jan 20          Jan 27
```

---

## Example: Product Roadmap (horizontal)

```
Q1 2025         Q2 2025         Q3 2025         Q4 2025
│               │               │               │
├─ Auth v2      │               │               │
├─ API limits   │               │               │
│               ├─ Mobile beta  │               │
│               ├─ Billing      │               │
│               │               ├─ K8s migrate  │
│               │               ├─ Search       │
│               │               │               ├─ SOC 2
│               │               │               ├─ Perf work
▼               ▼               ▼               ▼
Jan             Apr             Jul             Oct
```

---

## Timeline Construction Patterns

**Vertical timeline (events top-to-bottom):**
```
HH:MM ──── LABEL ──────────────────
         Description of what happened
```

**Horizontal timeline (phases left-to-right):**
```
Phase 1    │  Phase 2    │  Phase 3
───────────┼─────────────┼──────────
Start date │             │  End date
```

**Milestone marker conventions:**
```
──── ✅  Completed / resolved
──── ⚠   Warning / degraded
──── 🔴  Critical / outage
──── 📟  Alert triggered
──── 🔧  Mitigation applied
──── 📝  Documentation / postmortem
```
