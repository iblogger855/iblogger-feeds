# វគ្គគ្រូនិងសិស្ស: Decorator (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #decorator #structural #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងអង្គុយសរសេរ Class រាប់សិប លោកគ្រូយក្សដើរមកមើល)*

**លោកគ្រូយក្ស:** អាម៉ាប់! គ្រាន់តែអញឱ្យសរសេរកូដលក់កាហ្វេសោះ ហែងសរសេរដល់ ៥០ Classes? `MilkCoffee`, `SugarCoffee`, `MilkSugarCoffee`, `MilkSugarCreamCoffee`... ហែងចង់បង្កើតវចនានុក្រមថ្មីមែនទេ?

**អាម៉ាប់:** បាទលោកគ្រូ! ក៏កាហ្វេមានច្រើនជម្រើសពេក អញ្ចឹងខ្ញុំប្រើ Inheritance (ការស្នងមរតក) បង្កើតកូនអោយវាគ្រប់ប្រភេទម៉ាឆ្ងាញ់ទៅ! បើថ្ងៃក្រោយមានថែម "គុជ" ខ្ញុំនឹងបង្កើត `MilkSugarCreamBobaCoffee` មួយទៀត!

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថា "Class Explosion" (ការផ្ទុះ Class) វើយ! ប្រើ Inheritance បែបនេះងាប់មិនខាន! គេត្រូវប្រើ **Decorator Pattern**! ហែងចាត់ទុក "កាហ្វេសុទ្ធ" ជាកាដូមួយ! ចំណែក ស្ករ ទឹកដោះគោ ជា "ក្រដាសរុំកាដូ"! ហែងចង់បានប៉ុន្មានជាន់ ហែងទាញវាមករុំពីក្រៅតៗគ្នាទៅវាចប់ហើយ!

**អាម៉ាប់ (អេះក្បាល):** អូ! រុំតៗគ្នាមែនទេលោកគ្រូ? ចុះបើខ្ញុំរោគចិត្ត... ខ្ញុំយក "ក្រដាសរុំទឹកដោះគោ" ទៅរុំកាហ្វេហ្នឹង ១០០ ជាន់... រុំឡើងក្រាស់ រហូតដល់រកកាហ្វេខាងក្នុងអត់ឃើញ! តើវានឹងផ្ទុះ ឬក៏អ្នកផឹកហ្នឹងត្រូវខាំក្រដាសកាដូស៊ីទៅលោកគ្រូ?

**លោកគ្រូយក្ស (សម្លក់មុខ):** បើហែងរុំកាហ្វេហ្នឹងជាមួយទឹកដោះគោ ១០០ដង កូដហែងអត់ផ្ទុះទេ តែអ្នកញ៉ាំនោះវានឹងរាករូសរហូតដល់ចូលពេទ្យ! នៅក្នុង Decorator ហែងអាចយករនាំង (Decorator) ប្រភេទដដែលមករុំពីលើខ្លួនឯងរាប់សិបជាន់ក៏បាន វាអត់មាន Error ទេ តែវានឹងបូកតម្លៃទឹកដោះគោ ១០០ដង ធ្វើអោយកាហ្វេមួយកែវនោះមានតម្លៃ ១លានដុល្លារ! អញ្ចឹងហើយ ការប្រើប្រាស់វាត្រូវប្រយ័ត្នកុំឱ្យរុំរញ៉េរញ៉ៃពេក!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. Component
interface Coffee {
    double cost();
}

// ២. Concrete Component (កាហ្វេសុទ្ធ)
class BlackCoffee implements Coffee {
    public double cost() { return 1.5; }
}

// ៣. Base Decorator (ក្រដាសរុំ)
abstract class CoffeeDecorator implements Coffee {
    protected Coffee wrappedCoffee;
    public CoffeeDecorator(Coffee coffee) { this.wrappedCoffee = coffee; }
    public double cost() { return wrappedCoffee.cost(); }
}

// ៤. Concrete Decorator (គ្រឿងផ្សំ)
class MilkDecorator extends CoffeeDecorator {
    public MilkDecorator(Coffee coffee) { super(coffee); }
    public double cost() { return super.cost() + 0.5; } // បូកលុយបន្ថែម
}

// កូដរបស់អាម៉ាប់ដែលចង់រុំទឹកដោះគោ ១០០ដង!
// Coffee myCoffee = new MilkDecorator(new MilkDecorator(new MilkDecorator(new BlackCoffee())));
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅរុំកាដូពិតៗអោយលោកគ្រូចំនួន ១០ជាន់ បើហ៊ានបន្លំថែម Class សូម្បីតែមួយ គ្រូនឹងអោយធ្លាក់!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការប្រើ Subclasses (Inheritance) ដើម្បីផ្សំមុខងារផ្សេងៗគ្នា បង្កើតបានជា Class រាប់សិបដែលហៅថា Class Explosion។
- **ដំណោះស្រាយ:** រុំ Object នោះដោយប្រើ Decorator Classes ពីខាងក្រៅ ដើម្បីបន្ថែមមុខងារនៅពេល Runtime ដោយមិនបាច់បង្កើត Class ច្រើន។
