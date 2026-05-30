# Podcast: Interpreter (កិច្ចសន្ទនា Podcast ជុំវិញ Interpreter)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #interpreter #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងនឹងឈានដល់ Pattern ចុងក្រោយ គឺ **Interpreter Pattern**។ បូរិទ្ធ ធ្លាប់សរសេរកូដសម្រាប់មុខងារស្វែងរកកម្រិតខ្ពស់ទេ? ដូចជាការវាយបញ្ចូល `category:java AND (level:senior OR level:mid)`។

**Host B (បូរិទ្ធ - អ្នករៀន):** អូ! នេះគឺជាការបង្កើតភាសាស្វែងរកមួយហើយតើបង! បើខ្ញុំប្រើ `if/else` ឬ Regex ដើម្បីកាត់កូដនោះ វានឹងវង្វេងវង្វាន់មិនខាន។ ខ្ញុំដឹងថា Interpreter ដោះស្រាយដោយបំប្លែងប្រយោគនោះទៅជារចនាសម្ព័ន្ធមែកធាង (AST) រួចឱ្យវាយតម្លៃពីក្រោមឡើងលើ មែនទេបង?

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! យើងចាត់ទុកគ្រប់ពាក្យពេចន៍ទាំងអស់ជា Object ដែលហៅថា "Expression"។ `KeywordExpression` ត្រួតពិនិត្យពាក្យទោល រីឯ `AndExpression` មានផ្ទុកកូនពីរ ហើយវាឆែកកូនឆ្វេង និងកូនស្តាំ មុននឹងសម្រេចចិត្ត។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើខ្ញុំជា Hacker កំហូចម្នាក់! ខ្ញុំបង្កើត "ច្បាប់ស្វែងរក" ដែលមានវង់ក្រចករាប់សែនជាន់ ដូចជា `(((((A OR B) AND C) OR D) AND E) ...)` រាប់សែនតួ! តើពេលម៉ាស៊ីនវាយតម្លៃ (Evaluate) តើវាមិនរត់វង្វេងក្នុងព្រៃមែកធាងហ្នឹង វិលមុខស្លាប់ រហូតដល់គាំង Server ទេអីបង?

**Host A (សិទ្ធិ):** ហាហា... បូរិទ្ធឯងពិតជាពូកែរកវិធីសម្លាប់ Server របស់បងមែន! បើលោកឯងបង្កើតវង់ក្រចករាប់សែនជាន់បែបនេះ នោះការហៅ Method `evaluate()` វានឹងធ្វើ Recursive Call ចូលជ្រៅទៅៗ រហូតដល់ហៀរ Stack របស់ម៉ាស៊ីន (StackOverflowError) ហើយ Server នឹងគាំងស្លាប់ពិតប្រាកដមែន!
នេះគឺជាចំណុចខ្សោយដ៏សាហាវបំផុតរបស់ Interpreter Pattern។ វាមិនត្រូវបានរចនាឡើងសម្រាប់ "ភាសាដ៏ស្មុគស្មាញ និងមានជម្រៅជ្រៅ" នោះទេ។ បើវេយ្យាករណ៍របស់អ្នកធំធេងពេក ឬអ្នកប្រើប្រាស់អាចវាយអត្ថបទរាប់សែនបន្ទាត់បាន អ្នកគួរតែប្រើឧបករណ៍បង្កើត Parser ជំនាញៗដូចជា ANTLR ជំនួសវិញ ដែលវាមានយន្តការការពារបញ្ហានេះ។

**Host B (បូរិទ្ធ):** អូហូ! អញ្ចឹងមានន័យថា Pattern នេះប្រើបានតែជាមួយភាសាតូចតាច និងសាមញ្ញៗ ដូចជាការ Search ខ្លីៗប៉ុណ្ណោះមែនទេបង?

**Host A (សិទ្ធិ):** ច្បាស់ណាស់! សម្រាប់ការអនុវត្តតូចតាច វាងាយស្រួលយល់ និងងាយស្រួលសរសេរខ្លាំងណាស់ ព្រោះរាល់ Rule ទាំងអស់ត្រូវបានសរសេរដាច់ដោយឡែកពីគ្នានៅក្នុង Class តូចៗរៀងៗខ្លួន។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Abstract Expression Interface
public interface Expression {
    boolean evaluate(String context);
}

// ២. Terminal Expression (ស្លឹកចុងក្រោយ)
public class KeywordExpression implements Expression {
    private String keyword;
    public KeywordExpression(String keyword) { this.keyword = keyword; }

    public boolean evaluate(String context) {
        return context.contains(keyword);
    }
}

// ៣. Non-terminal Expression (មែក - មានផ្ទុកអ្នកផ្សេង)
public class AndExpression implements Expression {
    private Expression expr1;
    private Expression expr2;

    public AndExpression(Expression expr1, Expression expr2) {
        this.expr1 = expr1;
        this.expr2 = expr2;
    }

    public boolean evaluate(String context) {
        // Recursion ដែលអាចធ្វើឱ្យ Server របស់បូរិទ្ធគាំង បើមានរាប់សែនជាន់
        return expr1.evaluate(context) && expr2.evaluate(context);
    }
}

// ៤. Client Code
public class App {
    public static void main(String[] args) {
        // បង្កើតច្បាប់: "java" AND "senior"
        Expression java = new KeywordExpression("java");
        Expression senior = new KeywordExpression("senior");

        Expression finalRule = new AndExpression(java, senior);

        String context = "Looking for a java senior developer.";
        System.out.println(finalRule.evaluate(context)); // Output: true
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **ងាយស្រួលផ្លាស់ប្តូរវេយ្យាករណ៍:** បន្ថែមច្បាប់ថ្មីៗដោយគ្រាន់តែបង្កើត Class ថ្មី។
- **Implementation ងាយស្រួល:** បែងចែកបញ្ហាធំ ទៅជាកូនលក្ខខណ្ឌតូចៗនៅតាម Node នីមួយៗ។

**គុណវិបត្តិ (Cons):**
- **មិនសក្ដិសមសម្រាប់ភាសាស្មុគស្មាញ:** បើ Grammar ធំ វានឹងស៊ី Memory ខ្លាំង និងអាចបង្កឱ្យមាន StackOverflowError។
- **Performance:** ការដើរតាមមែកធាងធំៗ អាចនឹងមានល្បឿនយឺត។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** កម្មវិធីត្រូវដោះស្រាយបញ្ហាជាក់លាក់មួយដែលអាចបកប្រែជាទម្រង់ "ភាសា" (Domain-Specific Language - DSL)។
- **ដំណោះស្រាយ:** បង្កើតរចនាសម្ព័ន្ធមែកធាងនៃ Expression Classes ដែល Class នីមួយៗផ្តល់ Method `evaluate()` សម្រាប់បកប្រែអត្ថន័យ។
