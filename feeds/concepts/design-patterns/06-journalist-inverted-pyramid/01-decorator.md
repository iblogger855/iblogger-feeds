# Journalist: Decorator (ការបន្ថែមលក្ខណៈពិសេសលើ Object ដោយមិនប៉ះពាល់កូដចាស់)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #journalist #inverted-pyramid #design-patterns #decorator #clean-code  
**Category:** Concepts / Journalist  
**Read Time:** ~5 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. សេចក្តីសង្ខេបព្រឹត្តិការណ៍ (The Lede)](#១-សេចក្តីសង្ខេបព្រឹត្តិការណ៍-the-lede)
- [២. ព័ត៌មានលម្អិតស្នូល (Core Details)](#២-ព័ត៌មានលម្អិតស្នូល-core-details)
- [៣. ដ្យាក្រាមលំហូរ (Visual Flowchart)](#៣-ដ្យាក្រាមលំហូរ-visual-flowchart)
- [៤. Related Posts](#៤-related-posts)

---

## ១. សេចក្តីសង្ខេបព្រឹត្តិការណ៍ (The Lede)

### English
The **Decorator Pattern** allows developers to dynamically attach new behaviors and responsibilities to an individual object at runtime, without modifying the underlying class structure or using static, brittle subclass inheritance.

### Khmer
**Decorator Pattern** អនុញ្ញាតឱ្យអ្នកអភិវឌ្ឍន៍កម្មវិធីបន្ថែមឥរិយាបថ និងការទទួលខុសត្រូវថ្មីៗទៅកាន់ Object នីមួយៗដោយស្វ័យប្រវត្តិនៅពេលដំណើរការ (Runtime) ដោយមិនចាំបាច់កែប្រែរចនាសម្ព័ន្ធ Class ស្នូល ឬប្រើប្រាស់ការទទួលមរតកកូដ (Subclass Inheritance) ដែលរឹងកំព្រឹង និងងាយបាក់បែកឡើយ។

---

## ២. ព័ត៌មានលម្អិតស្នូល (Core Details)

### English
* **The Mechanism:** Instead of subclassing (e.g., creating `MilkCoffee`, `SugarCoffee`, `MilkSugarCoffee`), we wrap the core object in a decorator object. Both the core object and the decorator implement the same interface.
* **Double Wrapping:** A decorator contains a reference to the wrapped object and delegates calls to it, adding its own custom behavior before or after the delegation (e.g., adding milk, then adding sugar dynamically).
* **The Benefit:** It prevents "class explosion" by transforming an $O(2^N)$ inheritance problem into a flexible, dynamic runtime nesting process.

### Khmer
* **យន្តការការងារ៖** ជំនួសឱ្យការបង្កើត Subclass (ដូចជា `MilkCoffee`, `SugarCoffee`, `MilkSugarCoffee`) យើងខ្ចប់ Object ស្នូលទៅក្នុង Object Decorator មួយ។ ទាំង Object ស្នូល និង Decorator សុទ្ធតែអនុវត្តតាម Interface តែមួយ។
* **ការខ្ចប់ពីរជាន់៖** Decorator រក្សាទុក Reference ទៅកាន់ Object ដែលវាខ្ចប់ និងបញ្ជូនការងារទៅឱ្យវា ដោយបន្ថែមឥរិយាបថផ្ទាល់ខ្លួនមុន ឬក្រោយការបញ្ជូននោះ (ដូចជាការបន្ថែមទឹកដោះគោ រួចបន្ថែមស្ករដោយស្វ័យប្រវត្តិ)។
* **អត្ថប្រយោជន៍៖** វាការពារកុំឱ្យមានការកើនឡើងហួសប្រមាណនៃ Class (Class Explosion) ដោយបំប្លែងបញ្ហាមរតកកូដលំដាប់ $O(2^N)$ ឱ្យទៅជាដំណើរការខ្ចប់ជាជាន់ៗដ៏បត់បែននៅពេលដំណើរការ។

---

## ៣. ដ្យាក្រាមលំហូរ (Visual Flowchart)

```mermaid
flowchart LR
    classDef core fill:#2c3e50,stroke:#34495e,color:#fff
    classDef decorator fill:#f39c12,stroke:#d35400,color:#fff

    A["☕ Plain Coffee (Core)"]:::core --> B["🥛 MilkDecorator (Wrapper 1)"]:::decorator
    B --> C["🍬 SugarDecorator (Wrapper 2)"]:::decorator
    C --> D["💰 Final Output: Sweet<br/>Milk Coffee"]:::core
```

---

## ៤. Related Posts

* 📖 **Read the Parable:** [The Naked Coffee and the Add-ons (កាហ្វេខ្មៅ និងគ្រឿងបន្ថែម)](../../parables/81-the-naked-coffee.md)
* 🛠️ **Read the Code Implementation:** [Structural Patterns: The Architecture of Objects](../../../clean-code/design-patterns/02-structural-patterns.md#the-decorator)
