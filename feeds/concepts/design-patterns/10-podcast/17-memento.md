# Podcast: Memento (កិច្ចសន្ទនា Podcast ជុំវិញ Memento)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #memento #behavioral #clean-code  
**Category:** Concepts / Podcast  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនា (Podcast Transcript)](#១-កិច្ចសន្ទនា-podcast-transcript)
- [២. ការបកប្រែទៅជាកូដ (Translating to Code)](#២-ការបកប្រែទៅជាកូដ-translating-to-code)
- [៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)](#៣-គុណសម្បត្តិ-និងគុណវិបត្តិ-pros-cons)
- [៤. ចំណុចសំខាន់ៗ (Key Takeaways)](#៤-ចំណុចសំខាន់ៗ-key-takeaways)

---

## ១. កិច្ចសន្ទនា (Podcast Transcript)

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងពិភាក្សាអំពីមុខងារ Undo (`Ctrl+Z`) ដែលគ្រប់គ្នាស្រលាញ់។ ការថតចម្លង (Snapshot) ទិន្នន័យដើម្បីធ្វើ Undo ច្រើនតែបំពានគោលការណ៍ Encapsulation ព្រោះយើងបង្ខំឱ្យ Object បើក Public Fields។ ដូច្នេះយើងត្រូវការ **Memento Pattern**។

**Host B (បូរិទ្ធ - អ្នករៀន):** អូ! Memento គឺជា "រូបថតអនុស្សាវរីយ៍" មែនទេបង? អ្នកណាជាអ្នកថត?

**Host A (សិទ្ធិ):** មានតែ Object ស្នូល (Originator) ប៉ុណ្ណោះដែលជាអ្នកបង្កើត Memento ព្រោះវាជាម្ចាស់ទិន្នន័យ។ វាផ្តិតយករូបភាពផ្ទៃក្នុងរបស់វា រួចវេចខ្ចប់ក្នុងប្រអប់ Memento បិទជិតមួយ ហើយហុចមកឱ្យ History Manager (Caretaker) រក្សាទុកក្នុង History Stack។ Caretaker អត់អាចបើកមើល ឬកែប្រែអ្វីដែលនៅខាងក្នុងប្រអប់នោះបានឡើយ។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើខ្ញុំជា Hacker ហើយខ្ញុំ... លួចគាស់បើកប្រអប់ Memento ហ្នឹង ហើយលុបទិន្នន័យចោលខ្លះ ឬគូររូបខ្មោចលងដាក់បញ្ចូល... តើពេល Client ចុច Ctrl+Z តើវានឹងលោតចេញរូបខ្មោចមកអត់បង?

**Host A (សិទ្ធិ):** ហាហា... បើលោកឯងគាស់ប្រអប់នោះបានមែន ពេលចុច Ctrl+Z វាប្រាកដជាចេញរូបខ្មោចហើយ! ប៉ុន្តែនៅក្នុង Memento Pattern ដ៏ត្រឹមត្រូវ យើងសរសេរកូដមិនឱ្យនរណាម្នាក់គាស់ប្រអប់នោះបានឡើយ (Immutability)! 
នៅក្នុង Java គេតែងតែធ្វើឱ្យ Memento ក្លាយជា Inner Class របស់ Originator ហើយកំណត់ Field ទាំងអស់ឱ្យទៅជា `private final`។ ចំណែក Caretaker ខាងក្រៅ មើលឃើញត្រឹមតែ Interface ទទេស្អាតមួយប៉ុណ្ណោះ។ បើលោកឯងព្យាយាម `memento.setContent("ghost")` នោះ Compiler នឹងគប់ Error បែកក្បាលលោកឯងមិនខាន! ដូច្នេះទិន្នន័យត្រូវបានការពារយ៉ាងសុវត្ថិភាព។

**Host B (បូរិទ្ធ):** ហាហា ការពារបានល្អណាស់! ធ្វើបែបនេះ Originator នៅតែការពារទិន្នន័យ Private របស់ខ្លួនបានដដែល (Encapsulation) ចំណែកខាង Caretaker ក៏មិនបាច់ខ្វល់ពីភាពស្មុគស្មាញនៃទិន្នន័យនោះដែរ វាគ្រាន់តែជាអ្នកទុកដាក់ប្រអប់ប៉ុណ្ណោះ។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Memento (ប្រអប់រូបថត ដែលមិនអនុញ្ញាតឱ្យកែប្រែបាន - Immutable)
public class EditorMemento {
    private final String content; // ការពារមិនឱ្យបូរិទ្ធគូររូបខ្មោចបាន

    public EditorMemento(String content) {
        this.content = content;
    }
    
    // កំណត់ត្រឹម Package-private ឬប្រើ Inner Class ទើបមានសុវត្ថិភាពបំផុត
    String getSavedContent() { return content; }
}

// ២. Originator (Object ស្នូល ដែលដឹងពីរបៀបផ្តិតរូបខ្លួនឯង)
public class TextEditor {
    private String content = "";

    public void type(String words) { this.content += words; }
    public String getContent() { return content; }

    public EditorMemento save() {
        return new EditorMemento(content);
    }

    public void restore(EditorMemento memento) {
        this.content = memento.getSavedContent();
    }
}

// ៣. Caretaker (អ្នកថែរក្សាប្រវត្តិ - មិនចេះបើកមើលប្រអប់)
public class History {
    private Stack<EditorMemento> history = new Stack<>();

    public void backup(EditorMemento memento) {
        history.push(memento);
    }

    public EditorMemento undo() {
        if (!history.isEmpty()) return history.pop();
        return null;
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Encapsulation Maintained:** ថតចម្លង Object ដោយមិនចាំបាច់បើកបង្ហាញទិន្នន័យ Private របស់វា។
- **Simplifies Originator:** ប្រគល់ភារកិច្ចគ្រប់គ្រង History ទៅឱ្យ Caretaker។

**គុណវិបត្តិ (Cons):**
- **Memory Consumption:** ប្រសិនបើ State របស់ Object ធំ ការរក្សាទុក Memento ច្រើននឹងស៊ី Memory យ៉ាងខ្លាំង។ 

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការរក្សាទុកស្ថានភាពចាស់របស់ Object សម្រាប់ធ្វើ Undo អាចតម្រូវឱ្យទម្លាយទិន្នន័យ Private។
- **ដំណោះស្រាយ:** អនុញ្ញាតឱ្យ Object ស្នូល (Originator) ជាអ្នកបង្កើត និង Restore Snapshot (Memento) ដោយខ្លួនឯង។ Object ខាងក្រៅ (Caretaker) គ្រាន់តែជួយរក្សាទុក។
