# វគ្គសម្ភាសន៍ការងារ: Bridge (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #bridge #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងកំពុងសរសេរកម្មវិធី Report។ យើងមាន Report ពីរប្រភេទគឺ `SummaryReport` និង `DetailedReport`។ ថ្ងៃមួយ យើងត្រូវបញ្ចេញវាជាទម្រង់ `PDF` និង `Excel`។ អ្នកសរសេរកម្មវិធីមុន បានបង្កើតកូន Class ចំនួន ៤ (`SummaryPDF`, `SummaryExcel`, `DetailedPDF`, `DetailedExcel`)។ ចុះបើស្អែកខ្ញុំថែមទម្រង់ `Word` និង `HTML` ព្រមទាំង Report ប្រភេទថ្មី ៣ មុខទៀត... វានឹងកើនឡើងដល់ប៉ុន្មាន Class?

**បេក្ខជន (សុខា):** បាទ! វានឹងគុណគ្នាឡើងរហូតដល់ ២៥ Classes លោកប្រធាន! នេះគេហៅថាបញ្ហា **Cartesian Product Explosion** ដែលកើតឡើងដោយសារ Class មួយប្រែប្រួលទៅតាមពីរវិមាត្រ (Dimensions) ក្នុងពេលតែមួយ (ប្រភេទ Report និងទម្រង់ Output)។ 

**អ្នកសម្ភាសន៍:** ចុះប្អូនមានថ្នាំព្យាបាលជំងឺនេះទេ? 

**បេក្ខជន (សុខា):** ពិតប្រាកដណាស់! ខ្ញុំនឹងប្រើប្រាស់ **Bridge Pattern**។ ខ្ញុំនឹង "បំបែកវិមាត្រទាំងពីរនេះចេញពីគ្នា" ទៅជាពីរ Hierarchy ដាច់ដោយឡែក។ `Report` (Abstraction) នឹងនៅម្ខាង ហើយ `Renderer` (Implementation) នឹងនៅម្ខាងទៀត។ បន្ទាប់មកខ្ញុំនឹងបង្កើត "ស្ពាន (Bridge)" ភ្ជាប់ពួកវា ដោយអោយ `Report` កាន់ `Renderer` តាមរយៈ Composition ជំនួសអោយ Inheritance។ បែបនេះវាប្តូរពីការ "គុណគ្នា (5x5=25)" មកជាការ "បូកគ្នា (5+5=10 Classes)" វិញយ៉ាងមានប្រសិទ្ធភាព!

**អ្នកសម្ភាសន៍ (ញញឹមសាកល្បង):** អូខេ! ចុះវាមិនស្រដៀងនឹង Strategy Pattern ទេអី? Strategy ក៏បំបែក Algorithm ចេញមកក្រៅតាមរយៈ Composition ដូចគ្នា។ តើ Bridge និង Strategy ខុសគ្នាយ៉ាងម៉េច?

**បេក្ខជន (សុខា - គិតបន្តិចរួចឆ្លើយ):** នេះជាសំណួរដ៏ល្អបំផុតលោកប្រធាន! ទម្រង់កូដ (Structure) របស់វាពិតជាស្រដៀងគ្នាណាស់។ ប៉ុន្តែ **គោលបំណង (Intent)** គឺខុសគ្នាស្រឡះ៖
- **Strategy:** ផ្តោតទៅលើ "ឥរិយាបទ (Behavior)" ពោលគឺយើងចង់ប្តូររូបមន្តការងារ (Algorithm) នៅពេល Runtime។
- **Bridge:** ផ្តោតទៅលើ "រចនាសម្ព័ន្ធ (Structure)" ពោលគឺយើងចង់បំបែក Hierarchy ធំមួយទៅជាពីរដាច់ពីគ្នា តាំងពីពេល Design ដើម្បីការពារកុំអោយផ្ទុះ Class ច្រើនពេក។ 

**អ្នកសម្ភាសន៍ (ងក់ក្បាលយ៉ាងរំភើប):** ឆ្លាតណាស់! អ្នករៀន Design Pattern ច្រើនតែវង្វេងត្រង់ចំណុចនេះ។ ប្អូនយល់ច្បាស់ដល់ក្រអៅបេះដូងរបស់វា!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Implementor (វិមាត្រទី២: ទម្រង់ Output)
public interface ReportRenderer {
    void renderTitle(String title);
}

public class PdfRenderer implements ReportRenderer {
    public void renderTitle(String t) { System.out.println("PDF Title: " + t); }
}

public class ExcelRenderer implements ReportRenderer {
    public void renderTitle(String t) { System.out.println("Excel Title: " + t); }
}

// ២. Abstraction (វិមាត្រទី១: ប្រភេទ Report)
public abstract class Report {
    // នេះគឺជាស្ពានភ្ជាប់ (Bridge)! វាជួយការពារ Cartesian Product Explosion
    protected ReportRenderer renderer; 

    public Report(ReportRenderer renderer) {
        this.renderer = renderer;
    }

    public abstract void generate();
}

// ៣. Refined Abstraction
public class SummaryReport extends Report {
    public SummaryReport(ReportRenderer r) { super(r); }
    public void generate() { renderer.renderTitle("Summary Report"); }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** ស្គាល់បញ្ហា Cartesian Product Explosion យ៉ាងច្បាស់។ បកស្រាយពីភាពខុសគ្នារវាង Bridge និង Strategy បានយ៉ាងមុតស្រួច ដែលនេះបង្ហាញពីការយល់ដឹងកម្រិតខ្ពស់ (Senior level understanding)។
❌ **អន្ទាក់:** សួរពីភាពស្រដៀងគ្នារវាង Bridge និង Strategy ដែលជាអន្ទាក់សម្លាប់បេក្ខជនភាគច្រើន។ បេក្ខជនបានឆ្លើយយ៉ាងជោគជ័យ។
