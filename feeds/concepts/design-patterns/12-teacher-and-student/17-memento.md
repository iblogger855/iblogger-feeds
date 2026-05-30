# វគ្គគ្រូនិងសិស្ស: Memento (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #memento #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(ម៉ោងរៀនសរសេរកម្មវិធី Editor អាម៉ាប់កំពុងកែកូដ ស្រាប់តែប្តូរពាក្យ `private String content` ទៅជា `public String content` လោកគ្រូយក្សស្ទុះមកទាញកាស)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងប្តូរទិន្នន័យសំខាន់ទៅជា `public` អោយអ្នកណាចូលមកកែតាមចិត្តហ្នឹង? ហែងបំពានច្បាប់ Encapsulation ហើយវើយ!

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំចង់ធ្វើមុខងារ `Ctrl+Z` (Undo)! បើខ្ញុំមិនដាក់វាជា `public` តើអោយ Class `HistoryManager` ទាញយកទិន្នន័យពី Editor ទៅ Save ទុកយ៉ាងម៉េច?

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! គេមិនដែលហែកទ្រូងអោយគេមើលពោះវៀនដើម្បី Save ទុកទេ! គេត្រូវប្រើ **Memento Pattern**! ហែងត្រូវអោយ Editor ខ្លួនឯងហ្នឹង ជាអ្នក "ថតរូបខ្លួនឯង" (Snapshot)! រូបថតនោះគេហៅថា `Memento`!
ថតរួច វាខ្ចប់ដាក់ប្រអប់បិទជិត ហុចអោយ `HistoryManager`! `HistoryManager` គ្រាន់តែអ្នកយាមប្រអប់ទេ អត់មានសិទ្ធិបើកមើល ឬកែប្រែប្រអប់នោះឡើយ!

**អាម៉ាប់ (សើចកក្អិក):** អូហូ! ខ្ចប់ប្រអប់បិទជិតមែន? ចុះបើខ្ញុំលួចគាស់ប្រអប់ Memento ហ្នឹង... ហើយលុបទិន្នន័យចោលខ្លះ ឬគូររូបខ្មោចលងដាក់បញ្ចូល... តើពេលគេចុច `Ctrl+Z` តើវានឹងលោតចេញរូបខ្មោចមកបន្លាចគេអត់គ្រូ?

**លោកគ្រូយក្ស (សម្លក់):** បើហែងគាស់ប្រអប់នោះបានមែន ពេលចុច `Ctrl+Z` វាប្រាកដជាចេញរូបខ្មោចពិតមែន! ប៉ុន្តែនៅក្នុងកូដជើងចាស់ គេសរសេរ Memento ហ្នឹងជា Inner Class ហើយគេដាក់អថេរទាំងអស់ជា `final` វើយ!
មានន័យថាវា "កកថ្ម (Immutable)" ពេលហែងថតរូបហើយ ហែងកែអត់បានទេ! បើហែងហ៊ានវាយពាក្យ `memento.setContent("រូបខ្មោច")` កុំព្យូទ័រវានឹង Error បោកក្បាលហែងអោយបែកឥឡូវហ្នឹង! ដូច្នេះទិន្នន័យមានសុវត្ថិភាព ១០០%!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. Originator (អ្នកដែលអាចថតរូបខ្លួនឯងបាន)
class Editor {
    private String content; // លាក់បាំងយ៉ាងអាថ៌កំបាំង (private)

    public void type(String words) { this.content += words; }
    public String getContent() { return content; }

    // បង្កើតរូបថត (Memento) 
    public Memento save() { return new Snapshot(content); }

    // ស្តារអតីតកាល (Undo)
    public void restore(Memento memento) {
        this.content = ((Snapshot) memento).getSavedContent();
    }

    // ២. Memento ជា Inner Class (ការពារការគាស់កកាយរបស់អាម៉ាប់)
    private static class Snapshot implements Memento {
        private final String savedContent; // Immutable! កកថ្ម! កែអត់បាន!

        public Snapshot(String content) { this.savedContent = content; }
        private String getSavedContent() { return savedContent; }
    }
}

// ៣. Memento Interface (ទទេស្អាត អោយអ្នកក្រៅកាន់ តែបើកមើលអត់បាន)
interface Memento {}

// ៤. Caretaker (អ្នកទុកដាក់ប្រអប់ មិនចេះបើកមើល)
class HistoryManager {
    private Stack<Memento> history = new Stack<>();
    
    public void backup(Memento m) { history.push(m); }
    public Memento undo() { return history.isEmpty() ? null : history.pop(); }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅសរសេរពាក្យ `private final` ចំនួន ១០០ដង ដើម្បីចងចាំថាទិន្នន័យ History ហាមកែប្រែផ្តេសផ្តាស!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការចង់រក្សាទុកស្ថានភាព (State) របស់ Object មួយដើម្បីធ្វើការ Undo ច្រើនតែទាមទារអោយបំបែក Encapsulation (ប្តូរវាទៅជា Public) ដែលនាំអោយបាត់បង់សុវត្ថិភាព។
- **ដំណោះស្រាយ:** អនុញ្ញាតអោយ Object ស្នូលនោះ ជាអ្នកបង្កើត Snapshot នៃខ្លួនវាដោយផ្ទាល់ (ហៅថា Memento) ដែល Object ខាងក្រៅអាចយកទៅរក្សាទុកបាន តែមិនអាចបើកមើល ឬកែប្រែវាបានឡើយ។
