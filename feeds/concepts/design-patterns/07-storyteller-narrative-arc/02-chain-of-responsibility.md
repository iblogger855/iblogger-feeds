# Storyteller: Chain of Responsibility (ខ្សែសង្វាក់នៃការទទួលខុសត្រូវ)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #storyteller #narrative-arc #design-patterns #chain-of-responsibility #clean-code  
**Category:** Concepts / Storyteller  
**Read Time:** ~5 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. តួអង្គ និងការតស៊ូ (Hero & Conflict)](#១-តួអង្គ-និងការតស៊ូ-hero-conflict)
- [២. ដំណោះស្រាយសង្គ្រោះស្ថានការណ៍ (The Resolution)](#២-ដំណោះស្រាយសង្គ្រោះស្ថានការណ៍-the-resolution)
- [៣. ដ្យាក្រាមលំហូរ (Visual Flowchart)](#៣-ដ្យាក្រាមលំហូរ-visual-flowchart)
- [៤. Related Posts](#៤-related-posts)

---

## ១. តួអង្គ និងការតស៊ូ (Hero & Conflict)

### English
* **The Hero:** Sophy, a senior backend engineer building an API gateway for a high-security banking system.
* **The Villain:** The "Mega-Controller" anti-pattern. Every incoming API request had to undergo raw Authentication, Rate Limiting, Input Validation, Role Check, and DB Logging.
* **The Conflict:** Sophy wrote all these validation steps directly inside the `APIController` method. The method grew to 800 lines of nested `if-else` blocks. When the business team wanted to disable Rate Limiting for VIP customers, or change the validation format, Sophy had to carefully dissect the massive controller. One minor slip-up during an emergency deployment broke the authentication system, allowing unauthenticated requests into production!

### Khmer
* **វីរបុរស៖** សុភី ជាវិស្វករប្រព័ន្ធខាងក្រោយ (Backend Engineer) ជាន់ខ្ពស់ម្នាក់ដែលកំពុងសាងសង់ API Gateway សម្រាប់ប្រព័ន្ធធនាគារដែលមានសុវត្ថិភាពខ្ពស់។
* **មេកំណាច៖** Anti-pattern «Mega-Controller»។ រាល់ API Request ដែលចូលមកត្រូវឆ្លងកាត់ការផ្ទៀងផ្ទាត់សិទ្ធិ (Auth) ការកំណត់ចំនួនស្នើសុំ (Rate Limit) ការត្រួតពិនិត្យទិន្នន័យចូល (Validation) ការឆែកតួនាទី (Role) និងការកត់ត្រាចូល DB។
* **ជម្លោះ៖** សុភីបានសរសេរជំហានត្រួតពិនិត្យទាំងអស់នេះនៅក្នុង Class `APIController` ផ្ទាល់តែម្តង។ មុខងារនេះបានរីកធំដល់ទៅ ៨០០ ជួរនៃកូដ `if-else` ត្រួតៗគ្នា។ នៅពេលក្រុមការងារចង់បិទ Rate Limiting សម្រាប់អតិថិជន VIP ឬចង់ប្តូរទម្រង់ Validation សុភីត្រូវវះកាត់ Class ដ៏ធំនោះដោយយកចិត្តទុកដាក់។ កំហុសបន្តិចបន្តួចពេលប្រញាប់ប្រញាល់ Deploy បានធ្វើឱ្យប្រព័ន្ធផ្ទៀងផ្ទាត់សិទ្ធិបាក់បែក បង្កឱ្យ Request ដែលគ្មានសិទ្ធិអាចចូលទៅកាន់ប្រព័ន្ធផលិតកម្មពិតប្រាកដ (Production) បាន!

---

## ២. ដំណោះស្រាយសង្គ្រោះស្ថានការណ៍ (The Resolution)

### English
* **The Resolution:** Sophy refactored the entire system using the **Chain of Responsibility Pattern**.
* Instead of a single mega-controller, she broke the operations into independent, decoupled **Handlers**: `AuthHandler`, `RateLimitHandler`, `ValidationHandler`, and `RoleCheckHandler`.
* Each handler has a reference to the `next` handler. It performs its specific check. If it succeeds, it passes the request to the `next` handler. If it fails, it halts the execution immediately and returns an error.
* The `APIController` now only receives 100% clean, authenticated, and validated requests. Sophy was able to dynamically reorder handlers or add new ones (like `CacheHandler`) without touching the controller! The system became unbreakable, and Sophy won the team's praise.
* **The Lesson:** Decouple request senders and receivers by giving multiple objects a chance to handle the request. Link the receiving objects in a chain.

### Khmer
* **ដំណោះស្រាយ៖** សុភីបានរៀបចំប្រព័ន្ធឡើងវិញទាំងស្រុងដោយប្រើប្រាស់ **Chain of Responsibility Pattern**។
* ជំនួសឱ្យ Mega-controller តែមួយ នាងបានបំបែកប្រតិបត្តិការទៅជា **Handlers** ឯករាជ្យដាច់ដោយឡែកពីគ្នា៖ `AuthHandler`, `RateLimitHandler`, `ValidationHandler` និង `RoleCheckHandler`។
* Handler នីមួយៗរក្សាទុក Reference ទៅកាន់ Handler `next` (បន្ទាប់)។ វាធ្វើការត្រួតពិនិត្យការងាររបស់វា។ បើជោគជ័យ វាបញ្ជូន Request ទៅកាន់ Handler បន្ទាប់។ បើបរាជ័យ វាកាត់ផ្តាច់ដំណើរការភ្លាមៗ និងហុច Error ត្រឡប់ទៅវិញ។
* ពេលនេះ `APIController` ទទួលតែ Request ណាដែលស្អាត សុវត្ថិភាព និងផ្ទៀងផ្ទាត់ជោគជ័យ ១០០% ប៉ុណ្ណោះ។ សុភីអាចដោះដូរលំដាប់លំដោយរបស់ Handler ឬបន្ថែម Handler ថ្មីៗ (ដូចជា `CacheHandler`) បានយ៉ាងងាយស្រួលដោយមិនបាច់ប៉ះពាល់ដល់ Controller ឡើយ! ប្រព័ន្ធលែងគាំង ហើយសុភីទទួលបានការកោតសរសើរយ៉ាងខ្លាំងពីក្រុមការងារ។
* **មេរៀនជាស្នូល៖** បំបែកភាពជាប់គ្នារវាងអ្នកផ្ញើសំណើ និងអ្នកទទួលសំណើ ដោយផ្តល់ឱកាសឱ្យ Object ច្រើនអាចដោះស្រាយសំណើនោះបាន។ តភ្ជាប់ Object ទទួលទាំងនោះជាខ្សែសង្វាក់។

---

## ៣. ដ្យាក្រាមលំហូរ (Visual Flowchart)

```mermaid
flowchart LR
    classDef client fill:#2c3e50,stroke:#34495e,color:#fff
    classDef handler fill:#f39c12,stroke:#d35400,color:#fff
    classDef success fill:#27ae60,stroke:#2ecc71,color:#fff

    A["👤 Request"]:::client --> B["🛡️ AuthHandler"]:::handler
    B -- "Passed" --> C["⏱️ RateLimitHandler"]:::handler
    C -- "Passed" --> D["📝 ValidationHandler"]:::handler
    D -- "Passed" --> E["✅ APIController"]:::success
```

---

## ៤. Related Posts

* 📖 **Read the Parable:** [The Customer Service Hotline (ខ្សែទូរស័ព្ទបម្រើអតិថិជន)](../../parables/87-the-customer-service-hotline.md)
* 🛠️ **Read the Code Implementation:** [Behavioral Patterns: The Dynamics of Objects](../../../clean-code/design-patterns/03-behavioral-patterns.md#the-chain-of-responsibility)
