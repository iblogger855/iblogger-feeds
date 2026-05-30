# វគ្គសម្ភាសន៍ការងារ: Mediator (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #mediator #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងមានផ្ទាំង UI មួយដែលមាន Button, Checkbox, TextBox, និង Dropdown។ ពេលចុច Checkbox វាត្រូវលាក់ TextBox។ ពេលរើស Dropdown វាត្រូវបិទមិនអោយចុច Button។ កូនចៅខ្ញុំសរសេរកូដអោយ Component ទាំងនោះទាក់ទងគ្នា (Call method) ខ្វាត់ខ្វែងដូចសំបុកពីងពាង! ពេលចង់យក Button នោះទៅប្រើនៅកន្លែងផ្សេង វាមិនដើរ ព្រោះវាជាប់ជំពាក់ជំពិនជាមួយ Checkbox! តើប្អូនមានយុទ្ធសាស្ត្រអ្វីដោះស្រាយ?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះគេហៅថា "Tight Coupling" រវាង Components។ ដើម្បីដោះស្រាយ ខ្ញុំនឹងប្រើយុទ្ធសាស្ត្រ **Mediator Pattern** ដែលប្រៀបដូចជា "ប្រាង្គអាកាស" (Control Tower) នៅក្នុងព្រលានយន្តហោះ។
Components ទាំងអស់លែងមានសិទ្ធិទាក់ទងគ្នាដោយផ្ទាល់ទៀតហើយ! ពួកវាគ្រាន់តែមានតួនាទី "រាយការណ៍ (Notify)" ទៅកាន់ Mediator តែប៉ុណ្ណោះ។ ឧទាហរណ៍ ពេល Checkbox ត្រូវគេចុច វាគ្រាន់តែប្រាប់ Mediator ថា "ខ្ញុំត្រូវគេចុចហើយ"។ បន្ទាប់មក Mediator ជាអ្នកសម្រេចចិត្តថាត្រូវទៅបិទ TextBox ឫអត់ (Logic ស្ថិតនៅកណ្តាល)។ ធ្វើបែបនេះ Component នីមួយៗអាចកាត់ផ្តាច់ (Decouple) ហើយយកទៅប្រើឡើងវិញ (Reuse) បានយ៉ាងសេរី!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ស្តាប់ទៅល្អណាស់! ប៉ុន្តែបើប្អូនប្រមូល Logic គ្រប់យ៉ាងពីគ្រប់ទិសទី យកមកគរទុកនៅក្នុង Mediator តែមួយ... តើ Mediator នោះវាមិនរីកធំឡើងៗ រហូតក្លាយជា "បិសាច" ដែលគ្មានអ្នកណាហ៊ានកែទេអី?

**បេក្ខជន (សុខា - ញញឹមប្រុងប្រយ័ត្ន):** នេះហើយគឺជា "God Object Anti-Pattern" ដែលជាគ្រោះថ្នាក់ដ៏សាហាវបំផុតរបស់ Mediator! 
ប្រសិនបើយើងមិនប្រយ័ត្ន Mediator នឹងប្រែជា `God Object` ដែលមានកូដរាប់ម៉ឺនបន្ទាត់។ ដើម្បីការពារបញ្ហានេះ ខ្ញុំនឹងបែងចែក Mediator ធំ ទៅជា Mediator តូចៗ (Sub-mediators) តាមការទទួលខុសត្រូវ (Single Responsibility Principle) ដូចជា `ValidationMediator` និង `VisibilityMediator`។ ម្យ៉ាងទៀត ខ្ញុំនឹងប្រើប្រាស់ Event-Driven Architecture (Publisher/Subscriber) មកជំនួយ ដើម្បីកាត់បន្ថយភាពស្មុគស្មាញនៅក្នុងកូដ Mediator ផងដែរ។

**អ្នកសម្ភាសន៍:** ចម្លើយតឹងរឹង និងបង្ហាញពីបទពិសោធន៍ខ្ពស់! ប្អូនដឹងច្បាស់ពីចំណុចខ្សោយនៃ Pattern ដែលប្អូនលើកមក។

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Mediator Interface (ប្រាង្គអាកាស)
public interface Mediator {
    void notify(Component sender, String event);
}

// ២. Base Component (យន្តហោះ ដែលត្រូវមានវិទ្យុទាក់ទងទៅប្រាង្គ)
public abstract class Component {
    protected Mediator mediator;

    public Component(Mediator mediator) {
        this.mediator = mediator;
    }
}

// ៣. Concrete Components (មិនខ្វល់ពីអ្នកណាទាំងអស់ ក្រៅពី Mediator)
public class Checkbox extends Component {
    public Checkbox(Mediator m) { super(m); }
    public void check() {
        System.out.println("Checkbox ticked.");
        mediator.notify(this, "check"); // ប្រាប់ប្រាង្គអាកាស
    }
}

public class TextBox extends Component {
    public TextBox(Mediator m) { super(m); }
    public void hide() { System.out.println("TextBox is hidden."); }
}

// ៤. Concrete Mediator (អ្នកកណ្តាលសម្រេចចិត្ត - ប្រយ័ត្នក្លាយជា God Object)
public class FormMediator implements Mediator {
    private Checkbox checkbox;
    private TextBox textBox;

    public void register(Checkbox c, TextBox t) {
        this.checkbox = c; this.textBox = t;
    }

    @Override
    public void notify(Component sender, String event) {
        // Business Logic ផ្តុំគ្នានៅទីនេះ
        if (sender == checkbox && event.equals("check")) {
            textBox.hide(); // បិទ TextBox នៅពេល Checkbox ត្រូវចុច
        }
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីអត្ថប្រយោជន៍នៃ Mediator ក្នុងការ Decouple UI Components។ 
❌ **អន្ទាក់:** សួរអំពីការបង្កើត "God Object" ដែលជា Anti-Pattern ដ៏ល្បីល្បាញរបស់ Mediator។ បេក្ខជនបានផ្តល់ដំណោះស្រាយតាមរយៈការបំបែកជា Sub-mediators និងការប្រើ Event-driven architecture។ ឆ្លើយបានយ៉ាងល្អเยี่ยม!
