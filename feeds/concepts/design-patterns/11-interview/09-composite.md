# វគ្គសម្ភាសន៍ការងារ: Composite (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #composite #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងកំពុងសរសេរប្រព័ន្ធគ្រប់គ្រង File System។ នៅក្នុង Folder អាចមាន File និង Folder កូនៗជាច្រើនជាន់ (Nested)។ កូនចៅខ្ញុំសរសេរកូដ `if (node instanceof File)` គណនាទំហំមួយបែប ហើយ `else if (node instanceof Folder)` ត្រូវសរសេរ Loop វិលវល់ចុះឡើងរហូតដល់គាំងម៉ាស៊ីន! តើប្អូនមានដំណោះស្រាយកម្រិតខ្ពស់ទេ?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះដោះស្រាយបានល្អបំផុតដោយប្រើប្រាស់ **Composite Pattern**។ គោលដៅគឺធ្វើឱ្យ "ស្លឹក" (File) និង "មែកធាង" (Folder) មានមុខមាត់ (Interface) ដូចគ្នា។ ខ្ញុំនឹងបង្កើត Interface មួយឈ្មោះ `FileSystemComponent` ដែលមាន Method `getSize()`។
ពេល Client ហៅ `folder.getSize()` វានឹងរត់ទៅហៅ `getSize()` លើកូនៗរបស់វាទាំងអស់ដោយស្វ័យប្រវត្តិ (Recursion)។ Client មិនបាច់ខ្វល់ថាវាជា File ឬ Folder ទេ!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ឆ្លាត! ចុះបើ Interface នោះមាន Method ដូចជា `add(Component c)` និង `remove(Component c)`... តើប្អូនគិតថា `File` (ស្លឹក) គួរតែមាន Method ទាំងពីរនេះទេ? ព្រោះ File មិនអាចផ្ទុកអ្វីបានឡើយ!

**បេក្ខជន (សុខា - ញញឹម):** នេះគឺជាចំណុចចម្រូងចម្រាសបំផុតរបស់ Composite ដែលគេហៅថា "ការថ្លឹងថ្លែងរវាង Uniformity និង Safety" លោកប្រធាន!
- បើយើងយក **Uniformity (ភាពស្មើគ្នា)**: យើងដាក់ Method `add()` ក្នុង Interface នោះទាំង File និង Folder ត្រូវតែមានវា។ តែក្នុង File យើងត្រូវសរសេរ `throw new UnsupportedOperationException()`។ វាងាយស្រួលដល់ Client តែវាមិនមាន Type-Safety ទេ (ព្រោះអត់ដឹងថាពេលណា Error)!
- បើយើងយក **Safety (សុវត្ថិភាព)**: យើងដក Method `add()` ចេញពី Interface ហើយដាក់វាត្រឹមតែក្នុង `Folder` ប៉ុណ្ណោះ។ Client ត្រូវចាំបាច់ Cast `(Folder) node` សិនទើបអាច Add បាន ដែលនេះធ្វើឱ្យបាត់បង់ភាពងាយស្រួលបន្តិច។

**អ្នកសម្ភាសន៍:** ចម្លើយកម្រិត Senior! ចុះប្អូនជ្រើសរើសមួយណាសម្រាប់ការងារនេះ?

**បេក្ខជន (សុខា):** សម្រាប់ File System ខ្ញុំជ្រើសរើសយក **Safety**! ខ្ញុំមិនចង់ឱ្យប្រព័ន្ធធ្លាក់ (Crash) នៅពេល Runtime ដោយសារតែមានអ្នកណាម្នាក់ព្យាយាមយក Folder ទៅញាត់ចូលក្នុង File នោះទេ។ កំហុសគួរតែត្រូវបានចាប់បានតាំងពីពេល Compile (Compile-time)។

**អ្នកសម្ភាសន៍:** អស្ចារ្យ! វិភាគបានស៊ីជម្រៅមែនទែន!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Component Interface (ជ្រើសយក Safety: គ្មាន Method add/remove នៅទីនេះទេ)
public interface FileSystemNode {
    int getSize();
}

// ២. Leaf (ស្លឹក - មិនអាចមានកូន)
public class File implements FileSystemNode {
    private int size;
    public File(int size) { this.size = size; }

    @Override
    public int getSize() {
        return size;
    }
}

// ៣. Composite (មែក - មានផ្ទុកកូនៗ)
public class Folder implements FileSystemNode {
    private List<FileSystemNode> children = new ArrayList<>();

    // មានតែ Folder ទេទើបមាន Method នេះ (Type-Safety)
    public void add(FileSystemNode node) {
        children.add(node);
    }

    @Override
    public int getSize() {
        int totalSize = 0;
        // Recursion ដ៏អស្ចារ្យ មិនបាច់សរសេរ if/else ញែកប្រភេទទេ
        for (FileSystemNode child : children) {
            totalSize += child.getSize(); 
        }
        return totalSize;
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** ស្គាល់ច្បាស់ពីការបំបាត់ `if/else` និងការប្រើប្រាស់ Recursion ក្នុងរចនាសម្ព័ន្ធមែកធាង។
❌ **អន្ទាក់:** សួរអំពីការរចនា Interface (Uniformity vs Safety) ដែលអ្នកបង្កើតកូដតែងតែឈ្លោះគ្នា។ បេក្ខជនបកស្រាយបានយ៉ាងក្បោះក្បាយ និងមានហេតុផលរឹងមាំក្នុងការជ្រើសរើសរចនាបថ Safety។
