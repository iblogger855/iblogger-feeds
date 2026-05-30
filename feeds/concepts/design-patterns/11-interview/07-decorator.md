# វគ្គសម្ភាសន៍ការងារ: Decorator (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #decorator #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** នៅក្នុងប្រព័ន្ធ Notification របស់យើង យើងមាន `EmailNotifier`។ ស្រាប់តែមេធំចង់អោយមានផ្ញើតាម `SMSNotifier`, និង `SlackNotifier` ព្រមគ្នា។ កូនចៅខ្ញុំសរសេរកូដរហូតបង្កើត Class ដូចជា `EmailAndSMSNotifier`, `EmailAndSlackNotifier`, `EmailAndSMSAndSlackNotifier` កើនឡើងរាប់សិប Class (Class Explosion)! តើប្អូននឹងប្រើប្រាស់ក្បួន Inheritance ដោះស្រាយវា ឬយ៉ាងណា?

**បេក្ខជន (សុខា):** លោកប្រធាន! នេះគឺជាបញ្ហាបុរាណនៃការប្រើប្រាស់ Inheritance ខុសគោលដៅ! Inheritance គឺ Static ផ្លាស់ប្តូរលែងបាននៅពេល Compile ធ្វើអោយ Class ផ្ទុះឡើងបែបនេះឯង។ ខ្ញុំនឹងប្រើ **Decorator Pattern** (ប្រើប្រាស់ Composition) វិញ។
ខ្ញុំនឹងយក `Notifier` ធ្វើជាកាដូគោល។ ចំណែកឯ SMS និង Slack គឺជា "ក្រដាសរុំកាដូ" (Decorators)។ ពេល Client ចង់បានទាំងបី ខ្ញុំគ្រាន់តែយក `SlackDecorator` ទៅរុំពីក្រៅ `SMSDecorator` ហើយរុំពីក្រៅ `EmailNotifier`។ ពេលហៅ Method `send()` វានឹងហៅតៗគ្នាពីក្រៅចូលក្នុង!

**អ្នកសម្ភាសន៍ (ញញឹមចុងមាត់):** ឆ្លាតណាស់! ចុះបើខ្ញុំរុំវា ១០០ ជាន់... ឧទាហរណ៍ `new Slack(new Slack(new Slack(...)))` វានឹងរុំខ្លួនវា ១០០ដង! តើវាមិនស៊ី Memory ឬធ្វើអោយ Performance ធ្លាក់ចុះដល់កម្រិតសូន្យទេអី?

**បេក្ខជន (សុខា - ប្រុងប្រយ័ត្ន):** ពិតមែនហើយលោកប្រធាន! បើរុំ ១០០ជាន់ កម្មវិធីនឹងរត់កាត់ Method Calls រាប់រយដង ដែលប្រាកដជាធ្វើអោយ Performance ធ្លាក់ចុះបន្តិចបន្តួច។ ប៉ុន្តែនៅក្នុងការអនុវត្តជាក់ស្តែង យើងកម្ររុំ Decorator លើសពី ៥ ឬ ៦ ជាន់ណាស់។ 
លើសពីនេះ បញ្ហាដ៏ធំបំផុតរបស់ Decorator មិនមែន Performance ទេ តែគឺ **"Object Identity"**។ បន្ទាប់ពីរុំរួច Object ខាងក្រៅបំផុត មិនមែនជា Object ស្នូលខាងក្នុងទៀតទេ! បើយើងសរសេរកូដឆែក `if (myNotifier instanceof EmailNotifier)` វានឹងលោត `false` បាត់ហើយ ព្រោះឥឡូវវាគឺជា `SlackDecorator`។ នេះគឺជាកំហុសធ្ងន់ធ្ងរដែលអ្នកប្រើប្រាស់ Decorator តែងតែជួបប្រទះ!

**អ្នកសម្ភាសន៍ (ទះដៃ):** ចម្លើយដ៏មានតម្លៃបំផុត! ការលើកឡើងពីបញ្ហា "Object Identity" បង្ហាញថាប្អូនពិតជាធ្លាប់ប្រើប្រាស់វា ហើយធ្លាប់ជួបការឈឺចាប់ដោយសារវានៅក្នុងពិភពពិតមែន!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Component Interface
public interface Notifier {
    void send(String msg);
}

// ២. Concrete Component (កាដូស្នូល)
public class EmailNotifier implements Notifier {
    public void send(String msg) { System.out.println("Emailing: " + msg); }
}

// ៣. Base Decorator (ក្រដាសរុំកាដូ)
public abstract class NotifierDecorator implements Notifier {
    protected Notifier wrappee; // កាន់ Object ខាងក្នុង

    public NotifierDecorator(Notifier wrappee) {
        this.wrappee = wrappee;
    }

    public void send(String msg) {
        wrappee.send(msg); // បោះការងារបន្តទៅខាងក្នុង
    }
}

// ៤. Concrete Decorators
public class SMSDecorator extends NotifierDecorator {
    public SMSDecorator(Notifier wrappee) { super(wrappee); }

    @Override
    public void send(String msg) {
        super.send(msg); // ហៅខាងក្នុងអោយផ្ញើ Email សិន
        System.out.println("SMSing: " + msg); // រួចខ្លួនឯងផ្ញើ SMS តាមក្រោយ
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ថា Composition ប្រសើរជាង Inheritance ក្នុងការបំបាត់បញ្ហា Class Explosion។ បានលើកឡើងពីបញ្ហាលាក់កំបាំងដ៏ជ្រៅគឺ "ការបាត់បង់អត្តសញ្ញាណ Object" (Loss of Object Identity) ដែលអ្នកសម្ភាសន៍ចង់លឺបំផុត។
❌ **អន្ទាក់:** សួរអន្ទាក់ពី Performance បេក្ខជនបានបកស្រាយថាវាមិនមែនជាបញ្ហាចម្បង បើធៀបនឹងបញ្ហា Object Identity។
