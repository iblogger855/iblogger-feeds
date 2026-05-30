# Podcast: Bridge (កិច្ចសន្ទនា Podcast ជុំវិញ Bridge)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #bridge #structural #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងជជែកអំពី **Bridge Pattern** សម្រាប់ទប់ទល់នឹងការកើនឡើង Class ដោយសារវិមាត្រ (Dimensions) ច្រើន។ បូរិទ្ធ បើអ្នកមានរបាយការណ៍ សង្ខេប (Summary) និងលម្អិត (Detailed) ហើយត្រូវបញ្ចេញវាជា PDF និង Excel តើអ្នកនឹងបង្កើត Class ប៉ុន្មាន?

**Host B (បូរិទ្ធ - អ្នករៀន):** ប្រហែលជា ៤ ទេដឹងបង! `SummaryPdf`, `SummaryExcel`, `DetailedPdf`, `DetailedExcel`។ តែចុះបើថែមរបាយការណ៍ ៥ មុខទៀត និងទម្រង់ Word, HTML អីទៀត វានឹងកើនឡើងគុណនឹងគ្នា ២៥ Class បាត់ហើយ! 

**Host A (សិទ្ធិ):** ត្រូវហើយ នេះហៅថា Cartesian Product។ ដំណោះស្រាយគឺ "ផ្តាច់" វិមាត្រទាំងពីរនេះចេញពីគ្នា (Abstraction ផ្តាច់ពី Implementation)។ វាប្រៀបដូចជាតេឡេបញ្ជា (Abstraction) និងទូរទស្សន៍ (Implementation)។ យើងគ្រាន់តែបង្កើត "ស្ពាន" ភ្ជាប់ពីតេឡេ ទៅកាន់ទូរទស្សន៍ណាមួយក៏បាន (Sony, Samsung) ជាការស្រេច។

**Host B (បូរិទ្ធ - អ្នករៀន):** សុំសួរមួយបង! ចុះបើ... ស្ពានដែលបងថានេះ វាបាក់កណ្តាល តើទូរទស្សន៍ធ្លាក់ចូលទឹក ឬក៏តេឡេខ្ញុំផ្ទុះ?

**Host A (សិទ្ធិ):** ហាហា... បើ "ស្ពានបាក់" ក្នុងកូដ មានន័យថាអ្នកភ្លេចចាក់បញ្ចូល (Inject) `Implementation` (ឧ. ភ្លេចអោយ `PdfRenderer` ទៅកាន់ `Report`) នោះពេលអ្នកហៅ Method វានឹងគប់ `NullPointerException` (ធ្លាក់ចូលទឹកមែន!)។ ដូច្នេះទើបយើងតែងតែតម្រូវឱ្យ "តេឡេ" ត្រូវតែមាន "ទូរទស្សន៍" នៅក្នុង Constructor របស់វាជាដាច់ខាត ដើម្បីធានាថាស្ពាននេះរឹងមាំតាំងពីពេលចាប់ផ្តើម!

**Host B (បូរិទ្ធ):** អូ យល់ហើយ! អញ្ចឹងបើខ្ញុំចង់បានរបាយការណ៍សង្ខេបជា PDF ខ្ញុំគ្រាន់តែយក `SummaryReport` ទៅភ្ជាប់ស្ពានជាមួយ `PdfRenderer`។ បើខ្ញុំចង់ថែម Word ខ្ញុំគ្រាន់តែបង្កើត `WordRenderer` មួយគត់ ដោយមិនបាច់ប៉ះពាល់ដល់កូដ Report នោះទេ គឺប្តូរពីការ "គុណ" មក "បូក" វិញមែនទេបង?

**Host A (សិទ្ធិ):** ត្រឹមត្រូវឥតខ្ចោះ! Bridge Pattern បំបែក High-level logic (Abstraction) ចេញពី Low-level details (Implementation) ធ្វើឱ្យពួកវាអាចវិវឌ្ឍដោយឯករាជ្យពីគ្នា។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Implementation Interface (វិមាត្រទី២: របៀប Render)
public interface ReportRenderer {
    void renderTitle(String title);
}

// ២. Concrete Implementations
public class PdfRenderer implements ReportRenderer {
    public void renderTitle(String t) { System.out.println("PDF Title: " + t); }
}

// ៣. Abstraction Base Class (វិមាត្រទី១: ប្រភេទរបាយការណ៍)
public abstract class Report {
    protected ReportRenderer renderer; // នេះហើយគឺ "Bridge" (ស្ពានការពារកុំអោយធ្លាក់ទឹក)

    public Report(ReportRenderer renderer) {
        if (renderer == null) throw new IllegalArgumentException("Bridge is broken!");
        this.renderer = renderer;
    }

    public abstract void generate();
}

// ៤. Refined Abstractions
public class SummaryReport extends Report {
    public SummaryReport(ReportRenderer r) { super(r); }

    public void generate() {
        renderer.renderTitle("Summary Report");
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **ការពារ Cartesian Product Explosion:** ប្តូរពីការគុណ Class មកជាការបូក Class វិញ។
- **Open/Closed Principle:** អាចបន្ថែម Abstractions ឬ Implementations ថ្មីៗដោយសេរី។

**គុណវិបត្តិ (Cons):**
- **ស្មុគស្មាញជាបឋម:** កូដកាន់តែពិបាកអានដំបូង ព្រោះត្រូវតាមដានស្ពានដើម្បីដឹងពីទម្រង់ពិតប្រាកដ។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** Class ប្រែប្រួលទៅតាមពីរវិមាត្រខុសៗគ្នា បង្កើតបាន Subclass ច្រើនលើសលប់។
- **ដំណោះស្រាយ:** បំបែកវាជាពីរ Hierarchy ដាច់ដោយឡែក ហើយប្រើ Composition (Bridge) ភ្ជាប់គ្នា។
