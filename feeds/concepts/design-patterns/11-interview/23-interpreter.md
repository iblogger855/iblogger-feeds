# វគ្គសម្ភាសន៍ការងារ: Interpreter (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #interpreter #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងកំពុងសរសេរកម្មវិធីគណិតវិទ្យាមួយ ដែលអនុញ្ញាតអោយអ្នកប្រើប្រាស់វាយបញ្ចូលរូបមន្ត (Expression) ដូចជា `5 + (3 - 1)` ជាទម្រង់ String។ ប្រព័ន្ធយើងត្រូវអាន String នោះហើយគណនាលទ្ធផល។ កូនចៅខ្ញុំសរសេរ Regular Expression រាប់ពាន់បន្ទាត់ដើម្បីកាត់ String នេះ ធ្វើអោយកូដគាំងនិងមើលលែងយល់! តើប្អូនមាន Design Pattern ណាដែលអាចជួយបានទេ?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះគឺការបង្កើត "ភាសាផ្ទាល់ខ្លួន (Domain-Specific Language - DSL)"។ ដំណោះស្រាយដែលស័ក្តិសមបំផុតគឺ **Interpreter Pattern**។
ខ្ញុំនឹងបម្លែង String `5 + (3 - 1)` នោះទៅជា "ដើមឈើវេយ្យាករណ៍ (Abstract Syntax Tree - AST)"។ រាល់តួអក្សរ និងសញ្ញាប្រមាណវិធី នឹងត្រូវតំណាងដោយ Class ដាច់ដោយឡែកពីគ្នា! ឧទាហរណ៍ យើងមាន `NumberExpression`, `AddExpression`, `SubtractExpression`។ Class ទាំងអស់នេះមាន Method តែមួយគត់គឺ `interpret()`។ ពេលយើងហៅ `interpret()` ពីឬសគល់នៃដើមឈើ វានឹងរត់គណនាតៗគ្នាចុះក្រោមរហូតបានចម្លើយយ៉ាងត្រឹមត្រូវ ដោយមិនបាច់សរសេរ Regex ស្មុគស្មាញឡើយ!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ស្តាប់ទៅឡូយមែន! ប៉ុន្តែចុះបើភាសារបស់យើងវាកាន់តែធំឡើងៗ? ឧទាហរណ៍ ថែមសញ្ញាគុណ ចែក ស្វ័យគុណ អាំងតេក្រាល លក្ខខណ្ឌ `if-else`... តើប្រព័ន្ធរបស់ប្អូននឹងមានបញ្ហាអ្វី? តើមានមនុស្សច្រើនទេដែលប្រើ Pattern នេះ?

**បេក្ខជន (សុខា - ប្រុងប្រយ័ត្ន):** នេះគឺជាចំណុចខ្សោយដ៏ធ្ងន់ធ្ងររបស់ Interpreter Pattern! វាស័ក្តិសមសម្រាប់តែ "ភាសាសាមញ្ញៗ (Simple Grammar)" ប៉ុណ្ណោះ។ ប្រសិនបើភាសានោះស្មុគស្មាញ វាទាមទារអោយយើងបង្កើត Class រាប់រយរាប់ពាន់ ដែលបណ្តាលអោយមាន **Class Explosion** កម្រិតធ្ងន់ និងពិបាកថែទាំបំផុត។
តាមការពិត នៅក្នុងឧស្សាហកម្មជាក់ស្តែង មនុស្សកម្រនឹងសរសេរ Interpreter Pattern ដោយដៃណាស់! គេច្រើនតែប្រើប្រាស់ឧបករណ៍ជំនួយ (Parser Generators) ដូចជា **ANTLR** ឬ **Yacc** ដើម្បីផលិតកូដដើមឈើនេះដោយស្វ័យប្រវត្តិវិញ។

**អ្នកសម្ភាសន៍:** ចម្លើយតឹងរឹង និងប្រាកដប្រជា! ការដឹងពីដែនកំណត់នៃ Pattern និងដឹងពីឧបករណ៍ទំនើប (ANTLR) គឺជាសញ្ញានៃវិស្វករជើងចាស់។

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Abstract Expression (កិច្ចសន្យាអោយចេះគណនា)
public interface Expression {
    int interpret();
}

// ២. Terminal Expression (ស្លឹក - គ្មានកូន - តំណាងអោយតួលេខ)
public class NumberExpression implements Expression {
    private int number;
    public NumberExpression(int number) { this.number = number; }
    
    @Override
    public int interpret() { return number; }
}

// ៣. Non-Terminal Expression (មែក - មានកូន - តំណាងអោយសញ្ញាបូក)
public class AddExpression implements Expression {
    private Expression left;
    private Expression right;

    public AddExpression(Expression left, Expression right) {
        this.left = left; this.right = right;
    }

    @Override
    public int interpret() {
        return left.interpret() + right.interpret(); // ហៅកូនអោយគណនាបន្ត!
    }
}

// ៤. របៀបប្រើប្រាស់ (Client ត្រូវចេះរៀបចំដើមឈើ AST សិន)
public class Client {
    public static void main(String[] args) {
        // តំណាងអោយ (5 + 3)
        Expression five = new NumberExpression(5);
        Expression three = new NumberExpression(3);
        Expression addition = new AddExpression(five, three);

        System.out.println("Result: " + addition.interpret()); // ចេញ 8
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីការប្រើប្រាស់ AST (Abstract Syntax Tree) ដើម្បីគណនារូបមន្ត។ 
❌ **អន្ទាក់:** សួរអំពីភាពកម្រមាននៃការប្រើប្រាស់ (Class Explosion) និងជម្រើសល្អជាងនៅក្នុងពិភពពិត។ បេក្ខជនបានផ្តល់ចម្លើយយ៉ាងមុតស្រួចដោយលើកយក Tool ដូចជា ANTLR មកពន្យល់ ដែលបង្ហាញពីចំណេះដឹងទូលំទូលាយ។
