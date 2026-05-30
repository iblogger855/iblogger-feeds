# វគ្គគ្រូនិងសិស្ស: Builder (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #builder #creational #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(ក្នុងម៉ោងរៀនសរសេរកម្មវិធី OOP, អាម៉ាប់កំពុងអង្គុយងោក លោកគ្រូយក្សក៏ដើរមកក្បែរតុ រួចគោះតុផាំង!)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងមើលកូដដែលហែងទើបតែប្រគល់ឱ្យអញនេះមើល៍! `new User("Ah Map", 18, true, false, null, "PP", true, null, 1.65);`! ហែងសរសេរអក្សរមន្តអាគមអីហ្នឹង? `true, false, null, true` មានន័យថាម៉េច? ហែងគិតថាអញជាទេវតាទាយដឹងថា Parameter ទី៣ ជាភេទ ឬជាអាសយដ្ឋានមែនទេ?

**អាម៉ាប់ (ញីភ្នែក):** បាទលោកគ្រូ! ខ្ញុំខ្ជិលសរសេរ Class ច្រើន! ខ្ញុំសរសេរ Constructor វែងអន្លាយតែមួយទៅ ស្រួលញាត់ទិន្នន័យចូលតែម្តង! បើគ្រូចង់ដឹងថា `true` ឬ `false` ហ្នឹងជាអី គ្រូគ្រាន់តែយក Mouse ទៅចង្អុលពីលើវាក្នុង IDE ទៅ វាប្រាប់ហើយតើ!

**លោកគ្រូយក្ស:** ចុះបើអញអានកូដហែងនៅលើ GitHub ដែលអត់មាន IDE ប្រាប់ តើអញត្រូវទន្ទេញវាចាំមាត់មែនទេ? នេះគេហៅថា "Telescoping Constructor" អាភ្លើ! វាធ្វើឱ្យអ្នកអានវិលមុខ ហើយងាយច្រឡំទីតាំងណាស់! ជួនកាលហែងច្រឡំវាយកម្ពស់ ១.៦៥ ចូលទៅកន្លែងទម្ងន់ ធ្វើឱ្យ User ហែងស្គមនៅសល់តែ ១គីឡូកន្លះក៏មាន! គេត្រូវប្រើ **Builder Pattern** វើយ!

**អាម៉ាប់:** អូ... Builder ហ្នឹងគឺយើងហៅ `.name("Ah Map").age(18).build()` ហ្នឹងមែនទេលោកគ្រូ? ហូយ! វែងកូដណាស់លោកគ្រូ! ខ្ញុំសរសេរ `user.setAge(18)` ប្រើ Setter ធម្មតាមិនលឿនជាងទេអី?

**លោកគ្រូយក្ស (ទាញត្រចៀកអាម៉ាប់):** ហែងចង់ប្រើ Setter មែនទេ? ចុះបើហែងกำลัง Set បានតែឈ្មោះ... ស្រាប់តែមានកូដផ្សេងវាយក Object User ហែងទៅ Save ចូល Database បាត់! ពេលនោះ Database នឹងមាន User ខ្មោច ដែលអត់មានអាយុ អត់មានទម្ងន់! បើប្រើ Builder, ទាល់តែហែងរៀបចំគ្រឿងផ្សំគ្រប់គ្រាន់ ហើយស្រែកថា `.build()` ទើប Object នោះកើតចេញជារូបរាងពេញលេញ! ពេលកើតចេញមក វា "កកថ្ម" (Immutable) កែប្រែអត់បានទេ! គ្មានអ្នកណាលួចកែអាយុហែងពីក្រោយខ្នងបានឡើយ!

**អាម៉ាប់ (រាងយល់):** អូហូ! សុវត្ថិភាពខ្ពស់! ចុះបើខ្ញុំរឹងក្បាល... ខ្ញុំហៅ `.age(-50).build()` លោកគ្រូគិតម៉េចដែរ? User ខ្ញុំអាយុដក ៥០ឆ្នាំ!

**លោកគ្រូយក្ស:** នៅក្នុង Builder គេមានកន្លែងសម្រាប់ចាប់កំហុសហែង (Validation) នៅពេលហែងហៅ `.build()`! បើវាឃើញអាយុដក ៥០ វាគប់ Exception បោកក្បាលហែងឱ្យ Error ពេញអេក្រង់តែម្តង! តោះ ចម្លងកូដនេះទៅ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// កូដដ៏មានសុវត្ថិភាពដែលលោកគ្រូយក្សបង្ខំអាម៉ាប់អោយសរសេរ
public class User {
    // fields ត្រូវតែ final ដើម្បីធានា Immutability (មិនអាចកែប្រែបាន)
    private final String name;
    private final int age;
    private final boolean isMarried;

    // private constructor ការពារការហៅ new ដោយផ្ទាល់
    private User(Builder builder) {
        this.name = builder.name;
        this.age = builder.age;
        this.isMarried = builder.isMarried;
    }

    public static class Builder {
        private String name;
        private int age;
        private boolean isMarried = false; // Default value

        public Builder name(String name) {
            this.name = name;
            return this; // Method chaining ត្រលប់មកវិញនូវខ្លួនឯង
        }

        public Builder age(int age) {
            this.age = age;
            return this;
        }

        public Builder married(boolean status) {
            this.isMarried = status;
            return this;
        }

        public User build() {
            // Validation: ការពារការលេងសើចរបស់អាម៉ាប់
            if (name == null || name.trim().isEmpty()) {
                throw new IllegalArgumentException("នាមត្រកូលឯណាអាភ្លើ?");
            }
            if (age < 0 || age > 150) {
                throw new IllegalArgumentException("អាយុអីក៏ចម្លែកម៉្លេះ?");
            }
            // ពេលត្រួតពិនិត្យរួចរាល់ ទើបឱ្យកំណើត Object ពិតប្រាកដ
            return new User(this);
        }
    }
}

// របៀបដែលអាម៉ាប់យកទៅប្រើ
User map = new User.Builder()
            .name("Ah Map")
            .age(18)
            .married(false)
            .build(); // កូដស្អាតភ្នែក ហើយគ្មានអ្នកណាច្រឡំទីតាំង Parameter ឡើយ!
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅសរសេរ Constructor ដ៏វែងអន្លាយរបស់វាឡើងវិញ ដោយដក Parameter `boolean` ចេញទាំងអស់ ហើយប្រើ `enum` ជំនួសវិញ ប្រសិនបើមិនព្រមប្រើ Builder!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** Constructor ដែលមាន Parameter ច្រើនពេក (ពិសេសប្រភេទដដែលៗ ដូចជា `String, String, int, int`) ធ្វើឱ្យងាយច្រឡំទីតាំង ហើយពិបាកអាន។ ចំណែកការប្រើ Setter ធ្វើឱ្យ Object បាត់បង់ភាព Immutability និងងាយរងគ្រោះក្នុង Multi-threading។
- **ដំណោះស្រាយ:** ប្រើ Builder Pattern ដើម្បីកំណត់ទិន្នន័យម្តងមួយៗ (Method Chaining) ដែលជួយឱ្យកូដមើលទៅដូចប្រយោគភាសាអង់គ្លេសងាយយល់ ហើយនៅចុងបញ្ចប់ផ្តល់នូវ Object ដែលមានសុវត្ថិភាព និងមិនអាចកែប្រែបាន។
