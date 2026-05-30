# Podcast: Template Method (កិច្ចសន្ទនា Podcast ជុំវិញ Template Method)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #template-method #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងជជែកពី **Template Method Pattern**។ បូរិទ្ធ ឧបមាថាអ្នកសរសេរកម្មវិធីទាញយកទិន្នន័យពី Excel និង CSV។ ជំហានការងារមាន៖ ១.បើកឯកសារ ២.ទាញយកទិន្នន័យ ៣.វិភាគទិន្នន័យ និង ៤.បិទឯកសារ។ តើលោកនឹងសរសេរកូដនេះបែបណាដើម្បីកុំឱ្យជាន់គ្នា?

**Host B (បូរិទ្ធ - អ្នករៀន):** ជាធម្មតា ជំហានទី១ ទី៣ និងទី៤ គឺដូចគ្នា។ ខុសគ្នាតែទី២ គឺរបៀបទាញយកទិន្នន័យ (Extract)។ បើខ្ញុំសរសេរ Class ពីរដាច់ដោយឡែក ខ្ញុំប្រាកដជា Copy/Paste ជំហានដែលដូចគ្នាជាមិនខាន!

**Host A (សិទ្ធិ):** ហ្នឹងហើយគឺជាពេលដែល Template Method ចូលមកជួយ! យើងបង្កើត Method ធំមួយ ឈ្មោះ `processFile()` នៅក្នុង Class មេ ដែលហៅ Method ទាំង ៤ នោះជាបន្តបន្ទាប់។ Method `processFile()` នេះជាធម្មតាត្រូវដាក់ Keyword `final` ដើម្បីកុំឱ្យ Class កូនៗបំពានកែប្រែលំដាប់លំដោយនេះបាន។ ចំណែក Method ណាដែលខុសគ្នា ដូចជា `extractData()` យើងទុកវាជា `abstract` សម្រាប់ឱ្យកូនបំពេញ (Hook)។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើខ្ញុំជាកូនកំហូច... ខ្ញុំមិនខ្វល់ពី Keyword `final` អីទេ ខ្ញុំចង់ប្តូរលំដាប់លំដោយហ្នឹង! ខ្ញុំចង់ឱ្យកម្មវិធីវា 'បិទឯកសារ' (Close File) ជាមុនសិន រួចចាំ 'ទាញយកទិន្នន័យ' (Extract Data) តាមក្រោយ តើម៉ាស៊ីនវាវាយក្បាលខ្ញុំអត់បង?

**Host A (សិទ្ធិ):** ហាហា... បើលោកឯងចង់ប្តូរលំដាប់លំដោយនៃ `final method` នៅក្នុង Class មេ នោះ Compiler របស់ Java វានឹង "វាយក្បាល" លោកឯងមុនគេតែម្តង! វាគប់ Error ប្រាប់ថា `Cannot override the final method from BaseClass`។
នេះហើយជាអំណាចនៃ Template Method! វាការពារគ្រោងឆ្អឹង (Skeleton) នៃ Algorithm យ៉ាងរឹងមាំ។ Class កូនមានសិទ្ធិតែ "បំពេញចន្លោះប្រហោង" ដែល Class មេអនុញ្ញាតប៉ុណ្ណោះ គ្មានសិទ្ធិមករុះរើផ្ទះទាំងមូលនោះទេ។ ល្បិចនេះគេហៅថា "Hollywood Principle" គឺ "Don't call us, we'll call you!" កូដនឹងរត់ពី Class មេមកហៅ Class កូននៅពេលដល់វេលា។

**Host B (បូរិទ្ធ):** អូហូ... តឹងរ៉ឹងមែនទែន! អញ្ចឹង Framework ធំៗដូចជា Android Lifecycle (`onCreate()`, `onStart()`) គឺដើរតួជា Class មេហ្នឹងឯង ដែលវាហៅ Method របស់កូនៗយើងតាមលំដាប់លំដោយដ៏ត្រឹមត្រូវមួយដោយស្វ័យប្រវត្តិ។ យើងមិនអាចទៅប្រាប់វាឱ្យ `onDestroy()` មុន `onCreate()` បានទេ!

**Host A (សិទ្ធិ):** ត្រឹមត្រូវឥតខ្ចោះ! នេះគឺជាមូលដ្ឋានគ្រឹះនៃ Frameworks ភាគច្រើន។ វាជួយឱ្យយើងផ្តោតទៅលើតែ "ចំណុចដែលខុសប្លែកគ្នា" ដោយទុកការងាររៀបចំលំដាប់លំដោយដ៏គួរឱ្យធុញទ្រាន់ទៅឱ្យ Base Class ជាអ្នកចាត់ចែង។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Abstract Base Class (ពុម្ពគំរូ)
public abstract class DataMiner {
    
    // នេះគឺជា Template Method (ដាក់ final ដើម្បីវាយក្បាលកូនកំហូច)
    public final void mineData(String path) {
        openFile(path);
        String data = extractData(); // ជំហានដែលត្រូវបត់បែន
        analyzeData(data);
        closeFile();
    }

    // ជំហានដែលអនុវត្តរួមគ្នា (Concrete Methods)
    protected void openFile(String path) { System.out.println("Opening file " + path); }
    protected void analyzeData(String data) { System.out.println("Analyzing: " + data); }
    protected void closeFile() { System.out.println("File closed."); }

    // Abstract Method ដែលតម្រូវឱ្យកូនបំពេញ (Hook)
    protected abstract String extractData();
}

// ២. Concrete Classes
public class ExcelMiner extends DataMiner {
    @Override
    protected String extractData() {
        return "Data extracted using Excel Library";
    }
}

// ៣. Client Code
public class App {
    public static void main(String[] args) {
        DataMiner excelTask = new ExcelMiner();
        // Client ហៅតែ Method មេ វាដើរចប់គ្រប់ជំហាន
        excelTask.mineData("report.xlsx"); 
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **DRY Principle:** កាត់បន្ថយការសរសេរកូដជាន់គ្នាយ៉ាងច្រើនសន្ធឹកសន្ធាប់ដោយប្រមូលផ្តុំវានៅក្នុង Base Class។
- **Inversion of Control (Hollywood Principle):** អនុញ្ញាតឱ្យ Framework ជាអ្នកគ្រប់គ្រងលំហូរនៃការងារ។

**គុណវិបត្តិ (Cons):**
- **Liskov Substitution Principle:** ជួនកាលកូនខ្លះចង់រំលងជំហានណាមួយរបស់មេ ហើយមិនអាចធ្វើបាន ព្រោះលំដាប់ត្រូវបានចាក់សោ (rigid template)។ 

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ក្បួនដោះស្រាយ (Algorithm) ច្រើនមានជំហានដូចៗគ្នា ខុសគ្នាតែចំណុចបន្តិចបន្តួច បណ្តាលឱ្យមានកូដជាន់គ្នា។
- **ដំណោះស្រាយ:** បង្កើត Class មេមួយដែលមាន Method គោលរៀបចំលំដាប់លំដោយ (Template Method) និងបន្សល់ទុក Abstract methods សម្រាប់ Class កូនបំពេញបន្ថែម។
