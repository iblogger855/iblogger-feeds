# CCPA (ច្បាប់ការពារឯកជនភាពអ្នកប្រើប្រាស់រដ្ឋកាលីហ្វ័រញ៉ា)៖ សិទ្ធិ និងកាតព្វកិច្ចការពារទិន្នន័យ (CCPA — California Consumer Privacy Act)

**សមត្ថកិច្ចអនុវត្ត (Jurisdiction)៖** រដ្ឋកាលីហ្វ័រញ៉ា សហរដ្ឋអាមេរិក (California, USA)  
**ថ្ងៃចូលជាធរមាន (In force)៖** ១ មករា ២០២០ (កែសម្រួលដោយ CPRA មានប្រសិទ្ធភាពចាប់ពី ១ មករា ២០២៣) (1 January 2020, amended by CPRA effective 1 January 2023)  
**សហគ្រាសជាប់កាតព្វកិច្ច (Applies to)៖** អាជីវកម្មស្វែងរកប្រាក់ចំណេញណាដែលបំពេញលក្ខខណ្ឌណាមួយដូចជា៖ ប្រាក់ចំណូលសរុបប្រចាំឆ្នាំ > ២៥ លានដុល្លារ; ទិញ/លក់/ទទួល/ចែករំលែកព័ត៌មានផ្ទាល់ខ្លួនរបស់អតិថិជន ឬគ្រួសារនៅកាលីហ្វ័រញ៉ាចាប់ពី ១០០,០០០ នាក់ឡើងទៅ; ឬទទួលបានចំណូល ៥០% ឡើងទៅពីការលក់/ចែករំលែកព័ត៌មានផ្ទាល់ខ្លួន (For-profit businesses that meet any of: annual gross revenue > $25M; buys/sells/receives/shares personal info of 100,000+ California consumers/households; or derives 50%+ of revenue from selling/sharing personal info)  
**Tags:** #compliance #ccpa #cpra #data-privacy #usa #california

---

## 📌 មាតិកា (Table of Contents)
- [សេចក្តីផ្តើម (What It Is)](#0)
- [១. និយមន័យសំខាន់ៗ (Key Definitions)](#1)
- [២. សិទ្ធិរបស់អ្នកប្រើប្រាស់ (Consumer Rights)](#2)
- [៣. យន្តការ «Do Not Sell or Share» (Do Not Sell or Share My Personal Information)](#3)
- [៤. តម្រូវការបច្ចេកទេស (Technical Requirements)](#4)
- [៥. ភាពខុសគ្នាសំខាន់ៗរវាង CCPA និង GDPR (CCPA vs GDPR Key Differences)](#5)
- [៦. ទណ្ឌកម្ម និងការផាកពិន័យ (Penalties)](#6)
- [៧. អ្វីដែលត្រូវសាងសង់ (What to Build)](#7)
- [Related](#8)

---

<a id="0"></a>
## សេចក្តីផ្តើម (What It Is)

CCPA ផ្តល់សិទ្ធិអំណាចដល់ប្រជាពលរដ្ឋរដ្ឋកាលីហ្វ័រញ៉ាលើព័ត៌មានផ្ទាល់ខ្លួនរបស់ពួកគេ និងតម្រូវឱ្យអាជីវកម្មជាប់កាតព្វកិច្ចត្រូវមានតម្លាភាពក្នុងការប្រមូល ប្រើប្រាស់ និងចែករំលែកទិន្នន័យទាំងនោះ។ ច្បាប់ CPRA (ច្បាប់សិទ្ធិឯកជនភាពកាលីហ្វ័រញ៉ា ឆ្នាំ ២០២៣) បានពង្រឹងច្បាប់នេះបន្ថែមទៀត ដោយបន្ថែមសិទ្ធិថ្មីៗ និងបង្កើតទីភ្នាក់ងារការពារឯកជនភាពកាលីហ្វ័រញ៉ា (CPPA)។

CCPA gives California residents rights over their personal information and requires covered businesses to be transparent about how they collect, use, and share that data. The CPRA (California Privacy Rights Act, 2023) strengthened it further — adding new rights and creating the California Privacy Protection Agency (CPPA).

---

<a id="1"></a>
## ១. និយមន័យសំខាន់ៗ (Key Definitions)

| វាក្យសព្ទ (Term) | អត្ថន័យ CCPA (CCPA meaning) | ធៀបនឹង GDPR (vs GDPR) |
|:-----|:------------|:--------|
| **ព័ត៌មានផ្ទាល់ខ្លួន (Personal information)** | កំណត់ន័យទូលំទូលាយ៖ រួមមាន ឈ្មោះ, IP, ប្រវត្តិស្វែងរក, ប្រវត្តិនៃការទិញ, ជីវមាត្រ, និងការសន្និដ្ឋានផ្សេងៗ (Broadly defined — includes name, IP, browsing history, purchase history, biometrics, inferences) | ស្រដៀងនឹងទិន្នន័យផ្ទាល់ខ្លួនរបស់ GDPR (Similar to GDPR personal data) |
| **ព័ត៌មានផ្ទាល់ខ្លួនរសើប (Sensitive personal information)** | លេខសន្តិសុខសង្គម (SSN), ទិន្នន័យហិរញ្ញវត្ថុ, សុខភាព, សេនេទិច, ទីតាំងភូមិសាស្ត្រជាក់លាក់, ជាតិសាសន៍, សាសនា, និន្នាការផ្លូវភេទ (SSN, financial data, health, genetics, precise geolocation, race, religion, sexual orientation) | ស្រដៀងនឹងទិន្នន័យប្រភេទពិសេសរបស់ GDPR (Similar to GDPR special categories) |
| **អ្នកប្រើប្រាស់ (Consumer)** | ប្រជាពលរដ្ឋរស់នៅក្នុងរដ្ឋកាលីហ្វ័រញ៉ា (California resident) | ម្ចាស់ទិន្នន័យ (Data subject) |
| **អាជីវកម្ម (Business)** | ក្រុមហ៊ុន ឬសហគ្រាសជាប់កាតព្វកិច្ច (The covered company) | អ្នកគ្រប់គ្រងទិន្នន័យ (Data controller) |
| **អ្នកផ្តល់សេវាកម្ម (Service provider)** | ភាគីទីបីដែលដំណើរការទិន្នន័យតំណាងឱ្យអាជីវកម្ម (Third party processing on behalf of business) | អ្នកដំណើរការទិន្នន័យ (Data processor) |
| **ការលក់ (Sale)** | ការចែករំលែកព័ត៌មានផ្ទាល់ខ្លួនដើម្បីប្រាក់កម្រៃ ឬដើម្បីផលប្រយោជន៍មានតម្លៃផ្សេងទៀត (Sharing personal info for monetary or other valuable consideration) | ទូលំទូលាយជាង GDPR ដោយរាប់បញ្ចូលទាំងការចែករំលែកសម្រាប់ផ្សាយពាណិជ្ជកម្មគោលដៅ (Broader than GDPR — includes sharing for targeted advertising) |

---

<a id="2"></a>
## ២. សិទ្ធិរបស់អ្នកប្រើប្រាស់ (Consumer Rights)

| សិទ្ធិ (Right) | អ្វីដែលអ្នកប្រើប្រាស់អាចធ្វើបាន (What the consumer can do) | រយៈពេលឆ្លើយតប (Timeframe) |
|:------|:------------------------|:----------|
| **សិទ្ធិដឹង (Know)** | ស្នើសុំដឹងពីប្រភេទ និងព័ត៌មានលម្អិតជាក់លាក់ដែលត្រូវបានប្រមូល (What categories and specific pieces of personal info are collected) | ឆ្លើយតបក្នុងរយៈពេល ៤៥ ថ្ងៃ (Respond within 45 days) |
| **សិទ្ធិលុបចោល (Delete)** | ស្នើសុំឱ្យលុបទិន្នន័យផ្ទាល់ខ្លួនរបស់ពួកគេចោល (Request deletion of their data) | ឆ្លើយតបក្នុងរយៈពេល ៤៥ ថ្ងៃ (Respond within 45 days) |
| **សិទ្ធិកែតម្រូវ (Correct)** (CPRA) | កែតម្រូវព័ត៌មានផ្ទាល់ខ្លួនដែលខុស ឬមិនត្រឹមត្រូវ (Correct inaccurate personal information) | ឆ្លើយតបក្នុងរយៈពេល ៤៥ ថ្ងៃ (Respond within 45 days) |
| **សិទ្ធិជំទាស់ការលក់/ចែករំលែក (Opt-out of sale/sharing)** | បញ្ឈប់អាជីវកម្មមិនឱ្យលក់ ឬចែករំលែកទិន្នន័យរបស់ខ្លួនសម្រាប់ការផ្សព្វផ្សាយពាណិជ្ជកម្មឆ្លងប្រព័ន្ធ (Stop the business selling or sharing their data for cross-context advertising) | ត្រូវតែអនុវត្តតាមជាបន្ទាន់ (Must honour immediately) |
| **សិទ្ធិរឹតត្បិតការប្រើប្រាស់ទិន្នន័យរសើប (Limit sensitive PI use)** (CPRA) | រឹតត្បិតការប្រើប្រាស់ព័ត៌មានផ្ទាល់ខ្លួនកម្រិតរសើប (Restrict use of sensitive personal information) | អនុវត្តតាមក្នុងរយៈពេល ១៥ ថ្ងៃធ្វើការ (Honour within 15 business days) |
| **សិទ្ធិមិនរើសអើង (Non-discrimination)** | មិនអាចត្រូវបានបដិសេធសេវាកម្ម ឬគិតថ្លៃខ្ពស់ជាងមុនដោយសារតែការអនុវត្តសិទ្ធិឡើយ (Cannot be denied service or charged more for exercising rights) | ភ្លាមៗ (Immediate) |
| **សិទ្ធិផ្ទេរទិន្នន័យ (Data portability)** (CPRA) | ទទួលបានទិន្នន័យរបស់ពួកគេជាទម្រង់ដែលអាចផ្ទេរបានងាយស្រួល (Receive their data in a portable format) | ឆ្លើយតបក្នុងរយៈពេល ៤៥ ថ្ងៃ (Respond within 45 days) |

---

<a id="3"></a>
## ៣. យន្តការ «Do Not Sell or Share» (Do Not Sell or Share My Personal Information)

នេះគឺជាតម្រូវការចម្បង និងសំខាន់បំផុតរបស់ច្បាប់ CCPA។ ប្រសិនបើអាជីវកម្មរបស់អ្នកលក់ ឬចែករំលែកទិន្នន័យផ្ទាល់ខ្លួន (រួមទាំងការប្រើប្រាស់ដើម្បីផ្សព្វផ្សាយពាណិជ្ជកម្មគោលដៅ) អ្នកត្រូវតែ៖

This is the defining requirement of CCPA. If your business sells or shares personal data (including for targeted advertising), you must:

1. ផ្តល់តំណភ្ជាប់ **«Do Not Sell or Share My Personal Information»** (ហាមលក់ ឬចែករំលែកព័ត៌មានផ្ទាល់ខ្លួនរបស់ខ្ញុំ) នៅលើទំព័រដើម (Homepage) នៃគេហទំព័ររបស់អ្នក និងក្នុងគោលការណ៍ឯកជនភាព។
1. ទទួលស្គាល់ និងអនុវត្តតាមការស្នើសុំ Opt-out ពីកម្មវិធីរុករកតាមរយៈសញ្ញា Global Privacy Control (GPC) ដោយស្វ័យប្រវត្តិ។
1. ហាមលក់ទិន្នន័យរបស់អ្នកប្រើប្រាស់ដែលមានអាយុក្រោម ១៦ ឆ្នាំ បើគ្មានការយល់ព្រមច្បាស់លាស់ (អាយុក្រោម ១៣ ឆ្នាំ តម្រូវឱ្យមានការយល់ព្រមពីមាតាបិតា)។

---

<a id="4"></a>
## ៤. តម្រូវការបច្ចេកទេស (Technical Requirements)

### ៤.១ ដំណឹងឯកជនភាព (Privacy Notice)
* បង្ហាញច្បាស់លាស់ពីរាល់ប្រភេទព័ត៌មានផ្ទាល់ខ្លួនដែលប្រមូល និងមូលហេតុ។
* បង្ហាញបញ្ជីឈ្មោះភាគីទីបីទាំងអស់ដែលអ្នកបានចែករំលែកទិន្នន័យឱ្យ។
* ត្រូវធ្វើបច្ចុប្បន្នភាពយ៉ាងហោចណាស់រៀងរាល់ ១២ ខែម្តង។

### ៤.២ យន្តការទទួលការស្នើសុំ (Consumer Request Mechanism)
* ផ្តល់មធ្យោបាយយ៉ាងហោចណាស់ពីរសម្រាប់ទទួលការស្នើសុំ (ឧទាហរណ៍៖ Web Form + លេខទូរស័ព្ទ/អ៊ីមែល)។
* ផ្ទៀងផ្ទាត់អត្តសញ្ញាណអ្នកស្នើសុំជាមុនសិន ដោយមិនប្រមូលទិន្នន័យថ្មីដែលមិនចាំបាច់។
* មិនត្រូវគិតកម្រៃសេវាសម្រាប់ការស្នើសុំឡើយ (អនុញ្ញាតរហូតដល់ ២ ដងក្នុងរយៈពេល ១២ ខែ)។

### ៤.៣ ការគូសផែនទីទិន្នន័យ (Data Mapping)
* ត្រូវដឹងច្បាស់ថាព័ត៌មានផ្ទាល់ខ្លួនណាខ្លះដែលអ្នកប្រមូល រក្សាទុកនៅទីណា និងចែករំលែកទៅឱ្យអ្នកណា។
* នេះគឺជាលក្ខខណ្ឌចាំបាច់ដើម្បីឆ្លើយតបទៅនឹងសិទ្ធិស្នើសុំ "ដឹង (Know)" របស់អតិថិជនបានត្រឹមត្រូវ។

### ៤.៤ ការចាត់ចែងសញ្ញា Opt-Out (Opt-Out Signal Handling)
* ចាប់យក និងអនុវត្តតាមសញ្ញា Global Privacy Control (GPC) ពី Browser របស់អ្នកប្រើប្រាស់ដោយស្វ័យប្រវត្តិ។
* ហាមប្រើប្រាស់ Dark Patterns (ការរចនាបោកបញ្ឆោត) ដែលធ្វើឱ្យការស្នើសុំ Opt-out មានភាពលំបាកជាង Opt-in។

---

<a id="5"></a>
## ៥. ភាពខុសគ្នាសំខាន់ៗរវាង CCPA និង GDPR (CCPA vs GDPR Key Differences)

| ទិដ្ឋភាព (Aspect) | ច្បាប់ CCPA | ច្បាប់ GDPR |
|:-------|:-----|:-----|
| **ការយល់ព្រមជាមុន ឬជំទាស់តាមក្រោយ (Opt-in vs Opt-out)** | គំរូ Opt-out (ប្រមូលទិន្នន័យជាលំនាំដើម រួចទើបអនុញ្ញាតឱ្យជំទាស់តាមក្រោយ) (Opt-out model — data collected by default) | គំរូ Opt-in (តម្រូវឱ្យមានការយល់ព្រមជាមុនសិន ទើបអាចប្រមូលទិន្នន័យបាន) (Opt-in model — need consent before collection) |
| **ទំហំសហគ្រាស (Threshold)** | អនុវត្តចំពោះតែសហគ្រាសធំៗ ឬក្រុមហ៊ុនដំណើរការទិន្នន័យទ្រង់ទ្រាយធំប៉ុណ្ណោះ (Only large/data-heavy businesses) | គ្រប់អាជីវកម្មទាំងអស់ដែលដំណើរការទិន្នន័យរបស់ពលរដ្ឋសហភាពអឺរ៉ុប (Any business processing EU resident data) |
| **មូលដ្ឋានច្បាប់ (Legal basis)** | មិនមានតម្រូវការស្មើគ្នាទេ — យន្តការជំទាស់ Opt-out គឺជាគោល (No equivalent — opt-out is the mechanism) | ត្រូវតែមានមូលដ្ឋានផ្លូវច្បាប់ច្បាស់លាស់ជាមុន (Must have explicit legal basis) |
| **ការផាកពិន័យ (Penalties)** | ១០០ ទៅ ៧៥០ ដុល្លារក្នុងម្នាក់ក្នុងមួយករណី (សិទ្ធិប្តឹងផ្តល់ឯកជនសម្រាប់លេចធ្លាយទិន្នន័យ); ២,៥០០ ទៅ ៧,៥០០ ដុល្លារក្នុងមួយការរំលោភ قصទ្បើយដោយចេតនា ($100–$750 per consumer per incident; $2,500–$7,500 per intentional violation) | រហូតដល់ ៤% នៃប្រាក់ចំណូលសកលប្រចាំឆ្នាំ (Up to 4% of global turnover) |
| **ស្ថាប័នអនុវត្តច្បាប់ (Enforcement)** | ទីភ្នាក់ងារការពារឯកជនភាពកាលីហ្វ័រញ៉ា (CPPA) (California Privacy Protection Agency) | អាជ្ញាធរត្រួតពិនិត្យជាតិរបស់សមាជិកនីមួយៗ (National supervisory authorities) |

---

<a id="6"></a>
## ៦. ទណ្ឌកម្ម និងការផាកពិន័យ (Penalties)

| ប្រភេទរំលោភច្បាប់ (Violation) | ការផាកពិន័យ (Fine) |
|:----------|:-----|
| ការរំលោភច្បាប់ដោយអចេតនា (Unintentional violation) | រហូតដល់ ២,៥០០ ដុល្លារក្នុងមួយករណី (Up to $2,500 per violation) |
| ការរំលោភច្បាប់ដោយចេតនា (Intentional violation) | រហូតដល់ ៧,៥០០ ដុល្លារក្នុងមួយករណី (Up to $7,500 per violation) |
| ករណីលេចធ្លាយទិន្នន័យ (Data breach - Private right of action) | ១០០ ទៅ ៧៥០ ដុល្លារ ក្នុងម្នាក់ក្នុងមួយករណី ($100–$750 per consumer per incident) |

---

<a id="7"></a>
## ៧. អ្វីដែលត្រូវសាងសង់ (What to Build)

```
បញ្ជីរៀបចំប្រព័ន្ធការពារទិន្នន័យ CCPA អប្បបរមា (Minimum CCPA implementation)៖

□ តំណភ្ជាប់ "Do Not Sell or Share" នៅលើទំព័រដើម និងក្នុងគោលការណ៍ឯកជនភាព (Link on homepage and privacy policy)
□ ស្វែងរក និងអនុវត្តតាមសញ្ញា Global Privacy Control (GPC) (GPC signal detection and honouring)
□ ផតថលទទួលការស្នើសុំរបស់អតិថិជន — ដំណើរការសិទ្ធិ Know, Delete, Correct, Opt-out (Consumer request portal)
□ ប្រព័ន្ធផ្ទៀងផ្ទាត់អត្តសញ្ញាណសម្រាប់ការស្នើសុំ (Identity verification for requests)
□ ដំណឹងឯកជនភាព — ធ្វើបច្ចុប្បន្នភាពប្រចាំឆ្នាំ និងរាយគ្រប់ប្រភេទព័ត៌មាន (Privacy notice updated annually)
□ គូសផែនទីទិន្នន័យ — គ្រប់ប្រភេទព័ត៌មាន ទីតាំងរក្សាទុក និងដៃគូចែករំលែក (Data map of categories & sharing partners)
□ កិច្ចព្រមព្រៀងសេវាកម្ម (Service Provider Agreements) — ជាមួយគ្រប់អ្នកដំណើរការទិន្នន័យភាគីទីបី (With all third-party processors)
□ កំណត់ត្រានៃការស្នើសុំ — កត់ត្រារាល់សំណើរបស់អតិថិជន និងលទ្ធផលឆ្លើយតប (Record of requests and responses)
□ ទ្វារយល់ព្រមសម្រាប់អាយុក្រោម ១៦ ឆ្នាំ — ប្រសិនបើមានអ្នកប្រើប្រាស់ជាអនីតិជន (Under-16 consent gate)
```

---

<a id="8"></a>
## Related

- [GDPR](./01-gdpr.md) — គំរូច្បាប់សហភាពអឺរ៉ុបដែលមានភាពតឹងរ៉ឹងជាង (Opt-in)។
- [Data Privacy Comparison Matrix](./07-comparison-matrix.md) — ម៉ាទ្រីសប្រៀបធៀបច្បាប់ឯកជនភាពទិន្នន័យ។
- [Account Deletion & Data Retention Procedure](../../procedures/compliance-and-accounts/01-account-deletion-and-data-retention.md) — នីតិវិធីលុបគណនី និងការរក្សាទុកទិន្នន័យ។
