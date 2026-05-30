# Podcast: Visitor (កិច្ចសន្ទនា Podcast ជុំវិញ Visitor)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #visitor #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងជជែកពី **Visitor Pattern**។ បូរិទ្ធ ឧបមាថាអ្នកមានរចនាសម្ព័ន្ធមែកធាង (Tree) ដូចជា ចំណងជើង (Heading) និងកថាខណ្ឌ (Paragraph)។ ថ្ងៃមួយ មេប្រាប់ថាចង់បន្ថែមមុខងារ "Export to PDF" និង "Export to HTML"។ បើអ្នកកែ Class ទាំងនោះផ្ទាល់ វានឹងប៉ោងធំឡើងៗ!

**Host B (បូរិទ្ធ - អ្នករៀន):** ត្រូវហើយបង! Visitor Pattern អនុញ្ញាតឱ្យយើងបន្ថែមមុខងារថ្មី ទៅលើក្រុម Object ដែលមានស្រាប់ ដោយមិនចាំបាច់កែប្រែកូដនៅក្នុង Object ទាំងនោះឡើយ។ វាដូចជា "ភ្នាក់ងារត្រួតពិនិត្យពន្ធ" (Visitor) ដែលដើរចូលទៅពិនិត្យក្រុមហ៊ុននានាអញ្ចឹង។ ក្រុមហ៊ុន (Object) គ្រាន់តែបើកទ្វារឱ្យ Visitor ចូលមក (`accept(Visitor v)`)។

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! ពេលនោះ Object នឹងហៅត្រលប់ទៅ Visitor វិញថា `v.visit(this)`។ ល្បិចនេះហៅថា Double Dispatch ដែលជួយឱ្យ Visitor ដឹងច្បាស់ថាវាត្រូវប្រើក្បួនមួយណាសម្រាប់ Object មួយនោះ។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើភ្នាក់ងារពន្ធ (Visitor) ហ្នឹង... គាត់ចូលមកដល់ក្នុងក្រុមហ៊ុន ហើយគាត់មានគំនិតទុច្ចរិត លួចកែទិន្នន័យក្រុមហ៊ុន ឬលួចលុយយកទៅផ្ទះបាត់ តើយើងមានវិធានការការពារម៉េចទៅបង? ម៉េចក៏ឱ្យអ្នកក្រៅចូលមកស្រួលៗម៉្លេះ?

**Host A (សិទ្ធិ):** ហាហា... បូរិទ្ធឯងនេះសង្ស័យគ្រប់រឿងមែន! ប៉ុន្តែសំណួរនេះឆ្លុះបញ្ចាំងពី "ចំណុចខ្សោយដ៏ធំបំផុត" របស់ Visitor តែម្តង! បើ Object មិនបើក Public Fields ឱ្យគេទេ Visitor នោះក៏មិនអាចធ្វើការងារ (ឧទាហរណ៍ Export ទៅ PDF) បានដែរ។ ដូច្នេះយើងត្រូវបង្ខំចិត្ត "បើកទ្វារ (Encapsulation)" បន្តិចបន្តួច ដើម្បីឱ្យ Visitor អាចអានទិន្នន័យបាន។
ដើម្បីការពារកុំឱ្យ Visitor ធ្វើរឿងផ្តេសផ្តាស (ដូចបូរិទ្ធថាលួចលុយ) នៅក្នុងកូដ យើងតម្រូវឱ្យ Object នោះផ្តល់ត្រឹមតែ Method `Getter` សម្រាប់អានប៉ុណ្ណោះ ហើយហាមដាច់ខាតមិនឱ្យមាន Method `Setter` ដែលអនុញ្ញាតឱ្យ Visitor កែប្រែទិន្នន័យបានឡើយ។ អញ្ចឹងភ្នាក់ងារនោះគ្រាន់តែអាច "មើល" និងកត់ត្រា តែមិនអាចលួចលុយបានទេ!

**Host B (បូរិទ្ធ):** អូហូ! ការពារបានល្អ! អញ្ចឹងប្រើ Pattern នេះគឺចំណេញខ្លាំងពេលរចនាសម្ព័ន្ធនៃ Object របស់យើងមានភាពនឹងនរ តែយើងចង់ថែមមុខងារថ្មីៗរហូតមែនទេបង?

**Host A (សិទ្ធិ):** ពិតមែនហើយ។ តែត្រូវចាំថា បើ Object តែងតែបន្ថែមថ្មីរហូត (ឧ. ថែម `Table` Class) អ្នកត្រូវចូលទៅកែ `Visitor Interface` និងគ្រប់ Concrete Visitors ទាំងអស់ វានឹងធ្វើឱ្យកូដបែកបាក់យ៉ាងងាយ។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Element Interface
public interface DocumentNode {
    void accept(Visitor visitor); // បើកទ្វារស្វាគមន៍ Visitor
}

// ២. Concrete Elements
public class Heading implements DocumentNode {
    private String title = "Hello World";
    
    // បើកត្រឹម Getter មិនឱ្យ Visitor កែទិន្នន័យបាន (ការពារការលួច)
    public String getTitle() { return title; }
    
    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this); // Double Dispatch
    }
}
public class Paragraph implements DocumentNode {
    private String text = "Some text";
    public String getText() { return text; }
    @Override
    public void accept(Visitor visitor) { visitor.visit(this); }
}

// ៣. Visitor Interface
public interface Visitor {
    void visit(Heading heading);
    void visit(Paragraph paragraph);
}

// ៤. Concrete Visitor (មុខងារថ្មី)
public class PdfExportVisitor implements Visitor {
    public void visit(Heading heading) {
        System.out.println("Exporting Heading to PDF: " + heading.getTitle());
    }
    public void visit(Paragraph paragraph) {
        System.out.println("Exporting Paragraph to PDF: " + paragraph.getText());
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Open/Closed Principle:** បន្ថែមមុខងារថ្មីៗដោយមិនប៉ះពាល់កូដរបស់ Data Classes។
- **Single Responsibility:** ទាញយក Logic ដែលមិនសូវពាក់ព័ន្ធ (ដូចជា Export) ចេញពី Data Classes។

**គុណវិបត្តិ (Cons):**
- **ផុយស្រួយបើមានការបន្ថែម Data Classes:** ត្រូវចូលកែ Visitor Interface រាល់ពេលមាន Class ថ្មី។
- **បំពាន Encapsulation ខ្លះៗ:** បង្ខំឱ្យ Object ត្រូវបើក Public Getters ជាច្រើនដើម្បីឱ្យ Visitor អានបាន។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការបន្ថែមមុខងារថ្មីៗទៅលើរចនាសម្ព័ន្ធ Object ស្មុគស្មាញ ធ្វើឱ្យកូដប៉ោងធំ និងរញ៉េរញ៉ៃ។
- **ដំណោះស្រាយ:** បំបែកមុខងារទៅក្នុង Visitor Class ដាច់ដោយឡែក ហើយប្រើ Double Dispatch ដើម្បីអនុញ្ញាតឱ្យ Visitor ធ្វើការលើ Object នីមួយៗដោយសុវត្ថិភាព។
