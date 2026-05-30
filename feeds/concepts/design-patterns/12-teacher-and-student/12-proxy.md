# វគ្គគ្រូនិងសិស្ស: Proxy (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #proxy #structural #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងសរសេរកម្មវិធីធនាគារ ដោយអនុញ្ញាតអោយកូដគ្រប់កន្លែងអាចហៅ `Database.deleteUser()` បានដោយសេរី! លោកគ្រូយក្សស្ទុះមកទាញកាសចេញពីត្រចៀក)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរកូដអីហ្នឹង? ហែងបើកទ្វារ Database ចោលអោយអ្នកណាចូលលុបទិន្នន័យតាមចិត្តមែនទេ? បើមាន Hacker ចូលមក វាមិនលុបប្រាក់ខែអញចោលបាត់ហើយទេអី?

**អាម៉ាប់:** លោកគ្រូ! Database ខ្ញុំមាន Method លុប អញ្ចឹងខ្ញុំគ្រាន់តែហៅវាទៅ! ខ្ញុំមិនដឹងថាអ្នកណាលុបទេ ខ្ញុំដឹងតែអោយវារត់ទៅ!

**លោកគ្រូយក្ស (ទះតុផាំង):** អាភ្លើ! របស់សំខាន់ដូចជា Database គេមិនអាចអោយនរណាម្នាក់ហៅផ្ទាល់ដោយគ្មានការត្រួតពិនិត្យនោះទេ! គេត្រូវជួល "អង្គរក្ស" មកយាមមុខទ្វារ! អង្គរក្សនោះនៅក្នុងកូដហៅថា **Proxy Pattern**! 

**អាម៉ាប់ (អេះក្បាល):** អង្គរក្សហ្នឹងធ្វើយ៉ាងម៉េចទៅលោកគ្រូ? វានឹងវាយ Hacker អោយបែកក្បាលមែន?

**លោកគ្រូយក្ស:** អង្គរក្ស (Proxy) ហ្នឹង វាមានមុខមាត់ និង Method ដូច Database បេះបិទ! Client ខាងក្រៅគិតថាវាកំពុងនិយាយជាមួយ Database ពិត តែតាមពិតកំពុងនិយាយជាមួយ Proxy ទេ! មុននឹង Proxy ហៅទៅ Database ពិត វាត្រូវសួរថា "ឯងមាន Password អត់?" "ឯងមានសិទ្ធិលុបអត់?" (Protection Proxy)។ ជួនកាលវាអាចរក្សាទុកទិន្នន័យបណ្ដោះអាសន្ន (Caching Proxy) ដើម្បីកុំអោយរំខាន Database ញឹកញាប់ពេក!

**អាម៉ាប់ (សើចកក្អិក):** ហាហា... ចុះបើអង្គរក្ស (Proxy) ហ្នឹង... គាត់ស៊ីសំណូកពី Hacker! ហើយគាត់បើកទ្វារឱ្យ Hacker ចូលទៅលុបប្រាក់ខែលោកគ្រូ តើការពារម៉េចទៅគ្រូ?

**លោកគ្រូយក្ស (សម្លក់):** បើអង្គរក្សស៊ីសំណូក មានន័យថាហែងសរសេរ Logic ក្នុង Proxy ហ្នឹងខ្សោយ! ហែងសរសេរ `if (password == "123")` អញ្ចឹងវាច្បាស់ជាធ្លាយហើយ! Proxy ល្អ គឺត្រូវការពារវដ្តជីវិតរបស់ Object ពិតយ៉ាងតឹងរ៉ឹង! ក្នុងនោះ Proxy ជាអ្នកសាងសង់ (Instantiate) Object ពិតដោយខ្លួនឯង កុំអោយ Client ខាងក្រៅលូកដៃដល់អោយសោះ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. កិច្ចសន្យារួម (ធ្វើអោយ Client មើលអត់ដឹងថាជួបអ្នកពិត ឬអង្គរក្ស)
interface Database {
    void deleteUser(String id);
}

// ២. Database ពិតប្រាកដ (ផុយស្រួយ បើគ្មានអ្នកការពារ)
class RealDatabase implements Database {
    public void deleteUser(String id) {
        System.out.println("Deleting User: " + id); // លុបពិតៗ!
    }
}

// ៣. អង្គរក្ស (Protection Proxy)
class DatabaseProxy implements Database {
    private RealDatabase realDB;
    private String userRole;

    public DatabaseProxy(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public void deleteUser(String id) {
        // អង្គរក្សចាប់ផ្តើមធ្វើការឆែកឆេរ (ការពារការស៊ីសំណូក!)
        if ("ADMIN".equals(userRole)) {
            if (realDB == null) {
                realDB = new RealDatabase(); // បង្កើតដោយខ្លួនឯង សុវត្ថិភាពខ្ពស់
            }
            realDB.deleteUser(id);
        } else {
            System.out.println("បដិសេធ! ឯងគ្មានសិទ្ធិទេអាម៉ាប់!");
        }
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅឈរយាមមុខទ្វារសាលារយៈពេល ៣ម៉ោង ធ្វើជា Proxy អោយសាលា និងសួរ Password គ្រប់សិស្សដែលចូល!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការទាក់ទងផ្ទាល់ទៅកាន់ Object ដែលប្រើប្រាស់ធនធានច្រើន ឬតម្រូវការសុវត្ថិភាពខ្ពស់ (ដូចជា Database, Network) អាចបណ្តាលឱ្យប្រព័ន្ធដើរយឺត ឬគ្មានសុវត្ថិភាព។
- **ដំណោះស្រាយ:** បង្កើត Proxy Class មួយដែលដើរតួជា "អ្នកតំណាង" ដើម្បីទប់ទល់ ត្រួតពិនិត្យ (Access Control) ឬរក្សាទុកទិន្នន័យ (Caching) មុននឹងអនុញ្ញាតឱ្យប្រតិបត្តិការទៅដល់ Object ពិតប្រាកដ។
