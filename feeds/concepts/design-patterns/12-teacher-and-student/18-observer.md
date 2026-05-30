# វគ្គគ្រូនិងសិស្ស: Observer (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #observer #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងសរសេរកម្មវិធីរង់ចាំមើលទូរស័ព្ទ iPhone ថ្មីចូលហាង គេសរសេរ Loop `while(true) { checkShop() }` ធ្វើអោយ CPU កុំព្យូទ័រឡើងដល់ ១០០% ហើយកង្ហារលាន់សំឡេងដូចយន្តហោះ! លោកគ្រូយក្សស្ទុះមកទាញខ្សែភ្លើងដកចេញ!)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងចង់ដុតសាលាមែនទេ? ហែងសរសេរ Loop វិលរាល់មិល្លីវិនាទីអោយវាសួរហាងថា "មាន iPhone នៅ? មាន iPhone នៅ?" មិនឈប់អញ្ចឹង CPU ឯណារត់រួច? នេះគេហៅថា Polling វើយ!

**អាម៉ាប់:** លោកគ្រូ! បើខ្ញុំមិនសួររហូត ម៉េចដឹងថាទូរស័ព្ទមកដល់ពេលណា?

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហែងមិនចេះចុះឈ្មោះ (Subscribe) ទុកលេខទូរស័ព្ទអោយហាងគេទេអី? ពេលមានឥវ៉ាន់មកដល់ ហាងគេជាអ្នកខល (Notify) ប្រាប់ហែងវិញ! ហែងគ្រាន់តែដេកចាំនៅផ្ទះទៅវាចប់ហើយ! នេះគេហៅថា **Observer Pattern** វើយ! 

**អាម៉ាប់ (អេះក្បាល):** អូហូ! ឡូយមែន! អញ្ចឹងខ្ញុំចុះឈ្មោះអោយហាងហ្នឹងខលមក! សុំសួរមួយគ្រូ... ចុះបើខ្ញុំឆ្កួត! ខ្ញុំចុច `subscribe()` ដាក់លេខទូរស័ព្ទរបស់ខ្ញុំហ្នឹង ចំនួន ១លានដង! តើពេលមានទូរស័ព្ទថ្មីមក ហាងហ្នឹងវាមិនខលមកខ្ញុំ ១លានដង រហូតដល់ទូរស័ព្ទខ្ញុំផ្ទុះថ្មទេអីគ្រូ?

**លោកគ្រូយក្ស (សម្លក់):** បើអ្នកសរសេរកម្មវិធីអោយហាងនោះឆ្កួតដូចហែង គឺទូរស័ព្ទហែងផ្ទុះពិតមែន! ព្រោះបើសរសេរប្រើ `ArrayList` ធម្មតា វាអាចផ្ទុកលេខដដែលៗ ១លានដងបាន! 
តែសិស្សរៀនជាមួយអញ អញបង្រៀនអោយប្រើ `Set` វើយ! `Set` មិនអនុញ្ញាតអោយមានទិន្នន័យស្ទួនទេ! ទោះហែងខំចុច Subscribe ១លានដងទៀត ក៏មានឈ្មោះហែងតែមួយគត់ក្នុងបញ្ជីដែរ!

**អាម៉ាប់:** អូ! ការពារបានល្អណាស់! ចុះបើខ្ញុំទិញទូរស័ព្ទបានហើយ ខ្ញុំលែងចង់ដឹងដំណឹងហាងហ្នឹងទៀត តែខ្ញុំភ្លេច `unsubscribe()` តើមានអីកើតឡើងលោកគ្រូ?

**លោកគ្រូយក្ស:** នោះហើយគឺជាវិនាសកម្ម "Lapsed Listener"! ហាងវានៅតែខលទៅហែងរហូត! ហើយនៅក្នុងកូដវិញ ដោយសារហាងវានៅតែកាន់ Reference ហែង កម្មវិធីលុបសម្រាម (Garbage Collector) អត់ហ៊ានលុប Object ហែងចោលទេ! កម្មវិធីហែងនឹងរីកធំឡើងៗ រហូតដល់គាំង Server (Memory Leak) តែម្តង! ដូច្នេះ ឈប់ប្រើត្រូវតែ Unsubscribe វើយ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. អ្នករង់ចាំទទួលដំណឹង (Observer)
interface Observer {
    void update(String product);
}

class Customer implements Observer {
    private String name;
    public Customer(String name) { this.name = name; }
    public void update(String p) { System.out.println(name + " ទទួលបានដំណឹង: " + p); }
}

// ២. ហាងលក់ទូរស័ព្ទ (Subject)
class TechStore {
    // ប្រើ Set ដើម្បីការពារអាម៉ាប់កំហូច Subscribe ១លានដង
    private Set<Observer> subscribers = new HashSet<>();

    public void subscribe(Observer obs) { subscribers.add(obs); }
    
    // បើភ្លេចហៅ Method នេះ Memory Leak នឹងកើតមាន!
    public void unsubscribe(Observer obs) { subscribers.remove(obs); }

    public void restock(String product) {
        System.out.println("ឥវ៉ាន់ថ្មីមកដល់: " + product);
        notifySubscribers(product);
    }

    private void notifySubscribers(String product) {
        // ដើរខលប្រាប់អតិថិជនម្តងម្នាក់ៗ
        for (Observer obs : subscribers) {
            obs.update(product); 
        }
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅ Unsubscribe គ្រប់ Newsletter ទាំងឡាយក្នុង Email របស់ខ្លួនចេញអោយអស់ បើមិនអញ្ចឹងគ្រូនឹង Block អ៊ីមែលសាលាមិនអោយប្រើ!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការប្រើ Polling ធ្វើឱ្យស៊ី CPU និង DB យ៉ាងខ្លាំង។ ចំណែកការហៅ Method ដោយផ្ទាល់ធ្វើអោយកូដមាន Tight Coupling។
- **ដំណោះស្រាយ:** បង្កើតយន្តការ Publish-Subscribe ដោយអោយ Object (Subject) ជូនដំណឹងទៅកាន់អ្នកចុះឈ្មោះ (Observers)។ ត្រូវចងចាំជានិច្ចពីការកម្ចាត់ការចុះឈ្មោះស្ទួន (ប្រើ Set) និងការ Unsubscribe ជៀសវាងបញ្ហា Memory Leaks។
