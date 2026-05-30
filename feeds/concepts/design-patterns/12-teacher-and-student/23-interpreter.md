# វគ្គគ្រូនិងសិស្ស: Interpreter (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #interpreter #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងសរសេរកម្មវិធីម៉ាស៊ីនគិតលេខដែលអោយគេវាយជាអក្សរ "បូក ១ នឹង ២ ដក ៣"។ គេសរសេរ Regex និង `String.split()` ឡើង ១ម៉ឺនបន្ទាត់ រហូតដល់កុំព្យូទ័រគាំងចេញផ្សែង! លោកគ្រូយក្សដើរមកដល់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរស្អីហ្នឹង? គ្រាន់តែបូកដកលេខសោះ ម៉េចកូដហែងកាត់ String ច្របូកច្របល់ដូចបណ្តាញអគ្គិសនីអញ្ចឹង?

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំត្រូវកាត់ពាក្យ "បូក" រួចយកលេខ ១ ទៅបូកលេខ ២ រួចចាំកាត់ពាក្យ "ដក"... វិលមុខណាស់លោកគ្រូ! បើអតិថិជនវាយវង់ក្រចកចូលទៀត ខ្ញុំច្បាស់ជាសន្លប់មិនខាន!

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថាបង្កើត "ភាសាផ្ទាល់ខ្លួន (DSL)" ហើយ! គេមិនសរសេរ Regex ឆៅៗអញ្ចឹងទេ! គេត្រូវប្រើ **Interpreter Pattern** វើយ!
ហែងត្រូវបំប្លែងពាក្យ "បូក", "ដក" ហ្នឹងអោយទៅជា Class ដាច់ដោយឡែកពីគ្នា! ហើយរៀបចំវាអោយទៅជារចនាសម្ព័ន្ធដើមឈើ (AST)! Class ទាំងនោះមាន Method `interpret()` (បកប្រែ)! ពេលហែងហៅ मेथड នេះពីកំពូលដើមឈើ វាចេះដើរគណនាតៗគ្នារហូតដល់ចេញលទ្ធផល! មិនបាច់សរសេរ `if-else` កាត់ String នាំវិលមុខទេ!

**អាម៉ាប់ (អេះក្បាល):** អូហូ! សរសេរជា Class វិញតើ! អញ្ចឹងបើមានសញ្ញាគុណ, ចែក, ស្វ័យគុណ, អាំងតេក្រាល... ខ្ញុំក៏ត្រូវបង្កើត Class ម្នាក់មួយៗដែរមែនទេលោកគ្រូ? 

**លោកគ្រូយក្ស (សម្លក់មុខ):** អើ! នេះហើយជាភាពសាហាវរបស់វា! បើភាសាហែងមានក្បួនវេយ្យាករណ៍ ១ម៉ឺនក្បួន ហែងត្រូវបង្កើតកូដ ១ម៉ឺន Class! ហ្គេមហែងនឹងផ្ទុះ Class (Class Explosion) មិនខាន! អញ្ចឹងហើយ បានជាក្នុងពិភពពិត គេកម្រនឹងសរសេរ Pattern នេះដោយដៃណាស់! គេច្រើនតែប្រើកម្មវិធីជំនួយដូចជា "ANTLR" អោយវា Generate កូដអោយដោយស្វ័យប្រវត្តិ! ចំណែកឯហែង ត្រូវតែរៀនសរសេរដោយដៃដើម្បីយល់ពីបេះដូងវាសិន!

**អាម៉ាប់:** អូ! បានរៀនតែទ្រឹស្តីសោះ! តែមិនអីទេ ដឹងក្បួនបកប្រែដើមឈើ (AST) ទុកអួតប្រាប់គេក៏ចំណេញដែរ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. កិច្ចសន្យាអ្នកបកប្រែ
interface Expression {
    int interpret();
}

// ២. អ្នកកាន់តួលេខ (ស្លឹកឈើ - គ្មានកូន)
class NumberExpression implements Expression {
    private int number;
    public NumberExpression(int n) { this.number = n; }
    public int interpret() { return number; }
}

// ៣. អ្នកបូកលេខ (មែកឈើ - មានកូនឆ្វេងស្តាំ)
class AddExpression implements Expression {
    private Expression left, right;
    public AddExpression(Expression l, Expression r) { left = l; right = r; }
    
    // បង្ខំអោយកូនឆ្វេងស្តាំ គណនាលេខខ្លួនឯង រួចយកមកបូកបញ្ចូលគ្នា
    public int interpret() { return left.interpret() + right.interpret(); }
}

// ៤. អាម៉ាប់សាកល្បងដើមឈើវេយ្យាករណ៍ (AST)
class App {
    public static void main(String[] args) {
        // តំណាងអោយការបកប្រែ "បូក ១ នឹង ២"
        Expression one = new NumberExpression(1);
        Expression two = new NumberExpression(2);
        Expression tree = new AddExpression(one, two);

        System.out.println("ចម្លើយ: " + tree.interpret()); // ចេញ 3
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅសរសេរ Class សម្រាប់ "គុណ" និង "ចែក" រួចប្រមូលផ្តុំវាទៅជាដើមឈើ (AST) ដើម្បីគណនា `(1+2)*3`។ បើគណនាខុស គ្រូនឹងអោយវាយ Regex កាត់អក្សរដោយដៃរហូតទាល់តែគាំងកុំព្យូទ័រ!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កម្មវិធីត្រូវបកប្រែ (Evaluate) ប្រយោគនៃភាសា ឬរូបមន្តអ្វីមួយ ដែលការកាត់អត្ថបទ (String Parsing) ធម្មតានាំអោយកូដស្មុគស្មាញ និងគ្មានសណ្តាប់ធ្នាប់។
- **ដំណោះស្រាយ:** បំប្លែងក្បួនវេយ្យាករណ៍ (Grammar Rules) នីមួយៗទៅជា Classes ឯករាជ្យ ហើយផ្គុំវាទៅជាមែកធាង (AST)។ ប្រើប្រាស់ Method `interpret()` ដើម្បីគណនាលទ្ធផលពីកំពូលដើមឈើចុះក្រោម។ Pattern នេះស័ក្តិសមសម្រាប់តែភាសាសាមញ្ញៗប៉ុណ្ណោះ ជៀសវាងការផ្ទុះ Class។
