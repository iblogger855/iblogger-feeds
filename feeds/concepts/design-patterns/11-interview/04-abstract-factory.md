# វគ្គសម្ភាសន៍ការងារ: Abstract Factory (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #abstract-factory #creational #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន - សម្លឹងមើលដោយកែវភ្នែកតឹងតែង):** សួស្តី! ប្រព័ន្ធ UI របស់យើងគាំទ្រ Light Mode និង Dark Mode។ កូនចៅខ្ញុំសរសេរកូដរញ៉េរញ៉ៃណាស់ ជួនកាលវាទាញយកប៊ូតុង Light Mode ទៅដាក់លាយជាមួយ Checkbox Dark Mode មើលទៅដូចតុក្កតា! តើប្អូនមានក្បួនអីជួយបង្ខំឱ្យវាយក UI components ដែលស្ថិតក្នុង "គ្រួសារតែមួយ" (Family) មកប្រើជាមួយគ្នាទេ?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះដោះស្រាយបានដោយប្រើប្រាស់ **Abstract Factory Pattern**។ ខ្ញុំនឹងបង្កើត `UIFactory` មួយដែលមាន Method ពីរគឺ `createButton()` និង `createCheckbox()`។ បន្ទាប់មក ខ្ញុំនឹងបង្កើតរោងចក្រកូនពីរគឺ `LightUIFactory` និង `DarkUIFactory`។ បើ Client កំពុងប្រើ `DarkUIFactory` វាប្រាកដជានឹងទទួលបានប៊ូតុងនិង Checkbox ពណ៌ខ្មៅទាំងគូ គ្មានថ្ងៃលាយឡំគ្នាឡើយ!

**អ្នកសម្ភាសន៍ (សើចចំអក):** ហឹស! ស្តាប់ទៅឡូយមែន! ចុះវាមិនដូច Factory Method ទេអី? ម៉េចចាំបាច់ដាក់ឈ្មោះថា "Abstract Factory"? ចង់អួតពាក្យបច្ចេកទេសមែន?

**បេក្ខជន (សុខា):** ខុសគ្នាស្រឡះលោកប្រធាន! Factory Method បង្កើតទំនិញតែ "មួយមុខ" ប៉ុណ្ណោះ។ ចំណែក Abstract Factory គឺបង្កើតទំនិញ "មួយឈុត" (Family of products) ដែលត្រូវតែធ្វើការជាមួយគ្នា។

**អ្នកសម្ភាសន៍:** ល្អ! ចុះបើស្អែកឡើង ខ្ញុំចង់បន្ថែមទំនិញថ្មីមួយទៀត ឧទាហរណ៍ `createDropdown()`។ តើប្អូននឹងមានបញ្ហាអ្វីខ្លះជាមួយកូដប្អូន? ប្រាប់ការពិតមក!

**បេក្ខជន (សុខា - ដកដង្ហើមធំ):** នេះគឺជាចំណុចខ្សោយដ៏ធំបំផុតរបស់ Abstract Factory តែម្តង! បើថែម `createDropdown()` ចូលទៅក្នុង Interface មេ នោះ "គ្រប់" រោងចក្រកូនៗទាំងអស់ (LightUIFactory, DarkUIFactory និងអាចមានរាប់សិបទៀត) នឹង Error ព្រមគ្នាទាំងអស់! យើងត្រូវប្រញាប់ដើរទៅ Implement កូដថ្មីនៅគ្រប់រោងចក្រ! អញ្ចឹងហើយ Pattern នេះស័ក្តិសមតែជាមួយប្រព័ន្ធដែលឈុតទំនិញ (Products) មានស្ថិរភាពមិនងាយផ្លាស់ប្តូរ ប៉ុន្តែអាចបន្ថែមក្រុម (Families ដូចជា SolarMode) បានដោយងាយស្រួល។

**អ្នកសម្ភាសន៍ (ងក់ក្បាលពេញចិត្ត):** ពូកែណាស់ក្មួយ! ហ៊ានទទួលស្គាល់ទាំងចំណុចខ្លាំងនិងចំណុចខ្សោយ។ មិនមែនេះចេះតែប្រើៗដោយងងឹតងងល់នោះទេ។

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Abstract Products
interface Button { void render(); }
interface Checkbox { void render(); }

// ២. Concrete Products (គ្រួសារ Light)
class LightButton implements Button { public void render() { System.out.println("Light Button"); } }
class LightCheckbox implements Checkbox { public void render() { System.out.println("Light Checkbox"); } }

// Concrete Products (គ្រួសារ Dark)
class DarkButton implements Button { public void render() { System.out.println("Dark Button"); } }
class DarkCheckbox implements Checkbox { public void render() { System.out.println("Dark Checkbox"); } }

// ៣. Abstract Factory (ធានាភាពស៊ីចង្វាក់គ្នា)
interface UIFactory {
    Button createButton();
    Checkbox createCheckbox();
    // បើថែម createDropdown() នៅទីនេះ វានឹងផ្ទុះ Error ពេញប្រព័ន្ធ!
}

// ៤. Concrete Factories
class LightUIFactory implements UIFactory {
    public Button createButton() { return new LightButton(); }
    public Checkbox createCheckbox() { return new LightCheckbox(); }
}
class DarkUIFactory implements UIFactory {
    public Button createButton() { return new DarkButton(); }
    public Checkbox createCheckbox() { return new DarkCheckbox(); }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីភាពខុសគ្នារវាង Factory Method និង Abstract Factory។ យល់ពីកម្លាំងក្នុងការធានា Consistency។
❌ **អន្ទាក់:** សួរពីការបន្ថែម Product ថ្មី។ បេក្ខជនបានឆ្លើយយ៉ាងត្រឹមត្រូវថាវាជា "ចំនុចផុយស្រួយ" (Fragility) របស់ Pattern នេះ។
