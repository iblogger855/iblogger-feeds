# វគ្គសម្ភាសន៍ការងារ: Builder (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #builder #creational #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន - ចូលចិត្តចាប់កំហុស):** សួស្តី! យើងមាន Class `DatabaseConfig` មួយដែលមាន Parameter ចំនួន ១៥ សម្រាប់កំណត់ Host, Port, Username, Password, Timeout...។ ខ្ញុំឃើញអ្នកអភិវឌ្ឍន៍មុន សរសេរ Constructor រហូតដល់ ១០ ផ្សេងគ្នា (Telescoping Constructor)។ ពេលខ្ញុំហៅ `new DatabaseConfig("localhost", 5432, true, false, null, 100)` ខ្ញុំឡើងវិលមុខ! តើប្អូននឹងដោះស្រាយយ៉ាងម៉េច?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះគេហៅថា "Telescoping Constructor Anti-Pattern"។ ដើម្បីដោះស្រាយ ខ្ញុំនឹងប្រើប្រាស់ **Builder Pattern**។ វាអនុញ្ញាតឱ្យយើងកំណត់ Parameter ម្តងមួយៗយ៉ាងច្បាស់លាស់ តាមរយៈ Method Chaining ដូចជា `.host("localhost").port(5432).build()`។

**អ្នកសម្ភាសន៍:** ចុះហេតុអ្វីប្អូនមិនសរសេរ Setter ធម្មតាទៅ? ដូចជា `config.setHost("localhost")`! វាខ្លី និងងាយយល់ជាងការទៅអង្គុយបង្កើត Inner Builder Class រញ៉េរញ៉ៃកូដណា! ចង់បង្ហាញថាខ្លួនឯងពូកែសរសេរកូដស្មុគស្មាញមែន?

**បេក្ខជន (សុខា - ញញឹម):** អត់ទេលោកប្រធាន! បើយើងប្រើ Setter នោះ Object នឹងស្ថិតក្នុងសភាព "អាចកែប្រែបាន" (Mutable) ជារៀងរហូត។ ចុះបើប្រព័ន្ធកំពុងរត់ ស្រាប់តែមាន Thread មួយទៀតលួចហៅ `.setPort(9999)` តើប្រព័ន្ធមិនគាំងទេឬ? 
ម្យ៉ាងទៀត ពេលយើងកំពុង Set ទិន្នន័យបានពាក់កណ្តាល (Inconsistent state) ស្រាប់តែមានអ្នកយក Object នោះទៅប្រើមុន តើវានឹងមានរឿងអ្វីកើតឡើង? 
Builder Pattern ជួយធានាភាព "មិនអាចកែប្រែបាន" (Immutability)។ ពេលហៅ `.build()` រួចរាល់ Object នោះនឹងចាក់សោរ (Immutable) ១០០%!

**អ្នកសម្ភាសន៍:** ល្អ! ចុះបើខ្ញុំតម្រូវឱ្យ Port ត្រូវតែធំជាង 0 ហើយ Timeout មិនអាច Null បាន។ តើប្អូននឹងសរសេរ Logic ឆែកមើល (Validation) នៅឯណា? នៅក្នុង Class `DatabaseConfig` ឬនៅក្នុងកូន `Builder`?

**បេក្ខជន (សុខា - គិតបន្តិច):** នេះជាសំណួរដ៏ល្បិច! ខ្ញុំនឹងដាក់ Validation នៅក្នុង Method `.build()` របស់ `Builder` សិន ដើម្បីការពារកុំឱ្យការបង្កើតបរាជ័យ (Fail-fast)។ ប៉ុន្តែ ដើម្បីសុវត្ថិភាពកម្រិតទី២ ខ្ញុំក៏នឹងពិនិត្យវាម្តងទៀតនៅក្នុង `private constructor` របស់ `DatabaseConfig` ដែរ ប្រសិនបើមាន Rule ធ្ងន់ធ្ងរដែលមិនអាចបំពានបាន។

**អ្នកសម្ភាសន៍:** ចុះបើខ្ញុំប្រាប់ថា ការសរសេរ Builder វាសរសេរកូដជាន់គ្នា (Boilerplate) ច្រើនពេក តើប្អូនមានតិចនិកអ្វីដែលមិនបាច់សរសេរដោយដៃទេ?

**បេក្ខជន (សុខា):** បាទ! ក្នុងសម័យនេះ យើងគ្រាន់តែបំពាក់ Annotation `@Builder` របស់ **Lombok** ពីលើ Class ជាការស្រេច! កូដនឹងខ្លី ហើយស្អាតភ្នែក។

**អ្នកសម្ភាសន៍:** ចម្លើយពេញចិត្តណាស់! ប្អូនចេះទាំងទ្រឹស្តី ទាំងការអនុវត្តជាក់ស្តែងក្នុងឧស្សាហកម្មពិតប្រាកដ។

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
public class DatabaseConfig {
    // ត្រូវតែជា final ដើម្បីធានា Immutability ក្រោយពេល Build រួច
    private final String host;
    private final int port;
    private final boolean sslEnabled;

    // Private constructor បង្ខំឱ្យគេប្រើតែ Builder ប៉ុណ្ណោះ
    private DatabaseConfig(Builder builder) {
        // ការពារជាន់ទី២ (Validation មុនពេលឱ្យកំណើត Object)
        if (builder.host == null || builder.host.isEmpty()) {
            throw new IllegalArgumentException("Host cannot be empty!");
        }
        
        this.host = builder.host;
        this.port = builder.port;
        this.sslEnabled = builder.sslEnabled;
    }

    public static class Builder {
        // តម្លៃ Default ល្អៗ
        private String host = "localhost";
        private int port = 5432;
        private boolean sslEnabled = false;

        public Builder host(String host) {
            this.host = host;
            return this;
        }

        public Builder port(int port) {
            // Fail-fast validation
            if (port <= 0 || port > 65535) throw new IllegalArgumentException("Invalid Port!");
            this.port = port;
            return this;
        }

        public Builder enableSSL() {
            this.sslEnabled = true;
            return this;
        }

        public DatabaseConfig build() {
            return new DatabaseConfig(this); // ប្រគល់ការងារអោយ Constructor ចាត់ចែង
        }
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំងរបស់បេក្ខជន:**
- យល់ពីភាពខុសគ្នាយ៉ាងច្បាស់រវាង Builder Pattern និងការប្រើប្រាស់ Setter (JavaBeans Pattern)។
- ចេះការពារទិន្នន័យតាមរយៈ Immutability ដែលជារឿងចាំបាច់សម្រាប់ការសរសេរកូដធំៗ។
- ដឹងពីកន្លែងដែលត្រូវដាក់ Validation Rules (Fail-fast)។
- ស្គាល់ Library ទំនើបៗដូចជា Lombok ដើម្បីកាត់បន្ថយ Boilerplate Code។

❌ **ចំណុចខ្សោយ (Trap Question):**
- គ្មាន! បេក្ខជនបានគេចផុតពីអន្ទាក់ដែលញុះញង់ឱ្យប្រើ Setter ដើម្បីភាពងាយស្រួលដោយជោគជ័យ។

**លទ្ធផល:** ឆ្លងកាត់! (Pass)
