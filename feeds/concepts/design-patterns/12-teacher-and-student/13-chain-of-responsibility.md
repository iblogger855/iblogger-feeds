# វគ្គគ្រូនិងសិស្ស: Chain of Responsibility (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #chain-of-responsibility #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងអង្គុយសរសេរ `if/else` រាប់សិបជាន់នៅក្នុង Method តែមួយ លោកគ្រូយក្សដើរមកដល់ រួចដកដង្ហើមធំ)*

**លោកគ្រូយក្ស:** អាម៉ាប់! អញប្រាប់អោយឆែកមើល User ពេល Login សោះ ម៉េចហែងសរសេរ `if` ឆែក Password, `if` ឆែក IP, `if` ឆែក Role គរលើគ្នាដូចភ្នំសំរាមអញ្ចឹង? កូដហែងមួយ Method ប្រវែង ៣០០ បន្ទាត់! ពេលមាន Error ទៅរកឯណាឃើញ?

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំខ្លាចគេ Hack! អញ្ចឹងខ្ញុំដាក់ប៉ុស្តិ៍ត្រួតពិនិត្យ ៣ កន្លែងក្នុងកូដតែមួយហ្នឹងទៅ វាស្រួលមើល! បើខុសមួយណា ខ្ញុំលោត Error ភ្លាម!

**លោកគ្រូយក្ស (គប់ហ្វឺត):** ស្រួលមើលក្បាលហែងអី! នេះគេហៅថា កូដ Spaghetti! គេត្រូវប្រើ **Chain of Responsibility Pattern** វើយ! ហែងត្រូវបំបែកប៉ុស្តិ៍ត្រួតពិនិត្យហ្នឹងជា Class តូចៗដាច់ពីគ្នា! មួយឆែក Password មួយឆែក IP មួយឆែក Role! រួចអោយវាតម្រង់ជួរគ្នា! ពេលមាន Request ចូលមក អាទី១ ឆែករួច បោះអោយអាទី២, អាទី២ ឆែករួច បោះអោយអាទី៣! បើអាណាមួយឃើញកំហុស វា "ទាត់ចោល" ភ្លាម មិនបាច់រុញទៅមុខទៀតទេ!

**អាម៉ាប់ (អេះក្បាល):** អូហូ! ដូច Middleware ក្នុង Express.js អញ្ចឹងមែនទេគ្រូ? គ្រាន់តែហៅ `next()` រុញទៅមុខ!
ចុះសុំសួរមួយគ្រូ! បើខ្សែសង្វាក់ហ្នឹងវាវែងពេក... ហើយខ្ញុំសរសេរកូដច្រឡំ អោយអាទី៣ រុញត្រលប់មកអោយអាទី១ វិញ តើវានឹងមានរឿងអីកើតឡើង? អតិថិជនរង់ចាំស្លាប់ហើយ!

**លោកគ្រូយក្ស (សម្លក់មុខ):** បើហែងភ្ជាប់ខ្សែសង្វាក់ជារង្វង់បែបនេះ កូដហែងវានឹងរត់វិលវល់ (Infinite Loop / Circular Chain) រហូតដល់ម៉ាស៊ីន Server គាំងចេញផ្សែង (Stack Overflow) ស្លាប់ទាំងពូជមិនខាន! ដូច្នេះ ពេលហែងចងខ្សែសង្វាក់ ហែងត្រូវចងអោយវាមាន "ទីបញ្ចប់" វើយ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. អ្នកយាមទ្វារកម្រិតមូលដ្ឋាន (Handler Base)
abstract class CheckMiddleware {
    protected CheckMiddleware next;

    // ចងខ្សែសង្វាក់ (ប្រយ័ត្នចងជារង្វង់តាមអាម៉ាប់!)
    public void linkWith(CheckMiddleware next) {
        this.next = next;
    }

    public boolean check(String email, String password) {
        if (next == null) return true; // ចុងបញ្ចប់នៃខ្សែសង្វាក់
        return next.check(email, password); // រុញអោយអ្នកបន្ទាប់
    }
}

// ២. ប៉ុស្តិ៍ត្រួតពិនិត្យនីមួយៗ (ផ្តោតលើការងារតែមួយគត់)
class UserExistsMiddleware extends CheckMiddleware {
    public boolean check(String email, String password) {
        if (!email.equals("admin@test.com")) {
            System.out.println("មិនស្គាល់ Email នេះទេ!");
            return false; // ផ្តាច់ខ្សែសង្វាក់! មិនបោះបន្ត!
        }
        return super.check(email, password); // ត្រូវហើយ! រុញបន្តទៅ!
    }
}

class RoleMiddleware extends CheckMiddleware {
    public boolean check(String email, String password) {
        System.out.println("ស្វាគមន៍លោក Admin!");
        return super.check(email, password);
    }
}

// ៣. របៀបអាម៉ាប់ចងខ្សែសង្វាក់
class App {
    public static void main(String[] args) {
        CheckMiddleware middleware = new UserExistsMiddleware();
        middleware.linkWith(new RoleMiddleware());
        
        // ចាប់ផ្តើមរុញចូលខ្សែសង្វាក់
        middleware.check("admin@test.com", "123"); 
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅរៀបចំជួរអ្នកដំណើរនៅចំណតឡានក្រុង ហើយបញ្ជូនពួកគេពីម្នាក់ទៅម្នាក់អោយបានត្រឹមត្រូវ បើហ៊ានបញ្ជូនជារង្វង់ គ្រូនឹងអោយរត់ជុំវិញសាលា!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កូដមាន `if-else` ច្រើនជាន់ ដើម្បីត្រួតពិនិត្យលក្ខខណ្ឌបន្តបន្ទាប់គ្នា ធ្វើអោយកូដរញ៉េរញ៉ៃ (Spaghetti code) និងលំបាកក្នុងការថែទាំ។
- **ដំណោះស្រាយ:** បំបែកការត្រួតពិនិត្យនីមួយៗទៅជា Class (Handler) ដាច់ដោយឡែក ហើយចងភ្ជាប់ពួកវាជាខ្សែសង្វាក់ (Chain)។ Request នឹងរត់កាត់ Handler ម្តងមួយៗ រហូតដល់វាត្រូវបានដោះស្រាយ ឬបដិសេធ។
