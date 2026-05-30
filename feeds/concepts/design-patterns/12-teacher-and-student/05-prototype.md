# វគ្គគ្រូនិងសិស្ស: Prototype (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #prototype #creational #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងវាយកီးបតលឺសូរតុកៗ លោកគ្រូយក្សដើរមកមើល)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងកំពុងវាយអីឡើង ១០០បន្ទាត់ហ្នឹង? 

**អាម៉ាប់:** បាទលោកគ្រូ! ខ្ញុំកំពុងចម្លង Object! ខ្ញុំចង់បាន Object User មួយទៀតដែលមុខមាត់ដូចអាទីមួយដែរ។ ខ្ញុំក៏វាយ `User u2 = new User(); u2.setName(u1.getName()); u2.setAge(u1.getAge());` អង្គុយសរសេរ Getter Setter រហូតគាំងដៃហើយគ្រូ!

**លោកគ្រូយក្ស (គោះក្បាល):** អាភ្លើ! ចុះបើ Object នោះវាមាន Field ជា `private` ដែលហែងមិនអាច `get` យកមកបាន តើហែងចម្លងវាយ៉ាងម៉េច? គេប្រើ **Prototype Pattern** វើយ! គឺប្រាប់ Object នោះថា "វ៉ឺយ! ចម្លងខ្លួនឯងមួយមក!" តាមរយៈ Method `clone()`! ព្រោះមានតែខ្លួនវាទេ ដែលស្គាល់ពោះវៀនវាច្បាស់!

**អាម៉ាប់ (យកដៃស្ទាបក្បាល):** អូ! ស្រួលម៉្លេះ! អញ្ចឹងខ្ញុំសរសេរ `User u2 = u1.clone()` ទៅរួចរាល់ហើយ! ... អេ! លោកគ្រូ! ម៉េចក៏ខ្ញុំប្តូរផ្ទះរបស់ u2 (`u2.setAddress("PP")`) ស្រាប់តែផ្ទះរបស់ u1 ក៏ដូរទៅ "PP" ដែរអញ្ចឹង? ខ្ញុំអត់បានប៉ះ u1 ឯណា! ខ្មោចលងមែនគ្រូ?

**លោកគ្រូយក្ស (ទះតុផាំង):** ខ្មោចលងក្បាលហែងអី! ហ្នឹងហើយគេហៅថា **Shallow Copy (ចម្លងរាក់ៗ)**! ពេលហែងហៅ `clone()` ធម្មតា វាគ្រាន់តែចម្លង "អាសយដ្ឋាន Memory" របស់ផ្ទះហ្នឹងទៅឱ្យអា u2 ទេ។ អញ្ចឹង ពួកវាទាំងពីរនៅអាស្រ័យផ្ទះតែមួយ! បើហែងកែផ្ទះ u2 វាច្បាស់ជាប៉ះ u1 ហើយអាភ្លើ!

**អាម៉ាប់:** អូហូ! គ្រោះថ្នាក់មែនទែន! ចុះធ្វើម៉េចទើបខ្ញុំអាចផ្តាច់និស្ស័យវាទាំងពីរដាច់ស្រឡះពីគ្នាបានលោកគ្រូ?

**លោកគ្រូយក្ស:** ហែងត្រូវធ្វើ **Deep Copy (ចម្លងជ្រៅ)**! មានន័យថានៅក្នុង Method `clone()` របស់ User ហែងត្រូវបញ្ជាឱ្យ Address ហ្នឹង `clone()` ខ្លួនវាមួយទៀត ដើម្បីយកផ្ទះថ្មីសន្លាងមួយប្រគល់ទៅឱ្យ u2! យល់នៅ?

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
class Address implements Cloneable {
    String city;
    @Override
    public Address clone() {
        try { return (Address) super.clone(); } 
        catch (CloneNotSupportedException e) { return null; }
    }
}

class User implements Cloneable {
    String name;
    Address address;

    @Override
    public User clone() {
        try {
            // ចម្លងរាក់ៗសិន
            User copy = (User) super.clone();
            // ចម្លងជ្រៅ ដើម្បីផ្តាច់និស្ស័យអាម៉ាប់! 
            copy.address = this.address.clone(); // បើភ្លេចបន្ទាត់នេះ ខ្មោចលងអាម៉ាប់មិនខាន!
            return copy;
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅសរសេរពាក្យ "ខ្ញុំនឹងប្រយ័ត្ន Shallow Copy" ចំនួន ១០០ ដង!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** ការបង្កើត Object ថ្មីដែលមានសភាពដូច Object ចាស់ តម្រូវឱ្យសរសេរកូដចម្លងច្រើនជាន់ និងមិនអាចចម្លងទិន្នន័យ Private បាន។
- **ដំណោះស្រាយ:** បង្កើត Method `clone()` ឱ្យវាចម្លងខ្លួនឯង (Prototype)។ ត្រូវប្រុងប្រយ័ត្នបំផុតរវាងការចម្លងរាក់ៗ (Shallow Copy) ដែលនៅជាប់ចំណង Reference និងការចម្លងជ្រៅ (Deep Copy) ដែលផ្តាច់ចំណង ១០០%។
