# វគ្គគ្រូនិងសិស្ស: Flyweight (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #flyweight #structural #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(ម៉ោងរៀនសរសេរហ្គេម អាម៉ាប់ចុច Run ហ្គេមរបស់ខ្លួន ស្រាប់តែម៉ាស៊ីនកុំព្យូទ័រលោត Blue Screen គាំងធ្លាក់តែម្តង លោកគ្រូយក្សស្ទុះមកមើល)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរកូដអីគេហ្នឹង? គ្រាន់តែគូរព្រៃមួយសោះ ម៉េចកុំព្យូទ័រ Core i9 របស់សាលាគាំងអញ្ចឹង?

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំចង់អោយព្រៃហ្នឹងមើលទៅធំ អញ្ចឹងខ្ញុំវាយ `new Tree()` ចំនួន ១លានដើម! ហើយក្នុង `Tree` នីមួយៗ ខ្ញុំដាក់រូបភាព 3D Model ស្លឹកឈើ និងដើមឈើ ដែលមានទំហំ 10MB! គុណទៅវាស៊ី RAM ប្រហែល 10,000 GB ឯណោះគ្រូ!

**លោកគ្រូយក្ស (គប់កណ្តុរកុំព្យូទ័រ):** អាភ្លើ! កុំព្យូទ័រព្រះឥន្ទ្រឯណាមាន RAM 10,000 GB អោយហែងនោះ? ដើមឈើទាំង ១លានដើមហ្នឹង វាមើលទៅរូបរាងដូចគ្នាបេះបិទ! ហែងចម្លងរូបភាព 3D ចូលម៉េមូរី ១លានដងធ្វើអី? គេត្រូវប្រើ **Flyweight Pattern** វើយ! 

**អាម៉ាប់:** Flyweight ហ្នឹងវាយ៉ាងម៉េចទៅលោកគ្រូ? សន្សំម៉េមូរីម៉េចទៅ?

**លោកគ្រូយក្ស:** គេបំបែកទិន្នន័យជាពីរ! រូបភាព 3D និងពណ៌ ដែលដូចគ្នា គេហៅថា "រដ្ឋខាងក្នុង (Intrinsic)" គេទុកវាក្នុង Object រួមតែមួយគត់! ដើមឈើទាំង ១លានដើមគ្រាន់តែប្រើប្រាស់ Object តែមួយហ្នឹងរួមគ្នា (Share)! ចំណែក ទីតាំង (X, Y) ដែលដើមឈើនីមួយៗដុះខុសគ្នា គេហៅថា "រដ្ឋខាងក្រៅ (Extrinsic)" គេទុកវាក្នុង Array ធម្មតាទៅ! បែបនេះ វាស៊ី RAM តែប៉ុន្មាន Megabytes ប៉ុណ្ណោះ!

**អាម៉ាប់ (អេះក្បាល):** អូហូ! សន្សំសំចៃពេកហើយគ្រូ! ចុះបើខ្ញុំកំហូច... ដើមឈើកំពុងតែពណ៌បៃតង ខ្ញុំលួចចូលទៅកែ Object រួមហ្នឹងអោយទៅជា "ពណ៌ស៊ីជម្ពូ" វិញ តើមានអីកើតឡើងលោកគ្រូ?

**លោកគ្រូយក្ស:** បើហែងកែបាន ព្រៃហែងទាំងមូលដែលមានដើមឈើ ១លានដើម វានឹងប្រែពណ៌ស៊ីជម្ពូព្រមគ្នាក្នុងមួយវិនាទី! ហ្គេមហែងនឹងក្លាយជាហ្គេមខ្មោចលង! ដូច្នេះ ក្នុង Flyweight Object រួមហ្នឹង ហាមដាច់ខាតមិនអោយមាន Method កែប្រែ (Setter) ឡើយ! វាត្រូវតែជាកូដដែល "ចាក់សោរស្លាប់ (Immutable)" វើយ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. ទិន្នន័យដែលដូចគ្នា (សន្សំ Memory ខ្លាំងបំផុត) - ត្រូវតែ Immutable!
class TreeType {
    private final String name;
    private final String color;
    private final String otherTreeData; // ទិន្នន័យ 3D ទំហំធំៗ

    public TreeType(String name, String color, String otherTreeData) {
        this.name = name; this.color = color; this.otherTreeData = otherTreeData;
    }

    public void draw(int x, int y) {
        System.out.println("គូរដើម " + name + " នៅទីតាំង X:" + x + " Y:" + y);
    }
}

// ២. រោងចក្រចែករំលែក
class TreeFactory {
    private static Map<String, TreeType> treeTypes = new HashMap<>();

    public static TreeType getTreeType(String name, String color, String otherTreeData) {
        TreeType result = treeTypes.get(name);
        if (result == null) { // បើអត់មាន ទើបបង្កើតថ្មី
            result = new TreeType(name, color, otherTreeData);
            treeTypes.put(name, result);
        }
        return result; // បើមានហើយ ចែកគ្នារួម!
    }
}

// ៣. ទិន្នន័យដែលប្រែប្រួល (ទីតាំង X,Y ស៊ី Memory តិចបំផុត)
class Tree {
    private int x, y;
    private TreeType type; // ដើមឈើ ១លានដើម ចង្អុលមក Object នេះតែមួយគត់!

    public Tree(int x, int y, TreeType type) {
        this.x = x; this.y = y; this.type = type;
    }
    public void draw() { type.draw(x, y); }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅទិញ RAM អោយសាលាវិញចំនួន 10,000 GB បើមិនព្រមសរសេរកូដតាមរបៀប Flyweight!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កម្មវិធីត្រូវបង្កើត Object ចំនួនរាប់លាន ដែលស៊ី Memory (RAM) រហូតដល់គាំងម៉ាស៊ីន (OutOfMemoryError)។
- **ដំណោះស្រាយ:** ប្រើប្រាស់ Flyweight Pattern ដើម្បីបំបែកទិន្នន័យដែលដដែលៗ (Intrinsic) មករក្សាទុកតែមួយគត់ និងចែករំលែកគ្នាប្រើ។ ត្រូវប្រាកដថាទិន្នន័យរួមនោះគឺ Immutable ដើម្បីកុំឱ្យមានឥទ្ធិពលប៉ះពាល់គ្នាទៅវិញទៅមក។
