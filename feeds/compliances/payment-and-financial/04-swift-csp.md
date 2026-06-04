# SWIFT CSP (កម្មវិធីសុវត្ថិភាពអតិថិជនរបស់ SWIFT)៖ បទប្បញ្ញត្តិសុវត្ថិភាពសម្រាប់បណ្តាញទូទាត់ប្រាក់អន្តរជាតិ (SWIFT CSP — Customer Security Programme)

**ដែនសមត្ថកិច្ច (Jurisdiction)៖** សកល (Global)  
**អនុវត្តចំពោះ (Applies to)៖** គ្រប់ស្ថាប័នហិរញ្ញវត្ថុទាំងអស់ដែលតភ្ជាប់ទៅកាន់បណ្តាញ SWIFT (All financial institutions connected to the SWIFT network)  
**គ្រប់គ្រងដោយ (Administered by)៖** សមាគមទូរគមនាគមន៍ហិរញ្ញវត្ថុអន្តរធនាគារសកល (SWIFT) (Society for Worldwide Interbank Financial Telecommunication)  
**Tags:** #compliance #swift #csp #financial #banking #security

---

## 📌 មាតិកា (Table of Contents)
- [សេចក្តីផ្តើម (What It Is)](#0)
- [ហេតុអ្វីបានជាវាមានសារៈសំខាន់ (Why It Exists)](#1)
- [ក្របខ័ណ្ឌត្រួតពិនិត្យសុវត្ថិភាពអតិថិជន (CSCF) (Customer Security Controls Framework (CSCF))](#2)
- [ការបញ្ជាក់អះអាងប្រចាំឆ្នាំ (Annual Attestation)](#3)
- [សារព័ត៌មាន MT103 — ស្តង់ដារផ្ទេរប្រាក់តាមទូរលេខ (MT103 — The Standard Wire Transfer Message)](#4)
- [អ្វីដែលត្រូវបង្កើត / អនុវត្ត (What to Build / Implement)](#5)
- [ឯកសារទាក់ទង (Related)](#6)

---

<a id="0"></a>
## សេចក្តីផ្តើម (What It Is)

SWIFT CSP គឺជាក្របខ័ណ្ឌសុវត្ថិភាពកាតព្វកិច្ចសម្រាប់គ្រប់ធនាគារ និងស្ថាប័នហិរញ្ញវត្ថុទាំងអស់ដែលប្រើប្រាស់បណ្តាញផ្ញើសារ SWIFT — ដែលជាប្រព័ន្ធសកលសម្រាប់ការផ្ទេរប្រាក់តាមទូរលេខអន្តរជាតិ។ វាត្រូវបានបង្កើតឡើងបន្ទាប់ពីព្រឹត្តិការណ៍លួចប្រាក់ពីធនាគារកណ្តាលបង់ក្លាដេសក្នុងឆ្នាំ ២០១៦ ដែលក្រុមចោរព័ត៌មានវិទ្យាបានលួចប្រាក់ចំនួន ៨១ លានដុល្លារ ដោយវាយប្រហារចូលទៅក្នុងហេដ្ឋារចនាសម្ព័ន្ធផ្ញើសារ SWIFT។

SWIFT CSP is a mandatory security framework for all banks and financial institutions using the SWIFT messaging network — the global system for international wire transfers. It was created after the 2016 Bangladesh Bank heist where attackers stole $81M by compromising SWIFT messaging infrastructure.

---

<a id="1"></a>
## ហេតុអ្វីបានជាវាមានសារៈសំខាន់ (Why It Exists)

```
THE BANGLADESH BANK HEIST (2016):
  Attackers compromised the bank's SWIFT terminals
  Sent fraudulent SWIFT MT103 messages to the NY Fed
  Instructed transfer of $951M from Bangladesh's account
  $81M was transferred before fraud was detected
  Most was lost through Philippine casinos
  → SWIFT created CSP to prevent recurrence
```

---

<a id="2"></a>
## ក្របខ័ណ្ឌត្រួតពិនិត្យសុវត្ថិភាពអតិថិជន (CSCF) (CSCF — Customer Security Controls Framework)

កម្មវិធី CSP ត្រូវបានបង្កើតឡើងជុំវិញក្របខ័ណ្ឌ CSCF (Customer Security Controls Framework) ដែលមានការគ្រប់គ្រង**ជាកាតព្វកិច្ច** និង**ការណែនាំជាជម្រើស**៖

The CSP is built around the CSCF (Customer Security Controls Framework), which has **mandatory** and **advisory** controls:

### ការត្រួតពិនិត្យជាកាតព្វកិច្ច (ត្រូវតែអនុវត្តតាម) (Mandatory Controls (must comply))

| # | ការត្រួតពិនិត្យ (Control) | គោលបំណង (Purpose) |
|:--|:--------|:--------|
| 1.1 | ការការពារបរិស្ថាន SWIFT (SWIFT Environment Protection) | ដាក់ហេដ្ឋារចនាសម្ព័ន្ធ SWIFT ឱ្យនៅដាច់ដោយឡែកពីផ្នែកផ្សេងទៀតនៃបណ្តាញ (Isolate SWIFT infrastructure from the rest of the network) |
| 1.2 | ការត្រួតពិនិត្យគណនីឯកសិទ្ធិ (Privileged Account Control) | កម្រិត និងត្រួតពិនិត្យការចូលប្រើប្រាស់គណនីដែលមានសិទ្ធិខ្ពស់ (Restrict and monitor privileged access) |
| 2.1 | សុវត្ថិភាពលំហូរទិន្នន័យផ្ទៃក្នុង (Internal Data Flow Security) | ការពារទិន្នន័យ SWIFT ពេលកំពុងបញ្ជូននៅក្នុងស្ថាប័ន (Protect SWIFT data in transit within the institution) |
| 2.2 | ការធ្វើបច្ចុប្បន្នភាពសុវត្ថិភាព (Security Updates) | ដំឡើងបំណះសុវត្ថិភាព (Patch) លើគ្រប់ប្រព័ន្ធទាំងអស់ដែលទាក់ទងនឹង SWIFT (Patch all SWIFT-related systems) |
| 2.3 | ការពង្រឹងសុវត្ថិភាពប្រព័ន្ធ (System Hardening) | កាត់បន្ថយផ្ទៃដែលអាចរងការវាយប្រហារឱ្យនៅកម្រិតអប្បបរមា (Minimise attack surface) |
| 4.1 | គោលនយោបាយពាក្យសម្ងាត់ (Password Policy) | កំណត់ពាក្យសម្ងាត់ខ្លាំងសម្រាប់ប្រព័ន្ធ SWIFT (Strong passwords for SWIFT systems) |
| 5.1 | ការគ្រប់គ្រងការចូលប្រើប្រាស់តាមតក្កវិជ្ជា (Logical Access Controls) | ការផ្ទៀងផ្ទាត់ពហុកត្តា (Multi-factor authentication) |
| 5.2 | ការគ្រប់គ្រងឧបករណ៍ Token (Token Management) | ប្រើប្រាស់ឧបករណ៍ Hardware Token សម្រាប់ការចូលប្រើប្រាស់ SWIFT (Hardware tokens for SWIFT access) |
| 6.1 | សុចរិតភាពនៃវគ្គប្រតិបត្តិការរបស់អ្នកបញ្ជា (Operator Session Integrity) | ការពារវគ្គប្រតិបត្តិការ (Sessions) របស់ SWIFT ដែលកំពុងសកម្ម (Protect active SWIFT sessions) |
| 7.1 | ការឆ្លើយតបឧប្បត្តិហេតុតាមប្រព័ន្ធអ៊ីនធឺណិត (Cyber Incident Response) | រៀបចំផែនការឆ្លើយតបឧប្បត្តិហេតុផ្លូវការ (Formal incident response plan) |
| 7.2 | ការបណ្តុះបណ្តាលសុវត្ថិភាព (Security Training) | ការបណ្តុះបណ្តាលសុវត្ថិភាព SWIFT ជាកាតព្វកិច្ច (Mandatory SWIFT security training) |
| 7.3 | ការតេស្តជ្រៀតចូល (Penetration Testing) | ធ្វើតេស្តជ្រៀតចូលប្រចាំឆ្នាំលើបរិស្ថានការងាររបស់ SWIFT (Annual pen test of SWIFT environment) |
| 7.4 | ការវាយតម្លៃហានិភ័យតាមសេណារីយ៉ូ (Scenario Risk Assessment) | ការវាយតម្លៃហានិភ័យប្រចាំឆ្នាំ (Annual risk assessment) |

---

<a id="3"></a>
## ការបញ្ជាក់អះអាងប្រចាំឆ្នាំ (Annual Attestation)

សមាជិក SWIFT គ្រប់រូបត្រូវតែ**បញ្ជាក់អះអាងអំពីស្ថានភាពអនុលោមភាពរបស់ខ្លួនប្រចាំឆ្នាំ** តាមរយៈវេទិកាបញ្ជាក់សុវត្ថិភាព SWIFT KYC (KYC-SA)។ ការខកខានមិនបានបញ្ជាក់អះអាង នឹងត្រូវរាយការណ៍ទៅកាន់អាជ្ញាធរត្រួតពិនិត្យ។

Every SWIFT member must **annually attest** their compliance status through the SWIFT KYC Security Attestation (KYC-SA) platform. Non-attestation is reported to supervisory authorities.

---

<a id="4"></a>
## សារព័ត៌មាន MT103 — ស្តង់ដារផ្ទេរប្រាក់តាមទូរលេខ (MT103 — The Standard Wire Transfer Message)

MT103 គឺជាទម្រង់សារ SWIFT សម្រាប់ផ្ទេរឥណទានរបស់អតិថិជនអន្តរជាតិ។ វាមានព័ត៌មានដូចជា៖

MT103 is the SWIFT message format for international customer credit transfers. It contains:

```
Field 20:  Transaction Reference Number
Field 32A: Value Date, Currency, Amount
Field 50:  Ordering Customer (sender)
Field 52:  Ordering Institution (sender's bank)
Field 56:  Intermediary Institution (correspondent bank)
Field 57:  Account with Institution (beneficiary's bank)
Field 59:  Beneficiary Customer (recipient)
Field 70:  Remittance Information
Field 71:  Details of Charges (SHA/OUR/BEN)
```

ការការពារសុចរិតភាពនៃសារព័ត៌មាន MT103 គឺជាគោលបំណងចម្បងនៃកម្មវិធី CSP។

Protecting the integrity of MT103 messages is the core purpose of CSP.

---

<a id="5"></a>
## អ្វីដែលត្រូវបង្កើត / អនុវត្ត (What to Build / Implement)

សម្រាប់ធនាគារ និងស្ថាប័នហិរញ្ញវត្ថុដែលនៅលើប្រព័ន្ធ SWIFT៖

For banks and financial institutions on SWIFT:

□ បង្កើតបរិស្ថានការងារ SWIFT ដាច់ដោយឡែក និងត្រូវបានការពារ (បែងចែកផ្នែកបណ្តាញដាច់ដោយឡែក) (Dedicated, isolated SWIFT environment (separate network segment))
□ មិនអនុញ្ញាតឱ្យមានការចូលប្រើប្រាស់អ៊ីនធឺណិតដោយផ្ទាល់ពីប្រព័ន្ធ SWIFT ឡើយ (No direct internet access from SWIFT systems)
□ ប្រើប្រាស់ប្រព័ន្ធផ្ទៀងផ្ទាត់ពហុកត្តា (MFA) សម្រាប់គណនីប្រតិបត្តិករ SWIFT ទាំងអស់ (MFA for all SWIFT operator accounts)
□ ប្រើប្រាស់ឧបករណ៍ Hardware Token សម្រាប់ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវរបស់ SWIFT (Hardware tokens for SWIFT authentication)
□ ការត្រួតពិនិត្យប្រតិបត្តិការតាមពេលវេលាជាក់ស្តែង ដើម្បីស្វែងរកសារ SWIFT ដែលខុសប្រក្រតី (Real-time transaction monitoring for anomalous SWIFT messages)
□ បង្កើតនីតិវិធីហៅទូរសព្ទផ្ទៀងផ្ទាត់/បញ្ជាក់ឡើងវិញសម្រាប់រាល់ការផ្ទេរប្រាក់ដែលមានតម្លៃធំ (Callback/confirmation procedure for large-value transfers)
□ ធ្វើតេស្តជ្រៀតចូលប្រចាំឆ្នាំលើហេដ្ឋារចនាសម្ព័ន្ធ SWIFT (Annual penetration test of SWIFT infrastructure)
□ ធ្វើការបញ្ជាក់អះអាង CSCF ប្រចាំឆ្នាំនៅលើវេទិកា KYC-SA (Annual CSCF attestation on KYC-SA platform)
□ រៀបចំផែនការឆ្លើយតបឧប្បត្តិហេតុដែលគ្របដណ្តប់ជាពិសេសលើករណីប្រព័ន្ធ SWIFT ត្រូវបានវាយប្រហារ (Incident response plan specifically covering SWIFT compromise)
□ ធ្វើការបណ្តុះបណ្តាលបុគ្គលិកអំពីបច្ចេកទេសបោកបញ្ឆោត (Social Engineering) ដែលសំដៅលើព័ត៌មានសម្ងាត់ SWIFT (Staff training on social engineering targeting SWIFT credentials)

---

<a id="6"></a>
## ឯកសារទាក់ទង (Related)

- [AML/CFT](./03-aml-cft.md) — ការប្រឆាំងការលាងលុយកខ្វក់ និងការទប់ស្កាត់ហិរញ្ញប្បទានភេរវកម្ម។
- [ធនាគារជាតិនៃកម្ពុជា NBC](./05-nbc-cambodia.md) — បទប្បញ្ញត្តិ និងការណែនាំពីធនាគារជាតិនៃកម្ពុជា។
- [ប្រាក់ចំណូលពីការផ្សាយពាណិជ្ជកម្ម និងការទូទាត់ប្រាក់ឱ្យអ្នកបង្កើតមាតិកា (Ad Revenue & Creator Payout)](../../procedures/payments-and-revenue/03-ad-revenue-and-creator-payout.md) — ប្រើប្រាស់សារ SWIFT MT103 សម្រាប់ការទូទាត់ប្រាក់អន្តរជាតិ។
