# Engineer: Builder (ការបង្កើត Object ស្មុគស្មាញជាជំហានៗ)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #engineer #requirements-constraints #design-patterns #builder #clean-code  
**Category:** Concepts / The Engineer  
**Read Time:** ~5 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. តម្រូវការបច្ចេកទេស (Requirements)](#១-តម្រូវការបច្ចេកទេស-requirements)
- [២. ឧបសគ្គកំណត់ (Constraints)](#២-ឧបសគ្គកំណត់-constraints)
- [៣. ជម្រើសដោះស្រាយ និងការលុបចោល (Candidates & Elimination)](#៣-ជម្រើសដោះស្រាយ-និងការលុបចោល-candidates-elimination)
- [៤. ដំណោះស្រាយដែលបានជ្រើសរើស (Chosen Solution)](#៤-ដំណោះស្រាយដែលបានជ្រើសរើស-chosen-solution)
- [៥. ដ្យាក្រាមលំហូរ (Visual Flowchart)](#៥-ដ្យាក្រាមលំហូរ-visual-flowchart)
- [៦. Related Posts](#៦-related-posts)

---

## ១. តម្រូវការបច្ចេកទេស (Requirements)

We need to construct a highly complex object (e.g., an HTTP Request client, or a custom Invoice document) containing dozens of optional parameters and configurations. The constructed object must be **immutable** (to ensure absolute thread safety) and must never exist in an **incomplete or invalid state** during construction.

យើងត្រូវបង្កើត Object ដែលមានភាពស្មុគស្មាញខ្លាំង (ដូចជា HTTP Request Client ឬវិក្កយបត្រ Invoice ផ្ទាល់ខ្លួន) ដែលមានប៉ារ៉ាម៉ែត្រ និងការកំណត់ជាច្រើនផ្សេងទៀត។ Object ដែលបានបង្កើតឡើងត្រូវតែជាប្រភេទ **ថេរ (Immutable - មិនអាចកែប្រែបាន)** ដើម្បីធានាសុវត្ថិភាពខ្ពស់នៃខ្សែស្រឡាយការងារ (Thread safety) ហើយមិនត្រូវស្ថិតក្នុង **ស្ថានភាពមិនពេញលេញ ឬមិនត្រឹមត្រូវ** ណាមួយឡើយក្នុងកំឡុងពេលបង្កើត។

---

## ២. ឧបសគ្គកំណត់ (Constraints)

1. **Anti-Telescoping:** We must avoid having dozens of overloaded constructors (telescopic constructors), which make code unreadable and error-prone.
2. **Compile-time Safety:** We must prevent passing generic maps/arrays of values, which bypass static compiler check-ups.
3. **No Partial Read:** The object must not be accessible by other threads until the entire construction process is 100% complete.

---

## ៣. ជម្រើសដោះស្រាយ និងការលុបចោល (Candidates & Elimination)

| Candidate Solution | Requirements Met? | Constraints Met? | Status / Elimination Reason |
| :--- | :--- | :--- | :--- |
| **1. Telescopic Constructors** | Yes (Immutable) | No (Violates Anti-Telescoping; completely unreadable) | **❌ Eliminated** |
| **2. Java Beans (Setters)** | No (Allows incomplete states; object is highly mutable) | Yes (Readable) | **❌ Eliminated** |
| **3. Generic Maps** | Yes | No (Throws away compile-time type safety) | **❌ Eliminated** |
| **4. Builder Pattern** | **Yes (Immutable, Thread-safe)** | **Yes (Compile-time safe, elegant chaining)** | **✅ Selected** |

---

## ៤. ដំណោះស្រាយដែលបានជ្រើសរើស (Chosen Solution)

The **Builder Pattern** is the only logical solution. It isolates the construction code from the product. 
* We create a nested static `Builder` class.
* We configure optional fields step-by-step using method chaining (e.g., `.header()`, `.timeout()`).
* The product remains private and immutable. Only when `.build()` is called does the Builder validate constraints and return the fully constructed product.

### ដំណោះស្រាយបែបវិស្វករ (Khmer)
**Builder Pattern** គឺជាដំណោះស្រាយតក្កវិជ្ជាតែមួយគត់ដែលសាកសម។ វាបំបែកកូដបង្កើតចេញពីផលិតផល។
* យើងបង្កើត Class ឋិតិវន្តរួម `Builder` មួយនៅខាងក្នុង Class ដើម។
* យើងកំណត់ប៉ារ៉ាម៉ែត្រជាជំហានៗតាមរយៈការតភ្ជាប់មុខងារ (Method chaining ដូចជា `.header()`, `.timeout()`)។
* ផលិតផលស្នូលនៅតែជា `private` និងមិនអាចកែប្រែបាន (Immutable)។ លុះត្រាតែហៅ `.build()` ទើប Builder ផ្ទៀងផ្ទាត់លក្ខខណ្ឌទាំងអស់ រួចប្រគល់ផលិតផលដែលបានបង្កើតរួចរាល់ ១០០% មកវិញ។

---

## ៥. ដ្យាក្រាមលំហូរ (Visual Flowchart)

```mermaid
flowchart LR
    classDef builder fill:#2c3e50,stroke:#34495e,color:#fff
    classDef result fill:#27ae60,stroke:#2ecc71,color:#fff

    A["⚙️ HttpRequest.Builder"]:::builder -- "1. .url()" --> B["⚙️ Builder (with URL)"]:::builder
    B -- "2. .timeout()" --> C["⚙️ Builder (with Timeout)"]:::builder
    C -- "3. .build() triggers validation" --> D["🔒 Immutable HttpRequest"]:::result
```

---

## ៦. Related Posts

### 🔗 Explore All Viewpoints:
* 📖 **Read the Parable:** [The 47-Question Waiter (អ្នករត់តុសួរ ៤៧ សំណួរ)](../../parables/76-the-overwhelmed-sandwich-shop.md) — The emotional story of a chaotic customer experience.
* 🧠 **Read the First Principles Derivation:** [MIT Professor Strategy: Builder (គោលការណ៍គ្រឹះដំបូងនៃ Builder)](../01-mit-professor/04-builder.md) — Derives the pattern from stack frame layouts and thread safety laws.
* 👶 **Read the Feynman Simplification:** [Feynman Technique: Builder (ការពន្យល់ពី Builder ដោយគ្មានពាក្យបច្ចេកទេស)](../02-feynman-technique/05-builder.md) — Breaks it down using a simple cafe menu checklist.
* 👦 **Read the ELI5 Metaphor:** [ELI5: Builder (ការពន្យល់ពី Builder ដូចក្មេងអាយុ ៥ ឆ្នាំ)](../03-eli5/05-builder.md) — Teaches a five-year-old using Lego spaceship construction books.
* 🌉 **Read the Analogy Bridge:** [Analogy Bridge: Builder (ស្ពានប្រៀបធៀបនៃ Builder)](../04-analogy-bridge/05-builder.md) — Maps real sandwich ticks to fluent Java methods, outlining physical limitations.
* 🧐 **Read the Socratic Discovery:** [Socratic Method: Builder (ការបង្កើត Object ស្មុគស្មាញតាមវិធីសាស្ត្រសូក្រាត)](../05-socratic-method/05-builder.md) — Probes yourself via a mentor-student constructor debate.
* 📰 **Read the Journalist Summary:** [Journalist: Builder (ការបង្កើត Object ស្មុគស្មាញជាជំហានៗ)](../06-journalist-inverted-pyramid/05-builder.md) — Quick news lede, telescoping prevention, and step-by-step assembly validation.
* 🎭 **Read the Storyteller Narrative:** [Storyteller: Builder (វីរបុរស Builder និងសង្គ្រាមប៉ារ៉ាម៉ែត្ររញ៉េរញ៉ៃ)](../07-storyteller-narrative-arc/05-builder.md) — Sopheap's battle against a production parameter bomb catastrophe on Black Friday.
* ⚙️ **Read the Engineer Spec:** [Engineer: Builder (ការបង្កើត Object ស្មុគស្មាញជាជំហានៗ)](../08-engineer-requirements-constraints-solution/01-builder.md) — Read the formal engineering requirements and candidate evaluation table.
* 📊 **Read the Pros & Cons:** [Pros & Cons Compared: Builder (ការប្រៀបធៀបគុណសម្បត្តិ និងគុណវិបត្តិនៃ Builder)](../09-pros-and-cons-compared/02-builder.md) — Full trade-off analysis and decision matrix.
* 🛠️ **Read the Code Implementation:** [Creational Patterns: The Art of Instantiation](../../../clean-code/design-patterns/01-creational-patterns.md#the-builder) — Production-grade Java with fluent chaining and immutable object construction.
