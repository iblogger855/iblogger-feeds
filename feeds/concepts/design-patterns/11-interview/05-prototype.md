# វគ្គសម្ភាសន៍ការងារ: Prototype (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #prototype #creational #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន - សម្លឹងរកកំហុស):** យើងមាន Object មួយដែលស្មុគស្មាញមែនទែន មាន Field Private រាប់សិប។ ខ្ញុំចង់ Duplicate វាមួយទៀត។ កូនចៅខ្ញុំសរសេរកូដ `new` រួចអង្គុយ `getter/setter` ចម្លង Field ម្តងមួយៗ។ ក្រៅពីខ្ជះខ្ជាយពេល វាថែមទាំង Error ដោយសារមាន Field ខ្លះ Private មិនអាច Copy បាន! តើប្អូនមានក្បាច់អី?

**បេក្ខជន (សុខា):** បាទ! បញ្ហានេះដោះស្រាយបានដោយ **Prototype Pattern**។ ជាជាងយើងអ្នកខាងក្រៅអង្គុយចម្លងវា យើងគួរតែបញ្ជាឱ្យ Object នោះវា "ចម្លងខ្លួនវា" តែម្តង ដោយប្រើ Method `clone()`។ ព្រោះវាជាម្ចាស់ខ្លួន វាអាចមើលឃើញ Field Private ទាំងអស់របស់វាយ៉ាងងាយស្រួល។

**អ្នកសម្ភាសន៍:** ល្អ! ចុះបើនៅក្នុង Object នោះ មានផ្ទុក Object ផ្សេងទៀត (ដូចជា List នៃ Address) តើការប្រើ `clone()` របស់ប្អូន មានសុវត្ថិភាពទេ? ប្រយ័ត្នរលាយកូដណា!

**បេក្ខជន (សុខា):** នេះជាអន្ទាក់នៃការធ្វើ **Shallow Copy**! បើយើងគ្រាន់តែចម្លងធម្មតា នោះ Address នៅក្នុង Clone Object នឹងចង្អុលទៅកាន់ Memory តែមួយជាមួយ Original Object។ បើគេកែ Address ក្នុង Clone... វានឹងរត់ទៅកែ Original ដែរ! ដើម្បីឱ្យមានសុវត្ថិភាព ខ្ញុំត្រូវសរសេរកូដធ្វើ **Deep Copy** មានន័យថាត្រូវ `clone()` កូនៗរបស់វាតៗគ្នារហូតដល់អស់ ទើបអាចផ្តាច់ចំណង ១០០% បាន។

**អ្នកសម្ភាសន៍ (ញញឹម):** ចុះបើ Object ទាំងនោះមានទម្រង់ "Circular Reference"? A ចង្អុលទៅ B, រួច B ចង្អុលមក A វិញ! ពេលប្អូនធ្វើ Deep Copy តើវានឹងមិនវិលជុំ `clone()` គ្នារហូតដល់គាំង Server (StackOverflow) ទេឬ?

**បេក្ខជន (សុខា - បែកញើស):** អូហូ! សំណួរនេះកាចមែនទែនលោកប្រធាន! បើមាន Circular Reference ការសរសេរ Deep Copy ដោយដៃពិតជាគ្រោះថ្នាក់។ ដើម្បីដោះស្រាយ ខ្ញុំនឹងប្រើប្រាស់ "Serialization"។ ខ្ញុំបម្លែង Object A និងកូនៗវាទាំងអស់ទៅជា JSON ឬ Byte Stream រួចDeserialize វាមកវិញ។ វិធីនេះធានា Deep Copy ១០០% ហើយទប់ទល់ Circular Reference បានយ៉ាងមានប្រសិទ្ធភាព ដោយមិនបាច់សរសេរ Logic ចម្លងស្មុគស្មាញដោយដៃឡើយ!

**អ្នកសម្ភាសន៍:** ចម្លើយដ៏អស្ចារ្យ! ប្អូនពិតជាមានបទពិសោធន៍ដោះស្រាយបញ្ហាជាក់ស្តែងពិតមែន។ 

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ការសរសេរ Prototype ជាមួយ Deep Copy ដោយដៃ
public class User implements Cloneable { // ត្រូវ implement Cloneable នៅក្នង Java
    private String name;
    private Address address; // Object កូន!

    public User(String name, Address address) {
        this.name = name;
        this.address = address;
    }

    @Override
    public User clone() {
        try {
            // Shallow Copy សិន
            User cloned = (User) super.clone();
            // Deep Copy សម្រាប់កូន (ដើម្បីការពារកុំអោយមានបញ្ហាកែ Clone ប៉ះ Original)
            cloned.address = this.address.clone(); 
            return cloned;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីភាពខុសគ្នារវាង Shallow Copy និង Deep Copy ដែលជាគ្រោះថ្នាក់ដ៏ធំបំផុតនៅក្នុង Prototype Pattern។ ថែមទាំងដឹងពីរបៀបប្រើ Serialization ដើម្បីគេចចេញពីបញ្ហា Circular Reference។
❌ **អន្ទាក់:** សួររឿង Circular Reference ដែលជាធម្មតាអាចសម្លាប់កូដ Recursion របស់ Deep Copy បានយ៉ាងងាយ។ បេក្ខជនដោះស្រាយបានល្អ។
