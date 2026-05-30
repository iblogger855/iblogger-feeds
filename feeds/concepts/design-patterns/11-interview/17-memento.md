# វគ្គសម្ភាសន៍ការងារ: Memento (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #memento #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងកំពុងសរសេរកម្មវិធី Text Editor ដែលត្រូវការមុខងារ Undo (`Ctrl+Z`)។ កូនចៅខ្ញុំបានបង្កើត Class `HistoryManager` ហើយដើម្បីអោយវាអាច Save ទិន្នន័យពី `Editor` បាន ពួកវាបានប្តូរ Field របស់ `Editor` ពី `private` ទៅជា `public` អោយគេទាញយកតាមចិត្ត! តើការធ្វើបែបនេះត្រឹមត្រូវទេ? បើមិនត្រឹមត្រូវ តើប្អូនមានដំណោះស្រាយអ្វី?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! ការប្តូរ Field ទៅជា `public` គឺបំពានគោលការណ៍ **Encapsulation (ការលាក់បាំងទិន្នន័យ)** យ៉ាងធ្ងន់ធ្ងរ! វាធ្វើអោយ Object ខាងក្រៅអាចចូលមកកែប្រែទិន្នន័យផ្តេសផ្តាសបាន។
ដើម្បីដោះស្រាយ ខ្ញុំនឹងប្រើប្រាស់ **Memento Pattern**។ ខ្ញុំអោយ `Editor` (Originator) ជាអ្នកបង្កើត "ប្រអប់រូបថត (Snapshot)" របស់ខ្លួនឯងដោយផ្ទាល់ ព្រោះវាជាម្ចាស់វាស្គាល់ Field ខ្លួនឯងច្បាស់។ ប្រអប់រូបថតនោះហៅថា `Memento`។ បន្ទាប់មក វាបញ្ជូនប្រអប់នោះទៅអោយ `HistoryManager` (Caretaker) រក្សាទុកក្នុង Stack។ `HistoryManager` មានសិទ្ធិតែទុកដាក់ប៉ុណ្ណោះ គ្មានសិទ្ធិបើកប្រអប់នោះមើលឡើយ!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អ! ចុះបើខ្ញុំជា Hacker កំហូច! ខ្ញុំលួចគាស់ប្រអប់ Memento ហ្នឹងពីក្នុង Stack រួចកែអត្ថបទខាងក្នុងពី "Hello" ទៅជា "You are hacked!"! តើពេលអ្នកប្រើប្រាស់ចុច `Ctrl+Z` (Undo) វាមិនលោតពាក្យ Hack នោះចេញមកទេអី?

**បេក្ខជន (សុខា - ញញឹមជឿជាក់):** នេះហើយជាអំណាចនៃ Memento! នៅក្នុង Java ខ្ញុំនឹងសរសេរ Memento នេះជា **Inner Class** របស់ `Editor` ហើយកំណត់ Field ទាំងអស់របស់វាទៅជា `private final`! 
មានន័យថា Memento នេះគឺ **Immutable (មិនអាចកែប្រែបាន)**។ ពេលវាត្រូវបានបង្កើតរួច គ្មានអ្នកណា (សូម្បីតែ Hacker) អាចកែទិន្នន័យក្នុងប្រអប់នោះបានឡើយ បើហ៊ានហៅ Setter Compiler នឹងគប់ Error ភ្លាម! ចំណែក `HistoryManager` ខាងក្រៅ នឹងមើលឃើញ Memento នេះត្រឹមតែជា Interface ទទេស្អាតមួយប៉ុណ្ណោះ។ សុវត្ថិភាព ១០០%!

**អ្នកសម្ភាសន៍:** ចុះបើទិន្នន័យក្នុង `Editor` មានទំហំ 1GB រាល់ពេលថតរូបម្តងៗ? បើចុច Save ៥០ដង វាមិនស៊ី RAM 50GB គាំងកុំព្យូទ័រទេអី?

**បេក្ខជន (សុខា):** ពិតមែនហើយលោកប្រធាន! នេះជាបញ្ហាធំបំផុតរបស់ Memento។ ដើម្បីសន្សំ Memory ជំនួសអោយការថតចម្លង (Deep Copy) 1GB ទាំងស្រុង ខ្ញុំនឹងប្រើបច្ចេកទេសកត់ត្រាតែ "អ្វីដែលផ្លាស់ប្តូរ (Diff ឬ Delta)" ប៉ុណ្ណោះ ដូចរបៀបដែល Git ធ្វើការងារអញ្ចឹង!

**អ្នកសម្ភាសន៍ (ទះដៃ):** អស្ចារ្យណាស់! ការប្រើប្រាស់ Inner Class សម្រាប់ Encapsulation គឺត្រឹមត្រូវឥតខ្ចោះ។

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Originator (Object ស្នូល)
public class TextEditor {
    private String content = ""; // លាក់បាំងយ៉ាងជិត (private)

    public void type(String words) { this.content += words; }
    public String getContent() { return content; }

    // ខ្លួនវាជាអ្នកបង្កើត Memento
    public Memento save() { return new EditorMemento(content); }

    // ខ្លួនវាជាអ្នក Restore ពី Memento
    public void restore(Memento memento) {
        this.content = ((EditorMemento) memento).getSavedContent();
    }

    // ២. Memento ត្រូវតែជា Inner Class ដើម្បីការពារសុវត្ថិភាពកម្រិតខ្ពស់
    private static class EditorMemento implements Memento {
        private final String savedContent; // Immutable មិនអាចកែបាន! (ការពារ Hacker)

        private EditorMemento(String content) { this.savedContent = content; }
        private String getSavedContent() { return savedContent; }
    }
}

// ៣. Memento Interface (ទទេស្អាត សម្រាប់បិទបាំងអ្នកខាងក្រៅ)
public interface Memento {
    // គ្មាន Method អ្វីទាំងអស់!
}

// ៤. Caretaker (អ្នកថែរក្សាប្រវត្តិ - មិនចេះបើកមើលប្រអប់)
public class HistoryManager {
    private Stack<Memento> history = new Stack<>();

    public void backup(Memento memento) {
        history.push(memento); // ទុកដាក់ប្រអប់ដោយមិនដឹងថាខាងក្នុងមានអី
    }

    public Memento undo() {
        if (!history.isEmpty()) return history.pop();
        return null;
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** ដឹងពីរបៀបការពារ Encapsulation តាមរយៈការប្រើ `private final` fields និង Inner Classes នៅក្នុង Java។ ដឹងពីចំណុចខ្សោយផ្នែក Memory របស់ Memento និងចេះស្នើដំណោះស្រាយ (Diff/Delta) ដូចប្រព័ន្ធ Git។
❌ **អន្ទាក់:** សួរពីការ Hack Memento ដែលបេក្ខជនបានផ្តល់ចម្លើយ Immutability យ៉ាងត្រឹមត្រូវ។
