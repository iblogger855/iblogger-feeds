# វគ្គសម្ភាសន៍ការងារ: Strategy (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #strategy #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** នៅក្នុងប្រព័ន្ធ Checkout របស់យើង ការគិតលុយ (Payment) មានលក្ខខណ្ឌច្រើនណាស់! បើបង់តាមកាត (Credit Card) មានក្បួនមួយ, បង់តាម ABA PAY មានក្បួនមួយ, បង់តាមសាច់ប្រាក់សុទ្ធមានក្បួនមួយ។ Developer មុនបានសរសេរ `if-else` ចំនួន ១០ ជាន់នៅក្នុងកន្លែងតែមួយ! តើប្អូនមានយុទ្ធសាស្ត្រអ្វីដើម្បីបំបែកភាពស្មុគស្មាញនេះ?

**បេក្ខជន (សុខា):** បាទ! ការសរសេរ `if-else` បំពានគោលការណ៍ Open/Closed Principle យ៉ាងធ្ងន់ធ្ងរ។ ខ្ញុំនឹងដោះស្រាយដោយប្រើ **Strategy Pattern**។
ខ្ញុំនឹង "ផ្តាច់" រូបមន្តបង់ប្រាក់នីមួយៗ (Algorithms) ទៅជា Class ដាច់ដោយឡែកពីគ្នា ដែលអនុវត្តតាម Interface តែមួយគឺ `PaymentStrategy`។ បន្ទាប់មក នៅក្នុងកូដ Checkout (Context) ខ្ញុំគ្រាន់តែទុកប្រអប់ទទេមួយសម្រាប់ទទួល Strategy នេះនៅពេល Runtime។ 
នៅពេលអតិថិជនរើស ABA រោងចក្រនឹងបញ្ជូន (Inject) `ABAPayStrategy` ទៅអោយ Checkout! បែបនេះ Checkout មិនបាច់ដឹងពីរបៀបកាត់លុយស្មុគស្មាញឡើយ។

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អណាស់! ចុះបើខ្ញុំជា Hacker កំហូចម្នាក់! ខ្ញុំសរសេរ Class ថ្មីមួយឈ្មោះ `CrazyHackerStrategy` ដែលមានរូបមន្ត "បង់ប្រាក់ 0 ដុល្លារ" ហើយខ្ញុំចាក់បញ្ចូល (Inject) Strategy នោះទៅឱ្យ Checkout Service របស់ប្អូនដោយផ្ទាល់ តើប្រព័ន្ធប្អូនមិនរលាយទេអី? តើ Checkout Service អាចទប់ស្កាត់ Strategy ក្លែងក្លាយនេះបានទេ?

**បេក្ខជន (សុខា - ញញឹមប្រុងប្រយ័ត្ន):** នេះជាចំណុចពិសេសមួយ! បើយើងនិយាយតាមទ្រឹស្តី Strategy Pattern សុទ្ធសាធ, នោះ Checkout Service (Context) គឺ "ងងឹតងងុល"! វាទទួលយកគ្រប់ Strategy ដែលគេហុចអោយ ហើយហៅ मेथड `pay()` ដោយឥតលក្ខខណ្ឌ។ ដូច្នេះ បើវាជា Hacker នោះវានឹងរលាយមែន!
ប៉ុន្តែ នៅក្នុងប្រព័ន្ធពិតប្រាកដ Client ខាងក្រៅ (UI) មិនមានសិទ្ធិ Inject Object Strategy ចូលមកដោយផ្ទាល់ទេ! ការជ្រើសរើស Strategy តែងតែត្រូវបានគ្រប់គ្រងដោយ **Factory Class** នៅផ្នែកខាងក្រោយ (Backend)។ Factory នោះនឹងឆែកលក្ខខណ្ឌសុវត្ថិភាព មុននឹងផលិត Strategy ត្រឹមត្រូវមួយបញ្ជូនទៅអោយ Context។

**អ្នកសម្ភាសន៍:** ចម្លើយតឹងរឹងល្អណាស់! ចុះតើ Strategy ខុសពី State Pattern យ៉ាងម៉េច បើមើលទៅវាបំបែក Class ដូចគ្នា?

**បេក្ខជន (សុខា):** 
- **Strategy:** Client (អ្នកហៅ) ជាអ្នក "ជ្រើសរើស" ថាតើត្រូវប្រើយុទ្ធសាស្ត្រមួយណា (ឧ. រើសយក ABA)។ 
- **State:** ការផ្លាស់ប្តូរ State ត្រូវបាន "គ្រប់គ្រងដោយខ្លួនវាផ្ទាល់" ពីខាងក្នុង (Internal Transitions) ស្របតាមលក្ខខណ្ឌ មិនមែន Client ជាអ្នកបញ្ជាអោយប្តូរនោះទេ។

**អ្នកសម្ភាសន៍ (ងក់ក្បាលពេញចិត្ត):** អស្ចារ្យ! ការបកស្រាយរវាង Pattern ទាំងពីរគឺត្រឹមត្រូវឥតខ្ចោះ!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Strategy Interface
public interface PaymentStrategy {
    boolean pay(double amount);
}

// ២. Concrete Strategies (យុទ្ធសាស្ត្រដាច់ដោយឡែក)
public class CreditCardStrategy implements PaymentStrategy {
    public boolean pay(double amount) {
        System.out.println("Paid $" + amount + " using Credit Card.");
        return true;
    }
}

public class ABAPayStrategy implements PaymentStrategy {
    public boolean pay(double amount) {
        System.out.println("Paid $" + amount + " using ABA PAY.");
        return true;
    }
}

// Strategy កំហូចរបស់ Hacker!
public class HackerStrategy implements PaymentStrategy {
    public boolean pay(double amount) {
        System.out.println("Hacked! Paid $0 instead of $" + amount);
        return true; 
    }
}

// ៣. Context (អ្នកយកទៅប្រើប្រាស់ - ងងឹតងងុល)
public class CheckoutService {
    private PaymentStrategy strategy;

    // ត្រូវមាន Factory ឬ Validation មុននឹងហៅ Method នេះ!
    public void setStrategy(PaymentStrategy strategy) {
        this.strategy = strategy;
    }

    public void processPayment(double amount) {
        if (strategy == null) throw new IllegalStateException("មិនទាន់រើសរបៀបបង់ប្រាក់ទេ!");
        strategy.pay(amount); // Delegation (បោះការងារអោយ Strategy)
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីការបំបាត់ `if-else` ដោយប្រើ Delegation។ យល់ពីទិដ្ឋភាពសុវត្ថិភាពដែល Context ងងឹតងងុល និងត្រូវការការការពារពី Factory។ បកស្រាយពីភាពខុសគ្នារវាង Strategy និង State បានច្បាស់លាស់។
❌ **អន្ទាក់:** សួរអំពីការ Inject Malicious Strategy។ បេក្ខជនបានពន្យល់ពីព្រំដែនសុវត្ថិភាពរវាង Frontend និង Backend បានយ៉ាងល្អ។
