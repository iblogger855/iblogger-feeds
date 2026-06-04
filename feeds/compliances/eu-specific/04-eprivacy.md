# ePrivacy (សេចក្តីណែនាំអំពីឯកជនភាពអេឡិចត្រូនិក)៖ ច្បាប់ Cookie និងឯកជនភាពទំនាក់ទំនង (ePrivacy Directive — Cookie Law and Electronic Communications Privacy)

**សមត្ថកិច្ចអនុវត្ត (Jurisdiction)៖** សហភាពអឺរ៉ុប (European Union)  
**កំណែបច្ចុប្បន្ន (Current version)៖** សេចក្តីណែនាំ ePrivacy 2002/58/EC កែសម្រួលដោយសេចក្តីណែនាំ 2009/136/EC ("ច្បាប់ Cookie") (ePrivacy Directive 2002/58/EC, amended by Directive 2009/136/EC)  
**ស្ថានភាព (Status)៖** សេចក្តីណែនាំ (ការអនុវត្តខុសគ្នាទៅតាមប្រទេសសមាជិក); ថ្ងៃខាងមុខនឹងត្រូវជំនួសដោយបទប្បញ្ញត្តិ ePrivacy Regulation ដែលបច្ចុប្បន្នកំពុងចរចា (Directive, ePrivacy Regulation to replace it — still in negotiation)  
**សហគ្រាសជាប់កាតព្វកិច្ច (Applies to)៖** គេហទំព័រ ឬកម្មវិធីណាដែលផ្តល់សេវាដល់អ្នកប្រើប្រាស់នៅសហភាពអឺរ៉ុប ហើយប្រើប្រាស់ cookies, ការតាមដាន, ឬការទំនាក់ទំនងអេឡិចត្រូនិក (Any website or app serving EU users that uses cookies, tracking, or electronic communications)  
**Tags:** #compliance #eprivacy #cookies #tracking #eu #consent

---

## 📌 មាតិកា (Table of Contents)
- [សេចក្តីផ្តើម (What It Is)](#0)
- [១. ច្បាប់ស្នូលស្តីពី Cookie (Cookies — The Core Rule)](#1)
- [២. លក្ខខណ្ឌតម្រូវសម្រាប់ផ្ទាំងទម្រង់យល់ព្រម Cookie (Cookie Consent Banner Requirements)](#2)
- [៣. ច្បាប់ទីផ្សារផ្ទាល់ (Direct Marketing Rules)](#3)
- [៤. ភាពសម្ងាត់នៃការទំនាក់ទំនង (Confidentiality of Communications)](#4)
- [៥. ភាពខុសគ្នារវាង ePrivacy និង GDPR (ePrivacy vs GDPR)](#5)
- [៦. ភាពខុសគ្នារវាងប្រទេសសមាជិក (Member State Variations)](#6)
- [៧. ទណ្ឌកម្ម និងការផាកពិន័យ (Penalties)](#7)
- [៨. អ្វីដែលត្រូវសាងសង់ (What to Build)](#8)
- [Related](#9)

---

<a id="0"></a>
## សេចក្តីផ្តើម (What It Is)

សេចក្តីណែនាំ ePrivacy គឺជាច្បាប់របស់សហភាពអឺរ៉ុបដែលគ្រប់គ្រងលើ៖
1. **Cookies និងបច្ចេកវិទ្យាតាមដាន៖** តម្រូវឱ្យមានការយល់ព្រមពីអ្នកប្រើប្រាស់មុនពេលដាក់ដំណើរការ cookies មិនចាំបាច់។
2. **ទីផ្សារអេឡិចត្រូនិក៖** ច្បាប់ជ្រើសរើសចូលរួម (opt-in) សម្រាប់ការផ្សព្វផ្សាយពាណិជ្ជកម្មតាមរយៈ Email/SMS។
3. **ភាពសម្ងាត់នៃការទំនាក់ទំនងអេឡិចត្រូនិក៖** ឯកជនភាពផ្នែកទូរគមនាគមន៍។

ច្បាប់នេះដំណើរការទន្ទឹមគ្នាជាមួយច្បាប់ GDPR ដោយច្បាប់ GDPR គឺជាច្បាប់ការពារទិន្នន័យទូទៅ រីឯច្បាប់ ePrivacy គឺជាច្បាប់ជាក់លាក់សម្រាប់ប្រព័ន្ធទំនាក់ទំនងអេឡិចត្រូនិក និងការតាមដាន។ ច្បាប់ទាំងពីរនេះត្រូវបានអនុវត្តក្នុងពេលតែមួយ។

The ePrivacy Directive is the EU law that governs:
1. **Cookies and tracking technologies** — requires consent before placing non-essential cookies.
2. **Electronic marketing** — opt-in rules for email/SMS marketing.
3. **Confidentiality of electronic communications** — telecoms privacy.

It operates alongside GDPR — GDPR is the general data protection law, ePrivacy is the specific law for electronic communications and tracking. Both apply simultaneously.

---

<a id="1"></a>
## ១. ច្បាប់ស្នូលស្តីពី Cookie (Cookies — The Core Rule)

```
cookies ដែល «ចាំបាច់បំផុត» (STRICTLY NECESSARY cookies)៖
  មិនតម្រូវឱ្យមានការសុំការយល់ព្រមឡើយ។
  ឧទាហរណ៍៖ session cookies, ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ (authentication), រទេះទិញទំនិញ (shopping cart), CSRF tokens។

cookies ផ្សេងទៀតទាំងអស់តម្រូវឱ្យមាន៖
  □ ការយល់ព្រមដោយដឹងមុនជាមុន — មុនពេល cookie ត្រូវបានដំឡើង (Prior informed consent)
  □ ផ្តល់ឱ្យដោយសេរី — គ្មានផ្ទាំងរារាំងការចូលមើលគេហទំព័រដើម្បីបង្ខំឱ្យយល់ព្រម (Freely given)
  □ ជាក់លាក់ — ការយល់ព្រមដាច់ដោយឡែកពីគ្នាសម្រាប់ប្រភេទនីមួយៗនៃ cookie (Specific)
  □ ដឹងមុនច្បាស់លាស់ — អ្នកប្រើប្រាស់ដឹងពីតួនាទីរបស់ប្រភេទនីមួយៗ (Informed)
  □ ដកចេញវិញដោយងាយស្រួល — ជម្រើសដកការយល់ព្រមចេញត្រូវតែងាយស្រួលដូចពេលយល់ព្រមដែរ (Easy withdrawal)
```

### ប្រភេទនៃ Cookie (Cookie Categories)

| ប្រភេទ (Category) | ឧទាហរណ៍ (Examples) | ត្រូវការការយល់ព្រម? (Needs Consent?) |
|:---------|:---------|:--------------|
| **ចាំបាច់បំផុត (Strictly necessary)** | Session ID, auth token, cart, CSRF | ទេ (No) |
| **មុខងារ/ចំណូលចិត្ត (Functional/preference)** | ការកំណត់ភាសា, ការចងចាំចំណូលចិត្តអ្នកប្រើប្រាស់ | ត្រូវការពិន័យ (Yes) |
| **ការវិភាគ (Analytics)** | Google Analytics, Matomo | ត្រូវការពិន័យ (Yes - លើកលែងតែអនាមិកទាំងស្រុង) |
| **ទីផ្សារ/ផ្សាយពាណិជ្ជកម្ម (Marketing/advertising)** | Facebook Pixel, Google Ads, retargeting | ត្រូវការពិន័យ (Yes) |
| **បណ្តាញសង្គម (Social media)** | ប៊ូតុង Like, ប៊ូតុង Share ដែលដំឡើង cookies | ត្រូវការពិន័យ (Yes) |

---

<a id="2"></a>
## ២. លក្ខខណ្ឌតម្រូវសម្រាប់ផ្ទាំងទម្រង់យល់ព្រម Cookie (Cookie Consent Banner Requirements)

ផ្ទាំងទម្រង់សុំការយល់ព្រម Cookie ដែលត្រឹមត្រូវតាមច្បាប់ត្រូវតែ៖

```
✓ បង្ហាញឡើង មុនពេល cookies មិនចាំបាច់ត្រូវបានដំឡើង (Appear BEFORE setting cookies)
✓ មានប៊ូតុង «យល់ព្រម (Accept)» និង «បដិសេធ (Reject)» ច្បាស់លាស់ — មានភាពលេចធ្លោស្មើគ្នា (Equal prominence)
✓ មិនប្រើប្រាស់គំរូទម្រង់បញ្ឆោត (Dark Patterns) (ដូចជា ប្រអប់គូសគ្រីសទុកជាមុន, ភាសាញាំញី, ឬលាក់ប៊ូតុងបដិសេធ)
✓ អនុញ្ញាតឱ្យជ្រើសរើសតាមប្រភេទនីមួយៗ (មុខងារ / ការវិភាគ / ទីផ្សារ) (Granular choice)
✓ រក្សាទុកកំណត់ត្រានៃការយល់ព្រម — តើនរណាបានយល់ព្រម, យល់ព្រមលើអ្វី, ពេលណា, ពីអាសយដ្ឋាន IP ណា (Consent records)
✓ អនុញ្ញាតឱ្យដកចេញវិញដោយងាយស្រួល — មានការកំណត់ cookie settings នៅផ្នែកខាងក្រោម/ខាងលើគេហទំព័រ (Easy withdrawal)
✓ មិនរារាំងការចូលមើលគេហទំព័រក្នុងករណីមិនយល់ព្រម (ផ្ទាំងរារាំង/Consent walls គឺខុសច្បាប់ក្នុងប្រទេសភាគច្រើន)
```

### ការបដិសេធត្រូវតែមានភាពងាយស្រួលដូចការយល់ព្រម (Reject Must Be as Easy as Accept)

នេះជាច្បាប់ដែលគេហទំព័រភាគច្រើនរំលោភបំពាន៖

```
ខុសច្បាប់ (ILLEGAL)៖
  ប៊ូតុង "Accept all" (យល់ព្រមទាំងអស់) — ធំ និងលេចធ្លោខ្លាំង
  ប៊ូតុង "Manage preferences" (កំណត់ចំណូលចិត្ត) — តូច, លាក់បាំង, ត្រូវការចុចច្រើនដងដើម្បីបដិសេធទាំងអស់

ស្របច្បាប់ (LEGAL)៖
  ប៊ូតុង "Accept all" (យល់ព្រមទាំងអស់)
  ប៊ូតុង "Reject all" (បដិសេធទាំងអស់) — មានទំហំ និងកម្រិតលេចធ្លោស្មើគ្នា
```

---

<a id="3"></a>
## ៣. ច្បាប់ទីផ្សារផ្ទាល់ (Direct Marketing Rules)

### ទីផ្សារតាម Email (Email Marketing)
* **តម្រូវឱ្យមានការជ្រើសរើសចូលរួមជាមុន (Opt-in required)៖** សម្រាប់ Email ពាណិជ្ជកម្ម (លើកលែងតែករណី soft opt-in សម្រាប់អតិថិជនចាស់)។
* **Soft opt-in៖** អាចផ្ញើ Email ទៅអតិថិជនចាស់អំពីផលិតផលស្រដៀងគ្នាដោយមិនបាច់សុំការយល់ព្រមមុនឡើយ — ប៉ុន្តែត្រូវតែផ្តល់ជម្រើសដកខ្លួន (opt-out) នៅក្នុងរាល់ Email ទាំងអស់។
* **តំណភ្ជាប់ឈប់ជាវ (Unsubscribe link)៖** ត្រូវតែដំណើរការ និងអនុវត្តភ្លាម ៗ។

### ទីផ្សារតាម SMS (SMS Marketing)
* តម្រូវឱ្យមានការជ្រើសរើសចូលរួម (opt-in) ជាមុន។
* ត្រូវតែបង្ហាញអត្តសញ្ញាណអ្នកផ្ញើឱ្យច្បាស់លាស់។
* ត្រូវតែផ្តល់យន្តការដកខ្លួនចេញ (opt-out)។

### ការខលទូរស័ព្ទស្វ័យប្រវត្តិ (Automated Calls)
* តម្រូវឱ្យមានការជ្រើសរើសចូលរួម (opt-in) ជាមុននៅក្នុងប្រទេសសមាជិកភាគច្រើន។

---

<a id="4"></a>
## ៤. ភាពសម្ងាត់នៃការទំនាក់ទំនង (Confidentiality of Communications)

ទិន្នន័យទំនាក់ទំនង (ទិន្នន័យមេតាអំពីអ្នកណាទាក់ទងទៅអ្នកណា, ពេលណា, ពីកន្លែងណា) គឺជាព័ត៌មានសម្ងាត់៖
* ក្រុមហ៊ុនទូរគមនាគមន៍ និងអ្នកផ្តល់សេវាផ្ញើសារមិនអាចចូលមើលខ្លឹមសារបានឡើយ បើគ្មានការយល់ព្រម ឬការអនុញ្ញាតតាមច្បាប់។
* អនុវត្តចំពោះអ្នកផ្តល់សេវា Email, កម្មវិធីផ្ញើសារ (messaging apps), និង VoIP។

---

<a id="5"></a>
## ៥. ភាពខុសគ្នារវាង ePrivacy និង GDPR (ePrivacy vs GDPR)

| ទិដ្ឋភាព (Aspect) | សេចក្តីណែនាំ ePrivacy (ePrivacy Directive) | ច្បាប់ GDPR |
|:-------|:-------------------|:-----|
| **វិសាលភាព (Scope)** | Cookies, ការទំនាក់ទំនងអេឡិចត្រូនិក, ទីផ្សារ | ទិន្នន័យផ្ទាល់ខ្លួនទាំងអស់ (All personal data) |
| **មូលដ្ឋានច្បាប់ (Legal basis)** | ការយល់ព្រម (សម្រាប់ cookies និងទីផ្សារ) | មូលដ្ឋានច្បាប់ច្រើនយ៉ាង (Multiple legal bases) |
| **អាទិភាព (Priority)** | Lex specialis — ជំនួសច្បាប់ GDPR ត្រង់កន្លែងដែលមានការជាន់គ្នា | ច្បាប់ទូទៅ (General rule) |
| **ការអនុវត្តច្បាប់ (Enforcement)** | អាជ្ញាធរទំនាក់ទំនង/ទូរគមនាគមន៍ជាតិ | អាជ្ញាធរការពារទិន្នន័យជាតិ (DPAs) |

---

<a id="6"></a>
## ៦. ភាពខុសគ្នារវាងប្រទេសសមាជិក (Member State Variations)

ដោយសារ ePrivacy គឺជាសេចក្តីណែនាំ (Directive) មិនមែនជាបទប្បញ្ញត្តិផ្ទាល់ (Regulation) ការអនុវត្តមានភាពខុសគ្នាទៅតាមប្រទេសសមាជិក៖

| ប្រទេស (Country) | លក្ខណៈខុសប្លែកសំខាន់ (Notable Variation) |
|:--------|:-----------------|
| **អាល្លឺម៉ង់ (TTDSG)** | តឹងរ៉ឹងជាងកម្រិតអប្បបរមា — ការតាមដានទាំងអស់តម្រូវឱ្យមានការយល់ព្រម។ |
| **បារាំង (CNIL)** | អនុវត្តច្បាប់ «បដិសេធទាំងអស់» ត្រូវតែលេចធ្លោស្មើគ្នា និងផាកពិន័យធ្ងន់ធ្ងរ។ |
| **ចក្រភពអង់គ្លេស (PECR)** | ក្រោយ Brexit៖ ច្បាប់ចក្រភពអង់គ្លេសនៅតែឆ្លុះបញ្ចាំងយ៉ាងជិតស្និទ្ធតាម ePrivacy។ |
| **ហូឡង់** | ការអនុវត្តច្បាប់យ៉ាងសកម្មប្រឆាំងនឹង cookie walls (ផ្ទាំងបង្ខំឱ្យយល់ព្រម)។ |

---

<a id="7"></a>
## ៧. ទណ្ឌកម្ម និងការផាកពិន័យ (Penalties)

អនុវត្តនៅកម្រិតប្រទេសសមាជិកម្នាក់ ៗ — មានភាពប្រែប្រួលខ្លាំង៖

| ប្រទេស (Country) | ករណីអនុវត្តច្បាប់លេចធ្លោ (Notable Enforcement) |
|:--------|:-------------------|
| **បារាំង (CNIL)** | ផាកពិន័យ Google ១៥០ លានអឺរ៉ូ, Facebook ៦០ លានអឺរ៉ូ (ឆ្នាំ ២០២២) — ពាក់ព័ន្ធនឹង cookie consent។ |
| **អាល្លឺម៉ង់** | ការអនុវត្តច្បាប់យ៉ាងសកម្មដោយអាជ្ញាធររដ្ឋ។ |
| **អ៊ីតាលី (Garante)** | ការផាកពិន័យធំ ៗ ជាច្រើនសម្រាប់ការតាមដានដោយគ្មានការយល់ព្រម។ |

---

<a id="8"></a>
## ៨. អ្វីដែលត្រូវសាងសង់ (What to Build)

```
ការអនុលោមតាមច្បាប់ ePrivacy អប្បបរមា៖

□ ការសវនកម្ម Cookie — កត់ត្រា និងបែងចែកប្រភេទ cookies ទាំងអស់ (Cookie audit)
□ ប្រព័ន្ធគ្រប់គ្រងការយល់ព្រម (CMP) — ដូចជា OneTrust, Cookiebot, Usercentrics
□ ផ្ទាំងទម្រង់សុំយល់ព្រម — បង្ហាញមុនពេលដំឡើង cookies មិនចាំបាច់ (Consent banner)
✓ ប៊ូតុងយល់ព្រម និងបដិសេធមានភាពលេចធ្លោស្មើគ្នា (Accept/Reject prominence)
□ ជម្រើសយល់ព្រមដាច់ដោយឡែកតាមប្រភេទនីមួយៗ (Granular consent)
□ រក្សាទុកកំណត់ត្រានៃការយល់ព្រម — នរណា, លើអ្វី, ពេលណា (Consent records)
□ ការដកចេញវិញដោយងាយស្រួល — អាចចូលទៅកំណត់ឡើងវិញបានគ្រប់ពេល (Easy withdrawal)
□ មិនប្រើប្រាស់ consent walls (លើកលែងតែមានជម្រើសជំនួសដែលមិនរំលោភឯកជនភាព)
□ ទីផ្សារតាម Email — រក្សាទុកកំណត់ត្រាបញ្ជាក់ពីការយល់ព្រមចូលរួម (Opt-in records)
□ យន្តការឈប់ជាវ (Unsubscribe) — ដំណើរការក្នុងរយៈពេល ១០ ថ្ងៃ (Unsubscribe within 10 days)
□ បញ្ជីឈ្មោះដកចេញពីទីផ្សារ — អនុវត្តទូទាំងគ្រប់បណ្តាញទំនាក់ទំនង (Suppression list)
□ ត្រួតពិនិត្យឡើងវិញរាល់ពេលមានការបន្ថែម cookies ឬបច្ចេកវិទ្យាតាមដានថ្មី
```

---

<a id="9"></a>
## Related

- [GDPR](../data-privacy/01-gdpr.md) — បទប្បញ្ញត្តិគូកន
- [Regional: Europe Overview](../regional/07-europe-overview.md)
