# Podcast: Composite (កិច្ចសន្ទនា Podcast ជុំវិញ Composite)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #composite #structural #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ថ្ងៃនេះយើងពិភាក្សាអំពី **Composite Pattern** សម្រាប់រចនាសម្ព័ន្ធបែបមែកធាង (Tree Structure)។ ធ្លាប់គិតទំហំ (Size) នៃ Folder ដែលមាន File តូចៗ និង Folder កូនៗតៗគ្នាច្រើនជាន់ទេ?

**Host B (បូរិទ្ធ - អ្នករៀន):** បាទ! បើខ្ញុំសរសេរកូដ ខ្ញុំច្បាស់ជាត្រូវឆែកមើល `if (isFolder)` រួចប្រើ Loop ចូលទៅក្នុង... បើវាជា Folder ទៀត ត្រូវ Loop ទៀត រញ៉េរញ៉ៃណាស់បង។

**Host A (សិទ្ធិ):** ហ្នឹងហើយ! Composite Pattern ធ្វើឱ្យស្លឹក (File) និងមែក (Folder) មានរូបរាងតែមួយ តាមរយៈ Interface តែមួយ។ ដូច្នេះពេលយើងហៅ `folder.getSize()` វានឹងដើរហៅ `getSize()` លើកូនៗវាទាំងអស់ដោយស្វ័យប្រវត្តិ។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើខ្ញុំរោគចិត្ត... ខ្ញុំយក Folder ហ្នឹងទៅញាត់ចូលក្នុង File ធម្មតាវិញ តើកុំព្យូទ័រវានឹងឆ្កួតអត់បង? File ធម្មតាមានផ្ទុក Folder ខាងក្នុងបានអត់?

**Host A (សិទ្ធិ):** ហាហា... សំណួរនេះគឺចាក់ចំចំណុចខ្សោយរបស់ Composite តែម្តង! បើយើងឱ្យ File និង Folder ប្រើ Interface `FileSystemNode` តែមួយដែលមាន Method `add(Node child)`... នោះមានន័យថា File ក៏មាន Method `add()` ដែរ! បើលោកឯងយក Folder ទៅ `add` បញ្ចូលក្នុង File នោះវានឹងគប់ `UnsupportedOperationException` ចំកណ្តាលមុខលោកឯងហើយ! ព្រោះ "ស្លឹក" មិនអាចដុះ "មែក" ចេញមកវិញបានទេ។ នេះជារឿងដែលយើងត្រូវប្រយ័ត្នក្នុងការប្រើប្រាស់ Pattern នេះ (ភាព Uniformity ទល់នឹង Safety)។

**Host B (បូរិទ្ធ):** អូហូ! ការពិត File អត់ឱ្យញាត់អីចូលទេ! យល់ហើយបង។ តែបើប្រើត្រូវ វាពិតជាងាយស្រួលមែន ព្រោះកូដដែលហៅវាមកប្រើ (Client) មិនបាច់ឆែកលក្ខខណ្ឌច្រើនទេ គឺហៅ `getSize()` ទៅដើររលូនតែម្តង!

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! UI Components (DOM) ភាគច្រើនគឺប្រើ Composite នេះឯង។ ផ្ទាំង Panel (Folder) មានផ្ទុក Button (File)។ ពេលហៅ `panel.draw()` វានឹងឱ្យ Button គូរខ្លួនឯង។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Component Interface
public interface FileSystemNode {
    int getSize();
    void add(FileSystemNode node); // នេះអាចបង្កបញ្ហាដល់ File
}

// ២. Leaf (ស្លឹក - គ្មានកូន)
public class File implements FileSystemNode {
    private int size;
    public File(int size) { this.size = size; }

    @Override
    public int getSize() { return size; }

    @Override
    public void add(FileSystemNode node) {
        // ការពារការលេងឆ្កួតៗរបស់បូរិទ្ធ
        throw new UnsupportedOperationException("File cannot contain anything!");
    }
}

// ៣. Composite (មែក - មានកូន)
public class Folder implements FileSystemNode {
    private List<FileSystemNode> children = new ArrayList<>();

    public void add(FileSystemNode node) { children.add(node); }

    @Override
    public int getSize() {
        int total = 0;
        for (FileSystemNode child : children) {
            total += child.getSize(); // Recursion លាក់កំបាំង
        }
        return total;
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Uniformity:** Client ធ្វើការជាមួយ Object ដែលមានរចនាសម្ព័ន្ធស្មុគស្មាញ ដោយប្រើកូដតែមួយ។
- **Recursion Simplification:** ធ្វើឱ្យការប្រើប្រាស់ Recursion មានលក្ខណៈធម្មជាតិ។

**គុណវិបត្តិ (Cons):**
- **ពិបាករឹតត្បិតកូន:** ការប្រើ Interface រួមធ្វើឱ្យបាត់បង់ Type-Safety មួយកម្រិត (File មាន Method add)។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការគ្រប់គ្រងរចនាសម្ព័ន្ធមែកធាង តម្រូវឱ្យសរសេរលក្ខខណ្ឌញែកដាច់ពីគ្នារញ៉េរញ៉ៃ។
- **ដំណោះស្រាយ:** បង្កើត Component Interface រួមមួយសម្រាប់ទាំង Leaf និង Container ដើម្បីអាចប្រើប្រាស់វាដូចៗគ្នា។
