# វគ្គសម្ភាសន៍ការងារ: Proxy (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #proxy #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងមានកម្មវិធីបង្ហាញរូបភាព។ រូបភាពនីមួយៗទំហំ 50MB។ ពេលបើកកម្មវិធីឡើង វានឹងទាញយករូបភាព ១០០ សន្លឹកពី Database មកដាក់ពេញ Memory ទោះបីជាអ្នកប្រើប្រាស់អូស (Scroll) មើលមិនទាន់ដល់ក៏ដោយ ធ្វើអោយកម្មវិធីគាំង! តើប្អូននឹងជួយដោះស្រាយបញ្ហានេះដោយប្រើ Pattern មួយណា?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! នេះគឺជាបញ្ហាដ៏ល្អសម្រាប់ការប្រើប្រាស់ **Virtual Proxy Pattern** (Lazy Initialization)។
ជាជាងការបង្កើត (Instantiate) `RealImage` ធំៗ ១០០ សន្លឹក ខ្ញុំនឹងបង្កើត `ImageProxy` ១០០ សន្លឹកជំនួសវិញ។ Proxy នេះមានទំហំតូចមែនទែន! វាមាន Interface `display()` ដូច `RealImage` បេះបិទ។ ពេលកម្មវិធីបើក វាគ្រាន់តែបង្ហាញស៊ុមទទេរ។ តែនៅពេលដែលអ្នកប្រើប្រាស់ Scroll ទៅដល់រូបភាពនោះ ហើយកូដ UI ហៅ Method `proxy.display()`... ពេលនោះហើយទើប Proxy សម្រេចចិត្តបញ្ជាអោយ `RealImage` ធ្វើការទាញយកទិន្នន័យពិតប្រាកដ និងបង្ហាញ។ នេះជួយសន្សំ Memory និង Bandwidth យ៉ាងច្រើន!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ឆ្លាត! ចុះខ្ញុំសង្កេតឃើញថា Proxy កាន់កាប់ Object ពិត និងមាន Interface ដូចគ្នា។ Decorator ក៏មានទម្រង់បែបនេះដែរ! តើប្អូនអាចប្រាប់ពីភាពខុសគ្នារវាង Proxy និង Decorator បានទេ? តើវាមិនមែនជារបស់តែមួយទេឬ?

**បេក្ខជន (សុខា - ញញឹម):** ពួកវាមានទម្រង់ (Structure) ស្រដៀងគ្នាបេះបិទ! ប៉ុន្តែ **គោលបំណង (Intent)** ខុសគ្នាស្រឡះ!
- **Decorator:** ប្រើសម្រាប់ "បន្ថែមមុខងារថ្មី" (Add responsibilities) ទៅលើ Object។ ជាធម្មតា Client ជាអ្នកបញ្ចូន Object ពិតទៅអោយ Decorator (តាមរយៈ Constructor)។
- **Proxy:** ប្រើសម្រាប់ "គ្រប់គ្រងសិទ្ធិចូលប្រើប្រាស់" (Control access) ទៅកាន់ Object។ មិនថាក្នុងគោលបំណង Protection, Caching ឬ Lazy-loading ទេ។ Proxy តែងតែមានសិទ្ធិផ្តាច់មុខក្នុងការ "សាងសង់ (Lifecycle management)" Object ពិតប្រាកដដោយខ្លួនឯង! Client ខាងក្រៅមិនដែលឃើញឬស្គាល់ Object ពិតនោះទេ ស្គាល់តែ Proxy មួយគត់។

**អ្នកសម្ភាសន៍ (ងក់ក្បាលពេញចិត្ត):** អស្ចារ្យណាស់! ការពន្យល់រវាង Intent និង Structure ច្បាស់លាស់មែនទែន!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Subject Interface (មុខមាត់រួម ដែល Client ស្គាល់)
public interface Image {
    void display();
}

// ២. Real Subject (Object ពិត ដែលស៊ីធនធានខ្លាំង)
public class RealImage implements Image {
    private String fileName;

    public RealImage(String fileName) {
        this.fileName = fileName;
        loadFromDisk(fileName); // យឺត និងស៊ី Memory ខ្លាំង
    }

    private void loadFromDisk(String fileName) {
        System.out.println("Loading massive image: " + fileName);
    }

    @Override
    public void display() {
        System.out.println("Displaying " + fileName);
    }
}

// ៣. Proxy (អ្នកតំណាងឆ្លាតវៃ - Virtual Proxy)
public class ProxyImage implements Image {
    private RealImage realImage; // វានឹងបង្កើត Object នេះដោយខ្លួនឯង ពេលចាំបាច់
    private String fileName;

    public ProxyImage(String fileName) {
        this.fileName = fileName; 
        // អត់ធ្វើការទាញយកទិន្នន័យ (Load) ទេ! លឿនមែនទែន!
    }

    @Override
    public void display() {
        // Lazy Initialization
        if (realImage == null) {
            // ពេលចាំបាច់ទើបវាពលិកម្ម ទាញយក Object ពិតប្រាកដ
            realImage = new RealImage(fileName);
        }
        realImage.display();
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីអត្ថប្រយោជន៍របស់ Virtual Proxy ក្នុងការធ្វើ Lazy Loading ដើម្បីសន្សំធនធាន។ 
❌ **អន្ទាក់:** ការបែងចែកភាពស្រដៀងគ្នារវាង Proxy និង Decorator គឺជារឿងពិបាកសម្រាប់ Junior ភាគច្រើន។ បេក្ខជនបានពន្យល់ពី Lifecycle Management ដែលជាចំណុចស្នូលនៃភាពខុសគ្នា បានយ៉ាងក្បោះក្បាយ។ ឆ្លងកាត់ដោយជោគជ័យ!
