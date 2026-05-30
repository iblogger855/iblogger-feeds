# វគ្គសម្ភាសន៍ការងារ: Chain of Responsibility (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #chain-of-responsibility #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** នៅក្នុង Web Server របស់យើង រាល់ពេលមាន Request ចូលមក យើងត្រូវធ្វើការពិនិត្យ ៣ ដំណាក់កាល៖ ទី១ Rate Limiting (ការពារ Spam), ទី២ Authentication (ឆែក Token), ទី៣ Validation (ឆែកទិន្នន័យ)។ កូនចៅខ្ញុំសរសេរ `if-else` គរលើគ្នាក្នុងកន្លែងតែមួយ ធ្វើអោយកូដមើលទៅដូចចាន Spaghetti! តើប្អូនមានយោបល់យ៉ាងណា?

**បេក្ខជន (សុខា):** បាទ! បញ្ហានេះដោះស្រាយបានយ៉ាងល្អដោយប្រើប្រាស់ **Chain of Responsibility Pattern**។ វាស្រដៀងទៅនឹងការបង្កើត "Middleware" នៅក្នុង Express.js អញ្ចឹងដែរ។ ខ្ញុំនឹងបំបែកការត្រួតពិនិត្យនីមួយៗ ទៅជា Class ដាច់ដោយឡែកពីគ្នា ដែលហៅថា Handler។ 
Handler នីមួយៗដឹងពីរឿងតែពីរគត់៖ "តើខ្ញុំអាចអោយវាឆ្លងកាត់បានទេ?" និង "បើបាន តើខ្ញុំត្រូវរុញវាទៅអោយអ្នកណាបន្ត?"។ យើងអាចរៀបចំលំដាប់លំដោយនៃ Handler ទាំងនេះនៅពេល Runtime បានយ៉ាងបត់បែន។

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អណាស់! ចុះបើ Request នោះរត់ឆ្លងកាត់ Handler ទាំង ៣ រួចហើយ តែ "គ្មាន Handler ណាមួយចាត់វិធានការដោះស្រាយសោះ" ព្រោះពួកវាគិតថាមិនមែនជាភារកិច្ចរបស់ខ្លួន តើមានអ្វីកើតឡើងចំពោះ Request នោះ?

**បេក្ខជន (សុខា - ប្រុងប្រយ័ត្ន):** នេះគឺជាចំណុចខ្សោយដ៏ធំមួយរបស់ Pattern នេះ! ប្រសិនបើខ្សែសង្វាក់បញ្ចប់ ដោយគ្មាននរណាម្នាក់ទទួលយក (Handle) សោះ នោះ Request នោះនឹង "ធ្លាក់ទៅក្នុងទីងងឹត" (Dropped/Ignored) ដោយគ្មានការឆ្លើយតបទៅកាន់ Client វិញឡើយ (ធ្វើអោយ Client រង់ចាំរហូតដល់ Timeout)។
ដើម្បីការពារបញ្ហានេះ ខ្ញុំតែងតែដាក់ `DefaultHandler` ឬ `FallbackHandler` មួយនៅចុងបញ្ចប់នៃខ្សែសង្វាក់ ដើម្បីទទួលចាប់យកនូវរាល់ Request ដែលគ្មានអ្នកណាព្រមយក!

**អ្នកសម្ភាសន៍:** ចុះបើមានក្មេងថ្មីម្នាក់មកតភ្ជាប់ខ្សែសង្វាក់នេះខុស ធ្វើអោយ Handler ទី៣ បោះត្រលប់ទៅអោយ Handler ទី១ វិញជារង្វង់! តើប្អូននឹងមានបញ្ហាអ្វី?

**បេក្ខជន (សុខា):** នោះប្រាកដជាកើតមាន **Circular Chain** មិនខាន! Request នោះនឹងរត់ជារង្វង់រហូតដល់ពេញ Memory ហើយគប់ `StackOverflowError` សម្លាប់ Server តែម្តង។ ដូច្នេះ ការចងខ្សែសង្វាក់ (Configuration) ត្រូវធ្វើឡើងដោយប្រុងប្រយ័ត្នបំផុត!

**អ្នកសម្ភាសន៍ (ទះដៃ):** ចម្លើយដែលបង្ហាញពីបទពិសោធន៍ឈឺចាប់ពិតៗ! ប្អូនយល់ច្បាស់ពីចំណុចគ្រោះថ្នាក់នៃ Design Pattern នេះ!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Handler Interface (ចំណុចកណ្តាលនៃខ្សែសង្វាក់)
public abstract class Handler {
    protected Handler nextHandler;

    public void setNext(Handler next) {
        this.nextHandler = next;
    }

    public abstract boolean handle(Request request);
}

// ២. Concrete Handlers (អ្នកយាមទ្វារនីមួយៗ)
public class RateLimitHandler extends Handler {
    public boolean handle(Request request) {
        if (request.getSpamScore() > 100) {
            System.out.println("Blocked by Rate Limit!");
            return false; // បញ្ឈប់ត្រឹមនេះ មិនអោយទៅមុខទៀតទេ
        }
        if (nextHandler != null) {
            return nextHandler.handle(request); // រុញទៅកាន់អ្នកបន្ទាប់
        }
        return true;
    }
}

public class AuthHandler extends Handler {
    public boolean handle(Request request) {
        if (!request.hasValidToken()) {
            System.out.println("Blocked: Unauthorized!");
            return false;
        }
        if (nextHandler != null) {
            return nextHandler.handle(request);
        }
        return true;
    }
}

// ៣. Fallback Handler (ការពារបញ្ហា Request ធ្លាក់ចូលទីងងឹត)
public class FallbackHandler extends Handler {
    public boolean handle(Request request) {
        System.out.println("Request handled by default fallback. Status: OK");
        return true;
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** ភ្ជាប់ទ្រឹស្តីទៅនឹងការអនុវត្តពិត (ប្រៀបធៀបជាមួយ Middleware)។ ដឹងពីវិធីការពារ Request ដែលគ្មានអ្នកដោះស្រាយ (Uncaught Request) តាមរយៈការដាក់ Fallback Handler។
❌ **អន្ទាក់:** សួរអំពីហានិភ័យនៃ Circular Chain។ បេក្ខជនដឹងច្បាស់ថាវានឹងធ្វើអោយ Stack Overflow គាំង Server។
