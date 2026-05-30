# វគ្គសម្ភាសន៍ការងារ: Flyweight (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #flyweight #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** ក្រុមហ៊ុនយើងកំពុងបង្កើតហ្គេមបាញ់ប្រហារមួយ។ ពេលគ្រាប់បែកផ្ទុះ វាបង្កើតកម្ទេចកម្ទី (Particles) ចំនួន ១លានដុំនៅលើអេក្រង់។ Object នីមួយៗមានផ្ទុក 3D Model, Color, Texture និងទីតាំង X, Y, Z និងល្បឿន V។ ពេល Run ហ្គេម RAM ឡើងដល់ 10GB ហើយគាំង (OutOfMemoryError)! តើប្អូនមានយុទ្ធសាស្ត្រអ្វីដើម្បីសង្គ្រោះហ្គេមនេះ?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះដោះស្រាយបានដោយប្រើប្រាស់ **Flyweight Pattern** សម្រាប់ការសន្សំសំចៃ Memory (RAM)។ 
ខ្ញុំសង្កេតឃើញថា ទិន្នន័យដូចជា 3D Model, Color និង Texture របស់កម្ទេចកម្ទី គឺ "ដូចគ្នាបេះបិទ" សម្រាប់គ្រប់ ១លានដុំ។ នេះគេហៅថា **Intrinsic State (រដ្ឋខាងក្នុង)**។ ចំណែកឯ X, Y, Z និង V គឺប្រែប្រួលរហូត ដែលហៅថា **Extrinsic State (រដ្ឋខាងក្រៅ)**។
ខ្ញុំនឹងដក Intrinsic State ចេញមកក្រៅ បង្កើតជា Object រួមមួយ (Flyweight Object) ហើយអោយកម្ទេចកម្ទីទាំង ១លាននោះ ចង្អុល (Reference) មកកាន់ Object រួមនេះតែមួយគត់! ចំណែកទីតាំង X, Y, Z ខ្ញុំទុកវានៅក្នុង Array ធម្មតា ឬបញ្ជូនវាជា Parameter នៅពេលគូរ (Render)។ ការធ្វើបែបនេះអាចទម្លាក់ RAM ពី 10GB មកសល់ត្រឹមរាប់សិប MB ប៉ុណ្ណោះ!

**អ្នកសម្ភាសន៍ (ញញឹម សួរអន្ទាក់):** អស្ចារ្យណាស់! ចុះបើមានកូដកំហូច ឬ Thread មួយចំនួន ព្យាយាមចូលទៅកែ Color នៅក្នុង Flyweight Object នោះ តើមានអ្វីកើតឡើងចំពោះកម្ទេចកម្ទី ១លានដុំនៅលើអេក្រង់?

**បេក្ខជន (សុខា - ឆ្លើយដោយភាពជឿជាក់):** បើមានគេកែបានមែន កម្ទេចកម្ទីទាំង ១លានដុំនឹងប្រែពណ៌ព្រមគ្នាក្នុងមួយប៉ប្រិចភ្នែក ធ្វើឱ្យហ្គេមមើលទៅចម្លែក (Visual Glitch)! 
ដូច្នេះ ច្បាប់មាសរបស់ Flyweight គឺ **"Intrinsic State ត្រូវតែ Immutable (មិនអាចកែប្រែបានជាដាច់ខាត)!"**។ ខ្ញុំនឹងប្រកាស Field ទាំងនោះជា `final` ហើយគ្មាន Method `Setter` ឡើយ! ប្រសិនបើប្រព័ន្ធចង់បានពណ៌ថ្មី ពួកគេត្រូវប្រើប្រាស់ `FlyweightFactory` ដើម្បីស្នើសុំ Object ថ្មីមួយទៀត ដែលមានពណ៌នោះ។

**អ្នកសម្ភាសន៍:** ចុះ Flyweight និង Singleton ខុសគ្នាយ៉ាងម៉េច? មើលទៅដូចជាការប្រើប្រាស់ Object តែមួយដូចគ្នា!

**បេក្ខជន (សុខា):** Singleton មាន Object តែមួយគត់ក្នុងប្រព័ន្ធទាំងមូល។ ចំណែក Flyweight មាន Factory ដែលអាចផ្ទុក Object រួមជា "ច្រើន" អាស្រ័យលើលក្ខណៈរបស់វា (ឧ. Flyweight សម្រាប់គ្រាប់កាំភ្លើងពណ៌ក្រហម, Flyweight សម្រាប់គ្រាប់កាំភ្លើងពណ៌ខៀវ)។

**អ្នកសម្ភាសន៍ (ងក់ក្បាល):** ឥតខ្ចោះ! ប្អូនយល់ពីស្នូលនៃការគ្រប់គ្រង Memory!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Flyweight Object (ផ្ទុកតែទិន្នន័យដែលដូចគ្នា - Intrinsic State)
public class ParticleType {
    // ត្រូវតែ Immutable! (final fields)
    private final String name;
    private final String color;
    private final byte[] textureImage;

    public ParticleType(String name, String color, byte[] textureImage) {
        this.name = name;
        this.color = color;
        this.textureImage = textureImage;
    }

    // Extrinsic State (x, y) ត្រូវបានបោះចូលពីខាងក្រៅ
    public void draw(int x, int y) {
        System.out.println("Drawing " + color + " " + name + " at (" + x + ", " + y + ")");
    }
}

// ២. Flyweight Factory (អ្នកគ្រប់គ្រងឃ្លាំងផ្ទុក Object រួម)
public class ParticleFactory {
    private static Map<String, ParticleType> cache = new HashMap<>();

    public static ParticleType getParticleType(String name, String color, byte[] texture) {
        String key = name + "_" + color;
        if (!cache.containsKey(key)) {
            cache.put(key, new ParticleType(name, color, texture)); // បង្កើតថ្មីបើគ្មាន
        }
        return cache.get(key); // ចែករំលែករបស់ចាស់
    }
}

// ៣. Context Object (ផ្ទុកតែទិន្នន័យប្រែប្រួល - Extrinsic State)
public class Particle {
    private int x, y;
    private ParticleType type; // ចង្អុលទៅកាន់ Object រួម (ស៊ី Memory តិចតួចបំផុត)

    public Particle(int x, int y, ParticleType type) {
        this.x = x; this.y = y; this.type = type;
    }

    public void draw() { type.draw(x, y); }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** ញែកដាច់រវាង Intrinsic និង Extrinsic State។ យល់ពីកម្លាំងពិតប្រាកដរបស់ Pattern នេះក្នុងការជួយសង្គ្រោះ RAM។ ដឹងពីភាពចាំបាច់នៃការប្រើប្រាស់ Immutability ដើម្បីការពារកុំឱ្យមាន Visual Glitch នៅពេល Object ត្រូវបានចែករំលែករាប់លានដង។
❌ **អន្ទាក់:** សួរអំពីការកែប្រែទិន្នន័យ Intrinsic State។ បេក្ខជនបានអះអាងយ៉ាងច្បាស់លាស់ថាវាជារឿងហាមឃាត់ និងបានប្រៀបធៀបយ៉ាងច្បាស់រវាង Flyweight និង Singleton។
