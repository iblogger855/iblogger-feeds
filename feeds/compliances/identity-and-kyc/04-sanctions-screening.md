# ការត្រួតពិនិត្យទណ្ឌកម្ម (Sanctions Screening)៖ Sanctions Screening

**សមត្ថកិច្ចអនុវត្ត (Jurisdiction)៖** សកល  
**Jurisdiction:** Global  

**អនុវត្តចំពោះ (Applies to)៖** ធុរកិច្ចណាក៏ដោយដែលដំណើរការប្រតិបត្តិការហិរញ្ញវត្ថុ ឬផ្តល់សេវាកម្ម — ជាពិសេសសេវាកម្មហិរញ្ញវត្ថុ ពាណិជ្ជកម្មអេឡិចត្រូនិក និងផ្លែតហ្វមទីផ្សារ  
**Applies to:** Any business conducting financial transactions or providing services — especially financial services, e-commerce, and marketplace platforms  

**Tags:** #compliance #sanctions #ofac #un #screening #aml #kyc

---

## 📌 មាតិកា (Table of Contents)
- [តើវាជាអ្វី (What It Is)](#0)
- [បញ្ជីទណ្ឌកម្មសំខាន់ៗ (Key Sanctions Lists)](#1)
- [ហេតុអ្វីបានជា OFAC មានឥទ្ធិពលទោះនៅក្រៅសហរដ្ឋអាមេរិក (OFAC — Why It Matters Even Outside the USA)](#2)
- [អ្វីដែលត្រូវត្រួតពិនិត្យ (What to Screen)](#3)
- [ប្រភេទនៃការផ្គូផ្គង (Match Types)](#4)
- [ការផ្គូផ្គងឈ្មោះមិនច្បាស់លាស់ (Fuzzy Name Matching)](#5)
- [ក្រុមហ៊ុនផ្តល់សេវាកម្មត្រួតពិនិត្យ (Screening Providers)](#6)
- [ការហាមទម្លាយព័ត៌មាន (Tipping Off)](#7)
- [ការរក្សាទុកឯកសារកត់ត្រា (Record Keeping)](#8)
- [អ្វីដែលត្រូវរៀបចំ (What to Build)](#9)
- [ឯកសារទាក់ទង (Related)](#10)

---

<a id="0"></a>
## តើវាជាអ្វី (What It Is)

ទណ្ឌកម្ម គឺជាការរឹតត្បិតផ្លូវច្បាប់ដែលដាក់ចេញដោយរដ្ឋាភិបាល ឬស្ថាប័នអន្តរជាតិនានាប្រឆាំងនឹងបុគ្គល អង្គភាព ឬប្រទេសណាមួយ។ ការត្រួតពិនិត្យទណ្ឌកម្ម គឺជាដំណើរការនៃការត្រួតពិនិត្យអតិថិជន ភាគីពាក់ព័ន្ធ និងប្រតិបត្តិការហិរញ្ញវត្ថុធៀបនឹងបញ្ជីទាំងនេះ មុនពេលផ្តល់សេវាកម្ម ឬដំណើរការទូទាត់ប្រាក់។  
Sanctions are legal restrictions imposed by governments or international bodies against individuals, entities, or countries. Sanctions screening is the process of checking your customers, counterparties, and transactions against these lists before providing services or processing payments.  

ការរំលោភលើទណ្ឌកម្ម — ទោះបីជាដោយអចេតនាក៏ដោយ — អាចបណ្តាលឱ្យមានការផាកពិន័យជាប្រាក់យ៉ាងច្រើនសន្ធឹកសន្ធាប់ និងការចោទប្រកាន់ពីបទល្មើសព្រហ្មទណ្ឌ។ ពាក្យថា «យើងមិនបានដឹង» មិនមែនជាលេសដោះស្រាយការពារខ្លួនចំពោះមុខការិយាល័យ OFAC ឡើយ។  
Violating sanctions — even unknowingly — can result in massive fines and criminal charges. "We didn't know" is not a defence for OFAC.  

---

<a id="1"></a>
## បញ្ជីទណ្ឌកម្មសំខាន់ៗ (Key Sanctions Lists)

| បញ្ជី<br/>List | ស្ថាប័នបោះផ្សាយ<br/>Issuer | វិសាលភាព<br/>Scope |
|:---|:---|:---|
| **បញ្ជី SDN** (Specially Designated Nationals) | OFAC (ក្រសួងហិរញ្ញវត្ថុសហរដ្ឋអាមេរិក) | បុគ្គល និងអង្គភាព — ធុរកិច្ចសកលទាំងអស់អាចនឹងរងការផាកពិន័យប្រសិនបើធ្វើការជាមួយពួកគេ<br/>Individuals and entities — any global business can be fined for dealing with them |
| **Sectoral Sanctions** (ទណ្ឌកម្មតាមវិស័យ) | OFAC | ការរឹតត្បិតលើវិស័យជាក់លាក់ (ថាមពល ហិរញ្ញវត្ថុ) នៅក្នុងប្រទេសមួយចំនួន<br/>Restrictions on specific sectors (energy, finance) in certain countries |
| **បញ្ជីរួមបញ្ជូលគ្នារបស់ក្រុមប្រឹក្សាសន្តិសុខ UN** | អង្គការសហប្រជាជាតិ | កាតព្វកិច្ចសម្រាប់រដ្ឋសមាជិក UN ទាំងអស់<br/>Mandatory for all UN member states |
| **បញ្ជីរួមបញ្ចូលគ្នារបស់ EU** | សហភាពអឺរ៉ុប | កាតព្វកិច្ចសម្រាប់ធុរកិច្ចក្នុងសហភាពអឺរ៉ុប (EU)<br/>Mandatory for EU businesses |
| **ទណ្ឌកម្មហិរញ្ញវត្ថុរបស់ចក្រភពអង់គ្លេស** | OFSI (ក្រសួងហិរញ្ញវត្ថុអង់គ្លេស) | កាតព្វកិច្ចសម្រាប់ធុរកិច្ចក្នុងចក្រភពអង់គ្លេស<br/>Mandatory for UK businesses |
| **កម្មវិធីទណ្ឌកម្មប្រទេសរបស់ OFAC** | OFAC | ទណ្ឌកម្មទូលំទូលាយប្រឆាំងនឹងគុយបា អ៊ីរ៉ង់ កូរ៉េខាងជើង ស៊ីរី រុស្ស៊ី (វិស័យមួយចំនួន)<br/>Comprehensive sanctions against Cuba, Iran, North Korea, Syria, Russia (certain sectors) |
| **បញ្ជីជាតិ** | គណៈកម្មាធិការជាតិប្រឆាំងភេរវកម្មកម្ពុជា, AMLO របស់ថៃ ។ល។ | ជាក់លាក់ទៅតាមប្រទេសនីមួយៗ<br/>Country-specific |

---

<a id="2"></a>
## ហេតុអ្វីបានជា OFAC មានឥទ្ធិពលទោះនៅក្រៅសហរដ្ឋអាមេរិក (OFAC — Why It Matters Even Outside the USA)

ការិយាល័យ OFAC (Office of Foreign Assets Control) មានឥទ្ធិពល និងវិសាលភាពគ្របដណ្តប់ក្រៅដែនដី៖  
OFAC (Office of Foreign Assets Control) has extraterritorial reach:  

* **រាល់ប្រតិបត្តិការដែលឆ្លងកាត់ប្រព័ន្ធហិរញ្ញវត្ថុសហរដ្ឋអាមេរិក** (ប្រតិបត្តិការជាប្រាក់ដុល្លារអាមេរិក USD, ធនាគារឆ្លើយឆ្លងរបស់សហរដ្ឋអាមេរិក)  
  Any transaction that passes through the US financial system (USD transactions, US correspondent banks)  
* **អង្គភាពណាក៏ដោយដែលមានការចូលរួមពីបុគ្គលសហរដ្ឋអាមេរិក** (ប្រជាពលរដ្ឋសហរដ្ឋអាមេរិក អ្នករស់នៅអចិន្ត្រៃយ៍ ឬអង្គភាពដែលបានចុះបញ្ជីនៅសហរដ្ឋអាមេរិក)  
  Any entity with US persons involved (US citizens, residents, or US-incorporated entities)  
* **ក្រុមហ៊ុនណាក៏ដោយដែលមានប្រតិបត្តិការអាជីវកម្មនៅក្នុងសហរដ្ឋអាមេរិក**  
  Any company with US operations  

ដោយសារប្រាក់ដុល្លារអាមេរិក (USD) ជា រូបិយប័ណ្ណបម្រុងសកល ហើយការផ្ទេរប្រាក់តាមខ្សែស្រឡាយអន្តរជាតិភាគច្រើនត្រូវឆ្លងកាត់ធនាគារសហរដ្ឋអាមេរិក (ដូចជា Citibank, JPMorgan, BONY) ដូច្នេះវិធានការរបស់ OFAC ត្រូវបានអនុវត្តទូទាំងសកលលោកជាស្វ័យប្រវត្ត។  
Since USD is the world's reserve currency and most international wire transfers pass through US banks (Citibank, JPMorgan, BONY), OFAC effectively applies globally.  

**ឧទាហរណ៍នៃការផាកពិន័យរបស់ OFAC៖** ធនាគារអឺរ៉ុបមួយដែលដំណើរការទូទាត់ប្រាក់ទៅឱ្យអង្គភាពអ៊ីរ៉ង់ តាមរយៈធនាគារឆ្លើយឆ្លងរបស់សហរដ្ឋអាមេរិក នឹងត្រូវប្រឈមមុខនឹងការផាកពិន័យពេញលេញពី OFAC — ទោះបីជាធនាគារនោះមិនមែនជាធនាគារអាមេរិកក៏ដោយ។  
OFAC penalty example: A European bank processing a payment to an Iranian entity through a US correspondent bank faces full OFAC penalties — even though the bank is not American.  

---

<a id="3"></a>
## អ្វីដែលត្រូវត្រួតពិនិត្យ (What to Screen)

| អ្វីដែលត្រូវត្រួតពិនិត្យ<br/>What | ពេលវេលាត្រូវត្រួតពិនិត្យ<br/>When |
|:---|:---|
| **អតិថិជនថ្មី (បុគ្គល)**<br/>New customers (individuals) | នៅពេលចុះឈ្មោះចូលប្រើប្រាស់ — មុនពេលផ្តល់សេវាកម្មណាមួយ<br/>At onboarding — before any service is provided |
| **អតិថិជនថ្មី (ធុរកិច្ច)**<br/>New customers (businesses) | នៅពេលចុះឈ្មោះចូលប្រើប្រាស់ — ត្រួតពិនិត្យអង្គភាពធុរកិច្ច + នាយកទាំងអស់ + ម្ចាស់ UBOs<br/>At onboarding — screen the entity + all directors + UBOs |
| **អតិថិជនដែលមានស្រាប់**<br/>Existing customers | ការត្រួតពិនិត្យឡើងវិញជាប្រចាំ (យ៉ាងហោចណាស់ម្តងក្នុងមួយឆ្នាំ ឬនៅពេលបញ្ជីទណ្ឌកម្មមានការធ្វើបច្ចុប្បន្នភាព)<br/>Periodic re-screening (at least annually, or when lists update) |
| **អ្នកទទួលប្រាក់**<br/>Payees / beneficiaries | មុនពេលចាប់ផ្តើមដំណើរការផ្ទេរប្រាក់<br/>Before initiating a payment |
| **ភាគីប្រតិបត្តិការ**<br/>Transaction counterparties | ពេលវេលាពិតប្រាកដ ឬជិតពេលវេលាពិតប្រាកដ<br/>Real-time or near-real-time |
| **ប្រទេស**<br/>Countries | ពិនិត្យមើលថាតើប្រទេសគោលដៅរងទណ្ឌកម្មដែរឬទេ<br/>Check if the destination country is sanctioned |

---

<a id="4"></a>
## ប្រភេទនៃការផ្គូផ្គង (Match Types)

| ប្រភេទ<br/>Type | ការពិពណ៌នា<br/>Description | វិធានការត្រូវអនុវត្ត<br/>Action |
|:---|:---|:---|
| **ការផ្គូផ្គងពិតប្រាកដ**<br/>True match | ឈ្មោះ ថ្ងៃខែឆ្នាំកំណើត និងទិន្នន័យផ្សេងទៀតត្រូវគ្នាយ៉ាងច្បាស់ជាមួយបុគ្គលដែលរងទណ្ឌកម្ម<br/>Name, DOB, and other data clearly match the sanctioned person | បដិសេធប្រតិបត្តិការ និងរាយការណ៍ទៅសមត្ថកិច្ច<br/>Reject and report |
| **ការជូនដំណឹងខុស**<br/>False positive | ឈ្មោះស្រដៀងគ្នា ប៉ុន្តែជាមនុស្សផ្សេងគ្នា<br/>Similar name but different person | កត់ត្រា និងរក្សាទុកភស្តុតាងនៃការច្រានចោលការផ្គូផ្គង<br/>Document the dismissal with evidence |
| **ការផ្គូផ្គងសក្តានុពល**<br/>Potential match | ការផ្គូផ្គងមួយផ្នែក — តម្រូវឱ្យមានការស៊ើបអង្កេតបន្ថែម<br/>Partial match — requires investigation | បញ្ជូនទៅផ្នែកអនុលោមភាពដើម្បីពិនិត្យឡើងវិញ<br/>Escalate to compliance for review |

---

<a id="5"></a>
## ការផ្គូផ្គងឈ្មោះមិនច្បាស់លាស់ (Fuzzy Name Matching)

ឈ្មោះដែលត្រូវបានបកប្រែមកពីភាសាអារ៉ាប់ ចិន រុស្ស៊ី ខ្មែរ ឬអក្សរផ្សេងទៀត អាចមានអក្ខរាវិរុទ្ធត្រឹមត្រូវច្រើនបែប។ ការត្រួតពិនិត្យត្រូវតែគិតគូរពី៖  
Names transliterated from Arabic, Chinese, Russian, Khmer, or other scripts may have multiple valid spellings. Screening must account for:  
* **ការប្រែប្រួលនៃឈ្មោះ** (ឧទាហរណ៍ `Mohammed`, `Mohamed`, `Mohamad`)  
  Name variations (Mohammed, Mohamed, Mohamad)  
* **ឈ្មោះហៅក្រៅ** (បញ្ជី SDN រួមបញ្ចូលទាំងឈ្មោះហៅក្រៅដែលគេស្គាល់)  
  Aliases (SDN list includes known aliases)  
* **ភាពខុសគ្នានៃការបកប្រែអក្សរ**  
  Transliteration differences  
* **លំដាប់ឈ្មោះបញ្ច្រាស** (វប្បធម៌ខ្លះដាក់ត្រកូលមុន)  
  Reversed name order (some cultures list surname first)  

ឧបករណ៍ត្រួតពិនិត្យទណ្ឌកម្មភាគច្រើនប្រើប្រាស់ក្បួនដោះស្រាយការផ្គូផ្គងមិនច្បាស់លាស់ (ដូចជា Jaro-Winkler, Levenshtein distance) ជាមួយនឹងកម្រិតកំណត់ដែលអាចកំណត់រចនាសម្ព័ន្ធបាន។  
Most sanctions screening tools use fuzzy matching algorithms (e.g. Jaro-Winkler, Levenshtein distance) with configurable thresholds.  

---

<a id="6"></a>
## ក្រុមហ៊ុនផ្តល់សេវាកម្មត្រួតពិនិត្យ (Screening Providers)

| ក្រុមហ៊ុនផ្តល់សេវាកម្ម<br/>Provider | ចំណុចខ្លាំង<br/>Strengths |
|:---|:---|
| Dow Jones Risk & Compliance | ទិន្នន័យទូលំទូលាយ ស្តង់ដារឧស្សាហកម្មហិរញ្ញវត្ថុ<br/>Comprehensive data, financial industry standard |
| LexisNexis WorldCompliance | ការគ្របដណ្តប់ទូលំទូលាយ រួមបញ្ចូលគ្នាទាំង PEP + ទណ្ឌកម្ម<br/>Broad coverage, PEP + sanctions combined |
| ComplyAdvantage | ការត្រួតពិនិត្យពេលវេលាជាក់ស្តែងផ្អែកលើ ML ផ្តល់អាទិភាពលើ API<br/>Real-time ML-based screening, API-first |
| Refinitiv World-Check | ប្រើប្រាស់ដោយធនាគារធំៗភាគច្រើននៅលើពិភពលោក<br/>Used by most large banks globally |
| Trulioo | ការគ្របដណ្តប់ល្អលើទីផ្សារកំពុងអភិវឌ្ឍន៍<br/>Good coverage of emerging markets |
| SEON | មានប្រសិទ្ធភាពថ្លៃដើមសម្រាប់សហគ្រាសធុនតូច និងមធ្យម ផ្អែកលើ API<br/>Cost-effective for SMEs, API-based |

---

<a id="7"></a>
## ការហាមទម្លាយព័ត៌មាន (Tipping Off)

ប្រសិនបើអ្នកកំពុងត្រួតពិនិត្យអតិថិជនម្នាក់ ហើយរកឃើញថាពួកគេស្ថិតក្នុងបញ្ជីទណ្ឌកម្ម អ្នក **មិនត្រូវ** ប្រាប់ពួកគេឡើយ។ ការប្រាប់បុគ្គលដែលរងទណ្ឌកម្មថាពួកគេត្រូវបានរកឃើញ គឺជាសកម្មភាពទម្លាយព័ត៌មាន (Tipping Off) — ដែលជាបទល្មើសព្រហ្មទណ្ឌ។  
If you are screening a customer and determine they are on a sanctions list, you must **NOT** tell them. Informing a sanctioned person that they have been identified is "tipping off" — a criminal offence.  

```
ការអនុវត្តត្រឹមត្រូវ (CORRECT)៖
  ត្រួតពិនិត្យ ➔ រកឃើញការផ្គូផ្គង ➔ បដិសេធការចុះឈ្មោះ / បង្កកគណនី ➔
  រាយការណ៍ទៅអាជ្ញាធរពាក់ព័ន្ធ ➔ មិនត្រូវប្រាប់អតិថិជនពីមូលហេតុឡើយ

CORRECT:
  Screen → Match found → Reject application / freeze account → 
  Report to relevant authority → Do not inform the customer of the reason

ការអនុវត្តមិនត្រឹមត្រូវ (INCORRECT)៖
  «យើងមិនអាចផ្តល់សេវាកម្មជូនលោកអ្នកបានទេ ព្រោះលោកអ្នកមានឈ្មោះក្នុងបញ្ជី OFAC SDN»។
  ➔ នេះជាការទម្លាយព័ត៌មាន (Tipping Off)

INCORRECT:
  "We cannot serve you because you appear on the OFAC SDN list."
  ← This is tipping off
```

---

<a id="8"></a>
## ការរក្សាទុកឯកសារកត់ត្រា (Record Keeping)

| ប្រភេទឯកសារកត់ត្រា<br/>Record | រយៈពេលរក្សាទុក<br/>Retention |
|:---|:---|
| **លទ្ធផលត្រួតពិនិត្យ** (ការផ្គូផ្គង និងការច្រានចោល)<br/>Screening results (matches and dismissals) | ៥ ឆ្នាំ<br/>5 years |
| **ឯកសារចងក្រងពីការជូនដំណឹងខុស**<br/>False positive documentation | ៥ ឆ្នាំ<br/>5 years |
| **ឯកសារកត់ត្រាការបញ្ជូនបន្ត និងការសម្រេចចិត្ត**<br/>Escalation and decision records | ៥ ឆ្នាំ<br/>5 years |

---

<a id="9"></a>
## អ្វីដែលត្រូវរៀបចំ (What to Build)

ការអនុវត្តប្រព័ន្ធត្រួតពិនិត្យទណ្ឌកម្មជាអប្បបរមា៖  
Minimum sanctions screening implementation:  

- [ ] ភ្ជាប់ជាមួយ API ត្រួតពិនិត្យទណ្ឌកម្ម (ComplyAdvantage, LexisNexis ។ល។)  
  Integrate sanctions screening API (ComplyAdvantage, LexisNexis, etc.)  
- [ ] ត្រួតពិនិត្យអតិថិជនថ្មីទាំងអស់នៅពេលចុះឈ្មោះចូល — មុនពេលដំណើរការគណនី  
  Screen all new customers at onboarding — before account activation  
- [ ] ត្រួតពិនិត្យម្ចាស់ UBOs និងនាយកទាំងអស់សម្រាប់អតិថិជនជាធុរកិច្ច  
  Screen all UBOs and directors for business customers  
- [ ] ត្រួតពិនិត្យពេលវេលាជាក់ស្តែងលើអ្នកទទួលប្រាក់  
  Real-time screening of payment beneficiaries  
- [ ] ត្រួតពិនិត្យឡើងវិញជាប្រចាំលើអតិថិជនដែលមានស្រាប់ (យ៉ាងហោចណាស់ម្តងក្នុងមួយឆ្នាំ)  
  Periodic re-screening of existing customers (at least annually)  
- [ ] ប្រើប្រាស់វិធីសាស្ត្រផ្គូផ្គងមិនច្បាស់លាស់ (Fuzzy matching) ជាមួយកម្រិតកំណត់ដែលអាចកំណត់បាន  
  Fuzzy matching with configurable threshold  
- [ ] បង្កើតលំហូរការងារបញ្ជូនបន្តសម្រាប់ការផ្គូផ្គងសក្តានុពល  
  Escalation workflow for potential matches  
- [ ] បង្កើតដំណើរការចងក្រងឯកសារសម្រាប់ការជូនដំណឹងខុស  
  False positive documentation process  
- [ ] ការពារការទម្លាយព័ត៌មាន (Tipping Off) — មិនត្រូវប្រាប់ពីមូលហេតុនៃការបដិសេធឡើយ  
  Tipping off prevention — do not disclose reason for rejection  
- [ ] កំណត់ត្រាជូនដំណឹង — រក្សាទុករយៈពេល ៥ ឆ្នាំ  
  Alert records — 5-year retention  
- [ ] ទប់ស្កាត់អាសយដ្ឋាន IP សម្រាប់ប្រទេសដែលរងទណ្ឌកម្មទូលំទូលាយ  
  Country-level IP blocking for comprehensively sanctioned countries  

---

<a id="10"></a>
## ឯកសារទាក់ទង (Related)

* **[មូលដ្ឋានគ្រឹះ KYC / KYB (KYC / KYB Fundamentals)](./01-kyc-kyb-fundamentals.md)**  
  [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)  
* **[ការប្រឆាំងការសម្អាតប្រាក់ និងការផ្តល់ហិរញ្ញប្បទានដល់ភេរវកម្ម (AML/CFT)](../payment-and-financial/03-aml-cft.md)**  
  [AML/CFT](../payment-and-financial/03-aml-cft.md)  
* **[អនុសាសន៍របស់ FATF (FATF Recommendations)](./03-fatf-recommendations.md)**  
  [FATF Recommendations](./03-fatf-recommendations.md)  
* **[ការត្រួតពិនិត្យប្រតិបត្តិការ AML (AML Transaction Monitoring)](./02-aml-transaction-monitoring.md)**  
  [AML Transaction Monitoring](./02-aml-transaction-monitoring.md)  
