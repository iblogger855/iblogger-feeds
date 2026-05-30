# Podcast: Prototype (កិច្ចសន្ទនា Podcast ជុំវិញ Prototype)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #prototype #creational #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តី! ថ្ងៃនេះយើងនឹងពិភាក្សាអំពី Creational Pattern ចុងក្រោយ គឺ **Prototype Pattern** ដែលនិយាយពីការ Clone (ថតចម្លង) Object។ ឧទាហរណ៍ដូចជាការ Clone សត្វចម្លែករាប់រយក្បាលក្នុងហ្គេម ដើម្បីសន្សំសំចៃពេលក្នុងការបង្កើតពីដំបូង (From scratch)។

**Host B (បូរិទ្ធ - អ្នករៀន):** អូ! ដូចការ Copy កោសិកាក្នុងជីវវិទ្យាអញ្ចឹងមែនទេបង? សុំសួរមួយ... ចុះបើខ្ញុំ Clone សត្វចម្លែក (Monster) មួយក្បាល ហើយសត្វចម្លែកនោះមានកាន់ "កាំភ្លើងបាញ់ឡាស៊ែរ" មួយដើម។ តើ Monster ថ្មីដែលកើតមកនោះ មានកាំភ្លើងថ្មី ឬក៏វាទៅដណ្តើមកាំភ្លើងរបស់ Monster ចាស់យកមកប្រើដែរ?

**Host A (សិទ្ធិ):** ហាហា សំណួរនេះត្រូវរឿងតែម្តង! វាអាស្រ័យលើក្បាច់ Copy របស់លោកឯង។ បើលោកឯងប្រើក្បាច់ **Shallow Copy** (ចម្លងរាក់ៗ) វាគ្រាន់តែ Copy "អាសយដ្ឋាន" របស់កាំភ្លើងនោះប៉ុណ្ណោះ។ មានន័យថា Monster ទាំងពីរ កំពុងកាន់កាំភ្លើងតែមួយដើម! បើ Monster ទីមួយបាញ់អស់គ្រាប់ Monster ទីពីរក៏ស្រែកយំអត់គ្រាប់បាញ់ដែរ! នេះជារឿងដ៏គ្រោះថ្នាក់បំផុតក្នុងការសរសេរកូដ។

**Host B (បូរិទ្ធ):** អូហូ! គ្រោះថ្នាក់ណាស់បង! អញ្ចឹងបើខ្ញុំចង់ឱ្យ Monster ម្នាក់មានកាំភ្លើងមួយដើមរៀងៗខ្លួន តើខ្ញុំត្រូវរៀបអូមន្តអាគមបែបណាទៅ?

**Host A (សិទ្ធិ):** លោកឯងត្រូវប្រើក្បាច់ **Deep Copy** (ចម្លងដល់ឫស)! គឺនៅក្នុង Method `clone()` របស់ Monster យើងមិនត្រឹមតែចម្លងខ្លួនប្រាណវាទេ តែយើងត្រូវប្រាប់វាឱ្យបង្កើតកាំភ្លើងថ្មីមួយទៀត `weapon.clone()` ហើយយកកាំភ្លើងថ្មីនោះមកពាក់ឱ្យ Monster ថ្មី។ មានន័យថាត្រូវចុះទៅចម្លងគ្រប់ជាន់ថ្នាក់នៃ Object ដែលមាន Reference ទៅកាន់របស់ផ្សេងទៀត។

**Host B (បូរិទ្ធ):** ចុះបើ... សត្វ Monster ហ្នឹង វាមានចិញ្ចឹម "សត្វឆ្កែ" មួយក្បាល ហើយ "សត្វឆ្កែ" ហ្នឹង វាស្រាប់តែមានម្ចាស់គឺ "Monster ហ្នឹងផ្ទាល់" វិញ? វវិលចុះវិលឡើងជារង្វង់! តើពេល Clone វាមានរឿងអ្វីកើតឡើង? តើម៉ាស៊ីនវាមិនគិតថា "ចម្លងឆ្កែ ឆ្កែចម្លងម្ចាស់ ម្ចាស់ចម្លងឆ្កែ..." រហូតដល់ផ្ទុះកុំព្យូទ័រទេអីបង?

**Host A (សិទ្ធិ):** អូហូយ លោកបូរិទ្ធ! នេះគេហៅថា "Circular Reference" ហើយវាពិតជាសុបិនអាក្រក់បំផុតរបស់ Prototype Pattern! ប្រសិនបើអ្នកប្រើ Deep Copy ធម្មតា វាប្រាកដជារត់វិលវល់ (Infinite Loop) ដល់ផ្ទុះម៉េមូរី (StackOverflowError) ពិតមែន។ ដើម្បីដោះស្រាយ អ្នកត្រូវមានបញ្ជីមួយ (Map) សម្រាប់កត់ត្រាថា "តើ Object នេះខ្ញុំធ្លាប់ Clone វាហើយឬនៅ?"។ បើធ្លាប់ហើយ គ្រាន់តែភ្ជាប់ Reference ទៅ Object នោះកុំឱ្យវា Clone ថែមទៀត។ រាងឈឺក្បាលបន្តិចហើយកន្លែងនេះ!

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Interface សម្រាប់ Prototype
public interface Prototype {
    Prototype clone(); // កិច្ចសន្យាអោយចម្លងខ្លួនឯង
}

// ២. Concrete Class
public class Monster implements Prototype {
    private int health;
    private Weapon currentWeapon; // កាំភ្លើងដែលអាចនាំរឿងក្តៅក្រហាយ

    public Monster(int health, Weapon weapon) {
        this.health = health;
        this.currentWeapon = weapon;
    }

    // Method ដែលជាអ្នកធ្វើការ Clone ដោយខ្លួនឯង
    @Override
    public Prototype clone() {
        // Deep Copy ដ៏ត្រឹមត្រូវ៖ ត្រូវ clone() ទាំង Weapon ផងដែរ
        // បើមិន clone ទេ ពួកវានឹងដណ្តើមកាំភ្លើងគ្នាបាញ់មិនខាន!
        Weapon clonedWeapon = (Weapon) this.currentWeapon.clone();
        
        return new Monster(this.health, clonedWeapon);
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Performance:** លឿនជាងការប្រើពាក្យ `new` ប្រសិនបើការបង្កើត Object ពីសូន្យទាមទារការទាញទិន្នន័យពី Database/Network យូរ។
- **Alternative to Inheritance:** ជួយកាត់បន្ថយការបង្កើត Subclass ព្រោះអ្នកគ្រាន់តែ Clone Object ហើយប្តូរតម្លៃវាបន្តិចបន្តួច។

**គុណវិបត្តិ (Cons):**
- **ភាពស្មុគស្មាញនៃ Circular Reference:** ដូចបូរិទ្ធសួរអញ្ចឹង ការចម្លង Object ដែលមានទិន្នន័យវិលវល់ គឺជាសុបិនអាក្រក់។
- **បញ្ហា Shallow Copy មិនដឹងខ្លួន:** អ្នកអភិវឌ្ឍន៍តែងតែភ្លេចធ្វើ Deep Copy សម្រាប់ Reference Fields ធ្វើឱ្យមាន Bug ចែករំលែកទិន្នន័យដោយមិនដឹងខ្លួន។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការបង្កើត Object ពីសូន្យមានភាពស្មុគស្មាញ និងប្រើប្រាស់ធនធានកុំព្យូទ័រច្រើន។
- **ដំណោះស្រាយ:** បង្កើតវត្ថុដើម (Prototype) មួយ ហើយផ្តល់សមត្ថភាពឱ្យវាអាចថតចម្លង (Clone) ខ្លួនឯងបាន។
