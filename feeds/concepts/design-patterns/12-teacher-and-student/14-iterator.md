# វគ្គគ្រូនិងសិស្ស: Iterator (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #iterator #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងអង្គុយអានបញ្ជីឈ្មោះសិស្សក្នុង Array ដោយប្រើ Loop `for (int i = 0; i <= 1000000; i++)` រួចចុច Run ស្រាប់តែចេញពុម្ពអក្សរក្រហមឆ្អៅ `ArrayIndexOutOfBoundsException` ពេញអេក្រង់!)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរ Loop លេងសើចស្អីហ្នឹង? សិស្សក្នុងថ្នាក់មានតែ ៥០នាក់សោះ ហែងអោយវាអានរហូតដល់ ១លាននាក់?

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំខ្ជិលរាប់! ខ្ញុំគ្រាន់តែដឹងថាចង់អានទៅមុខរហូត! អញ្ចឹងខ្ញុំដាក់ ១លានដងទៅ កុំអោយខ្វះ! ម៉េចកុំព្យូទ័រវាជេរខ្ញុំអញ្ចឹង?

**លោកគ្រូយក្ស (ទាញត្រចៀក):** វាជេរហែងព្រោះហែងហួសព្រំដែនហ្នឹងហើយ! ដើម្បីការពារកុំអោយហែងវង្វេងក្នុង Array ឬ Tree គេត្រូវប្រើ **Iterator Pattern** វើយ! វាប្រៀបដូចជាហែងមាន "អ្នកជំនួយការ" ម្នាក់! ហែងមិនបាច់ខ្វល់រឿង Index `i` អីទេ ហែងគ្រាន់តែសួរវាថា `hasNext()` (មានអ្នកបន្ទាប់អត់?)។ បើមាន ហែងប្រាប់ថា `next()` (យកមក!) វាស្រួលអញ្ចឹង!

**អាម៉ាប់:** អូ! យល់ហើយលោកគ្រូ! គឺមានអ្នកចាំចាត់ចែងអោយ! ចុះបើ... ខ្ញុំរឹងក្បាល! ទោះវាប្រាប់ថា `hasNext()` ស្មើ `false` (អស់សិស្សហើយ) ក៏ខ្ញុំនៅតែស្រែកបញ្ជាអោយ `next()` រកសិស្សមកអោយខ្ញុំទៀត! តើអ្នកជំនួយការ (Iterator) វានឹងរត់ទៅឋាននរក កកាយរកខ្មោចមកអោយខ្ញុំមែនទេលោកគ្រូ?

**លោកគ្រូយក្ស (សម្លក់):** បើហែងរឹងក្បាលហៅ `next()` ទាំងដែលអត់មានមនុស្ស អ្នកជំនួយការវានឹងគប់គ្រាប់បែក `NoSuchElementException` ចំកណ្តាលក្បាលហែងតែម្តង! វាអត់ទៅរកខ្មោចអោយហែងទេ តែវានឹងអោយកម្មវិធីហែង Crash ស្លាប់ភ្លាមៗ! ដូច្នេះច្បាប់ទម្លាប់នៃការប្រើ Iterator គឺត្រូវតែសួរ `hasNext()` មុនជានិច្ច! យល់នៅ?

**អាម៉ាប់:** បាទ! យល់ច្បាស់ហើយ! មិនហ៊ានលេងសើចជាមួយ Iterator ទេ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. Iterator Interface (អ្នកជំនួយការ)
public interface Iterator<T> {
    boolean hasNext();
    T next();
}

// ២. Concrete Iterator (អ្នកជំនួយការប្រចាំថ្នាក់)
public class StudentIterator implements Iterator<String> {
    private String[] students;
    private int cursor = 0; // អ្នកជំនួយការកាន់ប៊ិចចង្អុល (State)

    public StudentIterator(String[] students) {
        this.students = students;
    }

    @Override
    public boolean hasNext() {
        return cursor < students.length;
    }

    @Override
    public String next() {
        // ការពារអាម៉ាប់កំហូច!
        if (!hasNext()) {
            throw new NoSuchElementException("អស់សិស្សហើយអាម៉ាប់ អត់មានខ្មោចឯណាទេ!");
        }
        return students[cursor++]; // អានរួច រុញប៊ិចទៅមុខ
    }
}

// ៣. របៀបអាម៉ាប់ប្រើប្រាស់ដោយសុវត្ថិភាព
public class App {
    public static void main(String[] args) {
        String[] classList = {"Sok", "Sao", "Mao"};
        Iterator<String> iterator = new StudentIterator(classList);

        // ប្រើប្រាស់ដោយមានវិន័យ
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវដើរទៅជួបមិត្តរួមថ្នាក់ម្តងម្នាក់ៗ ហើយសួរថា `hasNext()` មុននឹងសុំចាប់ដៃ! បើភ្លេចសួរ គ្រូនឹងអោយរត់ជុំវិញសាលា!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការប្រើប្រាស់ Loop ធម្មតា ទាមទារឱ្យដឹងពីរចនាសម្ព័ន្ធខាងក្នុងនៃទិន្នន័យ (Array, List, Tree) និងងាយបង្កកំហុស (Index out of bounds)។
- **ដំណោះស្រាយ:** បង្កើត Iterator Object ដើម្បីលាក់បាំងភាពស្មុគស្មាញនៃការ Traverse និងផ្តល់នូវ Method ស្តង់ដារ (`hasNext()`, `next()`) សម្រាប់ទាញយកទិន្នន័យប្រកបដោយសុវត្ថិភាព។
