# Template: Runbook

> **How to use:** Write a runbook for every alert, scheduled job, and deployment procedure. The audience is the on-call engineer at 2am who has never seen this service before. Every step must be executable without prior knowledge. Test it before you need it.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Runbook: [PROCEDURE / ALERT NAME]

**Service:** [SERVICE NAME]  
**Author:** [NAME]  
**Last Reviewed:** [YYYY-MM-DD]  
**Reviewers:** [NAMES]  
**Severity (if alert):** `SEV-1` | `SEV-2` | `SEV-3`  
**Expected Duration:** [X minutes]  

---

## 📋 Overview

> What is this runbook for? When does it apply?

[DESCRIBE THE PROCEDURE OR ALERT SCENARIO]

---

## 🔴 When to Use This Runbook

> What triggers this? What alert fired, or what task is scheduled?

- Alert: `[ALERT NAME]` in [MONITORING TOOL]
- Condition: `[METRIC] [OPERATOR] [THRESHOLD]` for [DURATION]
- Or: Scheduled task — runs [FREQUENCY]

---

## 🔍 Diagnosis Steps

> Before taking any action, understand the situation. Each step produces an observation.

### Step 1: Confirm the alert is real

```bash
[COMMAND TO CHECK CURRENT STATE]
```
Expected output: [WHAT NORMAL LOOKS LIKE]  
If you see [ABNORMAL OUTPUT]: proceed to Step 2.

---

### Step 2: Check recent deployments

```bash
[COMMAND — e.g. git log or deployment history query]
```
If a deployment happened in the last 30 minutes: consider rollback (see [Rollback](#rollback-1)).

---

### Step 3: Check logs

```bash
[LOG QUERY COMMAND — e.g. kubectl logs / grep / Datadog query]
```
Look for: [WHAT ERROR OR WARNING PATTERN INDICATES THE PROBLEM]

---

### Step 4: Check dependencies

| Dependency | Check Command | Healthy Indicator |
|:-----------|:-------------|:------------------|
| [DB / SERVICE / QUEUE] | `[COMMAND]` | [EXPECTED OUTPUT] |

---

## 🔧 Resolution Steps

> Ordered actions to resolve the issue. Mark which steps are destructive — get approval before running those.

### Option A: [MOST COMMON RESOLUTION]

```bash
# Step 1
[COMMAND]

# Step 2
[COMMAND]
```
Expected outcome: [WHAT SHOULD HAPPEN]  
Verify: `[VERIFICATION COMMAND]`

---

### Option B: [ESCALATION / ALTERNATIVE]

> Use if Option A does not resolve within [X] minutes.

```bash
[COMMAND]
```

---

## 🔁 Rollback

> Only run if the issue was introduced by a deployment. Get approval from [ROLE] first.

```bash
[ROLLBACK COMMAND / STEPS]
```
⚠️ Warning: [ANY DATA LOSS OR SIDE EFFECT TO BE AWARE OF]

---

## ✅ Verification

> How do you know it's fixed?

```bash
[VERIFICATION COMMAND]
```
Expected: [WHAT SUCCESS LOOKS LIKE — metric, log output, HTTP response]

---

## 📣 Communication

> Who to notify, when, and how.

| Stakeholder | When to Notify | How |
|:------------|:--------------|:----|
| [ROLE / TEAM] | [TRIGGER — e.g. "if not resolved in 30 min"] | [SLACK / EMAIL / PAGERDUTY] |

---

## 📝 Post-Incident

- [ ] Update incident ticket with resolution timeline
- [ ] Page down in PagerDuty if resolved
- [ ] Schedule post-mortem if SEV-1 or SEV-2
- [ ] Update this runbook if steps were inaccurate

---

## 📎 References

- [DASHBOARD LINK]
- [LOG QUERY LINK]
- [RELATED RUNBOOK]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Runbook: High Auth Error Rate Alert

**Service:** auth-service  
**Author:** Chamrong Thor  
**Last Reviewed:** 2026-05-18  
**Reviewers:** Ratha Noun, Sophea Keo  
**Severity:** `SEV-1`  
**Expected Duration:** 15–45 minutes  

---

## 📋 Overview

This runbook guides the on-call engineer when the `auth.login.error_rate` alert fires. This alert indicates that the login endpoint is failing for a significant percentage of users — which may mean users cannot log in to the application.

---

## 🔴 When to Use This Runbook

- Alert: `auth-service: high login error rate` in Datadog
- Condition: `auth.login.error_rate > 1%` for 3 consecutive minutes
- PagerDuty policy: pages on-call immediately (no escalation delay for SEV-1)

---

## 🔍 Diagnosis Steps

### Step 1: Confirm the alert is real

```bash
# Check current error rate in Datadog (last 15 minutes)
# Dashboard: https://app.datadoghq.com/dashboard/auth-service

# Or via CLI:
datadog-ci metric get auth.login.error_rate --last 15m
```
Normal: error rate < 0.1%  
Alerting: error rate > 1%  
If alert auto-resolved before you respond: add a note to the incident ticket and monitor for 30 more minutes.

---

### Step 2: Check recent deployments

```bash
# List last 5 deployments to production
kubectl rollout history deployment/auth-service -n production

# Or check CI/CD:
# https://ci.example.com/pipelines?service=auth-service&env=production&limit=5
```
If a deployment happened in the last 60 minutes: **consider rollback first** (see [Rollback](#rollback-1)).

---

### Step 3: Check error logs

```bash
# Tail recent errors (last 5 minutes)
kubectl logs -n production -l app=auth-service --since=5m | grep "ERROR"

# Or in Datadog Logs:
# service:auth-service status:error @http.url_details.path:/auth/login
```
Common patterns to look for:

| Log Pattern | Likely Cause | Go To |
|:------------|:-------------|:------|
| `NullPointerException` | Code bug — check recent deploy | Option A |
| `Connection refused` to DB | Database down or pool exhausted | Option B |
| `JWT verification failed` | JWT secret mismatch after deploy | Option C |

---

### Step 4: Check dependencies

| Dependency | Check Command | Healthy Indicator |
|:-----------|:-------------|:------------------|
| PostgreSQL | `kubectl exec -n production deploy/auth-service -- pg_isready -h $DB_HOST` | `accepting connections` |
| Redis (rate limiter) | `kubectl exec -n production deploy/auth-service -- redis-cli -h $REDIS_HOST ping` | `PONG` |

---

## 🔧 Resolution Steps

### Option A: Code bug introduced by recent deployment → Rollback

> Most common cause. Use if logs show `NullPointerException` or `500` errors after a deploy.

```bash
# Roll back to previous version
kubectl rollout undo deployment/auth-service -n production

# Verify rollback completed
kubectl rollout status deployment/auth-service -n production
```
Expected: `deployment "auth-service" successfully rolled out`  
Verify: `curl -X POST https://api.example.com/auth/login -d '{"email":"test@example.com","password":"wrongpassword"}' | jq .`  
Expected: `{"error":"INVALID_CREDENTIALS"}` (not a 500)

---

### Option B: Database connection pool exhausted

```bash
# Check active DB connections
kubectl exec -n production deploy/auth-service -- \
  psql $DATABASE_URL -c "SELECT count(*) FROM pg_stat_activity WHERE datname='iblogger';"
```
If count > 95 (pool max is 100):

```bash
# Restart auth-service to reset connection pool
kubectl rollout restart deployment/auth-service -n production
```
⚠️ This causes ~30s of elevated error rate during pod restart. Notify Sophea before running.

---

### Option C: JWT secret mismatch after deployment

```bash
# Verify JWT_SECRET env var matches Secrets Manager
kubectl get secret auth-secrets -n production -o jsonpath='{.data.JWT_SECRET}' | base64 -d

# Compare with Secrets Manager value
aws secretsmanager get-secret-value --secret-id prod/auth/jwt_secret --query SecretString
```
If they don't match:

```bash
# Update the k8s secret and restart
kubectl create secret generic auth-secrets --from-literal=JWT_SECRET=[CORRECT_VALUE] \
  -n production --dry-run=client -o yaml | kubectl apply -f -
kubectl rollout restart deployment/auth-service -n production
```

---

## 🔁 Rollback

```bash
# Roll back to the previous stable image
kubectl rollout undo deployment/auth-service -n production

# To roll back to a specific revision:
kubectl rollout undo deployment/auth-service -n production --to-revision=5

# Verify
kubectl rollout status deployment/auth-service -n production
```
⚠️ DB schema rollbacks (migrations) require separate action — contact Chamrong before running.

---

## ✅ Verification

```bash
# Check error rate is back to normal (should be < 0.1%)
datadog-ci metric get auth.login.error_rate --last 5m

# Smoke test login endpoint
curl -s -X POST https://api.example.com/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"smoketest@example.com","password":"SmokeTestPass123!"}' | jq .status
```
Expected: `200` with `{"access_token": "..."}` (not a 500)

---

## 📣 Communication

| Stakeholder | When to Notify | How |
|:------------|:--------------|:----|
| Sophea Keo (PM) | Immediately on SEV-1 | Slack DM + #incidents |
| Enterprise customers | If outage > 30 minutes | Customer success team via Sophea |
| Engineering team | After resolution | Post in #incidents with timeline |

---

## 📝 Post-Incident

- [ ] Update incident ticket with resolution timeline
- [ ] Page down in PagerDuty
- [ ] Schedule post-mortem (use [Post-Mortem template](../meetings/03-incident-postmortem.md))
- [ ] Update this runbook if any step was wrong or missing

---

## 📎 References

- [Datadog: Auth Service Dashboard](https://app.datadoghq.com/dashboard/auth-service)
- [Kubernetes: auth-service deployment](https://k8s.example.com/namespaces/production/deployments/auth-service)
- [Post-Mortem: INC-2026-0518](https://confluence.example.com/inc-2026-0518)
- [Runbook: Database Connection Issues](./runbook-db-connections.md)
