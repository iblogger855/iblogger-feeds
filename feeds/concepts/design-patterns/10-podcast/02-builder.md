# Podcast: Builder (កិច្ចសន្ទនា Podcast ជុំវិញ Builder)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #builder #creational #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ថ្ងៃនេះយើងជជែកពីបញ្ហាមួយនៅពេលដែល Object មួយមាន Parameter ច្រើនពេក។ ធ្លាប់ឃើញកូដដែល `new User("Dara", 25, true, false, null, "PP", null, true)` ទេ?

**Host B (បូរិទ្ធ - អ្នករៀន):** អូហូ! ខ្ញុំស្អប់កូដហ្នឹងជាងគេ! `true, false, null` តើមានន័យថាម៉េច? ជួនកាលខ្ញុំបញ្ចូលខុសទីតាំង ធ្វើឱ្យ User អាយុ `true` ឆ្នាំ ហើយមានភេទជាលេខ `25` វិញក៏មាន! តើយើងអាចធ្វើម៉េចទៅបង?

**Host A (សិទ្ធិ):** ដំណោះស្រាយគឺ Builder Pattern! វាប្រៀបដូចជាយើងទៅកុម្ម៉ង់សាំងវិចនៅហាងអញ្ចឹង។ អ្នកមិនបាច់ស្រែកប្រាប់រាល់មុខម្ហូបក្នុងដង្ហើមតែមួយទេ។ អ្នកគ្រាន់តែប្រាប់ម្តងមួយៗ "យកសាច់គោ... មិនយកខ្ទឹមបារាំង... យកទឹកជ្រលក់"។ ចុងក្រោយ អ្នកលក់រៀបចំរួច ទើបហុចសាំងវិចនោះមក។ កូដក៏ដូចគ្នា យើងប្រើ Method Chaining ដូចជា `.name("Dara").age(25).build()`។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើខ្ញុំរោគចិត្ត... ខ្ញុំប្រាប់អ្នកលក់ថា "ខ្ញុំយកសាច់គោ តែអត់យកនំប៉័ងទេ! ហើយសុំថែមទឹកជ្រលក់ ១០០ ជាន់!" តើ Builder ព្រមធ្វើសាំងវិចឆ្កួតៗហ្នឹងឱ្យខ្ញុំអត់?

**Host A (សិទ្ធិ):** ហាហា សំណួរនេះឡូយ! នៅក្នុង Builder Pattern យើងមានអ្នកត្រួតពិនិត្យភាពឆ្កួតលីលាហ្នឹង (Validation)។ នៅពេលលោកឯងហៅពាក្យ `.build()` ចុងក្រោយគេ មុននឹង Builder ហុចសាំងវិចឱ្យ វាឆែកមើលសិន "អត់នំប៉័ងម៉េចហៅថាសាំងវិច? ទឹកជ្រលក់ ១០០ ជាន់ វាហូរប្រឡាក់ខោឥឡូវហើយ!" ពេលនោះ Builder នឹងគប់ `IllegalArgumentException` ចំកណ្តាលមុខលោកឯងតែម្តង! វាធានាថា Object ដែលចេញមក គឺអាចប្រើការបាន ១០០%។

**Host B (បូរិទ្ធ):** អូហូ! កាចមែនទែន! ចុះហេតុអ្វីខ្ញុំមិនប្រើ Setter ធម្មតាទៅ ដូចជា `user.setAge(25)`? ម៉េចចាំបាច់បង្កើត Inner Class Builder ធ្វើអីឱ្យវាវែងកូដ? 

**Host A (សិទ្ធិ):** បើលោកឯងប្រើ Setter មានន័យថា Object នោះកំពុងស្ថិតក្នុងសភាព "ពាក់កណ្តាលរួចរាល់" (Partially constructed)។ ចុះបើលោកឯង Set បានពាក់កណ្តាល ស្រាប់តែមាន Thread មួយទៀតលួចយក Object ហ្នឹងទៅប្រើបាត់? វានឹងក្លាយជាសាំងវិចមានសាច់ តែអត់នំប៉័ងហ្នឹងឯង! ប្រើ Builder គឺធានាបាននូវភាព "មិនអាចកែប្រែបាន" (Immutability)។ ពេល `build()` ចេញមកហើយ គឺកកថ្ម មិនអាចកែបានទៀតទេ។ សុវត្ថិភាពខ្ពស់!

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
public class Sandwich {
    private final boolean hasBread; // Immutable
    private final int sauceLayers;

    private Sandwich(Builder builder) {
        this.hasBread = builder.hasBread;
        this.sauceLayers = builder.sauceLayers;
    }

    public static class Builder {
        private boolean hasBread = true; // Default
        private int sauceLayers = 1;

        public Builder noBread() {
            this.hasBread = false;
            return this;
        }

        public Builder addSauce(int layers) {
            this.sauceLayers = layers;
            return this;
        }

        public Sandwich build() {
            // ការពារការកុម្ម៉ង់ឆ្កួតៗរបស់បូរិទ្ធ
            if (!hasBread) throw new RuntimeException("No bread? Are you crazy?");
            if (sauceLayers > 10) throw new RuntimeException("Too much sauce, bro!");
            return new Sandwich(this);
        }
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Readable & Expressive:** លុបបំបាត់បញ្ហាច្រឡំទីតាំង Parameter ជាពិសេសពពួក `boolean` ច្រើនជាន់។
- **Immutability:** Object ដែលបង្កើតចេញមកមានសុវត្ថិភាពខ្ពស់ មិនប្រែប្រួលតម្លៃ។

**គុណវិបត្តិ (Cons):**
- **Boilerplate Code ច្រើន:** ត្រូវសរសេរកូដ Class មួយបន្ថែមទៀត ដែលធ្វើឱ្យកូដវែងជាងមុន។ (អាចដោះស្រាយបានជាមួយ Lombok `@Builder`)។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** Constructor មាន Parameter ច្រើនពេក ធ្វើឱ្យកូដពិបាកអាន និងងាយច្រឡំ។
- **ដំណោះស្រាយ:** បំបែកការកំណត់ទិន្នន័យតាមរយៈ Builder រួចហៅ `build()` ដើម្បីទាញយក Object សុវត្ថិភាព។
