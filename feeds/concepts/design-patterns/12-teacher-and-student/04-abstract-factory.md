# វគ្គគ្រូនិងសិស្ស: Abstract Factory (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #abstract-factory #creational #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(លោកគ្រូយក្សកំពុងពិនិត្យមើលកម្មវិធីដែលអាម៉ាប់សរសេរ ស្រាប់តែភ្នែកគាត់បើកធំៗសម្លឹងមើលអេក្រង់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងមកមើលស្នាដៃហែងមើល៍! ម៉េចក៏កម្មវិធី Theme "Dark Mode" របស់ហែង មាន Background ពណ៌ខ្មៅ តែប៊ូតុងវាពណ៌សចាំងកាត់ភ្នែក ហើយ Checkbox វាចេញជារូបពណ៌ស៊ីជម្ពូអញ្ចឹង? ហែងយកអីមកលាយគ្នាហ្នឹង?

**អាម៉ាប់:** បាទលោកគ្រូ! ពេលខ្ញុំសរសេរកូដ ខ្ញុំភ្លេចខ្លួន ខ្ញុំទាញយក `new LightButton()` មកប្រើលាយជាមួយ `new PinkCheckbox()` ព្រោះខ្ញុំរក `DarkButton` អត់ឃើញក្នុង IDE លោកគ្រូ!

**លោកគ្រូយក្ស (គប់ដុំសៀវភៅ):** អាភ្លើ! បើប្រព័ន្ធហែងមាន Theme ១០ ហែងមិនទាញលាយគ្នាឡើងក្លាយជាត្លុកទៅហើយ? ដើម្បីការពារកុំឱ្យពួកហែង "យកទំនិញខុសគ្រួសារ" មកលាយគ្នា គេត្រូវប្រើ **Abstract Factory Pattern** វើយ! វាជារោងចក្រដែលផលិតជា "ឈុត"!

**អាម៉ាប់ (អេះក្បាល):** ផលិតជាឈុតយ៉ាងម៉េចទៅលោកគ្រូ? ដូចឈុត KFC អញ្ចឹងមែន?

**លោកគ្រូយក្ស:** អើ! ដូចឈុត KFC អញ្ចឹង! បើហែងកុម្ម៉ង់ "ឈុត Dark Mode" ហែងត្រូវហៅរោងចក្រ `DarkUIFactory`! ហើយរោងចក្រហ្នឹង វាមាន Method `createButton()` និង `createCheckbox()` ដែលវានឹងប្រគល់ឱ្យហែង "តែរបស់ពណ៌ខ្មៅ" ប៉ុណ្ណោះ! ទោះហែងចង់ទាញពណ៌សមកលាយ ក៏រោងចក្រហ្នឹងវាអត់មានឱ្យហែងដែរ! យល់នៅ?

**អាម៉ាប់:** អូហូ! ការពារភាពល្ងង់ខ្លៅរបស់ខ្ញុំបានល្អមែន! អញ្ចឹងកូដខ្ញុំគ្រាន់តែដឹងថា វាកំពុងធ្វើការជាមួយ `UIFactory` ទៅបានហើយ មិនបាច់ខ្វល់ថាជា Light ឬ Dark ទេមែនទេគ្រូ?

**លោកគ្រូយក្ស:** ត្រឹមត្រូវ! កូដ Client ហែងនឹងមើលលែងឃើញពាក្យ `new LightButton()` ទៀតហើយ គឺឃើញតែពាក្យ `factory.createButton()`!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// អាម៉ាប់សរសេរកូដដ៏មានសុវត្ថិភាពក្រោមការបញ្ជារបស់លោកគ្រូយក្ស
interface UIFactory {
    Button createButton();
    Checkbox createCheckbox();
}

class DarkUIFactory implements UIFactory {
    public Button createButton() { return new DarkButton(); }
    public Checkbox createCheckbox() { return new DarkCheckbox(); }
}

// Client Code (កូដរបស់អាម៉ាប់)
class Application {
    private Button button;
    private Checkbox checkbox;

    // អាម៉ាប់គ្រាន់តែទទួលយក Factory អត់ខ្វល់ថាវាជា Factory ពណ៌អីទេ
    public Application(UIFactory factory) {
        // រោងចក្រនេះនឹងធានាថា ប៊ូតុង និង Checkbox គឺម៉ាឈុតស៊ីគ្នា ១០០%
        button = factory.createButton();
        checkbox = factory.createCheckbox();
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅប្តូរពណ៌ប៊ូតុង និង Checkbox នៅក្នុងកម្មវិធីខ្លួនឯងចំនួន ១០០ ទំព័រ ឱ្យត្រូវតាមគ្រួសារវាវិញ ដោយមិនឱ្យមានលាយពណ៌ស៊ីជម្ពូសូម្បីតែមួយ!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ហានិភ័យនៃការទាញយក Object មកប្រើប្រាស់ខុសប្រភេទឬខុសគ្រួសារ ធ្វើឱ្យប្រព័ន្ធមិនស៊ីចង្វាក់គ្នា (Inconsistent)។
- **ដំណោះស្រាយ:** បង្កើតរោងចក្រជាលក្ខណៈគ្រួសារ (Abstract Factory) ដើម្បីធានាថាទំនិញដែលបញ្ចេញមក គឺអាចធ្វើការរួមគ្នាបានដោយសុវត្ថិភាព។
