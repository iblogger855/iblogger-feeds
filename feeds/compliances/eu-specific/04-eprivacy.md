# ePrivacy Directive — Cookie Law and Electronic Communications Privacy

**Jurisdiction:** European Union  
**Current version:** ePrivacy Directive 2002/58/EC, amended by Directive 2009/136/EC ("Cookie Law")  
**Status:** Directive (implemented differently per member state); ePrivacy Regulation to replace it — still in negotiation  
**Applies to:** Any website or app serving EU users that uses cookies, tracking, or electronic communications  
**Tags:** #compliance #eprivacy #cookies #tracking #eu #consent

---

## What It Is

The ePrivacy Directive is the EU law that governs:
1. **Cookies and tracking technologies** — requires consent before placing non-essential cookies
2. **Electronic marketing** — opt-in rules for email/SMS marketing
3. **Confidentiality of electronic communications** — telecoms privacy

It operates alongside GDPR — GDPR is the general data protection law, ePrivacy is the specific law for electronic communications and tracking. Both apply simultaneously.

---

## Cookies — The Core Rule

```
STRICTLY NECESSARY cookies:
  Do not require consent.
  Examples: session cookies, authentication, shopping cart, CSRF tokens

ALL OTHER cookies require:
  □ Prior informed consent — before the cookie is set
  □ Freely given — no consent wall blocking access to site
  □ Specific — separate consent per cookie category
  □ Informed — user knows what each category does
  □ Easy withdrawal — opt-out must be as easy as opt-in
```

### Cookie Categories

| Category | Examples | Needs consent? |
|:---------|:---------|:--------------|
| **Strictly necessary** | Session ID, auth token, cart, CSRF | No |
| **Functional/preference** | Language setting, remembered preferences | Yes |
| **Analytics** | Google Analytics, Matomo | Yes (unless strictly anonymous) |
| **Marketing/advertising** | Facebook Pixel, Google Ads, retargeting | Yes |
| **Social media** | Like buttons, share buttons that set cookies | Yes |

---

## Cookie Consent Banner Requirements

A valid cookie consent banner must:

```
✓ Appear BEFORE any non-essential cookies are set
✓ Have a clear "Accept" and "Reject" option — equal prominence
✓ Not use dark patterns (pre-ticked boxes, confusing language, hidden reject button)
✓ Allow granular choice per category (functional / analytics / marketing)
✓ Store consent records — who consented, to what, when, from which IP range
✓ Allow easy withdrawal — accessible cookie settings in footer/header
✓ Not gate access to site on accepting tracking cookies (consent walls are illegal in most member states)
```

### Reject Must Be as Easy as Accept

This is the rule that most cookie banners violate:

```
ILLEGAL:
  "Accept all" button — large, prominent
  "Manage preferences" — small, hidden, requires 10 clicks to reject all

LEGAL:
  "Accept all" button
  "Reject all" button — equal size and prominence
```

---

## Direct Marketing Rules

### Email Marketing
- **Opt-in required** for commercial email (soft opt-in exception for existing customers)
- Soft opt-in: can email existing customers about similar products WITHOUT prior consent — but must offer opt-out in every email
- Unsubscribe link must be functional and honoured promptly

### SMS Marketing
- Prior opt-in required
- Must identify the sender
- Must offer opt-out mechanism

### Automated Calls
- Prior opt-in required in most member states

---

## Confidentiality of Communications

Communications data (metadata about who communicates with whom, when, from where) is confidential:
- Telecoms and messaging providers cannot access content without consent or legal authority
- Applies to email providers, messaging apps, and VoIP

---

## ePrivacy vs GDPR

| Aspect | ePrivacy Directive | GDPR |
|:-------|:-------------------|:-----|
| Scope | Cookies, electronic communications, marketing | All personal data |
| Legal basis | Consent (for cookies and marketing) | Multiple legal bases |
| Priority | Lex specialis — overrides GDPR where both apply | General rule |
| Enforcement | National telecoms/comms authorities | National DPAs |

---

## Member State Variations

Because ePrivacy is a Directive (not a Regulation), implementation varies:

| Country | Notable variation |
|:--------|:-----------------|
| Germany (TTDSG) | Stricter than minimum — all tracking requires consent |
| France (CNIL) | Enforces "Reject all" equally prominent; heavy fines |
| UK (PECR) | Post-Brexit: UK rules closely mirror ePrivacy |
| Netherlands | Active enforcement of cookie walls |

---

## Penalties

Enforced at member state level — varies significantly:

| Country | Notable enforcement |
|:--------|:-------------------|
| France (CNIL) | Google €150M, Facebook €60M (2022) — cookie consent |
| Germany | Active enforcement by state authorities |
| Italy (Garante) | Multiple large fines for tracking without consent |

---

## What to Build

```
Minimum ePrivacy compliance:

□ Cookie audit — list all cookies, categorise each
□ Consent Management Platform (CMP) — OneTrust, Cookiebot, Usercentrics
□ Consent banner — prior to any non-essential cookies
□ Equal prominence of Accept/Reject
□ Granular consent per category
□ Consent records stored — who, what, when
□ Easy withdrawal — accessible at all times
□ No consent walls (unless privacy-enhancing alternative offered)
□ Email marketing — opt-in confirmation records
□ Unsubscribe mechanism — functional within 10 days
□ Marketing suppression list — honoured across all channels
□ Review on each new cookie/tracking technology addition
```

---

## Related

- [GDPR](../data-privacy/01-gdpr.md) — companion regulation
- [Regional: Europe Overview](../regional/07-europe-overview.md)
