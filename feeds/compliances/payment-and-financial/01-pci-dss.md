# PCI-DSS (ស្តង់ដារសុវត្ថិភាពទិន្នន័យឧស្សាហកម្មកាតទូទាត់)៖ ស្តង់ដារសុវត្ថិភាពសម្រាប់ការការពារទិន្នន័យកាតទូទាត់ (PCI-DSS — Payment Card Industry Data Security Standard)

**ដែនសមត្ថកិច្ច (Jurisdiction)៖** សកល (Global)  
**កំណែ (Version)៖** PCI-DSS v4.0 (មានប្រសិទ្ធភាពចាប់ពីខែមីនា ឆ្នាំ ២០២៤ កំណែ v3.2.1 ត្រូវបានលុបឈប់ប្រើក្នុងខែមីនា ឆ្នាំ ២០២៥) (PCI-DSS v4.0 (effective March 2024, v3.2.1 retired March 2025))  
**អនុវត្តចំពោះ (Applies to)៖** គ្រប់ស្ថាប័ន ឬអង្គភាពណាដែលរក្សាទុក ដំណើរការ ឬបញ្ជូនទិន្នន័យម្ចាស់កាត (CHD) — រួមមានអាជីវករ ក្រុមហ៊ុនដំណើរការការទូទាត់ ច្រកទូទាត់ (Payment Gateways) និងធនាគារ (Any organisation that stores, processes, or transmits cardholder data (CHD) — merchants, payment processors, gateways, banks)  
**គ្រប់គ្រងដោយ (Administered by)៖** ក្រុមប្រឹក្សាស្តង់ដារសុវត្ថិភាព PCI (PCI SSC) (PCI Security Standards Council (PCI SSC))  
**Tags:** #compliance #pci-dss #payment #security #cardholder-data

---

## 📌 មាតិកា (Table of Contents)
- [សេចក្តីផ្តើម (What It Is)](#0)
- [ទិន្នន័យម្ចាស់កាត (CHD) ទល់នឹង ទិន្នន័យផ្ទៀងផ្ទាត់រសើប (SAD) (Cardholder Data (CHD) vs Sensitive Authentication Data (SAD))](#1)
- [កម្រិតកម្រងសំណួរវាយតម្លៃខ្លួនឯង (SAQ Levels)](#2)
- [តម្រូវការទាំង ១២ (The 12 Requirements)](#3)
- [បរិស្ថានទិន្នន័យម្ចាស់កាត (CDE) (Cardholder Data Environment (CDE))](#4)
- [របៀបរក្សាខ្លួននៅក្រៅដែនកំណត់វាយតម្លៃ (How to Stay Out of Scope)](#5)
- [ទណ្ឌកម្ម និងការផាកពិន័យ (Penalties)](#6)
- [អ្វីដែលត្រូវបង្កើត (What to Build)](#7)
- [ឯកសារទាក់ទង (Related)](#8)

---

<a id="0"></a>
## សេចក្តីផ្តើម (What It Is)

PCI-DSS គឺជាស្តង់ដារសុវត្ថិភាពបច្ចេកទេសសម្រាប់ការពារទិន្នន័យកាតទូទាត់។ វាត្រូវបានបង្កើតឡើងដោយក្រុមហ៊ុនកាតធំៗ រួមមាន Visa, Mastercard, American Express, Discover និង JCB។ អនុលោមភាពតាមស្តង់ដារនេះ គឺជាលក្ខខណ្ឌតម្រូវតាមកិច្ចសន្យាដោយក្រុមហ៊ុនកាតទាំងនោះ — មិនមែនជាច្បាប់របស់រដ្ឋាភិបាលឡើយ ប៉ុន្តែការរំលោភបំពាននឹងនាំឱ្យមានការផាកពិន័យ ការកើនឡើងកម្រៃជើងសារប្រតិបត្តិការ និងចុងក្រោយគឺការបាត់បង់លទ្ធភាពទទួលយកការទូទាត់តាមកាត។

PCI-DSS is a technical security standard for protecting payment card data. It was created by Visa, Mastercard, American Express, Discover, and JCB. Compliance is contractually required by card brands — not a government law, but violations result in fines, increased transaction fees, and ultimately loss of the ability to accept card payments.

---

<a id="1"></a>
## ទិន្នន័យម្ចាស់កាត (CHD) ទល់នឹង ទិន្នន័យផ្ទៀងផ្ទាត់រសើប (SAD) (Cardholder Data (CHD) vs Sensitive Authentication Data (SAD))

| ធាតុទិន្នន័យ (Data element) | ប្រភេទ (Type) | អាចរក្សាទុកបាន (បម្លែងកូដសម្ងាត់)? (Can store (encrypted)?) | អាចរក្សាទុកបាន (មិនបម្លែងកូដសម្ងាត់)? (Can store (unencrypted)?) |
|:------------|:-----|:----------------------|:------------------------|
| លេខគណនីបឋម (PAN) — លេខកាត ១៦ ខ្ទង់ (Primary Account Number (PAN) — the 16-digit card number) | ទិន្នន័យម្ចាស់កាត (CHD) (CHD) | បាទ/ចាស (ដោយប្រើការបម្លែងកូដសម្ងាត់ខ្លាំង) (Yes (with strong encryption)) | ទេ (No) |
| ឈ្មោះម្ចាស់កាត (Cardholder name) | ទិន្នន័យម្ចាស់កាត (CHD) (CHD) | បាទ/ចាស (Yes) | បាទ/ចាស (Yes) |
| កាលបរិច្ឆេទផុតកំណត់ (Expiry date) | ទិន្នន័យម្ចាស់កាត (CHD) (CHD) | បាទ/ចាស (Yes) | បាទ/ចាស (Yes) |
| កូដសេវាកម្ម (Service code) | ទិន្នន័យម្ចាស់កាត (CHD) (CHD) | បាទ/ចាស (Yes) | បាទ/ចាស (Yes) |
| ទិន្នន័យឆ្នូតម៉ាញេទិកទាំងមូល (Full magnetic stripe data) | ទិន្នន័យផ្ទៀងផ្ទាត់រសើប (SAD) (SAD) | ទេ (No) | ទេ (No) |
| CAV2/CVC2/CVV2/CID (កូដសុវត្ថិភាព) (CAV2/CVC2/CVV2/CID (security code)) | ទិន្នន័យផ្ទៀងផ្ទាត់រសើប (SAD) (SAD) | ទេ (No) | ទេ (No) |
| PIN / ប្លុក PIN (PIN / PIN block) | ទិន្នន័យផ្ទៀងផ្ទាត់រសើប (SAD) (SAD) | ទេ (No) | ទេ (No) |

**លេខ CVV/CVC មិនត្រូវរក្សាទុកជាដាច់ខាត — ទោះបីជាករណីណាក៏ដោយ។ សូម្បីតែនៅក្នុងឯកសារកត់ត្រាប្រតិបត្តិការ (Logs)។**

**The CVV/CVC must never be stored — ever. Not even in logs.**

---

<a id="2"></a>
## កម្រិតកម្រងសំណួរវាយតម្លៃខ្លួនឯង (SAQ Levels) (SAQ (Self-Assessment Questionnaire) Levels)

កម្រិតអនុលោមភាពរបស់អ្នក គឺអាស្រ័យលើរបៀបដែលអ្នកធ្វើអន្តរកម្មជាមួយទិន្នន័យកាត៖

Your compliance level depends on how you interact with card data:

| កម្រងសំណួរ SAQ (SAQ) | សម្រាប់អ្នកណា (Who it's for) | ការរៀបចំទូទៅ (Typical setup) |
|:----|:------------|:--------------|
| **SAQ A** | អាជីវករដែលប្រើប្រាស់សេវាកម្មក្រៅទាំងស្រុងសម្រាប់ដំណើរការកាត (Merchants that fully outsource card processing) | ប្រអប់បញ្ចូលរបស់ Stripe (Stripe hosted fields) ឬការទូទាត់តាម iFrame — ទិន្នន័យកាតមិនដែលប៉ះពាល់ម៉ាស៊ីនបម្រើ (Servers) របស់អ្នកឡើយ (Stripe hosted fields, iFrame checkout — card data never touches your servers) |
| **SAQ A-EP** | អាជីវករលក់ទំនិញអនឡាញ (E-commerce) ដែលប្រើប្រាស់សេវាកម្មក្រៅ ប៉ុន្តែមានទំព័រទូទាត់ផ្ទាល់ខ្លួន (Merchants with e-commerce, third-party processing but own payment page) | កូដ JavaScript មួយចំនួននៅលើទំព័រទូទាត់ ត្រូវបានទាញយកពីម៉ាស៊ីនបម្រើរបស់អ្នក (Some JavaScript on payment page loads from your server) |
| **SAQ B** | ឧបករណ៍ថតចម្លងព័ត៌មានកាតលើក្រដាស ឬម៉ាស៊ីនឆូតកាតទោលប៉ុណ្ណោះ (Imprint machines or standalone terminals only) | ម៉ាស៊ីន POS រូបវន្ត គ្មានការរក្សាទុកទិន្នន័យតាមប្រព័ន្ធអេឡិចត្រូនិកឡើយ (Physical POS, no electronic storage) |
| **SAQ C** | កម្មវិធីទូទាត់ប្រាក់ដែលភ្ជាប់ទៅអ៊ីនធឺណិត ប៉ុន្តែគ្មានការរក្សាទុកទិន្នន័យអេឡិចត្រូនិកឡើយ (Payment app connected to internet, no electronic storage) | ម៉ាស៊ីន POS ក្នុងភោជនីយដ្ឋានដែលមានការតភ្ជាប់អ៊ីនធឺណិត (Restaurant POS with internet) |
| **SAQ D** | គ្រប់អាជីវករ និងអ្នកផ្តល់សេវាកម្មដទៃទៀតទាំងអស់ (All other merchants and service providers) | ដំណើរការកាតដោយផ្ទាល់ មានប្រព័ន្ធបម្លែងកូដសម្ងាត់ជាតំណាង (Tokenisation) ផ្ទាល់ខ្លួន (Direct card processing, own tokenisation) |

**សម្រាប់វេទិកាគេហទំព័រភាគច្រើនដែលប្រើប្រាស់ប្រអប់ទូទាត់ Stripe/Adyen៖ SAQ A** — គឺជាដែនកំណត់វាយតម្លៃដែលសាមញ្ញ និងមានសុវត្ថិភាពបំផុត។

**For most web platforms using Stripe/Adyen hosted fields: SAQ A** — the simplest and safest scope.

---

<a id="3"></a>
## តម្រូវការទាំង ១២ (The 12 Requirements)

| # | តម្រូវការ (Requirement) | កាតព្វកិច្ចបច្ចេកទេសគន្លឹះ (Key technical obligation) |
|:--|:-----------|:------------------------|
| 1 | ដំឡើង និងថែទាំការត្រួតពិនិត្យសុវត្ថិភាពបណ្តាញ (Install and maintain network security controls) | ម៉ាស៊ីនការពារបណ្តាញ (Firewalls), ការបែងចែកផ្នែកបណ្តាញដើម្បីដាក់ឱ្យដាច់ពីគ្នានូវបរិស្ថាន CDE (Firewalls, network segmentation separating CDE) |
| 2 | អនុវត្តការកំណត់រចនាសម្ព័ន្ធដែលមានសុវត្ថិភាព (Apply secure configurations) | មិនប្រើប្រាស់ការកំណត់លំនាំដើមរបស់អ្នកផលិត (No vendor defaults), បិទសេវាកម្មដែលមិនចាំបាច់ (no unnecessary services) |
| 3 | ការពារទិន្នន័យគណនីដែលបានរក្សាទុក (Protect stored account data) | បម្លែងកូដសម្ងាត់លើលេខ PAN, ហាមរក្សាទុកលេខ CVV ជាដាច់ខាត (Encryption of PAN, no CVV storage ever) |
| 4 | ការពារទិន្នន័យម្ចាស់កាតពេលកំពុងបញ្ជូន (Protect cardholder data in transit) | ប្រើប្រាស់ពិធីការ TLS 1.2+ សម្រាប់ការបញ្ជូនទិន្នន័យកាតទាំងអស់ (TLS 1.2+ for all card data transmission) |
| 5 | ការពារប្រព័ន្ធពីកម្មវិធីបង្កគ្រោះថ្នាក់ (Malware) (Protect systems from malware) | ដំឡើងកម្មវិធីកំចាត់មេរោគ (AV) លើគ្រប់ប្រព័ន្ធទាំងអស់, ធ្វើការស្កេនជាប្រចាំ (AV on all systems, regular scans) |
| 6 | អភិវឌ្ឍ និងថែរក្សាប្រព័ន្ធប្រកបដោយសុវត្ថិភាព (Develop and maintain secure systems) | វដ្តជីវិតនៃការអភិវឌ្ឍសូហ្វវែរប្រកបដោយសុវត្ថិភាព (Secure SDLC), ការគ្រប់គ្រងភាពងាយរងគ្រោះ, ការដំឡើងបំណះសុវត្ថិភាព (Secure SDLC, vulnerability management, patching) |
| 7 | កម្រិតការចូលប្រើប្រាស់ទិន្នន័យម្ចាស់កាត (Restrict access to cardholder data) | ផ្តល់សិទ្ធិចូលមើលតាមតម្រូវការចាំបាច់ (Need-to-know basis), ការគ្រប់គ្រងការចូលប្រើប្រាស់ផ្អែកលើតួនាទី (RBAC) (Need-to-know basis, RBAC) |
| 8 | កំណត់អត្តសញ្ញាណអ្នកប្រើប្រាស់ និងផ្ទៀងផ្ទាត់ការចូលប្រើប្រាស់ (Identify users and authenticate access) | គណនីផ្ទាល់ខ្លួនដែកដោយឡែក (Unique IDs), ការផ្ទៀងផ្ទាត់ពហុកត្តា (MFA) សម្រាប់ការចូលប្រើពីចម្ងាយ ឬសិទ្ធិអ្នកគ្រប់គ្រង (MFA for remote/admin access) |
| 9 | កម្រិតការចូលប្រើប្រាស់ផ្នែករូបវន្ត (Restrict physical access) | ចាក់សោបន្ទប់ម៉ាស៊ីនបម្រើ, ប្រើប្រាស់កាតសម្គាល់ខ្លួនសម្រាប់ចូល (Locked server rooms, badge access) |
| 10 | កត់ត្រា និងត្រួតពិនិត្យរាល់ការចូលប្រើប្រាស់ទាំងអស់ (Log and monitor all access) | ឯកសារកត់ត្រាប្រតិបត្តិការសវនកម្ម (Audit logs) លើរាល់ការចូលប្រើប្រាស់បរិស្ថាន CDE, រក្សាទុកឯកសារកត់ត្រាទុកក្នុងរយៈពេល ១២ ខែ (Audit logs on all CDE access, 12-month retention) |
| 11 | តេស្តសាកល្បងសុវត្ថិភាពជាប្រចាំ (Test security regularly) | ស្កេនរកភាពងាយរងគ្រោះរៀងរាល់ត្រីមាស, តេស្តជ្រៀតចូល (Penetration Test) ប្រចាំឆ្នាំ (Quarterly vulnerability scans, annual penetration test) |
| 12 | គាំទ្រសុវត្ថិភាពព័ត៌មានតាមរយៈគោលនយោបាយ (Support information security with policies) | បង្កើតគោលនយោបាយជាលាយលក្ខណ៍អក្សរ, ការបណ្តុះបណ្តាលបុគ្គលិក, ផែនការឆ្លើយតបឧប្បត្តិហេតុ (Written policies, training, incident response plan) |

---

<a id="4"></a>
## បរិស្ថានទិន្នន័យម្ចាស់កាត (CDE) (Cardholder Data Environment (CDE))

បរិស្ថាន CDE គឺជាគ្រប់ប្រព័ន្ធទាំងអស់ដែលរក្សាទុក ដំណើរការ ឬបញ្ជូនទិន្នន័យ CHD រួមផ្សំជាមួយគ្រប់ប្រព័ន្ធទាំងអស់ដែលអាចទំនាក់ទំនងជាមួយប្រព័ន្ធទាំងនោះ។

The CDE is every system that stores, processes, or transmits CHD, plus all systems that can communicate with those systems.

**គោលដៅចម្បង គឺកាត់បន្ថយដែនកំណត់វាយតម្លៃ CDE ឱ្យនៅតូចបំផុត៖**

**The goal is to minimise the CDE scope:**

```
LARGE SCOPE (bad):
  Your entire application server communicates with the payment service.
  All servers are in scope.

MINIMAL SCOPE (good):
  Payment page uses Stripe.js hosted fields.
  Card data goes directly from browser to Stripe — never touches your server.
  Your backend only receives a token.
  CDE = zero servers on your side.
  → SAQ A compliant.
```

---

<a id="5"></a>
## របៀបរក្សាខ្លួននៅក្រៅដែនកំណត់វាយតម្លៃ (How to Stay Out of Scope)

1. **ប្រើប្រាស់ប្រអប់បញ្ចូលទូទាត់ប្រាក់ខាងក្រៅ** (ដូចជា Stripe Elements, Adyen Drop-in, Braintree hosted fields)
2. **ហាមកត់ត្រាទិន្នន័យកាតក្នុងឯកសារ Log ដាច់ខាត** — ត្រួតពិនិត្យបណ្ណាល័យកូដកត់ត្រា (Logging Libraries) និងកម្មវិធីកណ្តាល (Middleware) ទាំងអស់
3. **បម្លែងកូដសម្ងាត់ជាតំណាង (Tokenise) ភ្លាមៗ** — ជំនួសលេខ PAN ដោយប្រើតំណាង (Token) មុនពេលដំណើរការផ្សេងៗ
4. **ការបែងចែកបណ្តាញ (Network Segmentation)** — រក្សាសេវាកម្មទូទាត់ប្រាក់ឱ្យដាច់ដោយឡែកពីផ្នែកផ្សេងទៀតនៃកម្មវិធី

1. **Use hosted payment fields** (Stripe Elements, Adyen Drop-in, Braintree hosted fields)
2. **Never log card data** — check all logging libraries and middleware
3. **Tokenise immediately** — replace PAN with a token before any processing
4. **Network segmentation** — keep payment services isolated from the rest of the application

---

<a id="6"></a>
## ទណ្ឌកម្ម និងការផាកពិន័យ (Penalties)

ការផាកពិន័យគឺត្រូវបានកំណត់ដោយក្រុមហ៊ុនកាតផ្ទាល់ (ដូចជា Visa, Mastercard) មិនមែនដោយរដ្ឋាភិបាលឡើយ៖

Fines are imposed by card brands (Visa, Mastercard), not a government:

| ការរំលោភបំពាន (Violation) | ផលវិបាក (Consequence) |
|:----------|:------------|
| ភាពមិនអនុលោមតាមស្តង់ដារ (មិនមានការធ្លាយទិន្នន័យ) (Non-compliance (no breach)) | ៥,០០០ ដុល្លារ ដល់ ១០០,០០០ ដុល្លារ/ខែ សម្រាប់ក្រុមហ៊ុនកាតនីមួយៗ ($5,000–$100,000/month per card brand) |
| ការធ្លាយទិន្នន័យ — ក្នុងស្ថានភាពមិនអនុលោមតាមស្តង់ដារ (Data breach — non-compliant) | ៥០ ដុល្លារ ដល់ ៩០ ដុល្លារ ក្នុងមួយកាតដែលរងផលប៉ះពាល់; រួមជាមួយការចំណាយលើការស៊ើបអង្កេតកោសល្យវិច័យទាំងស្រុង ($50–$90 per compromised card; full forensic investigation costs) |
| បន្តមិនអនុលោមតាមស្តង់ដារជាបន្តបន្ទាប់ (Continued non-compliance) | ត្រូវបានដកហូតសិទ្ធិ និងឯកសិទ្ធិក្នុងការទទួលយកការទូទាត់តាមកាត (Card acceptance privileges revoked) |
| ប្រតិបត្តិការក្លែងបន្លំ (Fraudulent charges) | ការទាមទារប្រាក់ត្រឡប់មកវិញពីធនាគារចេញកាត (Chargebacks) (Issuing bank chargebacks) |

---

<a id="7"></a>
## អ្វីដែលត្រូវបង្កើត (What to Build)

ដែនកំណត់សុវត្ថិភាពអប្បបរមាសម្រាប់កាត់បន្ថយការវាយតម្លៃ PCI-DSS (SAQ A)៖

Minimum PCI-DSS scope reduction (SAQ A):

□ ប្រើប្រាស់ Stripe.js / Adyen Drop-in / Braintree hosted fields — ទិន្នន័យកាតមិនដែលប៉ះពាល់ម៉ាស៊ីនបម្រើរបស់អ្នកឡើយ (Use Stripe.js / Adyen Drop-in / Braintree hosted fields — card data never touches your servers)
□ មិនត្រូវកត់ត្រាលេខកាត លេខ CVV ឬលេខ PAN ពេញលេញនៅក្នុងប្រព័ន្ធឡើយ — មិនថាទីកន្លែងណាក៏ដោយ (NEVER log card numbers, CVV, or full PANs — anywhere)
□ ប្រើប្រាស់ពិធីការ TLS 1.2+ លើគ្រប់ច្រកចេញចូល (Endpoints) ទាំងអស់ (ជាពិសេសទំព័រទូទាត់ប្រាក់) (TLS 1.2+ on all endpoints (especially payment pages))
□ រក្សាទុកតែតំណាង Token របស់ Stripe/Adyen ប៉ុណ្ណោះ — មិនត្រូវរក្សាទុកលេខ PAN ដើមឡើយ (Store only the Stripe/Adyen token — never the raw PAN)
□ ប្រើប្រាស់ការផ្ទៀងផ្ទាត់ពហុកត្តា (MFA) សម្រាប់ការចូលប្រើប្រាស់គណនីអ្នកគ្រប់គ្រងទៅកាន់ប្រព័ន្ធផលិតកម្ម (Production Systems) ទាំងអស់ (MFA for all admin access to production systems)
□ ធ្វើការស្កេនរកភាពងាយរងគ្រោះរៀងរាល់ត្រីមាស (ប្រើប្រាស់សេវាកម្មពីអ្នកផ្តល់សេវាដែលទទួលបានការអនុម័តពី PCI) (Quarterly vulnerability scans (use a PCI-approved vendor))
□ បំពេញ និងដាក់ស្នើកម្រងសំណួរ SAQ ប្រចាំឆ្នាំទៅកាន់ធនាគារទទួលការទូទាត់ (Acquirer) (Annual SAQ completion and submission to acquirer)
□ រៀបចំគោលនយោបាយសុវត្ថិភាពព័ត៌មានជាលាយលក្ខណ៍អក្សរ (Written information security policy)
□ រៀបចំផែនការឆ្លើយតបឧប្បត្តិហេតុសម្រាប់ការធ្លាយទិន្នន័យកាត (Incident response plan covering card data breach)

---

<a id="8"></a>
## ឯកសារទាក់ទង (Related)

- [នីតិវិធីច្រកទូទាត់ប្រាក់ (Payment Gateway Procedure)](../../procedures/payments-and-revenue/01-payment-gateway.md) — នីតិវិធីសម្រាប់ការរៀបចំច្រកទូទាត់ប្រាក់ក្នុងប្រព័ន្ធ។
- [AML/CFT (ប្រឆាំងការលាងលុយកខ្វក់ និងហិរញ្ញប្បទានភេរវកម្ម)](./03-aml-cft.md) — ស្តង់ដារប្រឆាំងការលាងលុយកខ្វក់ និងការទប់ស្កាត់ហិរញ្ញប្បទានភេរវកម្ម។
- [PSD2 (សេចក្តីណែនាំសេវាកម្មទូទាត់ប្រាក់ទី២)](./02-psd2.md) — ក្របខ័ណ្ឌច្បាប់សម្រាប់សេវាកម្មទូទាត់ប្រាក់នៅក្នុងសហភាពអឺរ៉ុប។
