# បទប្បញ្ញត្តិ eIDAS — ការកំណត់អត្តសញ្ញាណអេឡិចត្រូនិក និងសេវាទំនុកចិត្ត (eIDAS — Electronic Identification and Trust Services)៖ eIDAS — Electronic Identification and Trust Services

**សមត្ថកិច្ចអនុវត្ត (Jurisdiction)៖** សហភាពអឺរ៉ុប (European Union)  
**Jurisdiction:** European Union  

**ចូលជាធរមាន (In force)៖** ថ្ងៃទី ១ ខែកក្កដា ឆ្នាំ ២០១៦ (eIDAS 1.0); បទប្បញ្ញត្តិ eIDAS 2.0 ត្រូវបានអនុម័តក្នុងឆ្នាំ ២០២៤  
**In force:** 1 July 2016 (eIDAS 1.0); eIDAS 2.0 regulation adopted 2024  

**អនុវត្តចំពោះ (Applies to)៖** អត្តសញ្ញាណអេឡិចត្រូនិក ហត្ថលេខាអេឡិចត្រូនិក ត្រាអេឡិចត្រូនិក ត្រាពេលវេលា និងការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃគេហទំព័រនៅក្នុងសហភាពអឺរ៉ុប (EU)  
**Applies to:** Electronic identity, electronic signatures, electronic seals, timestamps, and website authentication within the EU  

**Tags:** #compliance #eidas #digital-identity #e-signature #eu #trust-services

---

## 📌 មាតិកា (Table of Contents)
- [តើវាជាអ្វី (What It Is)](#0)
- [សមាសភាគគន្លឹះ (Key Components)](#1)
- [បទប្បញ្ញត្តិ eIDAS 2.0 — កាបូបអត្តសញ្ញាណឌីជីថលរបស់សហភាពអឺរ៉ុប (eIDAS 2.0 — EU Digital Identity Wallet)](#2)
- [អ្នកផ្តល់សេវាទំនុកចិត្ត (Trust Service Providers (TSPs))](#3)
- [ឥទ្ធិពលនៃ eIDAS លើផ្លែតហ្វមរបស់អ្នក (What eIDAS Means for Your Platform)](#4)
- [ឯកសារទាក់ទង (Related)](#5)

---

<a id="0"></a>
## តើវាជាអ្វី (What It Is)

eIDAS (electronic IDentification, Authentication and trust Services) គឺជាបទប្បញ្ញត្តិរបស់សហភាពអឺរ៉ុប (EU) ដែលបង្កើតក្របខ័ណ្ឌច្បាប់សម្រាប់៖  
eIDAS (electronic IDentification, Authentication and trust Services) is the EU regulation that establishes a legal framework for:  
1. **ការកំណត់អត្តសញ្ញាណអេឡិចត្រូនិក** — គម្រោងអត្តសញ្ញាណឌីជីថលដែលអាចត្រូវបានទទួលស្គាល់ទូទាំងប្រទេសជាសមាជិក EU  
   Electronic identification — digital identity schemes that can be recognised across EU member states  
2. **សេវាទំនុកចិត្ត** — ហត្ថលេខាអេឡិចត្រូនិក ត្រាអេឡិចត្រូនិក ត្រាពេលវេលា ការផ្ញើលិខិតបញ្ជាក់ និងការផ្ទៀងផ្ទាត់គេហទំព័រ  
   Trust services — electronic signatures, seals, timestamps, registered delivery, and website authentication  

បទប្បញ្ញត្តិ eIDAS បង្កើតតម្លៃច្បាប់ស្មើគ្នារវាងហត្ថលេខាអេឡិចត្រូនិក និងហត្ថលេខាផ្ទាល់ដៃនៅទូទាំងសហភាពអឺរ៉ុប។  
eIDAS creates the legal equivalence of electronic signatures with wet-ink signatures across the EU.  

---

<a id="1"></a>
## សមាសភាគគន្លឹះ (Key Components)

### ហត្ថលេខាអេឡិចត្រូនិក (Electronic Signatures)

| ប្រភេទ<br/>Type | ការពិពណ៌នា<br/>Description | ផលប៉ះពាល់ផ្លូវច្បាប់<br/>Legal effect |
|:---|:---|:---|
| **ហត្ថលេខាអេឡិចត្រូនិកសាមញ្ញ (SES)**<br/>Simple Electronic Signature (SES) | ទិន្នន័យអេឡិចត្រូនិកណាមួយដែលភ្ជាប់ជាមួយឯកសារ (ឧទាហរណ៍ ការវាយឈ្មោះ រូបថតហត្ថលេខាដែលបានស្កេន)<br/>Any electronic data attached to a document (e.g. typed name, scanned signature) | មិនត្រូវបានបដិសេធតម្លៃច្បាប់ឡើយ ប៉ុន្តែមានកម្រិតធានាទាបបំផុត<br/>Not denied legal effect but lowest assurance |
| **ហត្ថលេខាអេឡិចត្រូនិកកម្រិតខ្ពស់ (AdES)**<br/>Advanced Electronic Signature (AdES) | ភ្ជាប់ទៅកាន់ និងកំណត់អត្តសញ្ញាណអ្នកចុះហត្ថលេខាយ៉ាងច្បាស់លាស់ ព្រមទាំងអាចស្វែងរកការកែប្រែឯកសារបាន<br/>Uniquely linked to and identifies the signatory; detects changes | កម្រិតធានាខ្ពស់ជាង — ស័ក្តិសមសម្រាប់កិច្ចសន្យាភាគច្រើន<br/>Higher assurance — suitable for most contracts |
| **ហត្ថលេខាអេឡិចត្រូនិកដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ (QES)**<br/>Qualified Electronic Signature (QES) | បង្កើតឡើងដោយឧបករណ៍ និងវិញ្ញាបនបត្រដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ពីអ្នកផ្តល់សេវាទំនុកចិត្ត (Trust Service Provider)<br/>Created by a qualified device with a qualified certificate from a Trust Service Provider | មានតម្លៃស្មើនឹងហត្ថលេខាផ្ទាល់ដៃដោយស្របច្បាប់នៅទូទាំងសហភាពអឺរ៉ុប<br/>Legally equivalent to a handwritten signature across the EU |

### ត្រាអេឡិចត្រូនិក (Electronic Seals)

សម្រាប់នីតិបុគ្គល (ក្រុមហ៊ុន) ជាជាងបុគ្គលម្នាក់ៗ — ស្មើនឹងត្រាក្រុមហ៊ុន។ ប្រើប្រាស់ដើម្បីបញ្ជាក់ពីប្រភព និងភាពត្រឹមត្រូវនៃឯកសារ។  
For legal entities (companies) rather than individuals — equivalent to a company stamp. Used to prove origin and integrity of documents.  

### ត្រាពេលវេលាដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ (Qualified Timestamps)

បញ្ជាក់ថាទិន្នន័យមានវត្តមានពិតប្រាកដនៅពេលវេលាជាក់លាក់មួយ។ អាចប្រើប្រាស់ជាភស្តុតាងស្របច្បាប់បាន។  
Prove that data existed at a specific point in time. Legally admissible as evidence.  

### eDelivery / សេវាផ្ញើលិខិតបញ្ជាក់អេឡិចត្រូនិក (Registered Electronic Mail)

មានតម្លៃស្មើនឹងការផ្ញើលិខិតបញ្ជាក់តាមប្រៃសណីយ៍ — ផ្តល់ភស្តុតាងនៃការផ្ញើ និងការទទួល។  
Equivalent to registered post — provides proof of sending and receipt.  

### ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃគេហទំព័រ (QWAC) / Website Authentication (QWAC)

វិញ្ញាបនបត្រផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃគេហទំព័រដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ — បញ្ជាក់ថាគេហទំព័រនោះជារបស់នីតិបុគ្គលពិតប្រាកដដូចការអះអាង។  
Qualified Website Authentication Certificates — prove a website belongs to the legal entity it claims.  

---

<a id="2"></a>
## បទប្បញ្ញត្តិ eIDAS 2.0 — កាបូបអត្តសញ្ញាណឌីជីថលរបស់សហភាពអឺរ៉ុប (eIDAS 2.0 — EU Digital Identity Wallet)

eIDAS 2.0 (ត្រូវបានអនុម័តក្នុងឆ្នាំ ២០២៤) បានណែនាំ **កាបូបអត្តសញ្ញាណឌីជីថលរបស់សហភាពអឺរ៉ុប (EU Digital Identity Wallet)** — ដែលជាកាបូបឌីជីថលផ្ទាល់ខ្លួនដែលអាច៖  
eIDAS 2.0 (adopted 2024) introduces the **EU Digital Identity Wallet** — a personal digital wallet that:  
- ប្រជាពលរដ្ឋសហភាពអឺរ៉ុបម្នាក់ៗអាចទទួលបាន  
  Every EU citizen can obtain  
- រួមបញ្ចូលទាំងព័ត៌មានអត្តសញ្ញាណដែលបានផ្ទៀងផ្ទាត់ (ឈ្មោះ ថ្ងៃខែឆ្នាំកំណើត អាសយដ្ឋាន គុណវុឌ្ឍិវិជ្ជាជីវៈ)  
  Contains verified identity attributes (name, DOB, address, professional qualifications)  
- អាចប្រើប្រាស់ដើម្បីផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវទាំងអនឡាញ និងផ្ទាល់ផ្ទាល់នៅទូទាំងសហភាពអឺរ៉ុប  
  Can be used to authenticate online and in person across the EU  
- កាត់បន្ថយតម្រូវការនៃដំណើរការ KYC ដាច់ដោយឡែកសម្រាប់ផ្លែតហ្វមនានា  
  Eliminates the need for separate KYC processes for compliant platforms  

### ឥទ្ធិពលលើដំណើរការ KYC (Impact on KYC)

នៅពេលដែល eIDAS 2.0 ត្រូវបានដាក់ឱ្យអនុវត្តពេញលេញ៖  
When eIDAS 2.0 is fully implemented:  
- អ្នកប្រើប្រាស់អាចបង្ហាញកាបូបអត្តសញ្ញាណឌីជីថលសហភាពអឺរ៉ុបរបស់ពួកគេជំនួសឱ្យការបញ្ចូលរូបភាពឯកសារអត្តសញ្ញាណ  
  Users can present their EU Digital Identity Wallet instead of uploading identity documents  
- ការបញ្ជាក់នៅក្នុងកាបូបឌីជីថលត្រូវបានផ្ទៀងផ្ទាត់រួចជាស្រេចដោយអាជ្ញាធររដ្ឋាភិបាល  
  The wallet attestations are pre-verified by government authorities  
- ផ្លែតហ្វមដែលទទួលយកការផ្ទៀងផ្ទាត់តាមកាបូបឌីជីថលនឹងទទួលបានភាពប្រាកដប្រជាផ្នែកច្បាប់អំពីអត្តសញ្ញាណអ្នកប្រើប្រាស់  
  Platforms accepting wallet authentication get legal certainty about the user's identity  
- កាត់បន្ថយថ្លៃដើម និងភាពស្មុគស្មាញនៃដំណើរការ KYC យ៉ាងច្រើនសន្ធឹកសន្ធាប់  
  Reduces KYC cost and friction significantly  

---

<a id="3"></a>
## អ្នកផ្តល់សេវាទំនុកចិត្ត (Trust Service Providers (TSPs))

TSPs ផ្តល់នូវហេដ្ឋារចនាសម្ព័ន្ធសម្រាប់សេវាទំនុកចិត្តដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់។ ពួកគេត្រូវបានសវនកម្ម និងត្រួតពិនិត្យដោយអាជ្ញាធរជាតិ។ បញ្ជីស្វែងរកសេវាទំនុកចិត្ត (**Trusted List**) របស់សហភាពអឺរ៉ុបនឹងបោះពុម្ពផ្សាយរាល់ TSPs ដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ទាំងអស់។  
TSPs provide the infrastructure for qualified trust services. They are audited and supervised by national authorities. The EU's **Trusted List** publishes all qualified TSPs.  

ឧទាហរណ៍៖  
Examples:  
- DocuSign (មានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់នៅក្នុងដែនសមត្ថកិច្ចមួយចំនួនរបស់ EU)  
  DocuSign (qualified in some EU jurisdictions)  
- Adobe Sign (មានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់)  
  Adobe Sign (qualified)  
- Swisscom Trust Services  
- BankID (ស៊ុយអែត) — គម្រោង eID ថ្នាក់ជាតិ  
  BankID (Sweden) — national eID scheme  
- France Connect — ប្រព័ន្ធអត្តសញ្ញាណជាតិបារាំង  
  France Connect — French national identity  

---

<a id="4"></a>
## ឥទ្ធិពលនៃ eIDAS លើផ្លែតហ្វមរបស់អ្នក (What eIDAS Means for Your Platform)

### ប្រសិនបើអ្នកដំណើរការក្នុងសហភាពអឺរ៉ុប និងត្រូវការហត្ថលេខាអេឡិចត្រូនិក៖

**If you operate in the EU and need electronic signatures:**  
- សម្រាប់គោលបំណងទូទៅ (កិច្ចព្រមព្រៀងរក្សាការសម្ងាត់ NDA, កិច្ចព្រមព្រៀងសេវាកម្ម)៖ ហត្ថលេខាអេឡិចត្រូនិកកម្រិតខ្ពស់ (AdES) គឺគ្រប់គ្រាន់ហើយ  
  For most purposes (NDAs, service agreements): Advanced Electronic Signature is sufficient  
- សម្រាប់ឯកសារច្បាប់ដែលមានតម្លៃខ្ពស់ (អចលនទ្រព្យ កិច្ចសន្យាហិរញ្ញវត្ថុ)៖ អាចតម្រូវឱ្យមានហត្ថលេខាអេឡិចត្រូនិកដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ (QES)  
  For high-value legal documents (real estate, financial contracts): Qualified Electronic Signature may be required  
- ការប្រើប្រាស់អ្នកផ្តល់សេវា TSP ដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ ផ្តល់ឱ្យអ្នកនូវភាពប្រាកដប្រជាផ្នែកច្បាប់  
  Using a qualified TSP gives you legal certainty  

### ប្រសិនបើអ្នកធ្វើ KYC លើអ្នករស់នៅក្នុងសហភាពអឺរ៉ុប៖

**If you do KYC on EU residents:**  
- តាមដានការដាក់ឱ្យប្រើប្រាស់កាបូប eIDAS 2.0 — វានឹងក្លាយជាវិធីសាស្ត្រផ្ទៀងផ្ទាត់អត្តសញ្ញាណដែលត្រូវបានទទួលស្គាល់  
  Monitor eIDAS 2.0 wallet rollout — it will become an accepted identity verification method  
- ការទទួលយកការផ្ទៀងផ្ទាត់តាមកាបូបឌីជីថល នឹងត្រូវតម្រូវឱ្យអនុវត្តសម្រាប់សេវាកម្មដែលមានបទប្បញ្ញត្តិមួយចំនួននាពេលអនាគត  
  Accepting wallet authentication will eventually be required for certain regulated services  

### សម្រាប់ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃគេហទំព័រ៖

**For website authentication:**  
- វិញ្ញាបនបត្រ QWAC ផ្តល់ការធានាអត្តសញ្ញាណរឹងមាំជាងវិញ្ញាបនបត្រ DV/OV ស្តង់ដារ  
  QWAC certificates provide stronger identity assurance than standard DV/OV certificates  

---

<a id="5"></a>
## ឯកសារទាក់ទង (Related)

* **[មូលដ្ឋានគ្រឹះ KYC / KYB (KYC / KYB Fundamentals)](./01-kyc-kyb-fundamentals.md)**  
  [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)  
* **[ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណឌីជីថល (Digital Identity Verification)](./06-digital-identity-verification.md)**  
  [Digital Identity Verification](./06-digital-identity-verification.md)  
* **[បទប្បញ្ញត្តិ GDPR (GDPR)](../data-privacy/01-gdpr.md)** — ការការពារទិន្នន័យអត្តសញ្ញាណដែលបានប្រមូលក្រោម eIDAS  
  [GDPR](../data-privacy/01-gdpr.md) — data protection for identity data collected under eIDAS  
