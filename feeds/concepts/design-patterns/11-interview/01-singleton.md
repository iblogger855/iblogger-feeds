# វគ្គសម្ភាសន៍ការងារ: Singleton (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #singleton #creational #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន - តឹងតែង & ចូលចិត្តសាកល្បង):** សួស្តី សុខា! ខ្ញុំឃើញក្នុង CV ប្អូនដាក់ថា "ជំនាញខាង Design Patterns កម្រិតខ្ពស់"។ អូខេ! ថ្ងៃនេះខ្ញុំអត់សួររឿងស្រួលៗទេ! សរសេរកូដ Singleton មួយនៅលើក្តារខៀនមើល៍! បើសរសេរក្បាច់ `if (instance == null) instance = new Singleton()` ធម្មតា... ខ្ញុំឱ្យធ្លាក់ឥឡូវនេះ!

**បេក្ខជន (សុខា - រាងភ័យ តែរៀបចំខ្លួនបានល្អ):** បាទលោកប្រធាន! ខ្ញុំដឹងថាប្រព័ន្ធរបស់ក្រុមហ៊ុនយើងមានអ្នកប្រើប្រាស់ច្រើន ដូច្នេះក្បាច់ធម្មតានឹងងាប់ដោយសារ Race Condition (Thread ច្រើនចូលព្រមគ្នា)។ ខ្ញុំសុំសរសេរក្បាច់ **Double-Checked Locking** តែម្តង ដោយប្រើ `volatile` Keyword ទៀតផង!

**អ្នកសម្ភាសន៍:** ហឹស! ឆ្លាតគ្រាន់បើ... តែបើប្អូនដាក់ `private constructor` អញ្ចឹង ខ្ញុំចង់ប្រាប់ថា ខ្ញុំជា Hacker! ខ្ញុំនឹងយក **Reflection API** នៅក្នុង Java មកទម្លុះទ្វារ `private` នោះ ហើយ `new` យក Object ថ្មីមួយទៀតដោយកម្លាំងបាយ! ហាសហា! ឯណាទៅ Singleton របស់ប្អូននោះ? បែកធ្លាយបាត់ហើយ! 

**បេក្ខជន (សុខា - បែកញើសតក់ៗ តែគិតលឿន):** អូ! បើលោកប្រធានលេងក្បាច់ Reflection... ខ្ញុំនឹងដាក់អន្ទាក់នៅក្នុង constructor តែម្តង! ខ្ញុំនឹងសរសេរលក្ខខណ្ឌ `if (instance != null) throw new RuntimeException("Stop hacking me!");`។ អញ្ចឹងទោះលោកប្រធានទម្លុះទ្វារចូលមក ក៏ត្រូវគ្រាប់បែកស្លាប់ខ្លួនឯងដែរ!

**អ្នកសម្ភាសន៍ (ញញឹមចុងមាត់):** ល្អ! ចុះបើខ្ញុំលេងក្បាច់ **Serialization** វិញ? ខ្ញុំយក Object Singleton របស់ប្អូន ទៅបម្លែងជា File រួចខ្ញុំ Deserialize (ទាញពី File មកជា Object វិញ)។ ម៉ាស៊ីន Java វានឹងបង្កើត Object កូនភ្លោះមួយទៀតដោយស្វ័យប្រវត្តិ! Singleton របស់ប្អូនរលាយម្តងទៀតហើយ!

**បេក្ខជន (សុខា - ញញឹមវិញ):** ខ្ញុំបានត្រៀមខ្លួនរួចហើយ! នៅក្នុង Java ដើម្បីទប់ទល់នឹង Serialization ខ្ញុំគ្រាន់តែសរសេរ Method វេទមន្តមួយឈ្មោះថា `readResolve()` ហើយប្រាប់វាឱ្យ `return instance;` ចាស់ទៅវិញ។ ពេល Deserialize វានឹងរត់ចូល Method នេះ ហើយបោះបង់ Object ថ្មីចោល! 

**អ្នកសម្ភាសន៍ (ទះដៃ):** អស្ចារ្យណាស់! ការពារបានទាំងក្បាច់ Reflection ទាំងក្បាច់ Serialization និង Thread-Safe ទៀត! ប៉ុន្តែកូដប្អូនឡើងវែងអន្លាយ... ចុះបើខ្ញុំប្រាប់ថា មានក្បាច់មួយដែលសរសេរតែមួយបន្ទាត់គត់ ហើយដោះស្រាយរឿងរញ៉េរញ៉ៃទាំង ៣ នេះដោយស្វ័យប្រវត្តិពីធម្មជាតិ តើប្អូនដឹងថាជាអ្វីទេ?

**បេក្ខជន (សុខា):** អូ! ខ្ញុំនឹកឃើញហើយ! គឺការប្រើប្រាស់ **`enum`** មែនទេលោកប្រធាន? សៀវភៅ Effective Java របស់លោក Joshua Bloch បានប្រាប់ថា `enum` គឺជាវិធីដែលល្អនិងមានសុវត្ថិភាពបំផុតសម្រាប់ការបង្កើត Singleton នៅក្នុង Java!

**អ្នកសម្ភាសន៍:** ត្រឹមត្រូវ! ប្អូនពិតជាយល់ដឹងស៊ីជម្រៅមែន មិនមែនចេះតែទន្ទេញៗនោះទេ។ អូខេ ត្រៀមខ្លួនប្រឈមមុខនឹងសំណួរបន្ទាប់!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ក្បាច់ទី១: Double-Checked Locking (ការពារបាន Thread តែបែកធ្លាយដោយ Reflection & Serialization)
public class TraditionalSingleton implements Serializable {
    private static volatile TraditionalSingleton instance;

    // ការពារការ Hack តាមរយៈ Reflection
    private TraditionalSingleton() {
        if (instance != null) {
            throw new RuntimeException("Stop hacking me with Reflection!");
        }
    }

    public static TraditionalSingleton getInstance() {
        if (instance == null) {
            synchronized (TraditionalSingleton.class) {
                if (instance == null) {
                    instance = new TraditionalSingleton();
                }
            }
        }
        return instance;
    }

    // ការពារការ Hack តាមរយៈ Serialization
    protected Object readResolve() {
        return getInstance();
    }
}

// ==========================================

// ក្បាច់ទី២: Enum Singleton (ក្បាច់កំពូលដែលអ្នកសម្ភាសន៍ចង់ឃើញ)
// ការពាររាល់បញ្ហាទាំងអស់ដោយស្វ័យប្រវត្តិពីធម្មជាតិរបស់ JVM!
public enum UltimateSingleton {
    INSTANCE; // នេះគឺជា Singleton Object តែមួយគត់!

    public void doSomething() {
        System.out.println("Enum Singleton is bulletproof!");
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំងរបស់បេក្ខជន:**
- យល់ដឹងច្បាស់ពីបញ្ហា Race Condition នៅក្នុងបរិស្ថាន Multi-threading (ចេះប្រើ `volatile` និង `synchronized`)។
- មិនតក់ស្លុតនឹងសេណារីយ៉ូបំផ្លិចបំផ្លាញ (Hacking scenarios) ដូចជា Reflection និង Serialization។
- ស្គាល់ Best Practices ចុងក្រោយ (ការប្រើ `enum` សម្រាប់ Singleton)។

❌ **ចំណុចខ្សោយ (Trap Question):**
- បេក្ខជនគួរតែរំលឹកពីបញ្ហា Anti-Pattern របស់ Singleton ផងដែរ (ដូចជាវាធ្វើឱ្យកូដពិបាកធ្វើ Unit Test ព្រោះវាជា Global State)។

**លទ្ធផល:** ឆ្លងកាត់! (Pass) អ្នកពិតជាស័ក្តិសមសរសេរកូដប្រព័ន្ធ Core Banking របស់ក្រុមហ៊ុនយើង!
