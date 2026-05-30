# វគ្គសម្ភាសន៍ការងារ: Adapter (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #adapter #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** ក្រុមហ៊ុនយើងមានប្រព័ន្ធចាស់កញ្ចាស់ (Legacy) ប្រើ Method `processXML()`។ ឥឡូវយើងទិញ API ទំនើបមួយដែលទាមទារ `processJSON()`។ កូនចៅខ្ញុំសុំអនុញ្ញាតចូលទៅរុះរើកូដប្រព័ន្ធចាស់ចោលដើម្បីប្តូរទៅ JSON។ ខ្ញុំបដិសេធ! តើប្អូននឹងមានក្បួនអ្វីដើម្បីភ្ជាប់ពួកវាដោយមិនប៉ះពាល់កូដចាស់សូម្បីមួយបន្ទាត់?

**បេក្ខជន (សុខា):** លោកប្រធានសម្រេចចិត្តត្រឹមត្រូវណាស់ ការកែកូដ Legacy គឺជារឿងគ្រោះថ្នាក់បំផុត! ខ្ញុំនឹងប្រើប្រាស់ **Adapter Pattern**។ ខ្ញុំគ្រាន់តែបង្កើត Class `JSONToXMLAdapter` មួយមកឈរកាត់កណ្តាល។ វានឹងទទួលយក JSON ពី API ថ្មី រួចបកប្រែវាជា XML ហើយទើបបញ្ជូនបន្តទៅកាន់ប្រព័ន្ធចាស់។ ប្រព័ន្ធចាស់នៅតែគិតថាវាកំពុងធ្វើការជាមួយ XML ដដែល។

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អ! ចុះតើ Adapter Class នោះ គួរតែ Implement Interface របស់ប្រព័ន្ធថ្មី ឬក៏ Interface របស់ប្រព័ន្ធចាស់? ប្រយ័ត្នច្រឡំណា!

**បេក្ខជន (សុខា):** នេះជាចំណុចសំខាន់! Adapter ត្រូវតែ **Implement Target Interface (ប្រព័ន្ធដែលកំពុងចង់ហៅវា)** និង **Wrap យក Adaptee (ប្រព័ន្ធដែលវាត្រូវបកប្រែឱ្យ)**។ ក្នុងករណីនេះ ប្រសិនបើកូដ Client របស់យើងរំពឹងចង់ហៅ Method ថ្មី យើងត្រូវ Implement តាម Interface ថ្មី ដើម្បីឱ្យ Client កោះហៅវាបានដោយរលូន។

**អ្នកសម្ភាសន៍:** ចុះរវាង Object Adapter (ប្រើ Composition) និង Class Adapter (ប្រើ Multiple Inheritance) តើប្អូនជ្រើសរើសមួយណា?

**បេក្ខជន (សុខា):** ខ្ញុំតែងតែជ្រើសរើស **Object Adapter** លោកប្រធាន! ព្រោះនៅក្នុង Java មិនគាំទ្រ Multiple Inheritance នោះទេ ម្យ៉ាងទៀតការប្រើប្រាស់ Composition (`has-a` relationship) ផ្តល់ភាពបត់បែនជាងការប្រើ Inheritance ដែលចងកូដរឹងតឹង (Tight coupling)។

**អ្នកសម្ភាសន៍:** ចម្លើយមុតស្រួច និងច្បាស់លាស់! 

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Target Interface (ប្រព័ន្ធថ្មី ដែល Client ចង់ប្រើ)
public interface ModernAPI {
    void processJSON(String json);
}

// ២. Adaptee (ប្រព័ន្ធចាស់ ដែលមានស្រាប់ តែអត់ត្រូវគ្នា)
public class LegacySystem {
    public void processXML(String xml) {
        System.out.println("Processing XML: " + xml);
    }
}

// ៣. Adapter (អ្នកបកប្រែ កាត់កណ្តាល) - Object Adapter Pattern
public class JSONToXMLAdapter implements ModernAPI {
    private LegacySystem legacySystem; // ប្រើ Composition

    public JSONToXMLAdapter(LegacySystem legacySystem) {
        this.legacySystem = legacySystem;
    }

    @Override
    public void processJSON(String json) {
        // Logic បកប្រែពី JSON ទៅ XML កើតឡើងនៅទីនេះ!
        String convertedXML = "<data>" + json + "</data>"; 
        
        // ហៅទៅប្រព័ន្ធចាស់ដោយសុវត្ថិភាព
        legacySystem.processXML(convertedXML);
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីតួនាទីរបស់ Adapter ក្នុងការការពារ Legacy Code។ ដឹងពីភាពខុសគ្នារវាង Object Adapter នឹង Class Adapter ហើយជ្រើសរើសបានត្រឹមត្រូវស្របតាមគោលការណ៍ Composition over Inheritance។
❌ **អន្ទាក់:** សួរអំពីការជ្រើសរើស Interface (Target vs Adaptee) ដែលអ្នករៀនថ្មីៗតែងតែច្រឡំ។ បេក្ខជនឆ្លើយបានយ៉ាងរលូន។
