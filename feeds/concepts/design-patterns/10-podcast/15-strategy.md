# Podcast: Strategy (កិច្ចសន្ទនា Podcast ជុំវិញ Strategy)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #strategy #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងជជែកពី **Strategy Pattern** ដែលល្បីក្នុងការកាត់បន្ថយ `if/else` រញ៉េរញ៉ៃ។ ឧទាហរណ៍ ក្នុងផ្សារទំនើប៖ អតិថិជនធម្មតាគិតតម្លៃពេញ សមាជិកបញ្ចុះ ១០% ទិញដុំបញ្ចុះ ១៥%។ បើសរសេរ `if/else` ក្នុង Method គិតលុយ វានឹងវែងអន្លាយ ហើយបំពាន Open/Closed Principle។

**Host B (បូរិទ្ធ - អ្នករៀន):** ហ្នឹងហើយបង! Strategy Pattern ដោះស្រាយដោយ "ផ្តាច់" រូបមន្តបញ្ចុះតម្លៃនីមួយៗ ទៅជា Class ដាច់ដោយឡែក (Strategy) ដែលអនុវត្ត Interface តែមួយ។ ហើយ Checkout Service (Context) គ្រាន់តែទទួលយក Strategy នោះមកប្រើ។ 
តែសុំសួរមួយបង... ចុះបើខ្ញុំជា Hacker កំហូចម្នាក់! ខ្ញុំសរសេរ Class ថ្មីមួយឈ្មោះ `CrazyHackerDiscount` ដែលមានរូបមន្ត "បញ្ចុះតម្លៃ 100%" (Free យកទទេៗតែម្តង) ហើយខ្ញុំចាក់បញ្ចូល (Inject) Strategy នោះទៅឱ្យ Checkout Service។ តើផ្សារទំនើបហ្នឹងមិនរលាយហិនហោចទេអីបង?

**Host A (សិទ្ធិ):** ហាហា... សំណួរនេះពិតជាគ្រោះថ្នាក់ដល់សេដ្ឋកិច្ចមែន! បើយើងនិយាយពីទិដ្ឋភាព Strategy Pattern គឺ Checkout Service វានឹង "ទទួលយកដោយសេចក្តីត្រេកអរ" ហើយវាគិតលុយលោកឯង 0$ ពិតមែន! ព្រោះ Checkout Service លែងខ្វល់ថាខាងក្នុង Strategy នោះសរសេរអីហើយ វាគោរពតាមការចាក់បញ្ចូល (Delegation) ទាំងស្រុង។ 
ទោះជាយ៉ាងណា នៅក្នុងពិភពពិត ការជ្រើសរើសថា "ត្រូវយក Strategy មួយណាមកចាក់បញ្ចូល" គឺមិនមែនស្ថិតក្នុងដៃអ្នកប្រើប្រាស់នោះទេ តែស្ថិតនៅក្នុង System ខាងក្រោយ (Business Logic/Factory) ដែលមានសិទ្ធិត្រួតពិនិត្យភាពត្រឹមត្រូវជាមុនសិន។

**Host B (បូរិទ្ធ):** ហាហា អញ្ចឹងខ្ញុំលួចមិនបានសម្រេចទេ! តែឡូយមែនទែន ដែលយើងអាចប្តូរ Strategy ទាំងនេះនៅពេល Runtime បាន។ ដូចជារើស J&T ឬ វីរៈប៊ុនថាំ ក្នុងការដឹកជញ្ជូន ដោយមិនបាច់បញ្ឈប់កម្មវិធីអញ្ចឹង។

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! Strategy អនុញ្ញាតឱ្យផ្លាស់ប្តូរឥរិយាបទរបស់ Object នៅពេលកម្មវិធីកំពុងដំណើរការ ដោយគ្រាន់តែប្តូរ Reference ទៅកាន់ Strategy មួយទៀត។ វាមានប្រយោជន៍ខ្លាំងណាស់ក្នុងការសរសេរកូដដែលស្អាត និងងាយស្រួលធ្វើតេស្ត (Unit Testing)។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Strategy Interface
public interface DiscountStrategy {
    double applyDiscount(double rawAmount);
}

// ២. Concrete Strategies (រូបមន្តផ្សេងៗគ្នា)
public class NormalPricing implements DiscountStrategy {
    public double applyDiscount(double rawAmount) { return rawAmount; }
}
public class MemberDiscount implements DiscountStrategy {
    public double applyDiscount(double rawAmount) { return rawAmount * 0.90; } // ដក 10%
}
public class HackerDiscount implements DiscountStrategy {
    public double applyDiscount(double rawAmount) { return 0.0; } // ផ្សាររលាយ!
}

// ៣. Context (អ្នកយកទៅប្រើប្រាស់)
public class CheckoutCart {
    private DiscountStrategy strategy; 
    private double amount;

    public CheckoutCart(double amount) { this.amount = amount; }

    // អនុញ្ញាតឱ្យផ្លាស់ប្តូរ Strategy ពេល Runtime
    public void setStrategy(DiscountStrategy strategy) {
        this.strategy = strategy;
    }

    public double calculateFinalPrice() {
        if (strategy == null) return amount;
        return strategy.applyDiscount(amount); // Delegation
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **គោរព OCP:** អាចបន្ថែម Algorithm ថ្មីៗដោយមិនប៉ះពាល់កូដចាស់។
- **កាត់បន្ថយ `if/else`:** លុបបំបាត់ការសរសេរលក្ខខណ្ឌវែងអន្លាយ។
- **Swap at Runtime:** អនុញ្ញាតឱ្យផ្លាស់ប្តូរឥរិយាបទនៅពេលកម្មវិធីកំពុងដំណើរការ។

**គុណវិបត្តិ (Cons):**
- **Client ត្រូវយល់ដឹងច្រើន:** Client Code ត្រូវដឹងច្បាស់ថា Strategy មួយណាធ្វើអ្វី ទើបអាចជ្រើសរើសបញ្ជូនទៅឱ្យ Context បាន។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** កូដមាន `if/else` ច្រើនជាន់ដើម្បីជ្រើសរើសរូបមន្ត។
- **ដំណោះស្រាយ:** បំបែកក្បួនដោះស្រាយ (Algorithm) ទៅជា Class ដាច់ដោយឡែក ហើយបញ្ជូន (Inject) ទៅឱ្យ Context ប្រើប្រាស់។
