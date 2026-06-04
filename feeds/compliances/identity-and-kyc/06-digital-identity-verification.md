# ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណឌីជីថល — ស្តង់ដារបច្ចេកទេស (Digital Identity Verification — Technical Standards)៖ Digital Identity Verification — Technical Standards

**Tags:** #compliance #kyc #identity #liveness #ocr #biometrics #verification

---

## 📌 មាតិកា (Table of Contents)
- [តើវាជាអ្វី (What It Is)](#0)
- [សសរស្តម្ភទាំងបី (The Three Pillars)](#1)
- [ការធ្វើតេស្តអ្នកផ្តល់សេវាសម្គាល់ផ្ទៃមុខរបស់ NIST (NIST Face Recognition Vendor Test (FRVT))](#2)
- [កម្រិតនៃការធានាអត្តសញ្ញាណ (Identity Assurance Levels (NIST SP 800-63))](#3)
- [ប្រព័ន្ធ eKYC អេឡិចត្រូនិក (eKYC (Electronic KYC))](#4)
- [មូលហេតុបរាជ័យទូទៅ និងបទពិសោធន៍អ្នកប្រើប្រាស់ (Common Failure Reasons and User Experience)](#5)
- [ការគ្របដណ្តប់នៃឯកសារតាមប្រទេស (Document Coverage by Country)](#6)
- [លក្ខវិនិច្ឆ័យជ្រើសរើសដៃគូសេវាកម្ម (Vendor Selection Criteria)](#7)
- [ឯកសារទាក់ទង (Related)](#8)

---

<a id="0"></a>
## តើវាជាអ្វី (What It Is)

ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណឌីជីថល គឺជាដំណើរការបច្ចេកទេសក្នុងការបញ្ជាក់ថាបុគ្គលម្នាក់ពិតជាអ្នកដែលពួកគេបានអះអាងពិតប្រាកដ — ដោយប្រើប្រាស់មធ្យោបាយឌីជីថលជំនួសឱ្យវត្តមានផ្ទាល់។ វាបញ្ជូលគ្នារវាងការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃឯកសារ ការផ្គូផ្គងជីវមាត្រ (Biometric) និងការត្រួតពិនិត្យវត្តមានមនុស្សពិតប្រាកដ (Liveness)។  
Digital identity verification is the technical process of confirming that a person is who they claim to be — using digital means rather than physical presence. It combines document authentication, biometric matching, and liveness detection.  

---

<a id="1"></a>
## សសរស្តម្ភទាំងបី (The Three Pillars)

### ១. ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃឯកសារ (Document Authentication)

ផ្ទៀងផ្ទាត់ថាឯកសារសម្គាល់ខ្លួននោះពិតជាឯកសារពិតប្រាកដ និងមិនត្រូវបានគេកែប្រែ។  
Verify that the identity document is genuine and unaltered.  

| ការត្រួតពិនិត្យ<br/>Check | អ្វីដែលប្រព័ន្ធរកឃើញ<br/>What it detects |
|:---|:---|
| **ការផ្ទៀងផ្ទាត់តំបន់ MRZ**<br/>MRZ (Machine Readable Zone) validation | ពិនិត្យមើលភាពស៊ីគ្នានៃអក្សរពីរជួរនៅផ្នែកខាងក្រោមនៃលិខិតឆ្លងដែន<br/>Checks the bottom two lines of a passport for consistency |
| **ការពិនិត្យមើលដោយចក្ខុវិញ្ញាណ (AI)**<br/>Visual inspection (AI) | លក្ខណៈពិសេសការពារសន្តិសុខ លំនាំហូឡូក្រាម និងភាពស៊ីគ្នានៃពុម្ពអក្សរ<br/>Security features, hologram patterns, font consistency |
| **ការអានបន្ទះឈីប (NFC)**<br/>Chip reading (NFC) | សម្រាប់លិខិតឆ្លងដែនជីវមាត្រ (Biometric Passport) — អានទិន្នន័យពីឈីបផ្ទាល់<br/>For biometric passports — reads the chip directly |
| **ការស្កេនបាកូដ / QR កូដ**<br/>Barcode / QR scan | សម្រាប់អត្តសញ្ញាណប័ណ្ណជាតិមួយចំនួន<br/>For some national IDs |
| **ការស្វែងរកក្នុងមូលដ្ឋានទិន្នន័យ**<br/>Database lookup | ត្រួតពិនិត្យធៀបនឹងបញ្ជីឈ្មោះចុះបញ្ជីអត្តសញ្ញាណរបស់រដ្ឋាភិបាល (បើមាន)<br/>Checking against government identity registries (where available) |
| **ការរកឃើញលំនាំក្លែងបន្លំ**<br/>Fraud pattern detection | ស្វែងរកលំនាំនៃការក្លែងបន្លំឯកសារដែលធ្លាប់បានដឹង<br/>Known document forgery patterns |

### ២. ការផ្គូផ្គងជីវមាត្រ (Biometric Matching)

ផ្គូផ្គងបុគ្គលដែលកំពុងបង្ហាញឯកសារ ទៅនឹងរូបថតនៅលើឯកសារនោះ។  
Match the person presenting the document to the photo in the document.  

| វិធីសាស្ត្រ<br/>Method | ភាពត្រឹមត្រូវ<br/>Accuracy | កត់សម្គាល់<br/>Notes |
|:---|:---|:---|
| **ការសម្គាល់ផ្ទៃមុខ**<br/>Facial recognition | ៩៩%+ (ម៉ូដែលទំនើប)<br/>99%+ (modern models) | រូបថតសែលហ្វី ធៀបនឹង រូបថតលើអត្តសញ្ញាណប័ណ្ណ<br/>Selfie vs ID photo |
| **ការផ្គូផ្គង ១:១**<br/>1:1 matching | ខ្ពស់<br/>High | រូបថតសែលហ្វីត្រូវគ្នានឹងរូបថតលើអត្តសញ្ញាណប័ណ្ណជាក់លាក់នេះ<br/>Selfie matches this specific ID photo |
| **ការផ្គូផ្គង ១:N**<br/>1:N matching | ខ្ពស់ក្នុងកម្រិតទ្រង់ទ្រាយធំ<br/>High at scale | ពិនិត្យធៀបនឹងមូលដ្ឋានទិន្នន័យ (មិនសូវប្រើប្រាស់ក្នុងដំណើរការ KYC ឡើយ)<br/>Checks against a database (less common in KYC) |

### ៣. ការត្រួតពិនិត្យវត្តមានមនុស្សពិតប្រាកដ (Liveness Detection)

ការពារការក្លែងបន្លំដោយប្រើប្រាស់រូបថត វីដេអូ ឬរបាំងមុខ។  
Prevent spoofing with photos, videos, or masks.  

| ប្រភេទ<br/>Type | វិធីសាស្ត្រ<br/>Method |
|:---|:---|
| **ការត្រួតពិនិត្យវត្តមានអសកម្ម**<br/>Passive liveness | ការវិភាគដោយ AI លើរូបភាពទោល — មិនតម្រូវឱ្យអ្នកប្រើប្រាស់ធ្វើសកម្មភាពអ្វីឡើយ<br/>AI analysis of a single image — no user interaction required |
| **ការត្រួតពិនិត្យវត្តមានសកម្ម**<br/>Active liveness | អ្នកប្រើប្រាស់ត្រូវធ្វើសកម្មភាពណាមួយ (ងាកក្បាល បិទបើកភ្នែក ឬញញឹម)<br/>User performs an action (turn head, blink, smile) |
| **ការត្រួតពិនិត្យវត្តមានតាមវីដេអូ**<br/>Video liveness | ដំណើរការឃ្លីបវីដេអូខ្លីដើម្បីស្វែងរកសញ្ញាវត្តមានមនុស្សពិតប្រាកដ<br/>Short video clip processed for liveness signals |
| **ការត្រួតពិនិត្យវត្តមាន 3D**<br/>3D liveness | ឧបករណ៍ចាប់ជម្រៅ (ដូចជាប្រភេទ Face ID) — សន្តិសុខកម្រិតខ្ពស់បំផុត<br/>Depth sensors (Face ID type) — highest security |

---

<a id="2"></a>
## ការធ្វើតេស្តអ្នកផ្តល់សេវាសម្គាល់ផ្ទៃមុខរបស់ NIST (NIST Face Recognition Vendor Test (FRVT))

វិទ្យាស្ថាន NIST ដំណើរការការវាយតម្លៃជាបន្តបន្ទាប់លើក្បួនដោះស្រាយការសម្គាល់ផ្ទៃមុខ។ សម្រាប់ដំណើរការ KYC ដែលត្រូវការការធានាខ្ពស់ (សេវាកម្មហិរញ្ញវត្ថុ សេវាថែទាំសុខភាព) សូមប្រើប្រាស់អ្នកផ្តល់សេវាដែលមានពិន្ទុ FRVT ខ្ពស់។ អ្នកផ្តល់សេវាកំពូលៗរួមមាន៖ Idemia, NEC, Cognitec, Daon។  
NIST runs ongoing evaluations of face recognition algorithms. For high-assurance KYC (financial services, healthcare), use providers with strong FRVT scores. Top performers consistently include: Idemia, NEC, Cognitec, Daon.  

---

<a id="3"></a>
## កម្រិតនៃការធានាអត្តសញ្ញាណ (Identity Assurance Levels (NIST SP 800-63))

| កម្រិត<br/>Level | ឈ្មោះ<br/>Name | កម្លាំងនៃការផ្ទៀងផ្ទាត់<br/>Verification strength |
|:---|:---|:---|
| **IAL1** | ការអះអាងដោយខ្លួនឯង<br/>Self-asserted | គ្មានការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ — អ្នកប្រើប្រាស់ផ្តល់ព័ត៌មានដោយខ្លួនឯង<br/>No identity proofing — user provides their own info |
| **IAL2** | ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណពីចម្ងាយ<br/>Remote identity proofing | ឯកសារសម្គាល់ខ្លួន + សែលហ្វី + វត្តមានពិតប្រាកដ — ធ្វើឡើងពីចម្ងាយ<br/>Document + selfie + liveness — done remotely |
| **IAL3** | ការផ្ទៀងផ្ទាត់ផ្ទាល់<br/>In-person | វត្តមានផ្ទាល់ ឬផ្ទៀងផ្ទាត់ពីចម្ងាយក្រោមការត្រួតពិនិត្យពីភ្នាក់ងារ<br/>Physical presence or supervised remote with operator |

ករណីប្រើប្រាស់ KYC ភាគច្រើនតម្រូវឱ្យមានកម្រិត **IAL2** ជាអប្បបរមា។ សេវាកម្មហិរញ្ញវត្ថុដែលមានតម្លៃខ្ពស់អាចនឹងតម្រូវឱ្យមានកម្រិត IAL3។  
Most KYC use cases require **IAL2** minimum. High-value financial services may require IAL3.  

---

<a id="4"></a>
## ប្រព័ន្ធ eKYC អេឡិចត្រូនិក (eKYC (Electronic KYC))

eKYC គឺជាដំណើរការឌីជីថលពេញលេញពីចុងម្ខាងទៅចុងម្ខាង៖  
eKYC is the fully digital end-to-end process:  

```mermaid
%%{init: {
  'theme': 'dark',
  'themeVariables': {
    'background': '#1e1e1e',
    'primaryTextColor': '#ffffff',
    'lineColor': '#a0a0a0'
  },
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan { fill: #ffffff !important; }'
}}%%
graph TD
    A["📷 ថតរូបឯកសារសម្គាល់ខ្លួន ឬស្កេន NFC<br/>(Capture ID or NFC scan)"] --> B["🔍 ផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃឯកសារ<br/>(Document authentication)"]
    B --> C["📝 ទាញយកទិន្នន័យ OCR<br/>(Data extraction OCR)"]
    C --> D["🗄️ ផ្ទៀងផ្ទាត់ជាមួយមូលដ្ឋានទិន្នន័យជាតិ<br/>(Database verification)"]
    D --> E["🤳 ថតរូបសែលហ្វី<br/>(Selfie capture)"]
    E --> F["🧬 ត្រួតពិនិត្យវត្តមានមនុស្សពិត<br/>(Liveness check)"]
    F --> G["👥 ផ្គូផ្គងជីវមាត្រផ្ទៃមុខ<br/>(Biometric match)"]
    G --> H["⚠️ វាយតម្លៃពិន្ទុហានិភ័យ<br/>(Risk scoring)"]
    H --> I{"🎯 ការសម្រេចចិត្តចុងក្រោយ<br/>(Decision)"}
    I -- ជោគជ័យ --> J["🟢 អនុម័ត (PASS)"]
    I -- សង្ស័យ --> K["🟡 ត្រួតពិនិត្យដោយដៃ (REFER)"]
    I -- បរាជ័យ --> L["🔴 បដិសេធ (FAIL)"]

    style J fill:#27ae60,color:#fff
    style K fill:#f39c12,color:#fff
    style L fill:#e74c3c,color:#fff
```

---

<a id="5"></a>
## មូលហេតុបរាជ័យទូទៅ និងបទពិសោធន៍អ្នកប្រើប្រាស់ (Common Failure Reasons and User Experience)

| បញ្ហាបរាជ័យ<br/>Failure | សារត្រូវបង្ហាញជូនអ្នកប្រើប្រាស់<br/>Message to show user |
|:---|:---|
| **រូបថតឯកសារមិនច្បាស់**<br/>Blurry document photo | «រូបថតឯកសារសម្គាល់ខ្លួនរបស់លោកអ្នកមិនច្បាស់ទេ។ សូមថតម្តងទៀតនៅក្នុងទីតាំងដែលមានពន្លឺល្អជាងនេះ។»<br/>"Your ID photo is blurry. Please retake it in better lighting." |
| **មានចំណាំងប្លាតលើឯកសារ**<br/>Glare on document | «មានចំណាំងប្លាតពន្លឺលើឯកសារសម្គាល់ខ្លួនរបស់លោកអ្នក។ សូមជៀសវាងពីពន្លឺចាំងផ្ទាល់ ហើយថតម្តងទៀត។»<br/>"There's glare on your ID. Move away from direct light and retake." |
| **ឯកសារអស់សុពលភាព**<br/>ID expired | «ឯកសារសម្គាល់ខ្លួនរបស់លោកអ្នកបានអស់សុពលភាពហើយ។ សូមប្រើប្រាស់ឯកសារដែលមានសុពលភាព។»<br/>"Your ID has expired. Please use a valid document." |
| **ផ្ទៃមុខមិនស៊ីគ្នា**<br/>Face not matching | «យើងមិនអាចផ្គូផ្គងរូបថតសែលហ្វីទៅនឹងឯកសារសម្គាល់ខ្លួនរបស់លោកអ្នកបានទេ។ សូមថតរូបទាំងពីរឡើងវិញនៅក្នុងទីតាំងដែលមានពន្លឺល្អ។»<br/>"We couldn't match your selfie to your ID. Please retake both in good lighting." |
| **ការផ្ទៀងផ្ទាត់វត្តមានពិតប្រាកដបរាជ័យ**<br/>Liveness failed | «សូមអនុវត្តតាមការណែនាំ និងមើលឱ្យចំកាមេរ៉ា។»<br/>"Please follow the instructions and look directly at the camera." |
| **ឯកសារមិនត្រូវបានគាំទ្រ**<br/>Document not supported | «ប្រភេទឯកសារនេះមិនត្រូវបានទទួលយកនៅក្នុងប្រទេសរបស់លោកអ្នកឡើយ។ សូមប្រើប្រាស់ [ឯកសារជំនួស]។»<br/>"This document type is not accepted in your country. Please use [alternatives]." |

---

<a id="6"></a>
## ការគ្របដណ្តប់នៃឯកសារតាមប្រទេស (Document Coverage by Country)

ប្រទេសនីមួយៗមានការគាំទ្រឯកសារខុសៗគ្នា។ សូមប្រាកដថាអ្នកផ្តល់សេវាផ្ទៀងផ្ទាត់របស់អ្នកមានលទ្ធភាពគាំទ្រលើទីផ្សារគោលដៅរបស់អ្នក៖  
Different countries have different supported documents. Ensure your verification provider has coverage for your target markets:  

| ប្រទេស<br/>Country | ឯកសារដែលត្រូវបានទទួលយក<br/>Accepted documents |
|:---|:---|
| កម្ពុជា<br/>Cambodia | អត្តសញ្ញាណប័ណ្ណសញ្ជាតិខ្មែរ (ប្រភេទជីវមាត្រថ្មី) លិខិតឆ្លងដែន<br/>National ID (new biometric), Passport |
| ថៃ<br/>Thailand | អត្តសញ្ញាណប័ណ្ណជាតិ (CID) លិខិតឆ្លងដែន ប័ណ្ណបើកបរ<br/>National ID (CID), Passport, Driver's licence |
| សិង្ហបុរី<br/>Singapore | NRIC លិខិតឆ្លងដែន ប័ណ្ណការងារ (Employment Pass)<br/>NRIC, Passport, Employment Pass |
| វៀតណាម<br/>Vietnam | CCCD (អត្តសញ្ញាណប័ណ្ណមានឈីប) លិខិតឆ្លងដែន<br/>CCCD (Chip ID), Passport |
| ឥណ្ឌូនេស៊ី<br/>Indonesia | KTP (អត្តសញ្ញាណប័ណ្ណជាតិ) លិខិតឆ្លងដែន<br/>KTP (National ID), Passport |

---

<a id="7"></a>
## លក្ខវិនិច្ឆ័យជ្រើសរើសដៃគូសេវាកម្ម (Vendor Selection Criteria)

| លក្ខវិនិច្ឆ័យ<br/>Criterion | អ្វីដែលត្រូវត្រួតពិនិត្យ<br/>What to check |
|:---|:---|
| **ការគ្របដណ្តប់ឯកសារ**<br/>Document coverage | តើប្រព័ន្ធគាំទ្រឯកសាររបស់ប្រទេសគោលដៅរបស់អ្នកដែរឬទេ?<br/>Does it support your target countries' documents? |
| **អត្រារកឃើញការក្លែងបន្លំ**<br/>Fraud detection rate | តើអត្រាទទួលយកការផ្គូផ្គងខុស (FAR) មានកម្រិតប៉ុន្មាន?<br/>What is the false acceptance rate (FAR)? |
| **កម្រិតត្រួតពិនិត្យវត្តមាន**<br/>Liveness level | ប្រភេទសកម្ម ឬអសកម្ម — តើមួយណាដែលតម្រូវសម្រាប់កម្រិតហានិភ័យរបស់អ្នក?<br/>Passive vs active — what's required for your risk level? |
| **GDPR និងឯកជនភាពទិន្នន័យ**<br/>GDPR/data privacy | តើទិន្នន័យត្រូវបានរក្សាទុកនៅឯណា? តើគោលការណ៍រក្សាទុកទិន្នន័យជាអ្វី?<br/>Where is data stored? What is the retention policy? |
| **គុណភាព API**<br/>API quality | តើជាប្រភេទ SDK ឬ API? គុណភាព Mobile SDK យ៉ាងដូចម្តេច?<br/>SDK vs API? Mobile SDK quality? |
| **កិច្ចព្រមព្រៀងកម្រិតសេវាកម្ម (SLA)**<br/>SLA | តើពេលវេលានៃការដំណើរការផ្ទៀងផ្ទាត់ (SLA) មានរយៈពេលប៉ុន្មាន?<br/>What is the processing time SLA? |
| **តម្លៃ**<br/>Price | ការគិតតម្លៃក្នុងមួយការផ្ទៀងផ្ទាត់ — តើមានការបញ្ចុះតម្លៃតាមទំហំដែរឬទេ?<br/>Per-verification pricing — volume discounts? |
| **ភស្តុតាងសវនកម្ម**<br/>Audit trail | តើអ្នកអាចនាំចេញឯកសារកត់ត្រាការផ្ទៀងផ្ទាត់សម្រាប់សវនកម្មបានដែរឬទេ?<br/>Can you export verification records for compliance? |

---

<a id="8"></a>
## ឯកសារទាក់ទង (Related)

* **[មូលដ្ឋានគ្រឹះ KYC / KYB (KYC / KYB Fundamentals)](./01-kyc-kyb-fundamentals.md)**  
  [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)  
* **[បទប្បញ្ញត្តិ eIDAS (eIDAS)](./05-eidas.md)** — ក្របខ័ណ្ឌអត្តសញ្ញាណឌីជីថលរបស់សហភាពអឺរ៉ុប  
  [eIDAS](./05-eidas.md) — EU digital identity framework  
* **[ខ្សែសង្វាក់នៃការបញ្ចូល និងផ្ទៀងផ្ទាត់ឯកសារ (File Upload & Validation Pipeline)](../../procedures/compliance-and-accounts/02-file-upload-validation-pipeline.md)** — ការគ្រប់គ្រងឯកសារបច្ចេកទេសសម្រាប់ឯកសារ KYC<br/>[File Upload & Validation Pipeline](../../procedures/compliance-and-accounts/02-file-upload-validation-pipeline.md) — technical file handling for KYC documents  
* **[នីតិវិធីផ្ទៀងផ្ទាត់អ្នកផ្តល់សេវា KYC (KYC Provider Verification Procedure)](../../procedures/compliance-and-accounts/kyc/01-kyc-provider-verification.md)**  
  [KYC Provider Verification Procedure](../../procedures/compliance-and-accounts/kyc/01-kyc-provider-verification.md)  
