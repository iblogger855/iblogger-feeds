# NIST CSF — Cybersecurity Framework

**Jurisdiction / យុត្តាធិការ៖** USA (globally adopted) / សហរដ្ឋអាមេរិក (អនុវត្តជាសកល)  
**Current version / កំណែបច្ចុប្បន្ន៖** CSF 2.0 (February 2024)  
**Applies to / អនុវត្តចំពោះ៖** Originally critical infrastructure; now adopted by all sectors globally / ដើមឡើយអនុវត្តចំពោះហេដ្ឋារចនាសម្ព័ន្ធសំខាន់ៗ ប៉ុន្តែបច្ចុប្បន្នត្រូវបានយកទៅប្រើប្រាស់ក្នុងគ្រប់វិស័យទូទាំងសកលលោក  
**Administered by / គ្រប់គ្រងដោយ៖** NIST (National Institute of Standards and Technology), US Dept of Commerce / វិទ្យាស្ថានជាតិស្តង់ដារ និងបច្ចេកវិទ្យា (NIST) នៃក្រសួងពាណិជ្ជកម្មសហរដ្ឋអាមេរិក  
**Tags:** #compliance #nist #csf #cybersecurity #framework #risk

---

## 📌 មាតិកា (Table of Contents)

- [១. តើអ្វីជា NIST CSF? (What It Is)](#0)
- [២. មុខងារទាំងប្រាំមួយ (The Six Functions - CSF 2.0)](#1)
- [៣. ប្រភេទគន្លឹះតាមមុខងារនីមួយៗ (Key Categories per Function)](#2)
- [៤. កម្រិតនៃការអនុវត្ត (Implementation Tiers)](#3)
- [៥. ភាពខុសគ្នារវាង NIST CSF និង ISO 27001 (NIST CSF vs ISO 27001)](#4)
- [៦. ស្តង់ដារ NIST SP 800-53 (NIST SP 800-53)](#5)
- [៧. អ្វីដែលត្រូវបង្កើត (What to Build)](#6)
- [៨. ឯកសារទាក់ទង (Related)](#7)

---

<a id="0"></a>
## ១. តើអ្វីជា NIST CSF? (What It Is)

NIST CSF គឺជាក្របខ័ណ្ឌស្ម័គ្រចិត្តមួយ ដែលជួយស្ថាប័ននានាក្នុងការគ្រប់គ្រង និងកាត់បន្ថយហានិភ័យសន្តិសុខព័ត៌មាន (Cybersecurity Risk)។ វាមិនមែនជាបទប្បញ្ញត្តិឡើយ — វាជាវិធីសាស្ត្រដែលមានរចនាសម្ព័ន្ធច្បាស់លាស់ចំពោះសន្តិសុខព័ត៌មាន ដែលអាចប្រើប្រាស់ដោយឯករាជ្យ ឬដើម្បីបំពេញតម្រូវការបទប្បញ្ញត្តិ (បទប្បញ្ញត្តិជាច្រើនរបស់សហរដ្ឋអាមេរិកទទួលយក NIST CSF ជាមធ្យោបាយអនុលោមភាព)។

NIST CSF is a voluntary framework that helps organisations manage and reduce cybersecurity risk. It is not a regulation — it is a structured approach to cybersecurity that can be used independently or to satisfy regulatory requirements (many US regulations accept NIST CSF as a compliance path).

CSF 2.0 បានបន្ថែមមុខងារទីប្រាំមួយគឺ គ្រប់គ្រង (Govern) ទៅលើមុខងារទាំងប្រាំដើម។

CSF 2.0 added a sixth function (Govern) to the original five.

---

<a id="1"></a>
## ២. មុខងារទាំងប្រាំមួយ (The Six Functions - CSF 2.0)

```
គ្រប់គ្រង (GOVERN) ──────────────────────────────────────────────────────────┐
  បរិបទស្ថាប័ន យុទ្ធសាស្ត្រគ្រប់គ្រងហានិភ័យ ហានិភ័យខ្សែច្រវាក់ផ្គត់ផ្គង់      │
  គោលនយោបាយ តួនាទី និងការត្រួតពិនិត្យ                                    │
                                                                           │
កំណត់អត្តសញ្ញាណ ──► ការពារ ──► ស្វែងរក ──► ឆ្លើយតប ──► សង្គ្រោះឡើងវិញ        │
(IDENTIFY)      (PROTECT)  (DETECT)  (RESPOND)    (RECOVER)                │
                                                                           │
└──────────────────────────────────────────────────────────────────────────┘
```

```
GOVERN ─────────────────────────────────────────────────────┐
  Organisational context, risk management strategy,          │
  supply chain risk, policies, roles, oversight              │
                                                             │
IDENTIFY ──► PROTECT ──► DETECT ──► RESPOND ──► RECOVER     │
                                                             │
└───────────────────────────────────────────────────────────┘
```

| មុខងារ (Function) | វិសាលភាពគ្របដណ្ដប់ (What it covers) |
|:---|:---|
| **គ្រប់គ្រង (Govern)** <br/> Govern (new in 2.0) | យុទ្ធសាស្ត្រសន្តិសុខព័ត៌មាន, គោលនយោបាយ, តួនាទី, ហានិភ័យខ្សែច្រវាក់ផ្គត់ផ្គង់, ការត្រួតពិនិត្យ <br/> Cybersecurity strategy, policies, roles, supply chain risk, oversight |
| **កំណត់អត្តសញ្ញាណ (Identify)** <br/> Identify | ការគ្រប់គ្រងទ្រព្យសកម្ម, ការវាយតម្លៃហានិភ័យ, បរិស្ថានអាជីវកម្ម <br/> Asset management, risk assessment, business environment |
| **ការពារ (Protect)** <br/> Protect | ការគ្រប់គ្រងការចូលប្រើប្រាស់, ការបណ្ដុះបណ្ដាលការយល់ដឹង, សុវត្ថិភាពទិន្នន័យ, ការថែទាំ, បច្ចេកវិទ្យាការពារ <br/> Access control, awareness training, data security, maintenance, protective technology |
| **ស្វែងរក (Detect)** <br/> Detect | ការស្វែងរកភាពមិនប្រក្រតី, ការត្រួតពិនិត្យជាបន្តបន្ទាប់, ដំណើរការស្វែងរក <br/> Anomaly detection, continuous monitoring, detection processes |
| **ឆ្លើយតប (Respond)** <br/> Respond | ការរៀបចំផែនការឆ្លើយតប, ការប្រាស្រ័យទាក់ទង, ការវិភាគ, ការកាត់បន្ថយផលប៉ះពាល់ <br/> Response planning, communications, analysis, mitigation |
| **សង្គ្រោះឡើងវិញ (Recover)** <br/> Recover | ផែនការសង្គ្រោះឡើងវិញ, ការកែលម្អ, ការប្រាស្រ័យទាក់ទង <br/> Recovery planning, improvements, communications |

---

<a id="2"></a>
## ៣. ប្រភេទគន្លឹះតាមមុខងារនីមួយៗ (Key Categories per Function)

### កំណត់អត្តសញ្ញាណ (Identify)

- **ការគ្រប់គ្រងទ្រព្យសកម្ម (Asset Management)**៖ បញ្ជីសារពើភណ្ឌនៃគ្រឿងរឹង (Hardware) គ្រឿងទន់ (Software) ទិន្នន័យ និងបុគ្គលិកទាំងអស់
- **Asset Management**: Inventory of all hardware, software, data, and personnel
- **ការវាយតម្លៃហានិភ័យ (Risk Assessment)**៖ ការកំណត់អត្តសញ្ញាណការគំរាមកំហែង ការវាយតម្លៃភាពងាយរងគ្រោះ ការផ្ដល់ពិន្ទុហានិភ័យ
- **Risk Assessment**: Threat identification, vulnerability assessment, risk scoring
- **ហានិភ័យខ្សែច្រវាក់ផ្គត់ផ្គង់ (Supply Chain Risk)**៖ ការគ្រប់គ្រងហានិភ័យពីភាគីទីបី (Third-party)
- **Supply Chain Risk**: Third-party risk management

### ការពារ (Protect)

- **ការគ្រប់គ្រងអត្តសញ្ញាណ និងការចូលប្រើប្រាស់ (Identity Management and Access Control)**៖ ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវ គោលការណ៍សិទ្ធិអប្បបរមា MFA
- **Identity Management and Access Control**: Authentication, least privilege, MFA
- **ការយល់ដឹង និងការបណ្ដុះបណ្ដាល (Awareness and Training)**៖ ការបណ្ដុះបណ្ដាលសន្តិសុខព័ត៌មានជាទៀងទាត់សម្រាប់បុគ្គលិកទាំងអស់
- **Awareness and Training**: Regular security training for all staff
- **សុវត្ថិភាពទិន្នន័យ (Data Security)**៖ ការបែងចែកប្រភេទទិន្នន័យ ការកូដនីយកម្ម ការគ្រប់គ្រងវដ្តជីវិតទិន្នន័យ
- **Data Security**: Data classification, encryption, lifecycle management
- **បច្ចេកវិទ្យាការពារ (Protective Technology)**៖ របាំងការពារ (Firewalls) ការការពារឧបករណ៍ចុងក្រោយ (Endpoint Protection) ការកំណត់រចនាសម្ព័ន្ធប្រកបដោយសុវត្ថិភាព
- **Protective Technology**: Firewalls, endpoint protection, secure configuration

### ស្វែងរក (Detect)

- **ភាពមិនប្រក្រតី និងព្រឹត្តិការណ៍ (Anomalies and Events)**៖ កំណត់បន្ទាត់មូលដ្ឋាននៃសកម្មភាពធម្មតា ស្វែងរកការវង្វេងចេញពីភាពប្រក្រតី
- **Anomalies and Events**: Baseline normal activity, detect deviations
- **ការត្រួតពិនិត្យសន្តិសុខជាបន្តបន្ទាប់ (Security Continuous Monitoring)**៖ SIEM, ការប្រមូលផ្ដុំកំណត់ត្រាទុក (Log Aggregation) ព័ត៌មានការគំរាមកំហែង (Threat Feeds)
- **Security Continuous Monitoring**: SIEM, log aggregation, threat feeds
- **ដំណើរការស្វែងរក (Detection Processes)**៖ នីតិវិធីស្វែងរកដែលបានចងក្រងជាឯកសារ និងបានសាកល្បងជាទៀងទាត់
- **Detection Processes**: Documented detection procedures, tested regularly

### ឆ្លើយតប (Respond)

- **ការរៀបចំផែនការឆ្លើយតប (Response Planning)**៖ ផែនការឆ្លើយតបនឹងឧប្បត្តិហេតុ
- **Response Planning**: Incident response plan
- **ការប្រាស្រ័យទាក់ទង (Communications)**៖ ការប្រាស្រ័យទាក់ទងផ្ទៃក្នុង និងខាងក្រៅ (និយតករ ប្រព័ន្ធផ្សព្វផ្សាយ) កំឡុងពេលមានឧប្បត្តិហេតុ
- **Communications**: Internal and external (regulatory, media) communication during incident
- **ការវិភាគ (Analysis)**៖ កោសល្យវិច័យព័ត៌មានវិទ្យា (Forensics) ការវិភាគរកមូលហេតុបង្ក (Root Cause Analysis)
- **Analysis**: Forensics, root cause analysis
- **ការកាត់បន្ថយផលប៉ះពាល់ (Mitigation)**៖ ការទប់ស្កាត់ និងការលុបបំបាត់ការវាយប្រហារ
- **Mitigation**: Containment and eradication

### សង្គ្រោះឡើងវិញ (Recover)

- **ការរៀបចំផែនការសង្គ្រោះ (Recovery Planning)**៖ ផែនការបន្តអាជីវកម្ម និងសង្គ្រោះពីគ្រោះមហន្តរាយ (DR Plan)
- **Recovery Planning**: Business continuity and disaster recovery plans
- **ការកែលម្អ (Improvements)**៖ ការកែលម្អក្រោយពេលកើតមានឧប្បត្តិហេតុ
- **Improvements**: Post-incident improvements
- **ការប្រាស្រ័យទាក់ទង (Communications)**៖ សង្គ្រោះទំនុកចិត្តរបស់ភាគីពាក់ព័ន្ធឡើងវិញ
- **Communications**: Restore stakeholder trust

---

<a id="3"></a>
## ៤. កម្រិតនៃការអនុវត្ត (Implementation Tiers)

| កម្រិត (Tier) | ការពិពណ៌នា (Description) |
|:---|:---|
| **1 — មួយផ្នែក (Partial)** | ធ្វើឡើងតាមករណីជាក់ស្ដែង (Ad hoc) ប្រតិកម្មតាមក្រោយ។ គ្មានដំណើរការជាផ្លូវការឡើយ។ <br/> Ad hoc, reactive. No formal processes. |
| **2 — យល់ដឹងពីហានិភ័យ (Risk Informed)** | មានដំណើរការខ្លះៗ ប៉ុន្តែមិនស៊ីសង្វាក់គ្នានៅទូទាំងស្ថាប័នឡើយ។ <br/> Some processes in place but not consistent across organisation. |
| **3 — អាចធ្វើឡើងវិញបាន (Repeatable)** | មានគោលនយោបាយផ្លូវការ ការអនុវត្តប្រកបដោយភាពស៊ីសង្វាក់គ្នា និងយល់ដឹងពីហានិភ័យ។ <br/> Formal policies, consistent implementation, risk-informed. |
| **4 — អាចបន្សាំបាន (Adaptive)** | កែលម្អជាបន្តបន្ទាប់។ ប្រើប្រាស់ព័ត៌មានសម្ងាត់អំពីការគំរាមកំហែង។ សមាហរណកម្មពេញលេញ។ <br/> Continuously improving. Uses threat intelligence. Fully integrated. |

ស្ថាប័នភាគច្រើនគួរតែកំណត់គោលដៅយក **កម្រិតទី ៣ (Tier 3)**។ កម្រិតទី ៤ គឺសម្រាប់ហេដ្ឋារចនាសម្ព័ន្ធសំខាន់ៗ។

Most organisations should target **Tier 3**. Tier 4 is for critical infrastructure.

---

<a id="4"></a>
## ៥. ភាពខុសគ្នារវាង NIST CSF និង ISO 27001 (NIST CSF vs ISO 27001)

| ទិដ្ឋភាព (Aspect) | NIST CSF | ISO 27001 |
|:---|:---|:---|
| **ប្រភេទ** <br/> Type | ក្របខ័ណ្ឌ (ស្ម័គ្រចិត្ត) <br/> Framework (voluntary) | ស្តង់ដារដែលអាចទទួលបានវិញ្ញាបនបត្រ <br/> Certifiable standard |
| **លទ្ធផល** <br/> Output | ការវាយតម្លៃខ្លួនឯង / ប្រវត្តិរូប <br/> Self-assessment / profile | វិញ្ញាបនបត្រ <br/> Certificate |
| **កម្រិតនៃការណែនាំ** <br/> Prescriptiveness | បត់បែន ផ្អែកលើលទ្ធផល <br/> Flexible, outcomes-based | កំណត់លម្អិត ផ្អែកលើវិធានការគ្រប់គ្រង <br/> Prescriptive, controls-based |
| **ភូមិសាស្ត្រ** <br/> Geography | ផ្ដោតលើសហរដ្ឋអាមេរិក ប៉ុន្តែប្រើជាសកល <br/> US-centric but globally used | ជាសកល <br/> Global |
| **ការចំណាយ** <br/> Cost | ឥតគិតថ្លៃ <br/> Free to use | ជាទូទៅពី £20K–£80K សម្រាប់ការបញ្ជាក់វិញ្ញាបនបត្រ <br/> £20K–£80K for certification |
| **ករណីប្រើប្រាស់** <br/> Use case | ក្របខ័ណ្ឌគ្រប់គ្រងហានិភ័យ <br/> Risk management framework | ការបញ្ជាក់វិញ្ញាបនបត្រផ្លូវការសម្រាប់អតិថិជន <br/> Formal certification for customers |

---

<a id="5"></a>
## ៦. ស្តង់ដារ NIST SP 800-53 (NIST SP 800-53)

ការបោះពុម្ពផ្សាយពិសេសរបស់ NIST 800-53 (NIST SP 800-53) គឺជាកាតាឡុកវិធានការគ្រប់គ្រងលម្អិតដែលគាំទ្រដល់ក្របខ័ណ្ឌ CSF។ វាចុះបញ្ជីវិធានការសន្តិសុខជាក់លាក់រាប់រយ ក្នុងចំណោម ២០ ក្រុមគ្រួសារ។ ភ្នាក់ងារសហព័ន្ធសហរដ្ឋអាមេរិកត្រូវតែអនុលោមតាម SP 800-53 ខណៈផ្នែកឯកជនប្រើប្រាស់វាជាឯកសារយោង។

NIST Special Publication 800-53 is the detailed control catalogue that underpins CSF. It lists hundreds of specific security controls in 20 families. US federal agencies must comply with SP 800-53. Private sector uses it as a reference.

ក្រុមគ្រួសារវិធានការគ្រប់គ្រងសំខាន់ៗដែលទាក់ទងនឹងប្រព័ន្ធគេហទំព័រ៖

Key control families relevant to web platforms:

- AC — Access Control
- AU — Audit and Accountability
- IA — Identification and Authentication
- SC — System and Communications Protection
- SI — System and Information Integrity

---

<a id="6"></a>
## ៧. អ្វីដែលត្រូវបង្កើត (What to Build)

```
ការប្រើប្រាស់ NIST CSF ដើម្បីរៀបចំរចនាសម្ព័ន្ធកម្មវិធីសន្តិសុខព័ត៌មានរបស់អ្នក៖

GOVERN (គ្រប់គ្រង)៖
□ គោលនយោបាយសន្តិសុខព័ត៌មាន — ទទួលបានការអនុម័តពីថ្នាក់ដឹកនាំ
□ កំណត់តួនាទី និងការទទួលខុសត្រូវផ្នែកសន្តិសុខព័ត៌មានឱ្យបានច្បាស់លាស់
□ ការវាយតម្លៃហានិភ័យខ្សែច្រវាក់ផ្គត់បត្តិសម្រាប់អ្នកផ្គត់ផ្គង់សំខាន់ៗ

IDENTIFY (កំណត់អត្តសញ្ញាណ)៖
□ បញ្ជីសារពើភណ្ឌទ្រព្យសកម្ម — គ្រប់ប្រព័ន្ធ ទិន្នន័យ និងបុគ្គលិក
□ គោលនយោបាយបែងចែកប្រភេទទិន្នន័យ
□ ការវាយតម្លៃហានិភ័យប្រចាំឆ្នាំ

PROTECT (ការពារ)៖
□ MFA លើគ្រប់ប្រព័ន្ធដែលងាយរងគ្រោះ
□ ការចូលប្រើប្រាស់ផ្អែកលើតួនាទី — គោលការណ៍សិទ្ធិអប្បបរមា
□ ការបណ្ដុះបណ្ដាលការយល់ដឹងអំពីសន្តិសុខព័ត៌មាន — ប្រចាំឆ្នាំ
□ ការកូដនីយកម្មទិន្នន័យពេលរក្សាទុក និងពេលបញ្ជូន
□ ការការពារឧបករណ៍ចុងក្រោយ (Endpoint)

DETECT (ស្វែងរក)៖
□ ការកត់ត្រាទុកកណ្ដាល (Centralised Logging - SIEM)
□ ការផ្ដល់ដំណឹងអំពីការរកឃើញភាពមិនប្រក្រតី
□ ការពិនិត្យមើលកំណត់ត្រា (Logs) ឡើងវិញឱ្យបានទៀងទាត់

RESPOND (ឆ្លើយតប)៖
□ ផែនការឆ្លើយតបនឹងឧប្បត្តិហេតុ — បានចងក្រងជាឯកសារ និងបានសាកល្បង
□ ការប្ដូរវេនប្រចាំការដោះស្រាយបញ្ហា (On-call Rotation)
□ ទម្រង់គំរូសារប្រាស្រ័យទាក់ទងសម្រាប់ករណីលេចធ្លាយទិន្នន័យ

RECOVER (សង្គ្រោះឡើងវិញ)៖
□ នីតិវិធីបម្រុងទុក និងសង្គ្រោះទិន្នន័យ — កំណត់ RTO/RPO ច្បាស់លាស់
□ ដំណើរការពិនិត្យឡើងវិញក្រោយឧប្បត្តិហេតុ
```

```
Using NIST CSF to structure your security programme:

GOVERN:
□ Information security policy — approved by leadership
□ Defined cybersecurity roles and responsibilities
□ Supply chain risk assessment for critical vendors

IDENTIFY:
□ Asset inventory — all systems, data, personnel
□ Data classification policy
□ Annual risk assessment

PROTECT:
□ MFA on all sensitive systems
□ Role-based access — least privilege
□ Security awareness training — annual
□ Data encryption at rest and in transit
□ Endpoint protection

DETECT:
□ Centralised logging (SIEM)
□ Anomaly detection alerts
□ Regular log review

RESPOND:
□ Incident response plan — documented and tested
□ On-call rotation
□ Communication templates for breaches

RECOVER:
□ Backup and recovery procedures — RTO/RPO defined
□ Post-incident review process
```

---

<a id="7"></a>
## ៨. ឯកសារទាក់ទង (Related)

- [SOC 2](./01-soc2.md) — របាយការណ៍បញ្ជាក់ការគ្រប់គ្រងសេវាកម្ម ២
- [SOC 2](./01-soc2.md)
- [ISO 27001](./02-iso-27001.md) — វិញ្ញាបនបត្រ ISMS
- [ISO 27001](./02-iso-27001.md)
- [CIS Benchmarks](./05-cis-benchmarks.md) — ស្តង់ដារកំណត់រចនាសម្ព័ន្ធសុវត្ថិភាព CIS
- [CIS Benchmarks](./05-cis-benchmarks.md)
