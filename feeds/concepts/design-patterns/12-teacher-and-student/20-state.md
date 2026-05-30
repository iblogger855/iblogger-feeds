# វគ្គគ្រូនិងសិស្ស: State (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #state #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងសរសេរកម្មវិធីបញ្ជាម៉ាស៊ីនលក់ទឹកសុទ្ធ គេសរសេរ `switch-case` ចំនួន ៥០ កន្លែង! លោកគ្រូយក្សដើរមកដល់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរស្អីហ្នឹង? ក្នុងកន្លែងចុចប៊ូតុង ក៏មានសួរ `switch(state)`... ក្នុងកន្លែងបញ្ចេញទឹក ក៏មានសួរ `switch(state)`... ហែងអត់វិលមុខទេអី? បើថ្ងៃក្រោយសាលាថែម State "ម៉ាស៊ីនខូច" មួយទៀត ហែងមិនត្រូវរត់ទៅរកថែម `case` គ្រប់កន្លែងទាំងអស់ទេអី?

**អាម៉ាប់:** លោកគ្រូ! បើម៉ាស៊ីនហ្នឹងវាមានអារម្មណ៍ច្រើន (States) អញ្ចឹង ខ្ញុំត្រូវតែសួរវាគ្រប់ពេលហើយថាវាកំពុងគិតអី? បើមិនអញ្ចឹងទេ ពេលវាអស់ទឹកសោះ ខ្ញុំចុចប៊ូតុង វាលោតចេញទឹកមកប្រលាក់អាវខ្ញុំម៉េច?

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថា "Finite State Machine Spaghettification"! គេត្រូវប្រើ **State Pattern** វើយ!
គេត្រូវចាប់អារម្មណ៍ (State) នីមួយៗនោះ មកបង្កើតជា Class ម្នាក់មួយៗ! Class "អារម្មណ៍មានទឹក", Class "អារម្មណ៍អស់ទឹក", Class "អារម្មណ៍ស៊ីលុយ"! ម៉ាស៊ីនលែងខ្វល់ថាខ្លួនវាកំពុងនៅ State អីទៀតហើយ! ពេលហែងចុចប៊ូតុង ម៉ាស៊ីនគ្រាន់តែបោះការងារនោះទៅអោយ Class អារម្មណ៍ដែលកំពុងសកម្ម ជាអ្នកចាត់ចែង! 

**អាម៉ាប់ (អេះក្បាល):** អូហូ! គឺមានតួអង្គប្តូរមុខមាត់! ចុះសុំសួរមួយគ្រូ! បើ... ម៉ាស៊ីនហ្នឹងកំពុងស្ថិតក្នុង State "អស់ទឹកលីងពីទូ" ហើយខ្ញុំទៅបញ្ឆោតវា! ខ្ញុំយកលុយសន្លឹក ១០០ដុល្លារ ញាត់ចូលទៅ! តើ Class "អារម្មណ៍អស់ទឹក" ហ្នឹង វានឹងរលាយចេញទឹកមកអោយខ្ញុំទេលោកគ្រូ?

**លោកគ្រូយក្ស (សម្លក់):** អាគំនិតចោរ! បើវាស្ថិតក្នុង `NoWaterState` (អស់ទឹក) ហើយហែងញាត់លុយចូល Method `insertCoin()` របស់វាគឺសរសេរទុកថា "ព្រុយលុយចេញមកវិញ, ម៉ាស៊ីនគាំង!" វើយ! វាគ្មានថ្ងៃរលាយបញ្ចេញទឹកអោយហែងទេ ព្រោះច្បាប់របស់វា គឺតឹងរ៉ឹងតាម State នីមួយៗ! បើចង់ចេញទឹក លុះត្រាតែវាផ្លាស់ប្តូរខ្លួនវាទៅជា `HasWaterState` ជាមុនសិន!

**អាម៉ាប់:** អូ! តឹងរ៉ឹងម៉្លេះ! ម៉ាស៊ីននេះមិនងាយបន្លំវាបានទេ! ក្បួននេះការពារ Bug បានយ៉ាងជិតឈឹង!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. កិច្ចសន្យារបស់ State
interface State {
    void insertCoin();
    void dispenseWater();
}

// ២. State "អស់ទឹក" (អត់មានទឹកអោយទេ អាម៉ាប់!)
class NoWaterState implements State {
    public void insertCoin() {
        System.out.println("អស់ទឹកហើយ! លុយហែងក៏អញមិនយកដែរ ខ្ជាក់ចេញវិញ!");
    }
    public void dispenseWater() {
        System.out.println("ចុចខូចប៊ូតុងក៏អត់មានទឹកចេញមកដែរអាភ្លើ!");
    }
}

// ៣. State "មានទឹក" (ស្វាគមន៍ជានិច្ច)
class HasWaterState implements State {
    private VendingMachine machine;
    public HasWaterState(VendingMachine m) { this.machine = m; }

    public void insertCoin() {
        System.out.println("អរគុណ! កំពុងបញ្ចេញទឹក...");
        // ក្រោយពេលបញ្ចេញទឹករួច ឆែកមើលបើអស់ទឹក ត្រូវប្តូរ State ម៉ាស៊ីន!
        if (machine.getWaterCount() == 0) {
            machine.setState(machine.getNoWaterState()); 
        }
    }
    public void dispenseWater() { System.out.println("ធ្លាក់ទឹកមួយដបតុក!"); }
}

// ៤. ម៉ាស៊ីនកណ្តាល (លែងមាន Switch-Case រញ៉េរញ៉ៃ)
class VendingMachine {
    private State currentState; // ចង្អុលទៅអារម្មណ៍បច្ចុប្បន្ន

    public void setState(State state) { this.currentState = state; }
    
    // ហៅទៅចុះ មិនបាច់សួរនាំច្រើន វាដឹងខ្លួនឯងហើយ!
    public void insertCoin() { currentState.insertCoin(); }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅឈរមុខម៉ាស៊ីនលក់ទឹកសុទ្ធ ហើយរាយការណ៍ប្រាប់គ្រូពី State របស់វារាល់នាទី!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កម្មវិធីត្រូវផ្លាស់ប្តូរអាកប្បកិរិយារបស់វាទៅតាមស្ថានភាព (State) ដែលនាំអោយមានការសរសេរលក្ខខណ្ឌ (Switch-case/if-else) ស្មុគស្មាញ និងច្របូកច្របល់ពេញកូដ។
- **ដំណោះស្រាយ:** បំប្លែង State នីមួយៗទៅជា Class ឯករាជ្យ ហើយអនុញ្ញាតអោយ Object កណ្តាល (Context) ផ្លាស់ប្តូរអាកប្បកិរិយារបស់វានៅពេល Runtime តាមរយៈការប្តូរ Reference ទៅកាន់ State Class នោះ។
