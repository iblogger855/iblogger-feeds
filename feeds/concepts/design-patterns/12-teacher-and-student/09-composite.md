# វគ្គគ្រូនិងសិស្ស: Composite (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #composite #structural #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងអង្គុយសរសេរកូដរាប់សិបបន្ទាត់ដែលពោរពេញដោយ `if (isFile)`)*

**លោកគ្រូយក្ស:** អាម៉ាប់! គ្រាន់តែអញអោយគណនាទំហំ (Size) នៃ Folder `C:\` មួយសោះ ម៉េចហែងសរសេរកូដ Loop ឡើង ២០ ជាន់អញ្ចឹង? 

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំត្រូវឆែកមើល បើវាជា File ខ្ញុំបូកទំហំវា បើវាជា Folder ខ្ញុំត្រូវចូលទៅខាងក្នុងវា រួចឆែកមើលទៀត... បើក្នុងនោះមាន Folder ទៀត ខ្ញុំត្រូវចូលទៀត... វិលមុខសឹងសន្លប់ហើយគ្រូ!

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថា រចនាសម្ព័ន្ធមែកធាង (Tree Structure)! បើហែងសរសេរ `if/else` ញែកស្លឹក និងមែក កូដហែងនឹងរញ៉េរញ៉ៃមិនខាន! គេត្រូវប្រើ **Composite Pattern** វើយ! គេធ្វើអោយ File និង Folder មានមុខមាត់តែមួយ! ពេលហែងហៅ Method `getSize()` ទៅលើ Folder វាចេះដើរទៅហៅកូនៗវាទាំងអស់ដោយស្វ័យប្រវត្តិ មិនបាច់ហែងទៅកកាយវាទេ!

**អាម៉ាប់ (ភ្នែកធំៗ):** អូហូ! ឡូយមែនទែន! គឺអោយវាស្មើភាពគ្នាតែម្តង! អញ្ចឹងខ្ញុំដាក់ Method `add(កូន)` អោយវាទាំងពីរតែម្តងទៅលោកគ្រូ ដើម្បីអោយស្មើភាពគ្នា!

**លោកគ្រូយក្ស (សម្លក់):** ចុះ File ឯណាមាន Method `add` អាភ្លើ? ហែងធ្លាប់ឃើញគេយក Folder ទៅញាត់ចូលក្នុង File `text.txt` ទេ?

**អាម៉ាប់ (សើចកក្អិក):** ហាហា... បើអញ្ចឹង ខ្ញុំនឹងសរសេរកូដអោយ File អាច Add កូនចូលបាន! បើមានអ្នកណាយក Folder មកញាត់ចូល File ខ្ញុំ អោយម៉ាស៊ីនកុំព្យូទ័រវាឆ្កួត ហើយគប់ Exception បោកក្បាលអ្នកនោះតែម្តង!

**លោកគ្រូយក្ស (ទាញត្រចៀកអាម៉ាប់):** នេះហើយជាបញ្ហារបស់ Composite! បើហែងអោយវាមាន Method `add()` ដូចគ្នា វាហៅថា **Uniformity (ភាពស្មើគ្នា)** តែវានឹងផ្ទុះនៅពេល Runtime (ពេលកម្មវិធីកំពុងដើរ)! បើហែងមិនចង់អោយមានអ្នកណា "លេងឆ្កួតៗ" ដូចហែង ហែងត្រូវយក Method `add()` ចេញពី Interface រួចទុកវាតែនៅក្នុង Folder ទៅ! នេះគេហៅថា **Safety (សុវត្ថិភាព)** វានឹងរារាំងអំពើឆ្កួតៗរបស់ហែងតាំងពីពេលវាយកូដ (Compile-time) មកម៉្លេះ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. មុខមាត់រួម (Component)
interface FileSystemNode {
    int getSize(); // គ្រប់គ្នាត្រូវតែចេះប្រាប់ទំហំខ្លួនឯង
}

// ២. ស្លឹក (File - អ្នកនៅលីវ គ្មានកូន)
class File implements FileSystemNode {
    private int size;
    public File(int size) { this.size = size; }
    
    // អត់មាន Method add() ទេ! ការពារអាម៉ាប់លេងឆ្កួតៗ!
    public int getSize() { return size; }
}

// ៣. មែក (Folder - អ្នកមានគ្រួសារ)
class Folder implements FileSystemNode {
    private List<FileSystemNode> children = new ArrayList<>();

    public void add(FileSystemNode node) { children.add(node); }

    public int getSize() {
        int total = 0;
        // ដើរប្រមូលលុយ (ទំហំ) ពីកូនៗទាំងអស់យ៉ាងរលូន
        for (FileSystemNode child : children) {
            total += child.getSize(); // បើកូននោះជា Folder វាចេះប្រមូលលុយពីចៅបន្តទៀត!
        }
        return total;
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅរាប់ចំនួន File ក្នុងកុំព្យូទ័រដោយដៃ បើហ៊ានសរសេរកូដ Loop ញែក File ញែក Folder ទៀត គ្រូនឹង Format កុំព្យូទ័រវាចោល!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការគ្រប់គ្រងរចនាសម្ព័ន្ធមែកធាង (Tree) តម្រូវឱ្យសរសេរលក្ខខណ្ឌខុសៗគ្នាសម្រាប់ស្លឹក (Leaf) និងមែក (Container) ធ្វើឱ្យកូដស្មុគស្មាញ។
- **ដំណោះស្រាយ:** បង្កើត Component Interface រួមមួយ ដើម្បីឱ្យ Client អាចប្រាស្រ័យទាក់ទងជាមួយ Leaf និង Container ក្នុងលក្ខណៈស្មើភាពគ្នា តាមរយៈយន្តការ Recursion លាក់កំបាំង។
