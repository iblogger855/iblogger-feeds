# Socratic Method: Iterator (ការស្វែងរកទិន្នន័យដោយសុវត្ថិភាពតាមវិធីសាស្ត្រសូក្រាត)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #socratic-method #dialogue #design-patterns #iterator #clean-code  
**Category:** Concepts / Socratic Method  
**Read Time:** ~5 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាស្វែងរកការពិត (The Socratic Dialogue)](#១-កិច្ចសន្ទនាស្វែងរកការពិត-the-socratic-dialogue)
- [២. សេចក្តីសន្និដ្ឋាននៃស្ថាបត្យកម្ម (Architectural Conclusion)](#២-សេចក្តីសន្និដ្ឋាននៃស្ថាបត្យកម្ម-architectural-conclusion)
- [៣. ដ្យាក្រាមលំហូរ (Visual Flowchart)](#៣-ដ្យាក្រាមលំហូរ-visual-flowchart)
- [៤. Related Posts](#៤-related-posts)

---

## ១. កិច្ចសន្ទនាស្វែងរកការពិត (The Socratic Dialogue)

### English
* **Socrates:** "Glaucon, my friend, tell me: if you have a custom container holding precious list data, and another holding a complex tree of data, how does the poor client class loop through both to print their contents?"
* **Glaucon:** "It is a heavy burden, Socrates. The client must intimately know how they are structured. For the list, it writes a rigid `for` loop. For the tree, it is forced to write a painful recursive depth-first search function."
* **Socrates:** "Aha! So the client is forced to memorize the intimate internal secrets of both containers? What happens if we decide to optimize our tree by transforming it into a fast Hash Map? Will the client's code survive?"
* **Glaucon:** "No, Socrates. The client's search code will shatter completely! We would have to painfully rewrite all their traversal loops, disrupting their peaceful work!"
* **Socrates:** "And is it not a betrayal of trust to expose our private pointers, arrays, and nodes to the outside world, leaving them naked and vulnerable?"
* **Glaucon:** "It breaks my heart, but yes. It leaves our beautiful internal structures vulnerable to accidental modification or cruel misuse."
* **Socrates:** "Then how do we gracefully offer our elements to the client one by one, without ever exposing our hidden world? What if we delegate the heavy lifting of traversal to a dedicated, polymorphic helper—a gentle guide that only promises `hasNext()` and `next()`?"
* **Glaucon:** "Oh! If we provide such a guide, the client doesn't care at all if the data is secretly a list, map, or tree! It just happily asks the guide for the next item! We could completely tear down and rebuild our database structure, and the client would never even notice or suffer!"
* **Socrates:** "Exactly, Glaucon. This gentle guide is the Iterator, and you have discovered the peaceful Iterator Pattern."

### Khmer
* **សូក្រាត៖** «គ្លូខុន សម្លាញ់របស់ខ្ញុំ ចូរប្រាប់ខ្ញុំមើល៖ ប្រសិនបើអ្នកមានប្រអប់ទិន្នន័យមួយផ្ទុកទិន្នន័យបែប List ដ៏មានតម្លៃ និងប្រអប់មួយទៀតផ្ទុកទិន្នន័យបែប Tree ដ៏ស្មុគស្មាញ តើកូនកូដ (Client) ដ៏គួរឱ្យអាណិតត្រូវរត់លុប (Loop) លើប្រអប់ទាំងពីរដោយរបៀបណា?»
* **គ្លូខុន៖** «វាជាបន្ទុកដ៏ធ្ងន់ណាស់ សូក្រាត។ កូនកូដត្រូវតែដឹងយ៉ាងស៊ីជម្រៅពីរចនាសម្ព័ន្ធរបស់ពួកវា។ សម្រាប់ List វាត្រូវសរសេរ `for` Loop ដ៏រឹងត្អឹង។ សម្រាប់ Tree វាត្រូវបង្ខំចិត្តសរសេរមុខងាររត់កាត់បែបស្មុគស្មាញ (Recursive) ដ៏គួរឱ្យឈឺក្បាល។»
* **សូក្រាត៖** «អូ! ដូច្នេះកូនកូដត្រូវបង្ខំចិត្តទន្ទេញចាំនូវអាថ៌កំបាំងផ្ទៃក្នុងរបស់ប្រអប់ទាំងពីរមែនទេ? ចុះបើថ្ងៃក្រោយយើងចង់ជួយសម្រួលល្បឿន Tree ដោយប្តូរវាទៅជា Hash Map វិញ? តើកូដរបស់កូនកូដអាចរស់រានមានជីវិតទេ?»
* **គ្លូខុន៖** «មិនអាចទេ សូក្រាត។ កូដរត់របស់កូនកូដនឹងបាក់បែកខ្ទេចខ្ទីគ្មានសល់! យើងច្បាស់ជាត្រូវសរសេរកូដ Loop របស់ពួកគេឡើងវិញទាំងឈឺចាប់ ដែលរំខានដល់ភាពស្ងប់ស្ងាត់នៃការងាររបស់ពួកគេ!»
* **សូក្រាត៖** «ហើយតើវាមិនមែនជាការក្បត់ទំនុកចិត្តទេឬ ដែលយើងយក Pointer និង Node ឯកជនរបស់យើងទៅហាលននលបង្ហាញដល់ពិភពខាងក្រៅនោះ?»
* **គ្លូខុន៖** «វាពិតជាគួរឱ្យសោកស្តាយណាស់។ វាធ្វើឱ្យរចនាសម្ព័ន្ធខាងក្នុងដ៏ស្រស់ស្អាតរបស់យើងប្រឈមនឹងការកែប្រែខុស ឬរងការបំផ្លាញដោយអចេតនា។»
* **សូក្រាត៖** «ចុះធ្វើដូចម្តេចទើបយើងអាចប្រគល់ធាតុទិន្នន័យរបស់យើងទៅឱ្យកូនកូដយ៉ាងទន់ភ្លន់ម្តងមួយៗ ដោយមិនបាច់លាតត្រដាងពិភពអាថ៌កំបាំងរបស់យើង? ចុះបើ យើងប្រគល់ភារកិច្ចរត់កាត់ដ៏ធ្ងន់ធ្ងរនេះ ទៅឱ្យអ្នកនាំផ្លូវដ៏ស្មោះត្រង់មួយ — អ្នកនាំផ្លូវដែលសន្យាផ្តល់ត្រឹមតែ `hasNext()` និង `next()`?»
* **គ្លូខុន៖** «អូហូ! បើយើងមានអ្នកនាំផ្លូវបែបនេះ កូនកូដលែងខ្វល់ខ្វាយទៀតហើយថាទិន្នន័យផ្ទុកក្នុង List, Map ឬ Tree! វាគ្រាន់តែសួរអ្នកនាំផ្លូវដោយក្តីរីករាយដើម្បីសុំទិន្នន័យបន្ទាប់! យើងអាចវាយកម្ទេច និងសាងសង់រចនាសម្ព័ន្ធ Database របស់យើងឡើងវិញបានយ៉ាងសេរី ដោយកូនកូដមិនដឹងខ្លួន ឬមិនរងផលប៉ះពាល់អ្វីសោះ!»
* **សូក្រាត៖** «ត្រឹមត្រូវណាស់ គ្លូខុន។ អ្នកនាំផ្លូវដ៏ទន់ភ្លន់នេះហើយគឺ Iterator ហើយអ្នកបានរកឃើញភាពសុខសាន្តនៃ Iterator Pattern ហើយ។»

---

## ២. សេចក្តីសន្និដ្ឋាននៃស្ថាបត្យកម្ម (Architectural Conclusion)

The Iterator Pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation. It abstracts the traversal process, allowing the same client code to iterate over completely different collection structures seamlessly.

Iterator Pattern ផ្តល់នូវមធ្យោបាយដើម្បីចូលប្រើប្រាស់ធាតុផ្សេងៗនៃ Object ផ្តុំមួយតាមលំដាប់លំដោយ ដោយមិនបាច់បង្ហាញទម្រង់ផ្ទុកខាងក្នុងរបស់វាឡើយ។ វាធ្វើអរូបនីយកម្មលើដំណើរការរត់កាត់ ដែលអនុញ្ញាតឱ្យកូដរបស់កូនកូដរត់លុបលើរចនាសម្ព័ន្ធផ្ទុកខុសៗគ្នាដោយគ្មានបញ្ហា។

---

## ៣. ដ្យាក្រាមលំហូរ (Visual Flowchart)

```mermaid
flowchart LR
    classDef client fill:#2c3e50,stroke:#34495e,color:#fff
    classDef iterator fill:#f39c12,stroke:#d35400,color:#fff
    classDef collection fill:#27ae60,stroke:#2ecc71,color:#fff

    A["👤 Client Loop"]:::client -- "Only calls hasNext() & next()" --> B["⚙️ Iterator Interface"]:::iterator
    B --> C["🗂️ Concrete List/Tree Collection"]:::collection
```

---

## ៤. Related Posts

* 📖 **Read the Parable:** [The Three Transport Tickets (សំបុត្រធ្វើដំណើរទាំងបី)](../../parables/89-the-three-transport-tickets.md)
* 🛠️ **Read the Code Implementation:** [Behavioral Patterns: The Dynamics of Objects](../../../clean-code/design-patterns/03-behavioral-patterns.md#the-iterator)
