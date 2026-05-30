# Podcast: Flyweight (កិច្ចសន្ទនា Podcast ជុំវិញ Flyweight)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #flyweight #structural #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ធ្លាប់ឆ្ងល់ទេថា ហេតុអ្វីបានជាកម្មវិធី Text Editor (ដូចជា MS Word) ដែលមានអក្សររាប់លានតួ មិនស៊ី RAM កុំព្យូទ័ររហូតដល់គាំង? បើយើងចាត់ទុកតួអក្សរនីមួយៗជា Object មួយ (OOP) នោះអត្ថបទ ១លានតួ នឹងមាន Object ១លាន! 

**Host B (បូរិទ្ធ - អ្នករៀន):** ពិតមែនហើយបង! បើ Object មួយៗមានផ្ទុក Font, Size, និង Color ដដែលៗ ៥ម៉ឺនតួ ខ្ញុំនឹងបង្កើត Object 'A' ៥ម៉ឺន ដែលផ្ទុកទិន្នន័យដូចគ្នាបេះបិទ! នេះជាការខ្ជះខ្ជាយ Memory ដ៏ធំ។ តើគេដោះស្រាយវាយ៉ាងម៉េចទៅបង?

**Host A (សិទ្ធិ):** ដំណោះស្រាយគឺ **Flyweight Pattern**។ គំនិតចម្បងគឺ ការបំបែកទិន្នន័យរបស់ Object ជាពីរផ្នែក៖ 
ទី១ **Intrinsic State (រដ្ឋខាងក្នុង):** ទិន្នន័យដែលដូចគ្នានិងអាចចែករំលែកបាន (ឧ. រូបរាងតួអក្សរ 'A')។ យើងបង្កើតវា "តែមួយគត់" ទុកក្នុងឃ្លាំង (Cache)។
ទី២ **Extrinsic State (រដ្ឋខាងក្រៅ):** ទិន្នន័យដែលប្រែប្រួល (ឧ. ទីតាំង X, Y នៅលើអេក្រង់)។ យើងមិនរក្សាទុកទីតាំងក្នុង Object 'A' ទេ តែយើងបញ្ជូនវាពីក្រៅនៅពេលចង់គូរ (`draw(x,y)`)។

**Host B (បូរិទ្ធ):** សុំសួរឡប់ៗមួយបង! ចុះបើខ្ញុំកំហូច... ខ្ញុំចង់ឱ្យតួអក្សរ 'A' ទាំងអស់នៅក្នុងអត្ថបទ ប្តូរពណ៌ទៅជា "ពណ៌ស៊ីជម្ពូ" ព្រមគ្នាក្នុងមួយវិនាទី! ដោយសារពួកវាប្រើ Object 'A' រួមគ្នាតែមួយ (Intrinsic) អញ្ចឹងបើខ្ញុំកែពណ៌ Object តែមួយហ្នឹង វាមិនដូរពណ៌ទាំង ១លានតួអក្សរ ពេញអេក្រង់វិនាសកម្មតែម្តងអីបង?

**Host A (សិទ្ធិ):** ហាហា... បូរិទ្ធឯងនេះវៃឆ្លាតណាស់! ហ្នឹងហើយគឺជារឿងពិត! នៅក្នុង Flyweight ទិន្នន័យខាងក្នុង (Intrinsic State) ត្រូវតែ **Immutable (មិនអាចកែប្រែបានជាដាច់ខាត)** បន្ទាប់ពីវាត្រូវបានបង្កើតរួច។ បើលោកឯងព្យាយាមសរសេរ Method `setColor()` ឱ្យវា នោះលោកឯងនឹងបង្កើត "មហាវិនាសកម្មស៊ីជម្ពូ" ពេញអេក្រង់មែន! 
បើចង់បានអក្សរ 'A' ពណ៌ស៊ីជម្ពូ យើងត្រូវទៅសុំពី Factory ថា `getTreeType("A", "Pink")` ហើយ Factory នឹងបង្កើត Object 'A' ថ្មីមួយទៀតសម្រាប់ពណ៌ស៊ីជម្ពូនោះ ទើបត្រឹមត្រូវ។

**Host B (បូរិទ្ធ):** អូហូ! ខ្ញុំយល់ហើយ! គឺហាមដាច់ខាតមិនឱ្យមាន Setter នៅក្នុង Flyweight Object ព្រោះមានអ្នកកំពុងប្រើវាច្រើនណាស់។ នេះដូចជាដើមឈើក្នុងហ្គេមអញ្ចឹង ដើមឈើរាប់ពាន់ដើម ប្រើ 3D Model តែមួយ គ្រាន់តែ Render វាចេញមកដោយបញ្ជូនទីតាំង (X, Y) ខុសៗគ្នា (Extrinsic) ទើបហ្គេមមិនគាំង!

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! Flyweight គឺជា Pattern ដែលផ្តោតខ្លាំងទៅលើការសន្សំសំចៃ Memory សុទ្ធសាធ (Memory Optimization) តាមរយៈការចែករំលែក (Sharing) ។ ប្រសិនបើកម្មវិធីរបស់អ្នកមិនមានបញ្ហា Memory ទេ អ្នកមិនចាំបាច់ប្រើវាឡើយ ព្រោះវានាំឱ្យកូដស្មុគស្មាញ។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Flyweight Object (ផ្ទុកតែទិន្នន័យដែលអាចចែករំលែកបាន)
public class TreeType {
    // ត្រូវតែ Immutable! (គ្មាន Setter) ជៀសវាងមហាវិនាសកម្មស៊ីជម្ពូរបស់បូរិទ្ធ
    private final String name;
    private final String color;

    public TreeType(String name, String color) {
        this.name = name;
        this.color = color;
    }

    // Extrinsic State (x, y) ត្រូវបានបញ្ជូនចូលមក មិនមែនរក្សាទុកទេ
    public void draw(int x, int y) {
        System.out.printf("Drawing %s tree at (%d, %d)%n", name, x, y);
    }
}

// ២. Flyweight Factory (ឃ្លាំងចែករំលែក)
public class TreeFactory {
    private static Map<String, TreeType> treeTypes = new HashMap<>();

    public static TreeType getTreeType(String name, String color) {
        TreeType type = treeTypes.get(name);
        if (type == null) {
            type = new TreeType(name, color);
            treeTypes.put(name, type);
        }
        return type; // បើមានហើយ ចែករំលែករបស់ចាស់
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **សន្សំសំចៃ Memory យ៉ាងខ្លាំង:** កាត់បន្ថយចំនួន Object ពីការផ្ទុះរាប់លាន មកត្រឹមខ្ទង់រយ។ 

**គុណវិបត្តិ (Cons):**
- **កូដស្មុគស្មាញ (Complexity):** អ្នកត្រូវបំបែក Object ជាពីរផ្នែក ដែលធ្វើឱ្យកូដពិបាកអាន។
- **CPU vs RAM Trade-off:** សន្សំ RAM បានច្រើន តែពេលខ្លះត្រូវចំណាយពេល CPU ដើម្បីគណនា Extrinsic State ឡើងវិញ។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** កម្មវិធីត្រូវបង្កើត Object ច្រើនសន្ធឹកសន្ធាប់ដែលមានផ្ទុកទិន្នន័យដូចៗគ្នា បណ្តាលឱ្យអស់ Memory (RAM)។
- **ដំណោះស្រាយ:** ប្រើ Flyweight Pattern ដើម្បីទាញយកទិន្នន័យដែលដូចគ្នា (Intrinsic) មករក្សាទុកក្នុង Object តែមួយ រួចចែករំលែកប្រើប្រាស់។ ទិន្នន័យប្រែប្រួល (Extrinsic) ត្រូវបញ្ជូនចូលពីខាងក្រៅនៅពេលត្រូវការ។
