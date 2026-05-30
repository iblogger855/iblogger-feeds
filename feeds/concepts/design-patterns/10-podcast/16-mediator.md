# Podcast: Mediator (កិច្ចសន្ទនា Podcast ជុំវិញ Mediator)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #mediator #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! តើធ្លាប់ស្រមៃមើលព្រលានយន្តហោះដែលគ្មានប្រាង្គអាកាស (Air Traffic Control Tower) ទេ? ពេលយន្តហោះរាប់សិបគ្រឿងចង់ចុះចត បើគ្មានប្រាង្គបញ្ជាការ ពួកវាច្បាស់ជាបុកគ្នាពេញអាកាស!

**Host B (បូរិទ្ធ - អ្នករៀន):** ពិតមែនហើយបង! នៅក្នុងកូដក៏ដូចគ្នា បើ Button, Textbox, Checkbox ទាក់ទងគ្នាខ្វាត់ខ្វែងដោយផ្ទាល់ កូដនឹងក្លាយជាសំបុកពីងពាង (Tight Coupling)។

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! **Mediator Pattern** ដោះស្រាយរឿងនេះដោយដើរតួជាកណ្តាល។ Object នីមួយៗ (យន្តហោះ) លែងនិយាយរកគ្នាផ្ទាល់ទៀតហើយ ពួកវានិយាយតែជាមួយ Mediator ប៉ុណ្ណោះ។ ពេល Button ត្រូវគេចុច វាគ្រាន់តែប្រាប់ Mediator ថា "ខ្ញុំត្រូវគេចុចហើយ"។ Mediator នឹងសម្រេចចិត្តថាត្រូវទៅបញ្ជាអ្នកណាខ្លះបន្ត។

**Host B (បូរិទ្ធ):** សុំសួរឆ្កួតៗមួយបង! ចុះបើប្រាង្គអាកាស (Mediator) ហ្នឹង... ស្រាប់តែមានគូទាល់ (Crush) ជាមួយយន្តហោះណាមួយ ហើយគាត់លំអៀងឱ្យយន្តហោះហ្នឹងចុះចតមុនគេរហូត តើព្រលានយន្តហោះហ្នឹងមិនវិនាសទេអីបង?

**Host A (សិទ្ធិ):** ហាហា... បើ Mediator "លំអៀង" នៅក្នុងកូដ មានន័យថា Logic នៅក្នុង Mediator នោះវាសរសេរខុស (Bug) ឬក៏វាពោរពេញទៅដោយលក្ខខណ្ឌ `if/else` ដែលផ្តល់អទិភាពខុសប្រក្រតី (Hard-coded priorities)។ ហើយនេះក៏ជាចំណុចខ្សោយដ៏ធំបំផុតរបស់ Mediator ដែរ! ប្រសិនបើអ្នកមិនប្រយ័ត្នទេ Mediator នឹងស្រូបយក Logic ទាំងអស់ពី Component ផ្សេងៗ រហូតខ្លួនវាក្លាយជា God Object ដ៏ធំសម្បើម ដែលគ្រប់គ្រងរឿងគ្រប់យ៉ាងក្នុងប្រព័ន្ធតែម្នាក់ឯង។ បើ God Object នេះមាន Bug (ដូចបូរិទ្ធថាវាមាន Crush) នោះប្រព័ន្ធទាំងមូលនឹងរលាយពិតមែន!

**Host B (បូរិទ្ធ):** អូហូ! គួរឱ្យខ្លាចមែន! អញ្ចឹងយើងត្រូវប្រយ័ត្នកុំឱ្យ Mediator ក្លាយជាមេផ្តាច់ការដែលមានកូដរាប់ម៉ឺនបន្ទាត់។ តែបើប្រើត្រូវ វាពិតជាជួយផ្តាច់ចំណងរវាង Component បានល្អណាស់។ យើងអាចយក Button នោះទៅប្រើនៅកន្លែងផ្សេងបានដោយសេរី។

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! Chat Room ក៏ជាឧទាហរណ៍ដ៏ល្អនៃ Mediator ដែរ ដែលអ្នកប្រើប្រាស់ (User A) មិនបានផ្ញើសាររក (User B) ផ្ទាល់ទេ តែផ្ញើទៅ Server (Mediator) ហើយ Server ជាអ្នកបោះបន្ត។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Mediator Interface (ប្រាង្គអាកាស)
public interface Mediator {
    void notify(Component sender, String event);
}

// ២. Base Component (យន្តហោះ)
public abstract class Component {
    protected Mediator mediator;

    public Component(Mediator mediator) {
        this.mediator = mediator;
    }
}

// ៣. Concrete Components
public class Button extends Component {
    public Button(Mediator m) { super(m); }
    public void click() {
        System.out.println("Button is clicked.");
        mediator.notify(this, "click"); // ប្រាប់ Mediator
    }
}

// ៤. Concrete Mediator (ប្រាង្គបញ្ជាការដែលអាចក្លាយជា God Object)
public class FormMediator implements Mediator {
    private Button button;
    private TextBox textBox;

    public void register(Button b, TextBox t) {
        this.button = b;
        this.textBox = t;
    }

    @Override
    public void notify(Component sender, String event) {
        // ការពារកុំឱ្យមានសាច់រឿងលំអៀង!
        if (sender == button && event.equals("click")) {
            textBox.clear(); 
        }
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Loose Coupling:** ផ្តាច់ទំនាក់ទំនងខ្វាត់ខ្វែងរវាង Component អនុញ្ញាតឱ្យ Reusable។
- **Single Responsibility:** ប្រមូលផ្តុំ Logic ទំនាក់ទំនងទាំងអស់ទៅកន្លែងតែមួយ។

**គុណវិបត្តិ (Cons):**
- **God Object Anti-Pattern:** Mediator អាចប្រែទៅជា Object ដ៏ធំសម្បើម ដែលពិបាកថែទាំ។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** Object មួយចំនួនធំទាក់ទងគ្នាខ្វាត់ខ្វែង បង្កើតបានជាសំបុកពីងពាង។
- **ដំណោះស្រាយ:** បង្កើត Object កណ្តាលមួយ (Mediator) ជាអ្នកសម្របសម្រួល។
