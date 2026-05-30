# វគ្គសម្ភាសន៍ការងារ: State (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #state #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងកំពុងសរសេរកម្មវិធី Vending Machine។ វាមានស្ថានភាព (States) ច្រើនណាស់: មានលុយ, គ្មានលុយ, អស់ឥវ៉ាន់, កំពុងបញ្ចេញឥវ៉ាន់។ កូនចៅខ្ញុំម្នាក់ៗសរសេរកូដប្រើ `switch-case` នៅគ្រប់ Method ទាំងអស់ (insertCoin, pressButton, dispense)។ ពេលបន្ថែម State ថ្មី "កំពុងថែទាំ (Maintenance)" ពួកគេត្រូវរត់ទៅថែម `case` នៅរាប់សិបកន្លែង ធ្វើអោយកូដធ្លាយកំហុសរហូត! តើប្អូនមានយោបល់យ៉ាងណា?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះគឺជារោគសញ្ញានៃ "Finite State Machine (FSM) Spaghettification"! ខ្ញុំនឹងប្រើប្រាស់ **State Pattern** ដើម្បីវះកាត់វា។
ខ្ញុំនឹងបំបែក State នីមួយៗ (គ្មានលុយ, មានលុយ, អស់ឥវ៉ាន់) អោយទៅជា Class ឯករាជ្យដាច់ពីគ្នា ដែល Implement Interface `VendingMachineState` តែមួយ។ ម៉ាស៊ីន (Context) គ្រាន់តែរក្សាទុក Reference ទៅកាន់ State បច្ចុប្បន្ន។ ពេលមានគេចុចប៊ូតុង ម៉ាស៊ីនមិនបាច់ឆែក `if-else` ទេ វាគ្រាន់តែបោះបន្ត (Delegate) ការងារនោះទៅអោយ State បច្ចុប្បន្នជាអ្នកចាត់ចែង ហើយ State នោះក៏មានសិទ្ធិផ្លាស់ប្តូរ (Transition) ម៉ាស៊ីនទៅកាន់ State បន្ទាប់ដោយខ្លួនឯងដែរ។ បើចង់ថែម State ថ្មី ខ្ញុំគ្រាន់តែបង្កើត Class ថ្មីមួយជាការស្រេច (គោរព OCP)!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អណាស់! ប៉ុន្តែការប្តូរ State ញឹកញាប់ មានន័យថាប្អូនត្រូវបង្កើត Object ថ្មី ( `new HasMoneyState()`, `new NoMoneyState()` ) រាប់ពាន់ដងក្នុងមួយនាទីពេលម៉ាស៊ីនដំណើរការ។ តើវាមិនស៊ី Memory និងធ្វើអោយ Garbage Collector ធ្វើការធ្ងន់ទេឬ?

**បេក្ខជន (សុខា - ញញឹម):** នេះជាបញ្ហា Performance មួយដែលតែងកើតមាន! ប្រសិនបើ State Objects របស់យើងមិនមានទិន្នន័យផ្ទាល់ខ្លួន (No instance variables / Stateless) នោះយើងមិនបាច់បង្កើតវាថ្មីរាល់ដងទេ។ យើងអាចរួមបញ្ចូល State Pattern ជាមួយ **Singleton Pattern** ឬប្រើប្រាស់ **Flyweight Pattern** ដើម្បីសន្សំទុក State Object នីមួយៗជាលក្ខណៈ Global ឬ Static។ ពេលម៉ាស៊ីនចង់ប្តូរ State វាគ្រាន់តែចង្អុលទៅកាន់ Shared Instance ទាំងនោះទៅ វាលែងស៊ី Memory ទៀតហើយ!

**អ្នកសម្ភាសន៍:** ចម្លើយកម្រិតខ្ពស់! ចុះរវាងការអនុញ្ញាតអោយ State Class នីមួយៗជាអ្នក "សម្រេចចិត្តប្តូរ State (Transition)" និង ការអោយ Context (ម៉ាស៊ីន) ជាអ្នកប្តូរ តើមួយណាល្អជាង?

**បេក្ខជន (សុខា):** 
- បើយើងអោយ State ជាអ្នកប្តូរ វាជួយអោយកូដ Context ស្រឡះល្អ តែ State Classes នឹងជាប់ទាក់ទងគ្នា (Coupling) ព្រោះវាត្រូវស្គាល់គ្នាទៅវិញទៅមក។
- បើយើងអោយ Context ជាអ្នកប្តូរ (Centralized transition) States លែងស្គាល់គ្នា តែ Context នឹងក្លាយទៅជាអ្នកផ្ទុក Logic ស្មុគស្មាញ (ជិតក្លាយជា God Object វិញ)។
ភាគច្រើននៅក្នុង State Pattern ស្តង់ដារ យើងអនុញ្ញាតអោយ State Classes ជាអ្នកផ្លាស់ប្តូរ Transition ព្រោះវាកាត់បន្ថយភាពស្មុគស្មាញនៅកណ្តាលបានច្រើនជាង។

**អ្នកសម្ភាសន៍ (ងក់ក្បាល):** វិភាគបានស៊ីជម្រៅមែនទែន! 

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. State Interface (កិច្ចសន្យាដែលរាល់ State ត្រូវតែគោរព)
public interface State {
    void insertCoin();
    void pressButton();
    void dispense();
}

// ២. Concrete State (ស្ថានភាព "អត់លុយក្នុងម៉ាស៊ីន")
public class NoCoinState implements State {
    private VendingMachine machine; // កាន់ Reference ទៅកាន់ម៉ាស៊ីន ដើម្បីប្តូរ State វានៅពេលក្រោយ

    public NoCoinState(VendingMachine machine) { this.machine = machine; }

    public void insertCoin() {
        System.out.println("Coin inserted.");
        machine.setState(machine.getHasCoinState()); // ប្តូរស្ថានភាពម៉ាស៊ីន!
    }

    public void pressButton() { System.out.println("Please insert a coin first."); }
    public void dispense() { System.out.println("No coin, no product."); }
}

// ៣. Context (ម៉ាស៊ីន - លែងមាន Switch-Case ទៀតហើយ!)
public class VendingMachine {
    private State hasCoinState;
    private State noCoinState;
    
    private State currentState; // ចង្អុលទៅ State មួយណាដែលកំពុងសកម្ម

    public VendingMachine() {
        noCoinState = new NoCoinState(this); // ប្រើ Shared instances ដើម្បីកុំអោយ new រាល់ដង
        hasCoinState = new HasCoinState(this);
        currentState = noCoinState; // ចាប់ផ្តើមមកគឺអត់លុយ
    }

    public void setState(State state) { this.currentState = state; }
    
    // Delegation (បោះអោយ State បច្ចុប្បន្នជាអ្នកគិតគូរ)
    public void insertCoin() { currentState.insertCoin(); }
    public void pressButton() { currentState.pressButton(); }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីការបំបាត់ `Switch-Case` ដ៏សាហាវដោយប្រើ State Pattern។ បកស្រាយពីដំណោះស្រាយ Performance (Singleton/Flyweight) និងផ្តល់ទម្ងន់ត្រឹមត្រូវរវាងការដាក់ Transition Logic នៅក្នុង State ទល់នឹង Context។
❌ **អន្ទាក់:** សួរពីបញ្ហានៃការបង្កើត Object រាប់ពាន់ដង។ បេក្ខជនបានផ្តល់ចម្លើយយ៉ាងមុតស្រួចដោយប្រើ Singleton សម្រាប់ Stateless objects។
