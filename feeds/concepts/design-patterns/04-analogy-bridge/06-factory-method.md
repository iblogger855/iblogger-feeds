# Analogy Bridge: Factory Method (ស្ពានប្រៀបធៀបនៃ Factory Method)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #analogy-bridge #mental-mapping #design-patterns #factory-method #clean-code  
**Category:** Concepts / Analogy Bridge  
**Read Time:** ~5 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ស្ពានប្រៀបធៀប (The Analogy Bridge)](#១-ស្ពានប្រៀបធៀប-the-analogy-bridge)
- [២. តារាងដ្យាក្រាមលំហូរ (The Mapping Table)](#២-តារាងដ្យាក្រាមលំហូរ-the-mapping-table)
- [៣. ចំណុចបែកបាក់នៃការប្រៀបធៀប (Where the Analogy Breaks)](#៣-ចំណុចបែកបាក់នៃការប្រៀបធៀប-where-the-analogy-breaks)
- [៤. Related Posts](#៤-related-posts)

---

## ១. ស្ពានប្រៀបធៀប (The Analogy Bridge)

### English
* **Known Domain (Real World):** Imagine you want to send a delicate, heartfelt birthday gift to your best friend who lives across the country. You lovingly wrap it and take it to the **Post Office**. You don't need to personally buy a delivery truck, hire a driver, and navigate the stormy highways yourself. You simply hand over the box, trusting the system. Behind the scenes, the **Regional Hub (The Factory)** quietly decides the best way to care for your package—whether it needs a truck, a fast airplane, or a sturdy ship—ensuring your gift arrives safely without you ever stressing over the details.
* **Unknown Domain (Software Architecture):** In software, when a class needs a helper object to do some work, the naive approach is to use the `new` keyword to hardcode the exact class (`new Truck()`). But this tightly binds your code. If the system later needs to switch to planes or electric vehicles, you have to painfully rewrite the core logic everywhere.
* **The Bridge:** The Factory Method is like that caring **Post Office Hub**. Instead of forcing the sender to build the truck, the code simply says, "Please give me a generic Transport vehicle." A specialized Factory Subclass steps in and gently provides the perfect vehicle (Truck, Plane, or Ship) for the current situation. The core system remains clean, relaxed, and open to future changes without breaking a sweat!

### Khmer
* **ដែនដឹងស្គាល់ (ពិភពពិត):** ស្រមៃថាអ្នកចង់ផ្ញើកាដូថ្ងៃកំណើតដ៏មានអត្ថន័យចេញពីបេះដូង ទៅកាន់មិត្តសម្លាញ់ដែលរស់នៅម្ខាងទៀតនៃប្រទេស។ អ្នកវេចខ្ចប់វាយ៉ាងថ្នមៗ ហើយយកវាទៅកាន់ **ការិយាល័យប្រៃសណីយ៍**។ អ្នកមិនចាំបាច់ត្រូវទិញឡានដឹកទំនិញខ្លួនឯង ជួលអ្នកបើកបរ ឬបើកបរទម្លុះព្យុះភ្លៀងតាមផ្លូវហាយវេដោយផ្ទាល់នោះទេ។ អ្នកគ្រាន់តែប្រគល់កញ្ចប់នោះដោយក្តីទុកចិត្ត។ នៅពីក្រោយខ្នង **មណ្ឌលតំបន់ (The Factory)** នឹងសម្រេចចិត្តយ៉ាងស្ងៀមស្ងាត់នូវវិធីដ៏ល្អបំផុតក្នុងការថែរក្សាកញ្ចប់របស់អ្នក—ថាតើវាត្រូវការឡានដឹកទំនិញ យន្តហោះលឿន ឬកប៉ាល់ដ៏រឹងមាំ—ដើម្បីធានាថាកាដូរបស់អ្នកទៅដល់ដោយសុវត្ថិភាព ដោយអ្នកមិនបាច់ខ្វាយខ្វល់សូម្បីតែបន្តិច។
* **ដែនមិនស្គាល់ (ស្ថាបត្យកម្មកូដ):** នៅក្នុងកូដ នៅពេលដែល Class មួយត្រូវការ Object ជំនួយដើម្បីធ្វើការងារអ្វីមួយ វិធីសាស្ត្រធម្មតាគឺការប្រើពាក្យគន្លឹះ `new` ដើម្បីសរសេរកូដចងភ្ជាប់ Class នោះជាក់លាក់តែម្តង (`new Truck()`)។ ប៉ុន្តែនេះធ្វើឱ្យកូដរបស់អ្នកជាប់គាំង។ ប្រសិនបើថ្ងៃក្រោយប្រព័ន្ធត្រូវប្តូរទៅប្រើប្រាស់យន្តហោះ ឬឡានអគ្គិសនី អ្នកនឹងត្រូវលំបាកក្នុងការសរសេរកូដកែប្រែគ្រប់កន្លែងទាំងអស់។
* **ស្ពានតភ្ជាប់ (The Bridge):** Factory Method ប្រៀបបាននឹង **ការិយាល័យប្រៃសណីយ៍ដ៏យកចិត្តទុកដាក់** នោះអញ្ចឹង។ ជំនួសឱ្យការបង្ខំអ្នកផ្ញើឱ្យសាងសង់ឡានដឹកទំនិញ កូដគ្រាន់តែនិយាយថា «សូមផ្តល់មធ្យោបាយដឹកជញ្ជូនទូទៅមួយមកខ្ញុំមក»។ Subclass របស់ Factory ដែលមានជំនាញច្បាស់លាស់ នឹងចេញមុខមកផ្តល់មធ្យោបាយធ្វើដំណើរដ៏ល្អឥតខ្ចោះ (ឡាន យន្តហោះ ឬកប៉ាល់) សម្រាប់ស្ថានភាពជាក់ស្តែង។ ប្រព័ន្ធស្នូលនៅតែរក្សាបាននូវភាពស្អាតបាត ធូរស្រាល និងបើកចំហសម្រាប់ការផ្លាស់ប្តូរនៅថ្ងៃអនាគតដោយមិនបាច់ហត់នឿយសូម្បីតែបន្តិច!

---

## ២. តារាងដ្យាក្រាមលំហូរ (The Mapping Table)

| 🏫 Real-World Domain (សេវាប្រៃសណីយ៍) | 💻 Software Engineering Domain (Factory Method) |
| :--- | :--- |
| **Citizen (ប្រជាពលរដ្ឋ)** | **Client Code** (Uses the interface to invoke processes) |
| **Postage Delivery System (ប្រព័ន្ធប្រៃសណីយ៍)** | **Abstract Creator Class** (Defines core flow logic) |
| **Regional Hub (មណ្ឌលតំបន់)** | **Concrete Creator Subclass** (Overrides factory method) |
| **Mailbox Dropoff (ការទម្លាក់សំបុត្រ)** | **Factory Method Call** (Triggers internal creation) |
| **Trucks, Planes, Ships (ឡាន យន្តហោះ កប៉ាល់)** | **Concrete Products** (Implement abstract interface) |

---

## ៣. ចំណុចបែកបាក់នៃការប្រៀបធៀប (Where the Analogy Breaks)

### English
* **Physical Assembly:** In the physical world, trucks and planes require fuel and physical drivers. In software, objects exist purely as virtual structures inside JVM memory heap, costing almost nothing to instantiate compared to real physical hardware logistics.
* **Polymorphism Limits:** A truck cannot easily transform into a plane mid-journey. In software, because concrete products share the same interface, clients can treat them completely polymorphically, switching behaviors instantly without rebuilding any state.

### Khmer
* **ការដំឡើងរូបវន្ត៖** នៅក្នុងពិភពពិត ឡានដឹកទំនិញ និងយន្តហោះត្រូវការប្រេងឥន្ធនៈ និងអ្នកបើកបរពិតប្រាកដ។ នៅក្នុងកម្មវិធីកុំព្យូទ័រ Object គ្រាន់តែជារចនាសម្ព័ន្ធនិម្មិតនៅក្នុង JVM memory heap ប៉ុណ្ណោះ ដែលស្ទើរតែមិនចំណាយអ្វីសោះក្នុងការបង្កើត បើធៀបនឹងការដឹកជញ្ជូនរូបវន្តពិតប្រាកដ។
* **ដែនកំណត់ពហុរូបភាព (Polymorphism):** ឡានដឹកទំនិញមិនអាចបំប្លែងខ្លួនទៅជាយន្តហោះនៅពាក់កណ្តាលផ្លូវបានយ៉ាងងាយស្រួលឡើយ។ នៅក្នុងកម្មវិធីកុំព្យូទ័រ ដោយសារ concrete products ទាំងអស់ប្រើប្រាស់ interface រួមគ្នា កូនកូដអាចចាត់ទុកពួកវាជា polymorphic ទាំងស្រុង និងអាចផ្លាស់ប្តូរ behavior បានភ្លាមៗដោយមិនបាច់សង់ស្ថានភាព (state) ឡើងវិញឡើយ។

---

## ៤. Related Posts

### 🔗 Explore All Viewpoints:
* 📖 **Read the Parable:** [The CEO and the Regional Managers (នាយកប្រតិបត្តិ និងអ្នកគ្រប់គ្រងតំបន់)](../../parables/77-the-ceo-and-regional-managers.md) — The emotional core of delegating local decisions.
* 🧠 **Read the First Principles Derivation:** [MIT Professor Strategy: Factory Method (គោលការណ៍គ្រឹះដំបូងនៃ Factory Method)](../01-mit-professor/02-factory-method.md) — Derives the pattern step-by-step from base interface dependency laws.
* 👶 **Read the Feynman Simplification:** [Feynman Technique: Factory Method (ការពន្យល់ពី Factory Method ដោយគ្មានពាក្យបច្ចេកទេស)](../02-feynman-technique/06-factory-method.md) — Breaks it down using the hotel cleaner recruitment agency.
* 👦 **Read the ELI5 Metaphor:** [ELI5: Factory Method (ការពន្យល់ពី Factory Method ដូចក្មេងអាយុ ៥ ឆ្នាំ)](../03-eli5/06-factory-method.md) — Teaches a five-year-old using the magic toy machine slot.
* 🌉 **Read the Analogy Bridge:** [Analogy Bridge: Factory Method (ស្ពានប្រៀបធៀបនៃ Factory Method)](../04-analogy-bridge/06-factory-method.md) — Maps regional postal transport hubs to virtual methods, outlining physical limitations.
* 🧐 **Read the Socratic Discovery:** [Socratic Method: Factory Method (ការបង្កើត Object តាមតម្រូវការយឺតយ៉ាវតាមវិធីសាស្ត្រសូក្រាត)](../05-socratic-method/06-factory-method.md) — Socrates guides your discovery out of switch block coupling.
* 📰 **Read the Journalist Summary:** [Journalist: Factory Method (ការបំបែកកូដបង្កើត Object ឱ្យមានសេរីភាពសម្រេចចិត្តលើ Subclass)](../06-journalist-inverted-pyramid/06-factory-method.md) — High-impact news lede, OCP compliance, and SRP isolation details first.
* 🎭 **Read the Storyteller Narrative:** [Storyteller: Factory Method (វីរបុរស Factory Method និងការដោះលែងប្រព័ន្ធផ្ញើសារពីរនរក switch)](../07-storyteller-narrative-arc/06-factory-method.md) — Junior developer Dara's battle to vanquish the switch statement monster on Black Friday.
* ⚙️ **Read the Engineer Spec:** [Engineer: Factory Method (ការបំបែកកូដបង្កើត Object តាមរយៈការវាយតម្លៃតម្រូវការ និងឧបសគ្គកំណត់)](../08-engineer-requirements-constraints-solution/04-factory-method.md) — Technical requirements, ADR candidate matrix, and SLA evaluation.
* 📊 **Read the Pros & Cons:** [Pros & Cons Compared: Factory Method (ការប្រៀបធៀបគុណសម្បត្តិ និងគុណវិបត្តិនៃ Factory Method)](../09-pros-and-cons-compared/03-factory-method.md) — Full trade-off analysis and decision matrix.
* 🛠️ **Read the Code Implementation:** [Creational Patterns: The Art of Instantiation](../../../clean-code/design-patterns/01-creational-patterns.md#the-factory-method) — Production-grade Java with subclass dispatch and Open/Closed Principle.
