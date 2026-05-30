# Podcast: State (កិច្ចសន្ទនា Podcast ជុំវិញ State)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #state #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ថ្ងៃនេះយើងជជែកពី **State Pattern** ដែលផ្តោតលើការផ្លាស់ប្តូរឥរិយាបទពីខាងក្នុង។ ស្រមៃថាការបញ្ជាទិញមួយមានដំណាក់កាល៖ "Pending", "Paid", "Shipped" និង "Delivered"។ បើចង់ "Cancel" ពេល "Pending" គឺងាយស្រួល តែបើ "Shipped" ហើយ មិនអាច Cancel ទេព្រោះទំនិញនៅលើផ្លូវ។ 

**Host B (បូរិទ្ធ - អ្នករៀន):** បាទ! បើខ្ញុំសរសេរ `switch(state)` ឆែកនៅគ្រប់ Method ទាំងអស់ដូចជា `cancel()`, `ship()` វានឹងរញ៉េរញ៉ៃណាស់។ ខ្ញុំយល់ហើយថា State Pattern ដោះស្រាយដោយបំបែក State នីមួយៗទៅជា Class ដាច់ដោយឡែក (`PaidState`, `ShippedState`)។
តែសុំសួរឡប់ៗមួយបង! ចុះបើ... អតិថិជនគាត់ទិញទំនិញរួច ស្រាប់តែគាត់ Hack ប្តូរ State របស់គាត់ទៅជា "ខ្មោចលង" (`GhostState`) តើប្រព័ន្ធគិតលុយវានឹងបញ្ជូនទំនិញនោះទៅឋាននរកមែនទេបង?

**Host A (សិទ្ធិ):** ហាហា... បើលោកឯងបង្កើត `GhostState` ឱ្យវាដំណើរការមែន វានឹងទៅមែនហើយ! ប៉ុន្តែនៅក្នុង State Pattern អ្វីដែលល្អនោះគឺ "លំហូរនៃការផ្លាស់ប្តូរ State" ត្រូវបានចាក់សោរយ៉ាងតឹងរ៉ឹងនៅក្នុងកូដនៃ State នីមួយៗ (State Transitions)។
ឧទាហរណ៍ នៅក្នុង `PendingState` យើងសរសេរថាបើបង់លុយរួច វានឹងហៅ `order.setState(new PaidState())` ដោយខ្លួនវាផ្ទាល់។ អតិថិជនពីខាងក្រៅ មិនមានសិទ្ធិចូលមកបញ្ជា `setState` តាមចិត្តនោះទេ! ដូច្នេះទោះលោកឯងចង់ក្លាយជាខ្មោច ក៏ប្រព័ន្ធមិនអនុញ្ញាតដែរ! វាធានាថា State Machine នេះដំណើរការតាមផ្លូវដែលបានកំណត់ទុកជាមុន ១០០%។

**Host B (បូរិទ្ធ):** អូហូ! សុវត្ថិភាពខ្ពស់ណាស់បង! អញ្ចឹងមានន័យថា ឥរិយាបទ (Behavior) របស់ Order ផ្លាស់ប្តូរទាំងស្រុងនៅពេលដែល State ខាងក្នុងរបស់វាផ្លាស់ប្តូរដោយខ្លួនឯងមែនទេបង?

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! គ្មាន `switch` ឬ `if/else` ធំៗទៀតទេ។ លក្ខខណ្ឌទាំងអស់ត្រូវពង្រាយចូលទៅក្នុង State Class នីមួយៗរៀងៗខ្លួន។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. State Interface
public interface OrderState {
    void pay(Order order);
    void cancel(Order order);
}

// ២. Concrete States (ដំណាក់កាលនីមួយៗ)
public class PendingState implements OrderState {
    public void pay(Order order) {
        System.out.println("Payment successful.");
        // State ជាអ្នកប្តូរទៅ State បន្ទាប់ដោយខ្លួនឯង
        order.setState(new PaidState()); 
    }
    public void cancel(Order order) {
        System.out.println("Order cancelled easily.");
        order.setState(new CancelledState());
    }
}

public class PaidState implements OrderState {
    public void pay(Order order) {
        System.out.println("Already paid!"); 
    }
    public void cancel(Order order) {
        System.out.println("Refunding money... Order cancelled.");
        order.setState(new CancelledState());
    }
}

// ៣. Context (Object ស្នូល)
public class Order {
    private OrderState state;

    public Order() {
        this.state = new PendingState(); // ស្ថានភាពចាប់ផ្តើម
    }

    // គួរតែកំណត់សិទ្ធិត្រឹម Package-private ការពារបូរិទ្ធប្តូរជា GhostState
    void setState(OrderState state) { this.state = state; }

    public void pay() { state.pay(this); }
    public void cancel() { state.cancel(this); }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **លុបបំបាត់ State Machine ដ៏ស្មុគស្មាញ:** ប្តូរការសរសេរ `if/switch` ច្រើនជាន់ មកជា Object-oriented design វិញ។
- **Single Responsibility Principle:** ប្រមូលផ្តុំកូដដែលទាក់ទងនឹង State ជាក់លាក់ណាមួយ ដាក់ក្នុង Class តែមួយ។

**គុណវិបត្តិ (Cons):**
- **Class Explosion:** រាល់ State នីមួយៗតម្រូវឱ្យមាន Class ថ្មីមួយ ដែលអាច Overkill សម្រាប់ប្រព័ន្ធតូចតាច។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** Object មួយប្តូរឥរិយាបទអាស្រ័យលើស្ថានភាព (State) ហើយកូដពោរពេញដោយ `switch` វែងអន្លាយ។
- **ដំណោះស្រាយ:** បំបែក State នីមួយៗទៅជា Class ដាច់ដោយឡែក ហើយឱ្យ Object ស្នូល Delegate ការងារទៅកាន់ State នោះ។
