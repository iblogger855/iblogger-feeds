# OWASP ASVS — Application Security Verification Standard

**Jurisdiction / យុត្តាធិការ៖** Global / ជាសកល  
**Current version / កំណែបច្ចុប្បន្ន៖** ASVS 5.0 (2024)  
**Applies to / អនុវត្តចំពោះ៖** Web applications and APIs — used by developers, architects, QA, and security teams / កម្មវិធីគេហទំព័រ (Web Applications) និងចំណុចប្រទាក់កម្មវិធី (APIs) — ប្រើប្រាស់ដោយអ្នកអភិវឌ្ឍន៍ ស្ថាបត្យករ អ្នកត្រួតពិនិត្យគុណភាព (QA) និងក្រុមការងារសន្តិសុខព័ត៌មាន  
**Administered by / គ្រប់គ្រងដោយ៖** OWASP (Open Web Application Security Project) / គម្រោងសន្តិសុខកម្មវិធីគេហទំព័ររៀបចំចំហ (OWASP)  
**Tags:** #compliance #owasp #asvs #appsec #web-security #verification

---

## 📌 មាតិកា (Table of Contents)

- [១. តើអ្វីជា OWASP ASVS? (What It Is)](#0)
- [២. កម្រិតទាំងបីនៃ ASVS (The Three Levels)](#1)
- [៣. ដែនគ្រប់គ្រង (Domains - ASVS 5.0)](#2)
- [៤. តម្រូវការគន្លឹះតាមដែនគ្រប់គ្រង (Key Requirements by Domain)](#3)
- [៥. ភាពខុសគ្នារវាង ASVS និង OWASP Top 10 (ASVS vs OWASP Top 10)](#4)
- [៦. របៀបប្រើប្រាស់ ASVS (How to Use ASVS)](#5)
- [៧. ឯកសារទាក់ទង (Related)](#6)

---

<a id="0"></a>
## ១. តើអ្វីជា OWASP ASVS? (What It Is)

OWASP ASVS គឺជាក្របខ័ណ្ឌនៃតម្រូវការសន្តិសុខ និងការគ្រប់គ្រងសម្រាប់កម្មវិធីគេហទំព័រ។ វាមិនមែនជាបទប្បញ្ញត្តិឡើយ — វាជាស្តង់ដារដែលស្ថាប័ននានាយកមកអនុវត្តដោយស្ម័គ្រចិត្ត (ឬជាផ្នែកមួយនៃតម្រូវការកិច្ចសន្យា) ដើម្បីផ្ទៀងផ្ទាត់ និងកែលម្អស្ថានភាពសន្តិសុខកម្មវិធីរបស់ពួកគេ។

OWASP ASVS is a framework of security requirements and controls for web applications. It is not a regulation — it is a standard that organisations adopt voluntarily (or as part of a contractual requirement) to verify and improve their application security posture.

វាបញ្ជាក់អំពីកម្រិតរឹតបន្តឹងសន្តិសុខចំនួនបី ដែលអនុញ្ញាតឱ្យស្ថាប័ននានាជ្រើសរើសកម្រិតដែលសមស្របទៅនឹងទម្រង់ហានិភ័យរបស់ពួកគេ។

It defines three levels of security rigour, allowing organisations to choose the appropriate level for their risk profile.

---

<a id="1"></a>
## ២. កម្រិតទាំងបីនៃ ASVS (The Three Levels)

| កម្រិត (Level) | ឈ្មោះ (Name) | សម្រាប់ (For) | តម្រូវការសន្តិសុខ (Security requirements) |
|:---|:---|:---|:---|
| **L1** | ជំហានដំបូង <br/> First steps | កម្មវិធីដែលមានហានិភ័យទាប ចំណុចចាប់ផ្ដើម <br/> Low-risk apps, starting point | អនាម័យសន្តិសុខមូលដ្ឋាន — អាចធ្វើតេស្តជ្រៀតចូលបាន <br/> Basic security hygiene — penetration testing feasible |
| **L2** | ស្តង់ដារ <br/> Standard | កម្មវិធីគេហទំព័រភាគច្រើន — ចាត់ចែងទិន្នន័យងាយរងគ្រោះ <br/> Most web apps — handles sensitive data | ការផ្ទៀងផ្ទាត់ហ្មត់ចត់ — គ្របដណ្ដប់រាល់វិធីសាស្ត្រវាយប្រហារភាគច្រើន <br/> Thorough verification — covers most attack vectors |
| **L3** | កម្រិតខ្ពស់ <br/> Advanced | ហេដ្ឋារចនាសម្ព័ន្ធសំខាន់ៗ — ប្រព័ន្ធហិរញ្ញវត្ថុ វេជ្ជសាស្ត្រ និងប្រព័ន្ធសុវត្ថិភាព <br/> Critical infrastructure — financial, medical, safety systems | ការការពារស៊ីជម្រៅ — តម្រូវឱ្យមានការបង្កើតគំរូការគំរាមកំហែងពេញលេញ <br/> Defence in depth — full threat modelling required |

កម្មវិធីគេហទំព័រភាគច្រើនគួរតែកំណត់គោលដៅយក **L2**។

Most web applications should target **L2**.

---

<a id="2"></a>
## ៣. ដែនគ្រប់គ្រង (Domains - ASVS 5.0)

| ដែនគ្រប់គ្រង (Domain) | តម្រូវការគន្លឹះ (Key requirements) |
|:---|:---|
| **V1 — ស្ថាបត្យកម្ម ការរចនា និងការបង្កើតគំរូការគំរាមកំហែង** <br/> V1 — Architecture, Design, Threat Modelling | សន្តិសុខនៅដំណាក់កាលរចនា ការចងក្រងឯកសារលំហូរទិន្នន័យ <br/> Security at design phase, data flows documented |
| **V2 — ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវ** <br/> V2 — Authentication | ពាក្យសម្ងាត់, MFA, ការរក្សាទុកព័ត៌មានសម្ងាត់, ការសង្គ្រោះគណនី <br/> Passwords, MFA, credential storage, account recovery |
| **V3 — ការគ្រប់គ្រងសម័យប្រជុំ (Session)** <br/> V3 — Session Management | ថូខឹនសម័យប្រជុំ (Session Tokens) ការអស់ម៉ោង ការលុបចោលពេលចាកចេញ <br/> Session tokens, timeout, invalidation on logout |
| **V4 — ការគ្រប់គ្រងការចូលប្រើប្រាស់** <br/> V4 — Access Control | RBAC, បដិសេធតាមលំនាំដើម (Deny by Default) ការរុករកតាមផ្លូវ (Path Traversal) <br/> RBAC, deny by default, path traversal |
| **V5 — ការផ្ទៀងផ្ទាត់ ការសម្អាត និងការធ្វើកូដនីយកម្មបញ្ចូល** <br/> V5 — Validation, Sanitization, Encoding | ការផ្ទៀងផ្ទាត់ការបញ្ចូល ការធ្វើកូដនីយកម្មលទ្ធផល ការការពារ XSS/Injection <br/> Input validation, output encoding, XSS/injection prevention |
| **V6 — គ្រីបតូក្រាហ្វី (Cryptography)** <br/> V6 — Cryptography | ការជ្រើសរើសក្បួនដោះស្រាយ (Algorithm) ការគ្រប់គ្រងកូនសោ ការបង្កើតលេខចៃដន្យ <br/> Algorithm selection, key management, random number generation |
| **V7 — ការចាត់ចែងកំហុស និងការកត់ត្រាទុក** <br/> V7 — Error Handling and Logging | មិនបង្ហាញព័ត៌មានកំហុស (Stack Traces) ទៅអ្នកប្រើប្រាស់ ការកត់ត្រាព្រឹត្តិការណ៍សន្តិសុខ <br/> No stack traces to users, security event logging |
| **V8 — ការការពារទិន្នន័យ** <br/> V8 — Data Protection | ការបែងចែកប្រភេទទិន្នន័យ ការកូដនីយកម្ម គ្មានទិន្នន័យងាយរងគ្រោះក្នុង Logs/URLs <br/> Data classification, encryption, no sensitive data in logs/URLs |
| **V9 — ការប្រាស្រ័យទាក់ទង** <br/> V9 — Communication | ការកំណត់រចនាសម្ព័ន្ធ TLS ការផ្ទៀងផ្ទាត់វិញ្ញាបនបត្រ <br/> TLS configuration, certificate validation |
| **V10 — កូដព្យាបាទ (Malicious Code)** <br/> V10 — Malicious Code | គ្មានទ្វារក្រោយ (Backdoors) គ្មានមុខងារដែលគ្មានការចងក្រងឯកសារ <br/> No backdoors, no undocumented features |
| **V11 — တក្កវិជ្ជាអាជីវកម្ម (Business Logic)** <br/> V11 — Business Logic | ការការពារការបំពានលើលំហូរការងារ ការកំណត់កម្រិត (Rate Limiting) <br/> Workflow abuse prevention, rate limiting |
| **V12 — ឯកសារ និងធនធាន** <br/> V12 — Files and Resources | ការផ្ទៀងផ្ទាត់ការផ្ទុកឡើងឯកសារ ការរុករកតាមផ្លូវ (Path Traversal) <br/> File upload validation, path traversal |
| **V13 — ចំណុចប្រទាក់កម្មវិធី (API) និងសេវាគេហទំព័រ** <br/> V13 — API and Web Service | ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវរបស់ API ការផ្ទៀងផ្ទាត់ការបញ្ចូល បឋមកថា (Headers) សន្តិសុខ HTTP <br/> API authentication, input validation, HTTP security headers |
| **V14 — ការកំណត់រចនាសម្ព័ន្ធ** <br/> V14 — Configuration | ការកំណត់លំនាំដើមប្រកបដោយសុវត្ថិភាព ការគ្រប់គ្រងភាពអាស្រ័យ (Dependency Management), CSP <br/> Secure defaults, dependency management, CSP |

---

<a id="3"></a>
## ៤. តម្រូវការគន្លឹះតាមដែនគ្រប់គ្រង (Key Requirements by Domain)

### ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវ (V2) (Authentication (V2))

```
□ ពាក្យសម្ងាត់យ៉ាងតិច ១២ តួអក្សរ មិនកំណត់ប្រវែងអតិបរមាឡើយ
□ គ្មានការផ្ដល់តម្រុយពាក្យសម្ងាត់ ឬសំណួរសន្តិសុខផ្អែកលើចំណេះដឹង
□ ការពិនិត្យមើលការលេចធ្លាយព័ត៌មានសម្ងាត់ (ឧ. Have I Been Pwned)
□ ប្រើប្រាស់ TOTP ឬកូនសោរូបវន្តសម្រាប់ MFA
□ ការចាក់សោគណនីបណ្ដោះអាសន្នក្រោយការបញ្ចូលខុស ១០ ដង
□ ការកំណត់ឡើងវិញនូវពាក្យសម្ងាត់ដោយសុវត្ថិភាព — តំណភ្ជាប់អស់សុពលភាពក្នុងរយៈពេល ១០ នាទី
□ គ្មានព័ត៌មានសម្ងាត់លំនាំដើម (Default Credentials) លើប្រព័ន្ធណាមួយឡើយ
```

```
□ Passwords minimum 12 characters, no maximum length
□ No password hints or knowledge-based security questions
□ Credential breach checking (e.g. Have I Been Pwned)
□ TOTP or hardware key for MFA
□ Account lockout after 10 failed attempts
□ Secure password reset — link expires in 10 minutes
□ No default credentials on any system
```

### ការគ្រប់គ្រងសម័យប្រជុំ (V3) (Session Management (V3))

```
□ ថូខឹនសម័យប្រជុំ៖ មានកម្រិតភាពចៃដន្យយ៉ាងតិច ៦៤ ប៊ីត (Entropy)
□ សម័យប្រជុំត្រូវបានលុបចោលពេលចាកចេញ (Logout)
□ ការអស់ម៉ោងសម័យប្រជុំ៖ សកម្ម (អសកម្ម ៣០ នាទី) + ដាច់ខាត (៨ ម៉ោង)
□ កំណត់ទង់ Secure + HttpOnly + SameSite លើឃុកឃីសម័យប្រជុំ (Session Cookies)
□ ចេញថូខឹនសម័យប្រជុំថ្មីក្រោយពេលចូលប្រព័ន្ធ (ការពារការជួសជុលសម័យប្រជុំ - Session Fixation)
```

```
□ Session tokens: 64+ bits of entropy
□ Session invalidated on logout
□ Session timeout: active (30 min inactivity) + absolute (8 hours)
□ Secure + HttpOnly + SameSite flags on session cookies
□ New session token issued after login (prevents fixation)
```

### ការផ្ទៀងផ្ទាត់ការបញ្ចូល (V5) (Input Validation (V5))

```
□ ផ្ទៀងផ្ទាត់រាល់ការបញ្ចូលទាំងអស់នៅផ្នែកម៉ាស៊ីនបម្រើ (Server-side) — មិនត្រូវទុកចិត្តផ្នែកម៉ាស៊ីនភ្ញៀវតែមួយមុខឡើយ
□ ប្រើប្រាស់សំណួរដែលមានប៉ារ៉ាម៉ែត្រ (Parameterised Queries) សម្រាប់ការចូលប្រើប្រាស់មូលដ្ឋានទិន្នន័យទាំងអស់ (គ្មានការតភ្ជាប់ខ្សែអក្សរឡើយ)
□ ធ្វើកូដនីយកម្ម HTML (HTML Encoding) សម្រាប់រាល់លទ្ធផលដែលគ្រប់គ្រងដោយអ្នកប្រើប្រាស់
□ ការផ្ទុកឡើងឯកសារ៖ ពិនិត្យប្រភេទ MIME, ស្កេនរកមេរោគ, រក្សាទុកនៅក្រៅថតឫសរបស់គេហទំព័រ (Webroot)
□ បដិសេធ ឬធ្វើកូដនីយកម្មស្លាក (Tags) HTML ទាំងអស់នៅក្នុងការបញ្ចូលរបស់អ្នកប្រើប្រាស់ដែលបង្ហាញដល់អ្នកដទៃ
```

```
□ Validate all input server-side — never trust client-side only
□ Parameterised queries for all database access (no string concatenation)
□ HTML encoding for all user-controlled output
□ File upload: check MIME type, scan for malware, store outside webroot
□ Reject or encode all HTML tags in user input displayed to others
```

### គ្រីបតូក្រាហ្វី (V6) (Cryptography (V6))

```
□ ប្រើប្រាស់ AES-256 សម្រាប់ការកូដនីយកម្មស៊ីមេទ្រី (Symmetric Encryption)
□ ប្រើប្រាស់ RSA 3072+, ECDSA P-384+ សម្រាប់អាស៊ីមេទ្រី (Asymmetric Encryption)
□ ប្រើប្រាស់ Bcrypt/Argon2/PBKDF2 សម្រាប់ការធ្វើហាសសិញពាក្យសម្ងាត់ — មិនត្រូវប្រើ MD5/SHA1 ឡើយ
□ កំណត់យក TLS 1.2 ជាកម្រិតអប្បបរមា, ណែនាំឱ្យប្រើប្រាស់ TLS 1.3
□ គ្មានការសរសេរកូនសោសម្ងាត់ (Keys/Secrets) បញ្ចូលដោយផ្ទាល់ក្នុងកូដប្រភព (Source Code) ឡើយ
```

```
□ AES-256 for symmetric encryption
□ RSA 3072+, ECDSA P-384+ for asymmetric
□ Bcrypt/Argon2/PBKDF2 for password hashing — never MD5/SHA1
□ TLS 1.2 minimum, TLS 1.3 preferred
□ No hardcoded keys or secrets in source code
```

### ការកត់ត្រាទុក (V7) (Logging (V7))

```
□ កត់ត្រាទុក៖ ព្រឹត្តិការណ៍ផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវ បរាជ័យក្នុងការគ្រប់គ្រងការចូលប្រើប្រាស់ បរាជ័យក្នុងការផ្ទៀងផ្ទាត់ការបញ្ចូល
□ មិនត្រូវកត់ត្រាទុក៖ ពាក្យសម្ងាត់, ថូខឹន, លេខកាតឥណទាន, ទិន្នន័យសុខភាពឡើយ
□ គ្មានព័ត៌មានកំហុសលម្អិត (Stack Traces) នៅក្នុងសារបង្ហាញកំហុសទៅកាន់អ្នកប្រើប្រាស់ឡើយ
□ ការពារកំណត់ត្រាទុក (Logs) ពីការកែសម្រួលដោយគ្មានការអនុញ្ញាត
□ រក្សាទុកកំណត់ត្រាទុកនៅកន្លែងកណ្ដាល (Centralised Log Storage)
```

```
□ Log: authentication events, access control failures, input validation failures
□ Never log: passwords, tokens, credit card numbers, health data
□ No stack traces in user-facing error messages
□ Logs protected from tampering
□ Centralised log storage
```

---

<a id="4"></a>
## ៥. ភាពខុសគ្នារវាង ASVS និង OWASP Top 10 (ASVS vs OWASP Top 10)

| ឯកសារ (Document) | គោលបំណង (Purpose) |
|:---|:---|
| **OWASP Top 10** | បញ្ជីការយល់ដឹង — ហានិភ័យសំខាន់ៗទាំង ១០ របស់កម្មវិធីគេហទំព័រ។ ល្អសម្រាប់ការអប់រំ។ មិនមែនជាស្តង់ដារអនុលោមភាពឡើយ។ <br/> Awareness list — the 10 most critical web application risks. Good for education. Not a compliance standard. |
| **OWASP ASVS** | ស្តង់ដារផ្ទៀងផ្ទាត់គ្រប់ជ្រុងជ្រោយ — តម្រូវការជាក់លាក់ជាង ២៥០។ ប្រើប្រាស់សម្រាប់ការអនុលោមភាព និងការធ្វើតេស្តសន្តិសុខព័ត៌មាន។ <br/> Comprehensive verification standard — 250+ specific requirements. Used for compliance and security testing. |

ប្រើប្រាស់ Top 10 ដើម្បីស្វែងយល់អំពីការគំរាមកំហែង។ ប្រើប្រាស់ ASVS ដើម្បីផ្ទៀងផ្ទាត់វិធានការគ្រប់គ្រងរបស់អ្នកធៀបនឹងការគំរាមកំហែងទាំងនោះ។

Use the Top 10 to understand the threats. Use ASVS to verify your controls against them.

---

<a id="5"></a>
## ៦. របៀបប្រើប្រាស់ ASVS (How to Use ASVS)

1. **ជ្រើសរើសកម្រិតគោលដៅរបស់អ្នក** (L1, L2, ឬ L3)
1. **Choose your target level** (L1, L2, or L3)
2. **ផ្គូផ្គងវិធានការគ្រប់គ្រងដែលមានស្រាប់** ធៀបនឹងតម្រូវការ ASVS
2. **Map existing controls** against ASVS requirements
3. **កំណត់គម្លាត** — តម្រូវការដែលមិនទាន់ត្រូវបានបំពេញនាពេលបច្ចុប្បន្ន
3. **Identify gaps** — requirements not currently met
4. **កែតម្រូវ** — បង្កើតវិធានការគ្រប់គ្រងដែលខ្វះខាត
4. **Remediate** — build the missing controls
5. **ផ្ទៀងផ្ទាត់** — ធ្វើតេស្តជ្រៀតចូលធៀបនឹងតម្រូវការ ASVS
5. **Verify** — penetration test against ASVS requirements
6. **ចងក្រងឯកសារ** — កត់ត្រាទុកថាតើតម្រូវការណាខ្លះដែលត្រូវបានបំពេញ និងរបៀបអនុវត្ត
6. **Document** — record which requirements are met and how

---

<a id="6"></a>
## ៧. ឯកសារទាក់ទង (Related)

- [SOC 2](./01-soc2.md) — វិញ្ញាបនបត្រសន្តិសុខស្ថាប័ន
- [SOC 2](./01-soc2.md) — organisational security certification
- [ISO 27001](./02-iso-27001.md) — វិញ្ញាបនបត្រ ISMS
- [ISO 27001](./02-iso-27001.md) — ISMS certification
- [NIST CSF](./04-nist-csf.md) — ក្របខ័ណ្ឌសន្តិសុខព័ត៌មាន NIST
- [NIST CSF](./04-nist-csf.md)
- [ផ្នែកសន្តិសុខព័ត៌មាន](../../security/) — ការណែនាំអំពីការអនុវត្តបច្ចេកទេស
- [Security section](../../security/) — technical implementation guides
