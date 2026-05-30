# Clone Playbooks — Platform Build & Expansion Guides

Strategic and technical procedures for building marketplace and SaaS clones, starting in emerging markets and expanding into Europe.

Each guide covers: MVP scope, infrastructure (OVHcloud), compliance (per-country), tech stack, architecture, payments, and common mistakes.

---

## Guides

| # | Platform | Journey | Guide |
|---|----------|---------|-------|
| 01 | **Doctolib** — Healthcare booking & telemedicine | Africa MVP | [01-doctolib-africa-health-platform.md](./01-doctolib-africa-health-platform.md) |
| 02 | **Doctolib** — Healthcare booking & telemedicine | Africa → France (HDS-certified) | [02-doctolib-ovh-africa-to-europe.md](./02-doctolib-ovh-africa-to-europe.md) |
| 03 | **Airbnb** — Short-term rental marketplace | Cambodia & SEA → France (GDPR) | [03-airbnb-cambodia-to-europe.md](./03-airbnb-cambodia-to-europe.md) |

---

## Common Patterns Across All Guides

- **OVHcloud** as primary cloud (Singapore for SEA, Gravelines/Strasbourg for EU)
- **Cloudflare** for public/static content only — never proxying authenticated or PII routes
- **Keycloak** for auth with separate realms per region
- **PostgreSQL 16** on OVHcloud Cloud Databases (managed, no self-hosting)
- **Two-region data residency** — SEA data in SGP1, EU data in GRA/SBG
- **Append-only audit logs** — `DELETE` and `UPDATE` revoked on audit tables
- **Idempotency keys** on all payment capture calls

---

## Related

- [Africa Market Expansion & Architecture Planning Guide](../01-africa-market-expansion-architecture.md) — General strategy for expanding into African markets
