# Engineer: Factory Method (ការបំបែកកូដបង្កើត Object តាមរយៈការវាយតម្លៃតម្រូវការ និងឧបសគ្គកំណត់)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #engineer #requirements #constraints #adr #design-patterns #factory-method #clean-code  
**Category:** Concepts / Engineer Strategy  
**Read Time:** ~6 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. របាយការណ៍ស្ថាបត្យកម្មប្រព័ន្ធ (System Requirements & Constraints)](#១-របាយការណ៍ស្ថាបត្យកម្មប្រព័ន្ធ-system-requirements-constraints)
- [២. ការវាយតម្លៃបេក្ខភាពដំណោះស្រាយ (Candidate Evaluation Matrix)](#២-ការវាយតម្លៃបេក្ខភាពដំណោះស្រាយ-candidate-evaluation-matrix)
- [៣. ដំណោះស្រាយដែលបានជ្រើសរើស និងការបញ្ជាក់ហេតុផល (Chosen Solution & Rationale)](#៣-ដំណោះស្រាយដែលបានជ្រើសរើស-និងការបញ្ជាក់ហេតុផល-chosen-solution-rationale)
- [៤. Related Posts](#៤-related-posts)

---

## ១. របាយការណ៍ស្ថាបត្យកម្មប្រព័ន្ធ (System Requirements & Constraints)

### Architectural Requirements (តម្រូវការស្ថាបត្យកម្មប្រព័ន្ធ)
1. **Runtime Interchangeability (លទ្ធភាពផ្លាស់ប្តូរពេលដំណើរការ):** The client code must request and consume products without knowing their specific concrete classes.
2. **Strict Open-Closed Principle Compliance (ការគោរពតាមគោលការណ៍ Open-Closed យ៉ាងតឹងរ៉ឹង):** Adding a new product variant must NOT require modifications to existing, tested creation pathways.
3. **Encapsulated Construction (ការខ្ចប់ដំណើរការបង្កើតកូដ):** Complex object instantiation parameters must be hidden from the caller class to avoid stack contamination and dependency leakage.

### Engineering Constraints (ឧបសគ្គកំណត់ផ្នែកវិស្វកម្ម)
* **Zero Performance Overhead (មិនមានការថយចុះល្បឿន):** Swapping object creation mechanisms must operate in $O(1)$ constant time with minimal memory allocation profiles.
* **Typing Rigor (ភាពត្រឹមត្រូវនៃប្រភេទកូដ):** The system must guarantee type-safety at compile-time, completely avoiding unsafe runtime downcasts.

---

## ២. ការវាយតម្លៃបេក្ខភាពដំណោះស្រាយ (Candidate Evaluation Matrix)

We evaluate three potential architectural candidates to solve the polymorphic creation problem:

យើងវាយតម្លៃបេក្ខភាពស្ថាបត្យកម្មដែលអាចកើតមានចំនួនបី ដើម្បីដោះស្រាយបញ្ហានៃការបង្កើត Object បែបពហុរូបភាព (polymorphic creation)៖

| Candidate / Abstraction | Compliance with OCP | Coupling Level | Complexity & Boilerplate | Compile-time Safety |
| :--- | :--- | :--- | :--- | :--- |
| **Candidate 1: Direct Instantiation (if/else `new` blocks)** | ❌ **Failed:** Violates OCP completely; every new product type forces modifications to the client class. | 🔴 High coupling | 🟢 Minimal (easy to write) | 🟢 Guaranteed |
| **Candidate 2: Static Parameterized Factory (Helper switch)** | ❌ **Failed:** Partially decoupled, but adding new products still requires modifying the static switch logic. | 🟡 Medium coupling | 🟢 Low complexity | 🟢 Guaranteed |
| **Candidate 3: Factory Method (Virtual Abstract Creator)** | **✅ Passed:** 100% compliant with OCP. Subclasses handle creation independently without modifying base creators. | **🟢 Decoupled** | 🟡 Higher boilerplate due to subclass count | 🟢 Guaranteed |

---

## ៣. ដំណោះស្រាយដែលបានជ្រើសរើស និងការបញ្ជាក់ហេតុផល (Chosen Solution & Rationale)

### English
**Candidate 3 (Factory Method)** is selected as the primary architectural standard. By replacing parameterized static switches with dynamic, polymorphic factory methods, the base creator class is completely isolated from concrete product libraries. 

When a new product type is requested, developer teams only need to write a new subclass that implements the factory method. The core system remains entirely untouched, guaranteeing zero blast-radius when introducing new business features. Performance analysis confirms $O(1)$ instantiation time with negligible heap allocation overhead, meeting all runtime SLA thresholds.

### Khmer
**បេក្ខភាពទី ៣ (Factory Method)** ត្រូវបានជ្រើសរើសជាស្តង់ដារស្ថាបត្យកម្មចម្បង។ តាមរយៈការជំនួស static switches ធម្មតា ទៅជា factory methods ដែលមានលក្ខណៈ dynamic និង polymorphic នោះ Base Creator Class ត្រូវបានបំបែកដាច់ចេញពី concrete product libraries ទាំងស្រុង។

នៅពេលមានតម្រូវការផលិតផលថ្មី ក្រុមការងារអភិវឌ្ឍន៍គ្រាន់តែសរសេរ subclass ថ្មីមួយដែលអនុវត្តតាម (implement) factory method ប៉ុណ្ណោះ។ ប្រព័ន្ធស្នូលនៅតែរក្សាដដែលដោយគ្មានការប៉ះពាល់ ដែលធានាថាមិនមានផលប៉ះពាល់ដល់មុខងារចាស់ៗនៅពេលណែនាំមុខងារថ្មីៗ។ ការវិភាគលើផ្នែកល្បឿនបញ្ជាក់ថា ការបង្កើត Object ដំណើរការក្នុងកម្រិតល្បឿនថេរ $O(1)$ ជាមួយនឹងបន្ទុកប្រើប្រាស់មេម៉ូរីទាបបំផុត ដោយឆ្លងកាត់រាល់លក្ខខណ្ឌកំណត់ SLA ទាំងអស់។

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
