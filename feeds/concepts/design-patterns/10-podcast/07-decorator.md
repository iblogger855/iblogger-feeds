# Podcast: Decorator (កិច្ចសន្ទនា Podcast ជុំវិញ Decorator)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #decorator #structural #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! តើធ្លាប់ទិញកាហ្វេនៅហាងធំៗទេ? ដំបូងអ្នកទិញកាហ្វេសុទ្ធ (Black Coffee) លុះអ្នកចង់បន្ថែមទឹកដោះគោ វាទៅជា (Milk Coffee)។ បើអ្នកចង់ថែមស្ករ ថែមគ្រីម វាក្លាយជាកាហ្វេដែលមានឈ្មោះវែងអន្លាយ។ បើយើងប្រើ Inheritance ក្នុង OOP តើយើងត្រូវបង្កើត Class ប៉ុន្មានទៅសម្រាប់មុខម្ហូបកាហ្វេទាំងអស់នោះ?

**Host B (បូរិទ្ធ - អ្នករៀន):** អូហូ! ខ្ញុំច្បាស់ជាត្រូវបង្កើត `MilkCoffee`, `SugarCoffee`, `MilkSugarCoffee`, `MilkSugarCreamCoffee` ... វិលមុខស្លាប់ហើយបង! រាប់រយ Class!

**Host A (សិទ្ធិ):** ហ្នឹងហើយជាបញ្ហារបស់ Class Explosion! ដំណោះស្រាយគឺ **Decorator Pattern**។ គំនិតគឺ យើងមាន "កាហ្វេសុទ្ធ" ជា Object គោល (Component)។ រីឯ ទឹកដោះគោ ស្ករ គ្រីម សុទ្ធតែជា Object រុំពីក្រៅ (Decorators) ដែលមាន Interface ដូចគ្នានឹងកាហ្វេសុទ្ធដែរ។ ពេលគិតលុយ គ្រីមសួរទៅស្ករ ស្ករសួរទៅទឹកដោះគោ ទឹកដោះគោក៏សួរទៅកាហ្វេ រួចបូកលុយត្រលប់មកវិញ។

**Host B (បូរិទ្ធ):** សុំសួរឡប់ៗមួយបង! ចុះបើខ្ញុំយក "ក្រដាសកាដូ" ទៅរុំកាហ្វេហ្នឹង ១០០ ជាន់... រុំឡើងក្រាស់ រហូតដល់រកកាហ្វេខាងក្នុងអត់ឃើញ! តើវានឹងផ្ទុះ ឬក៏អ្នកផឹកហ្នឹងត្រូវខាំក្រដាសកាដូហ្នឹងស៊ីទៅបង?

**Host A (សិទ្ធិ):** ហាហា! សំណួរគួរឱ្យអស់សំណើច តែជាការពិតនៅក្នុងកូដ! បើលោកឯងយក `SugarDecorator` មករុំ `SugarDecorator` មករុំ `SugarDecorator` ១០០ ដង កូដវានៅតែដើរធម្មតា (មិនផ្ទុះទេ)! តែអ្នកដែលផ្ទុះគឺអ្នកញ៉ាំ (Client) ដែលត្រូវផឹកកាហ្វេផ្អែមស្លាប់ហ្នឹងឯង! នេះជាចំណុចពិសេសរបស់ Decorator គឺយើងអាចរុំវាចុះឡើងៗប៉ុន្មានជាន់ក៏បាន ហើយ Object ខាងក្រៅបំផុត ដើរតួជា "កាហ្វេ" ពេញលក្ខណៈសម្រាប់ Client យកទៅប្រើប្រាស់។ Client អត់ដឹងទេថាខាងក្នុងមានប៉ុន្មានជាន់ គេគ្រាន់តែហៅ `coffee.cost()` តែប៉ុណ្ណោះ។

**Host B (បូរិទ្ធ):** អូហូ! ឡូយមែន! មានន័យថាវាបត់បែនជាង Inheritance ឆ្ងាយណាស់ ព្រោះ Inheritance គឺកំណត់ថេរតាំងពីពេល Compile (Compile-time) ចំណែក Decorator គឺរុំបញ្ចូលគ្នានៅពេលកម្មវិធីកំពុងដើរ (Runtime)!

**Host A (សិទ្ធិ):** ត្រឹមត្រូវឥតខ្ចោះ! ឧទាហរណ៍ជាក់ស្តែង នៅក្នុង Java IO library គឺពោរពេញទៅដោយ Decorators ដូចជា `new BufferedReader(new InputStreamReader(new FileInputStream("data.txt")))`។ វារុំតៗគ្នាដើម្បីបន្ថែមមុខងារ Buffer ទៅឱ្យ File Stream នោះឯង!

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Component Interface
public interface Coffee {
    double getCost();
    String getDescription();
}

// ២. Concrete Component (Object គោល)
public class SimpleCoffee implements Coffee {
    public double getCost() { return 1.5; }
    public String getDescription() { return "Black Coffee"; }
}

// ៣. Base Decorator (រុំ Object ផ្សេងទៀតនៅខាងក្នុង)
public abstract class CoffeeDecorator implements Coffee {
    protected Coffee wrappedCoffee;

    public CoffeeDecorator(Coffee coffee) {
        this.wrappedCoffee = coffee;
    }

    public double getCost() { return wrappedCoffee.getCost(); }
    public String getDescription() { return wrappedCoffee.getDescription(); }
}

// ៤. Concrete Decorators (គ្រឿងផ្សំ)
public class MilkDecorator extends CoffeeDecorator {
    public MilkDecorator(Coffee coffee) { super(coffee); }

    public double getCost() { return super.getCost() + 0.5; }
    public String getDescription() { return super.getDescription() + ", Milk"; }
}

public class SugarDecorator extends CoffeeDecorator {
    public SugarDecorator(Coffee coffee) { super(coffee); }

    public double getCost() { return super.getCost() + 0.2; }
    public String getDescription() { return super.getDescription() + ", Sugar"; }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Flexibility:** អាចបន្ថែមឬដកមុខងារនៅពេល Runtime បានយ៉ាងងាយ។
- **Alternative to Inheritance:** ការពារ Class Explosion ដែលកើតឡើងដោយសារការបង្កើត Subclass ច្រើន។

**គុណវិបត្តិ (Cons):**
- **កូដមើលទៅរញ៉េរញ៉ៃ:** ពេលរុំគ្នាច្រើនជាន់ពេក ឧទាហរណ៍ `new A(new B(new C(new D())))` ធ្វើឱ្យកូដពិបាកអាន។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការប្រើប្រាស់ Subclasses ដើម្បីផ្សំមុខងារ បង្កើតបានជា Class រាប់សិបរយដែលមិនអាចថែទាំបាន។
- **ដំណោះស្រាយ:** រុំ Object ដោយប្រើ Decorator Classes ដែលអនុវត្តនូវ Interface ដូចគ្នា និងបោះបន្ត (Delegate) ការងារទៅ Object ដែលវាបានរុំ។
