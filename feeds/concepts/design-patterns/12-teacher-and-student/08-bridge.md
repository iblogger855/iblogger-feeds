# វគ្គគ្រូនិងសិស្ស: Bridge (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #bridge #structural #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងអង្គុយរាប់ Class នៅក្នុង Project របស់ខ្លួនឡើងវិលមុខ លោកគ្រូយក្សដើរមកដល់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! អញប្រាប់អោយបង្កើតរបាយការណ៍សង្ខេប (Summary) និងលម្អិត (Detailed) ទៅជា PDF និង Excel សោះ ម៉េចហែងបង្កើត Class រហូតដល់ ៤ ឯណោះ? `SummaryPDF`, `SummaryExcel`... ចុះបើថែម HTML និង Word ទៀត ហែងមិនបង្កើតឡើងរាប់សិប Class ទៅហើយអី?

**អាម៉ាប់:** បាទលោកគ្រូ! ក៏វាមានពីរវិមាត្រ (ប្រភេទរបាយការណ៍ និងទម្រង់ Output) អញ្ចឹងខ្ញុំយកវាគុណបញ្ចូលគ្នាតែម្តងទៅលោកគ្រូ វាចេញ ៥ គុណ ៥ ស្មើ ២៥ Class ល្មម! ខ្ញុំសរសេរជិតរួចហើយ!

**លោកគ្រូយក្ស (ទះតុផាំង):** អាកូននេះ! នេះគេហៅថាការផ្ទុះ Class (Cartesian Product)! បើហែងថែមមួយមុខ វាប៉ោង Class ឡើងមួយគំនរ! គេត្រូវប្រើ **Bridge Pattern** វើយ! គេអត់អោយវា "គុណ" គ្នាទេ គេបំបែកវាជាពីរក្រុមដាច់ដោយឡែក ហើយ "បូក" បញ្ចូលគ្នាវិញ តាមរយៈ "ស្ពាន" (Bridge)!

**អាម៉ាប់ (អេះក្បាល):** ស្ពានម៉េចទៅលោកគ្រូ? ដូចស្ពានជ្រោយចង្វារអញ្ចឹងមែន? 

**លោកគ្រូយក្ស:** ស្ពានហ្នឹងគឺ Composition វើយ! យើងទុក Report នៅម្ខាង ហើយទុក Renderer (អ្នកគូរ PDF/Excel) នៅម្ខាងទៀត។ Report គ្រាន់តែកាន់ Object របស់ Renderer ជាការស្រេច! ដូចតេឡេបញ្ជាទូរទស្សន៍អញ្ចឹង! តេឡេ (Report) មិនបាច់ខ្វល់ថាទូរទស្សន៍ (Renderer) ម៉ាកអីទេ! វាកាន់តែស្ពានបញ្ជាទៅបានហើយ!

**អាម៉ាប់ (ញញឹមខិល):** អូហូ! ចុះបើ... ស្ពានហ្នឹងវាបាក់កណ្តាល តើទូរទស្សន៍ធ្លាក់ចូលទឹក ឬក៏តេឡេខ្ញុំផ្ទុះទៅលោកគ្រូ?

**លោកគ្រូយក្ស (គប់ហ្វឺតចំក្បាល):** បើស្ពានបាក់កណ្តាល មានន័យថាហែងអត់បាន Pass `Renderer Object` ចូលទៅក្នុង Constructor របស់ `Report`! ពេលហែងចុចតេឡេ វានឹងគប់ `NullPointerException` (ធ្លាក់ចូលទឹកពិតមែន!) សម្លាប់កម្មវិធីហែងតែម្តងអាភ្លើ! អញ្ចឹងទើបអញប្រាប់ថា ស្ពានហ្នឹងត្រូវចាក់សីម៉ង់អោយរឹងមាំតាំងពីក្នុង Constructor!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. ក្រុមអ្នកគូរ (Renderer) នៅត្រើយម្ខាង
interface ReportRenderer {
    void draw();
}
class PdfRenderer implements ReportRenderer {
    public void draw() { System.out.println("Drawing PDF"); }
}

// ២. ក្រុមរបាយការណ៍ (Report) នៅត្រើយម្ខាងទៀត
abstract class Report {
    // នេះហើយជា "ស្ពាន" ការពារកុំអោយបាក់
    protected ReportRenderer renderer; 

    public Report(ReportRenderer renderer) {
        if(renderer == null) throw new RuntimeException("ស្ពានបាក់ហើយអាម៉ាប់!");
        this.renderer = renderer; // ចាក់សីម៉ង់អោយរឹងមាំ
    }
    public abstract void generate();
}

// ៣. ការរស់នៅដោយសន្តិភាព
class SummaryReport extends Report {
    public SummaryReport(ReportRenderer r) { super(r); }
    public void generate() { renderer.draw(); }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវលុបចោល Class ទាំង ២៥ នោះវិញ ហើយសរសេរ Bridge Pattern មកជំនួសវិញ បើមិនចង់អោយលោកគ្រូផ្តាច់ស្ពានអោយធ្លាក់ទឹក!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** Object មួយវិវឌ្ឍទៅតាមពីរវិមាត្រផ្សេងគ្នា (ឧ. រូបរាង និងពណ៌) ធ្វើអោយមានការគុណបញ្ចូលគ្នានៃ Class កើនឡើងឥតឈប់ឈរ។
- **ដំណោះស្រាយ:** បំបែកវិមាត្រទាំងពីរនោះចេញពីគ្នាជាពីរ Hierarchy រួចភ្ជាប់ពួកវាចូលគ្នាវិញដោយប្រើ Composition ដើរតួជា "ស្ពាន" ដើម្បីប្តូរពីការ "គុណ" មកជាការ "បូក" Classes វិញ។
