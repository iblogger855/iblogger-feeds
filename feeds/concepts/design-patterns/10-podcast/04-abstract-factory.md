# Podcast: Abstract Factory (កិច្ចសន្ទនា Podcast ជុំវិញ Abstract Factory)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #abstract-factory #creational #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តី! ថ្ងៃនេះយើងជជែកពី **Abstract Factory Pattern** ដែលផ្តោតលើការបង្កើត "ឈុត" នៃ Object។ បូរិទ្ធ បើអ្នកចង់ទិញគ្រឿងសង្ហារិមតុបតែងផ្ទះ តើអ្នកនឹងទិញកៅអីម៉ូដបុរាណ តែតុម៉ូដទំនើប (Modern) មកដាក់លាយគ្នាទេ?

**Host B (បូរិទ្ធ - អ្នករៀន):** អត់ទេបង! បើខ្ញុំរៀបម៉ូដទំនើប ខ្ញុំត្រូវទិញមួយឈុតទំនើបទាំងអស់។ តែសុំសួរឆ្កួតៗមួយចុះ បង! ចុះបើខ្ញុំរោគចិត្ត... ខ្ញុំចង់យកជើងតុម៉ូដបុរាណ មកវាយដែកគោលភ្ជាប់ជាមួយកៅអីម៉ូដទំនើប ហើយដាក់លើសាឡុងម៉ូដអវកាស តើ Abstract Factory អាចជួយទប់ស្កាត់ការរចនាដ៏មហាវិនាសកម្មនេះបានទេ?

**Host A (សិទ្ធិ):** ហាហា! គំនិតលោកឯងនេះពិតជាគ្រោះថ្នាក់ដល់សង្គមមែន! តែសំណាងល្អ Abstract Factory គឺបង្កើតមកដើម្បី "ទប់ស្កាត់" មនុស្សដូចលោកហ្នឹងឯង! 
Abstract Factory មិនមែនលក់ដាច់ដោយឡែកទេ គឺវាលក់ជាឈុត (Family of objects)។ ពេលកូដ Client ស្នើសុំគ្រឿងសង្ហារិម វានឹងហៅ `factory.createChair()` និង `factory.createTable()`។ ប្រសិនបើប្រព័ន្ធកំណត់ថា Factory នោះគឺជា `ModernFurnitureFactory` នោះអ្វីដែលវាបញ្ចេញមក សុទ្ធតែម៉ូដ Modern ទាំងអស់។ លោកឯងគ្មានសិទ្ធិទៅយក `VictorianTable` ពី Factory ផ្សេងមកលាយចូលគ្នាឡើយ!

**Host B (បូរិទ្ធ):** អូហូ! ផ្តាច់ការមែនទែនបង! អញ្ចឹងមានន័យថា បើក្នុងកូដ កម្មវិធីរត់លើ Windows វាប្រាកដជានឹងប្រើ `WindowsFactory` ដែលផលិតចេញមកសុទ្ធតែ Windows Button និង Windows Checkbox ដោយគ្មានលាយឡំ Mac Button ឡើយមែនទេ?

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! Client Code មិនដឹងសោះឡើយថាវាកំពុងប្រើ Button អ្វី វាគ្រាន់តែស្គាល់ Interface ប៉ុណ្ណោះ។ 

**Host B (បូរិទ្ធ):** ចុះបើថ្ងៃមួយ... ខ្ញុំចង់កុម្ម៉ង់ "កូនជ្រូកសន្សំលុយ" បន្ថែមនៅក្នុងឈុតគ្រឿងសង្ហារិមនោះ តើរោងចក្រ Abstract Factory ហ្នឹងព្រមធ្វើឱ្យខ្ញុំអត់?

**Host A (សិទ្ធិ):** ហ្នឹងហើយជាចំណុចខ្សោយដ៏ធំបំផុតរបស់វា! បើអ្នកចង់ថែម `createPiggyBank()` មួយ នោះរឿងធំហើយ! អ្នកត្រូវចូលទៅកែ Interface របស់ Abstract Factory មេ រួចត្រូវរត់ទៅកែរាល់កូន Factory ទាំងអស់ (Modern, Victorian, Space) ឱ្យចេះផលិតកូនជ្រូកសន្សំលុយហ្នឹង។ វាបំពាន Open/Closed Principle យ៉ាងធ្ងន់ធ្ងរ! ដូច្នេះគេប្រើយុទ្ធសាស្ត្រនេះ ទាល់តែគេប្រាកដថា "ផលិតផលក្នុងឈុត" មានចំនួនថេរ មិនសូវប្រែប្រួលទេ។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Interfaces សម្រាប់ផលិតផលនីមួយៗ
public interface Chair { void sitOn(); }
public interface Table { void putThingsOn(); }

// ២. Concrete Products (ឈុត Modern)
public class ModernChair implements Chair { ... }
public class ModernTable implements Table { ... }

// ៣. Abstract Factory Interface
public interface FurnitureFactory {
    Chair createChair();
    Table createTable();
    // បើថែម createPiggyBank() ទីនេះ, រាល់រោងចក្រទាំងអស់ត្រូវតែកែប្រែកូដ!
}

// ៤. Concrete Factory (រោងចក្ររារាំងមហាវិនាសកម្មរបស់បូរិទ្ធ)
public class ModernFurnitureFactory implements FurnitureFactory {
    public Chair createChair() { return new ModernChair(); }
    public Table createTable() { return new ModernTable(); }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **ធានាភាពស៊ីសង្វាក់គ្នា (Consistency):** ការពារអ្នកអភិវឌ្ឍន៍មិនឱ្យលាយឡំ Object ខុសប្រភេទចូលគ្នា។
- **Loose Coupling:** Client Code ធ្វើការជាមួយ Interface ងាយស្រួលផ្លាស់ប្តូរឈុតទាំងមូល។

**គុណវិបត្តិ (Cons):**
- **រឹងរូសចំពោះការបន្ថែមផលិតផលថ្មី:** បើចង់បន្ថែមប្រភេទផលិតផលថ្មីក្នុងឈុត ត្រូវកែប្រែ Interface មេ និង Factory កូនៗទាំងអស់។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** កម្មវិធីត្រូវបង្កើតកញ្ចប់វត្ថុផ្សេងៗ (Families of related objects) ដែលការយកទៅលាយឡំគ្នានឹងបង្កកំហុស។
- **ដំណោះស្រាយ:** បង្កើត Abstract Factory Interface ដើម្បីកំណត់នាមវលីនៃផលិតផលក្នុងឈុត រួចប្រើ Concrete Factories ផ្គត់ផ្គង់ផលិតផលទាំងនោះ។
