# វគ្គគ្រូនិងសិស្ស: Facade (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #facade #structural #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់ដើរចូលហាងកាហ្វេទំនើបមួយ រួចដើរចូលទៅដល់កន្លែងម៉ាស៊ីនឆុងកាហ្វេដែលមានប៊ូតុងរាប់សិប ហើយចាប់ផ្តើមចុចលេង)*

**លោកគ្រូយក្ស (ជាម្ចាស់ហាង ស្រែកលាន់):** ហ្អើយអាម៉ាប់! ហែងកំពុងធ្វើស្អី? ចង់ឆក់ខ្សែភ្លើងស្លាប់មែន?

**អាម៉ាប់:** ខ្ញុំចង់ញ៉ាំកាហ្វេលោកគ្រូ! អញ្ចឹងខ្ញុំចុចប៊ូតុង `turnOnHeater()`, បន្ទាប់មកខ្ញុំចុច `grindBeans()`, រួចខ្ញុំត្រូវឆែកមើលសម្ពាធទឹក `checkWaterPressure()`... ហូយ! វិលមុខណាស់លោកគ្រូ! ខ្ញុំច្រឡំយកទឹកដោះគោទៅចាក់ចូលម៉ាស៊ីនកិនគ្រាប់កាហ្វេបាត់ហើយ!

**លោកគ្រូយក្ស (យកក្រណាត់ជូតក្បាលអាម៉ាប់):** អាភ្លើ! ម៉ាស៊ីននេះវាស្មុគស្មាញណាស់! ហែងមិនឃើញអ្នករត់តុ (Barista) ឈរនៅនោះទេអី? នៅក្នុងការសរសេរកូដ បើមានប្រព័ន្ធដែលស្មុគស្មាញ មានកូដរាប់សិប Class គេត្រូវបង្កើត **Facade Pattern** វើយ! "អ្នករត់តុ" នោះហើយគឺ Facade! ហែងគ្រាន់តែប្រាប់គាត់ថា "យកឡាតេមួយកែវ" (`makeLatte()`) ទៅ វាចប់ហើយ! គាត់ជាអ្នកទៅវាយតប់ជាមួយម៉ាស៊ីនហ្នឹងជំនួសហែង!

**អាម៉ាប់ (ជូតញើស):** អូហូ! ឡូយមែន! មានអ្នកបំរើជំនួស! សុំសួរមួយលោកគ្រូ! ចុះបើ... អ្នករត់តុហ្នឹងគាត់ភ្លឹក គាត់យកកាហ្វេទៅចាក់ចូលម៉ាស៊ីនបោកខោអាវវិញ តើកាហ្វេហ្នឹងនៅឆ្ងាញ់អត់គ្រូ?

**លោកគ្រូយក្ស (សម្លក់មុខ):** បើហែងជាអ្នកសរសេរកូដ "អ្នករត់តុ (Facade)" ហ្នឹងខុស វានឹងរលាយមែនហើយ! ព្រោះអតិថិជនទុកចិត្តទាំងស្រុងលើអ្នករត់តុ! បើសរសេរ Facade អន់ វាប្រៀបដូចជាហែងយកក្រដាសកាតុងទៅបិទបាំងគំនរសំរាមអញ្ចឹង! កូដអាក្រក់នៅតែអាក្រក់ដដែល!
តែបើចង់បានកាហ្វេឆ្ងាញ់ពិតៗ អតិថិជនណាដែលជា "អ្នកជំនាញ" គាត់អាចមិនខ្វល់ពីអ្នករត់តុ រួចដើរចូលមកប្រើម៉ាស៊ីនឆុងកាហ្វេនេះដោយផ្ទាល់ក៏បាន គ្មានអ្នកណាឃាត់ទេ!

**អាម៉ាប់:** អូ! យល់ហើយ! Facade គ្រាន់តែជួយសម្រួលភាពងាយស្រួល មិនមែនជាគុកដាក់ច្រវាក់នោះទេ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. ប្រព័ន្ធដ៏ស្មុគស្មាញ និងគ្រោះថ្នាក់
class CoffeeGrinder { public void grind() { System.out.println("Grinding beans..."); } }
class WaterHeater { public void heat() { System.out.println("Heating water to 90C..."); } }
class MilkFrother { public void froth() { System.out.println("Frothing milk..."); } }

// ២. Facade (អ្នករត់តុដ៏ជំនាញ)
class BaristaFacade {
    private CoffeeGrinder grinder = new CoffeeGrinder();
    private WaterHeater heater = new WaterHeater();
    private MilkFrother frother = new MilkFrother();

    // បិទបាំងភាពស្មុគស្មាញអោយអាម៉ាប់
    public void makeLatte() {
        System.out.println("--- ទទួលបញ្ជា! ចាប់ផ្តើមធ្វើ Latte ---");
        grinder.grind();
        heater.heat();
        frother.froth();
        System.out.println("--- រួចរាល់! សូមអញ្ជើញពិសា! ---");
    }
}

// ៣. អាម៉ាប់ (Client)
class AhMap {
    public static void main(String[] args) {
        BaristaFacade barista = new BaristaFacade();
        // ស្រួលណាស់ មិនបាច់ចុចប៊ូតុងម៉ាស៊ីនដល់ឆក់ខ្សែភ្លើងទេ!
        barista.makeLatte(); 
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅលាងម៉ាស៊ីនឆុងកាហ្វេដែលវាចាក់ទឹកដោះគោចូលខុសនោះឱ្យស្អាត! រួចសរសេរពាក្យ "ខ្ញុំនឹងប្រើ Facade ពេលកូដមានភាពស្មុគស្មាញ" ១០០ដង!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ប្រព័ន្ធមួយ (Subsystem ឬ Library) មានទំហំធំ និងមាន Classes ជាច្រើនទាក់ទងគ្នាខ្វាត់ខ្វែង ធ្វើឱ្យ Client លំបាកក្នុងការប្រើប្រាស់និងងាយបង្កកំហុស។
- **ដំណោះស្រាយ:** បង្កើត Class កណ្តាលមួយ (Facade) ដើម្បីប្រមូលផ្តុំកូដដ៏ស្មុគស្មាញនោះ ទៅជា Method ងាយៗសម្រាប់អ្នកប្រើប្រាស់ទូទៅ។ វាជួយកាត់បន្ថយ Coupling រវាង Client និង Subsystem។
