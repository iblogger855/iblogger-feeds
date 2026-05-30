# វគ្គគ្រូនិងសិស្ស: Strategy (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #strategy #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងសរសេរកូដគិតលុយអោយផ្សារទំនើបសាលា គេប្រើ `if (member) ... else if (vip) ... else if (holiday) ...` វែងអន្លាយ ស្រាប់តែលោកគ្រូយក្សដើរមកដល់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! កូដហែងនេះបើសិនជាសាលាថែមប្រូម៉ូសិន "បញ្ចុះតម្លៃសម្រាប់អ្នកសង្ហា" មួយទៀត តើហែងត្រូវទៅវាយ `if` មួយជាន់ទៀតមែនទេ?

**អាម៉ាប់:** បាទលោកគ្រូ! ខ្ញុំ `if` រហូត! បើមាន ១០០ ប្រូម៉ូសិន ខ្ញុំ `if` ១០០ ជាន់! កូដខ្ញុំប្រវែង ៥ គីឡូម៉ែត្រ!

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថាបំពានច្បាប់ OCP! បើកូដវែងអញ្ចឹង ពេលហែងកែខុសមួយកន្លែង វាគិតលុយភ្ញៀវខុសពេញផ្សារហើយ! គេត្រូវប្រើ **Strategy Pattern** វើយ!
គេត្រូវដក "រូបមន្តបញ្ចុះតម្លៃ" (Algorithm) នីមួយៗចេញមកក្រៅ សរសេរជា Class តូចៗដាច់ពីគ្នា! មួយ Class សម្រាប់ VIP, មួយ Class សម្រាប់ Holiday! ពេលភ្ញៀវមកដល់ ហែងគ្រាន់តែ "ដោត (Inject)" រូបមន្តហ្នឹងចូលទៅក្នុងម៉ាស៊ីនគិតលុយទៅ វាចប់ហើយ!

**អាម៉ាប់:** អូហូ! ដូចដោតកាសចូលទូរស័ព្ទអញ្ចឹង! ម៉ាស៊ីនគិតលុយ (Context) អត់ខ្វល់ទេអោយតែមានរន្ធដោត!
ចុះបើខ្ញុំជាកូនកំហូច... ខ្ញុំសរសេរ Class ថ្មីមួយឈ្មោះ `FreeDiscountStrategy` (បញ្ចុះតម្លៃ ១០០%) រួចខ្ញុំលួចដោតវាចូលទៅក្នុងម៉ាស៊ីនគិតលុយហ្នឹង តើផ្សារទំនើបសាលាមិនរលាយហិនហោចទេអីគ្រូ?

**លោកគ្រូយក្ស (សម្លក់):** បើម៉ាស៊ីនគិតលុយហ្នឹងវាបណ្តោយអោយហែងដោតចូលបានមែន វាប្រាកដជារលាយមែនហើយ ព្រោះ Context នៅក្នុង Strategy គឺវាងងឹតងងុល! វាទុកចិត្ត Strategy ដែលគេហុចអោយ ១០០%! 
ប៉ុន្តែ ក្នុងពិភពពិត ការដោត (Inject) មិនមែនស្ថិតក្នុងដៃអ្នកប្រើប្រាស់ (UI) ទេ! គេមានកម្មវិធី (Factory) នៅពីក្រោយខ្នង ជាអ្នកសម្រេចចិត្តថាត្រូវដោតយកអ្វីមកប្រើ! អញ្ចឹងទោះហែងខំប្រឹង Hack យ៉ាងណាក៏មិនបានស៊ី Free ដែរអាភ្លើ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. Strategy Interface (កិច្ចសន្យាសម្រាប់ការបញ្ចុះតម្លៃ)
public interface DiscountStrategy {
    double applyDiscount(double originalPrice);
}

// ២. Concrete Strategies (រូបមន្តបញ្ចុះតម្លៃនីមួយៗ)
public class NormalStrategy implements DiscountStrategy {
    public double applyDiscount(double price) { return price; } // មិនបញ្ចុះទេ!
}

public class VipStrategy implements DiscountStrategy {
    public double applyDiscount(double price) { return price * 0.8; } // បញ្ចុះ 20%
}

// យុទ្ធសាស្ត្រកំហូចរបស់អាម៉ាប់! (ត្រូវប្រយ័ត្ន)
public class FreeStrategy implements DiscountStrategy {
    public double applyDiscount(double price) { return 0.0; } // ស៊ីទទេ!
}

// ៣. Context (ម៉ាស៊ីនគិតលុយ ដែលរង់ចាំការដោតចូល)
public class CashRegister {
    private DiscountStrategy strategy;

    // រន្ធសម្រាប់ដោត Strategy
    public void setStrategy(DiscountStrategy strategy) {
        this.strategy = strategy;
    }

    public double checkout(double price) {
        if (strategy == null) return price; 
        return strategy.applyDiscount(price); // ធ្វើតាម Strategy ទាំងងងឹតងងុល!
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅសរសេរ Class បញ្ចុះតម្លៃ ៥០ ប្រភេទដាច់ពីគ្នា បើហ៊ានប្រើ `if-else` ទោះតែមួយដង ក៏គ្រូនឹងអោយធ្លាក់ដែរ!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កូដមាន `if/else` ឬ `switch` វែងអន្លាយក្នុងការជ្រើសរើស Algorithm (រូបមន្ត) ធ្វើអោយបំពាន Open/Closed Principle។
- **ដំណោះស្រាយ:** ផ្តាច់រូបមន្តនីមួយៗទៅជា Class ឯករាជ្យដែលហៅថា Strategy។ បន្ទាប់មកអនុញ្ញាតអោយ Object ស្នូល (Context) ទទួលយក Strategy ណាមួយមកដំណើរការនៅពេល Runtime ប្រកបដោយភាពបត់បែន។
