# Podcast: Proxy (កិច្ចសន្ទនា Podcast ជុំវិញ Proxy)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #proxy #structural #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តី! ថ្ងៃនេះយើងជជែកពី **Proxy Pattern**។ បូរិទ្ធ ធ្លាប់ឃើញប្រធានក្រុមហ៊ុនធំៗ មានអង្គរក្ស ឬលេខាផ្ទាល់ខ្លួន ដែលចាំទទួលភ្ញៀវជំនួសពួកគេទេ? 

**Host B (បូរិទ្ធ - អ្នករៀន):** ធ្លាប់តើបង! យើងមិនអាចដើរចូលទៅជួបប្រធានក្រុមហ៊ុនដោយផ្ទាល់បានទេ។ លេខាជាអ្នកសួរនាំគោលបំណង បើចាំបាច់ទើបគាត់ឱ្យចូលជួបមេ។ តើនេះទាក់ទងអ្វីនឹងកូដទៅបង?

**Host A (សិទ្ធិ):** នេះហើយគឺជា Proxy! ពេលខ្លះ Object មួយ (ដូចជា Database ឬ Network) គឺ "ធ្ងន់ធ្ងរ" ឬ "សំខាន់ពេក" ក្នុងការឱ្យគេចូលប្រើដោយសេរី។ យើងបង្កើត Proxy Class មួយមកឈរនៅពីមុខវា ជាអ្នកតំណាង។ Proxy អាចធ្វើជា Protection Proxy (ឆែកសិទ្ធិ), Caching Proxy (ថតចម្លងទិន្នន័យមិនឱ្យរំខានមេញឹកញាប់) ឬ Virtual Proxy (ពន្យារពេលបង្កើតមេរហូតទាល់តែត្រូវការចាំបាច់)។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើអង្គរក្ស (Proxy) ហ្នឹង... គាត់ស៊ីសំណូកពីភ្ញៀវ! ហើយគាត់បើកទ្វារឱ្យភ្ញៀវចូលទៅវាយប្រធានក្រុមហ៊ុន (Real Object) ដល់ក្នុងបន្ទប់ តើការពារម៉េចទៅបង?

**Host A (សិទ្ធិ):** ហាហា សំណួរនេះចាក់ដោតផ្នែក Security តែម្តង! បើ Proxy "ស៊ីសំណូក" មានន័យថាកូដនៅក្នុង Method របស់ Proxy (ឧទាហរណ៍ `checkAccess()`) សរសេរខ្សោយ (Buggy)។ ប្រសិនបើ Client (ភ្ញៀវ) អាច Bypass ឆ្លងកាត់ Proxy នេះបាន វានឹងទៅវាយប្រហារ Database ពិតមែន! 
ទោះយ៉ាងណា ដោយសារ Proxy មាន Interface ដូចគ្នាបេះបិទនឹង Object ពិត ដូច្នេះ Client គិតថាវាកំពុងនិយាយជាមួយ Object ពិត។ ដើម្បីការពារអង្គរក្សស៊ីសំណូក យើងត្រូវសរសេរ Logic ក្នុង Proxy ឱ្យបានតឹងរ៉ឹងបំផុត! អ្វីដែលសំខាន់ គឺ Client ខាងក្រៅមិនដែលស្គាល់ Object ពិតនោះទេ គឺស្គាល់តែ Proxy ហ្នឹងឯង ព្រោះ Proxy ជាអ្នកសាងសង់ (Instantiate) Object ពិតដោយខ្លួនឯង!

**Host B (បូរិទ្ធ):** យល់ច្បាស់តែម្តង! ចុះវាខុសគ្នាពី Decorator យ៉ាងម៉េចទៅបង បើមើលទៅដូចជារុំព័ទ្ធ Object ពីក្រៅដូចគ្នា?

**Host A (សិទ្ធិ):** នេះជាចំណុចដែលគេតែងច្រឡំ។ 
- **Decorator:** Client ជាអ្នក "យកក្រដាសកាដូមករុំកាហ្វេ" (Client injects the object) ក្នុងគោលបំណង "បន្ថែមមុខងារ"។
- **Proxy:** Client "អត់ដឹងខ្លួនទេ" ថាខ្លួនកំពុងនិយាយជាមួយអ្នកតំណាង ព្រោះ Proxy គ្រប់គ្រងវដ្តជីវិត (Lifecycle) របស់ Object ពិតដោយខ្លួនឯងតាំងពីដើមទី ដើម្បី "គ្រប់គ្រងសិទ្ធិចូលប្រើប្រាស់"។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Subject Interface
public interface VideoDownloader {
    Video getVideo(String videoId);
}

// ២. Real Subject (ប្រធានក្រុមហ៊ុនដែលរវល់ខ្លាំង)
public class RealVideoDownloader implements VideoDownloader {
    public Video getVideo(String videoId) {
        System.out.println("Downloading massive video file...");
        return new Video(videoId);
    }
}

// ៣. Proxy (លេខា / អង្គរក្ស)
public class CachedVideoDownloader implements VideoDownloader {
    private RealVideoDownloader realDownloader;
    private Map<String, Video> cache = new HashMap<>();

    // Proxy បង្កើត និងគ្រប់គ្រង Real Object ដោយខ្លួនឯង (មិនមែន Client ហុចឱ្យទេ)
    public CachedVideoDownloader() {
        this.realDownloader = new RealVideoDownloader();
    }

    @Override
    public Video getVideo(String videoId) {
        // ធ្វើការងារមួយចំនួន "មុន" ពេលបញ្ជូនបន្ត (Caching Proxy)
        if (!cache.containsKey(videoId)) {
            // បើមិនមានក្នុង Cache ទើបទៅរំខាន Object ពិត
            Video video = realDownloader.getVideo(videoId);
            cache.put(videoId, video);
        } else {
            System.out.println("Returning video from Cache! No need to bother the Boss!");
        }
        
        return cache.get(videoId);
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **ការគ្រប់គ្រងដោយមិនដឹងខ្លួន:** គ្រប់គ្រង (ការពារ, Caching, Lazy load) Object ពិតដោយមិនបាច់ឱ្យ Client ដឹងខ្លួន។
- **សុវត្ថិភាពខ្ពស់:** អាចប្រើសម្រាប់ការពារកុំឱ្យមានការវាយប្រហារផ្ទាល់ទៅកាន់ Object រសើប។

**គុណវិបត្តិ (Cons):**
- **ការកើនឡើង Class:** ត្រូវបង្កើត Class ថ្មីៗច្រើន អាចធ្វើឱ្យកូដស្មុគស្មាញ។
- **ភាពយឺតយ៉ាវ (Latency):** ការបន្ថែមស្រទាប់មួយទៀតនៅពីមុខ អាចធ្វើឱ្យប្រតិបត្តិការមួយចំនួនយឺតជាងមុនបន្តិច។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការទាក់ទងផ្ទាល់ទៅកាន់ Object ដ៏ធ្ងន់ ឬមានសុវត្ថិភាព អាចធ្វើឱ្យប្រព័ន្ធយឺត ឬគ្រោះថ្នាក់។
- **ដំណោះស្រាយ:** បង្កើត Proxy Object ដែលដើរតួជាអ្នកតំណាង (Surrogate) ដើម្បីទប់ទល់ ត្រួតពិនិត្យ ឬថែរក្សា Object ពិតប្រាកដ។
