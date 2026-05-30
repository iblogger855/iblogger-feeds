# Storyteller: Factory Method (វីរបុរស Factory Method និងការដោះលែងប្រព័ន្ធផ្ញើសារពីរនរក switch)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #storyteller #narrative-arc #conflict-resolution #design-patterns #factory-method #clean-code  
**Category:** Concepts / Storyteller Narrative Arc  
**Read Time:** ~7 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ការចាប់ផ្តើមជម្លោះ៖ ប្រឡាយលក្ខខណ្ឌ switch ឥតកំណត់ (Inciting Incident)](#១-ការចាប់ផ្តើមជម្លោះ-ប្រឡាយលក្ខខណ្ឌ-switch-ឥតកំណត់-inciting-incident)
- [២. ភាពតានតឹងឡើងកម្រិត៖ ការបែកបាក់នៅថ្ងៃ Black Friday (Rising Action)](#២-ភាពតានតឹងឡើងកម្រិត-ការបែកបាក់នៅថ្ងៃ-black-friday-rising-action)
- [៣. របកគំហើញវីរបុរស៖ ការណែនាំ Factory Method (The Climax & Solution)](#៣-របកគំហើញវីរបុរស-ការណែនាំ-factory-method-the-climax-solution)
- [៤. Related Posts](#៤-related-posts)

---

## ១. ការចាប់ផ្តើមជម្លោះ៖ ប្រឡាយលក្ខខណ្ឌ switch ឥតកំណត់ (Inciting Incident)

### English
Dara was a junior engineer at a fast-growing retail company. Inside the central server sat a class named `NotificationService`. It was the heart of the company's customer communication. 

But it was a dark, scary heart.

Whenever the company wanted to send an alert, the `NotificationService` had to parse user preferences and initialize a concrete sender. In the beginning, there were only two options: Email and SMS. Dara's predecessor had written a small `if/else` block:
```java
if (type.equals("email")) {
    new SmtpEmailSender().send(...);
} else {
    new TwilioSmsSender().send(...);
}
```
But the company grew. Marketing demanded WhatsApp notifications. Then Push notifications. Then Slack alerts. With every new request, Dara had to open `NotificationService.java` and write another block of code, dragging in new concrete imports, and recompiling the entire system. The imports at the top of the file grew like ivy, choking the class. It was a classic case of tight coupling.

### Khmer
តារា គឺជាវិស្វករកូដវ័យក្មេងម្នាក់នៅក្នុងក្រុមហ៊ុនលក់រាយដែលកំពុងរីកចម្រើនយ៉ាងឆាប់រហ័ស។ នៅក្នុងម៉ាស៊ីនមេកណ្តាល មាន Class មួយឈ្មោះថា `NotificationService`។ វាជាបេះដូងនៃការប្រស្រ័យទាក់ទងជាមួយអតិថិជនរបស់ក្រុមហ៊ុន។

ប៉ុន្តែវាជាបេះដូងដ៏ខ្មៅងងឹត និងគួរឱ្យខ្លាច។

រាល់ពេលដែលក្រុមហ៊ុនចង់ផ្ញើសារព្រមាន `NotificationService` ត្រូវតែវិភាគចំណូលចិត្តអ្នកប្រើប្រាស់ និងបង្កើត Object ផ្ញើសារពិតប្រាកដ។ ដំបូងឡើយ មានជម្រើសតែពីរប៉ុណ្ណោះ៖ Email និង SMS។ អ្នកកាន់កូដមុនតារាបានសរសេរលក្ខខណ្ឌ `if/else` ខ្លីមួយ៖
```java
if (type.equals("email")) {
    new SmtpEmailSender().send(...);
} else {
    new TwilioSmsSender().send(...);
}
```
ប៉ុន្តែក្រុមហ៊ុនបានរីកចម្រើន។ ផ្នែកទីផ្សារទាមទារឱ្យមានការផ្ញើសារតាម WhatsApp។ បន្ទាប់មក Push notifications។ បន្ទាប់មក Slack alerts។ រាល់ពេលមានតម្រូវការថ្មី តារាត្រូវបើកឯកសារ `NotificationService.java` រួចសរសេរលក្ខខណ្ឌ `if/else` ថ្មីបន្ថែម អូសទាញ concrete imports ថ្មីៗចូល និងធ្វើការ Compiling ប្រព័ន្ធទាំងមូលឡើងវិញ។ Imports នៅផ្នែកខាងលើនៃឯកសារបានកើនឡើងដូចជាវល្លិ រុំព័ទ្ធ Class នោះរហូតស្ទះ។ វាជាករណីគំរូនៃការចងភ្ជាប់គ្នាស្អិតរមួត (Tight Coupling)។

---

## ២. ភាពតានតឹងឡើងកម្រិត៖ ការបែកបាក់នៅថ្ងៃ Black Friday (Rising Action)

### English
Black Friday arrived. Millions of buyers flooded the app. At 12:00 PM, the marketing director rushed to Dara's desk, sweat dripping from his forehead. *"Dara! We just signed a contract with a premium SMS provider to handle the massive traffic! We need to swap out Twilio and route all SMS through `PlivoSmsSender` immediately! Now!"*

Dara's hands trembled. He opened `NotificationService.java`. It was over 2,000 lines long, filled with messy logical branches. As he tried to carefully replace `new TwilioSmsSender()` with `new PlivoSmsSender()`, his finger slipped. He missed a semicolon and messed up a dependency import. 

He pushed the hotfix to production.

The server crashed. The checkout notifications stopped. The company was losing $10,000 every single minute. The CEO stood behind Dara, arms crossed, staring silently at the error logs. The problem was clear: `NotificationService` knew too much about the creation details of concrete senders. A change in a single provider brought the entire delivery engine down.

### Khmer
ថ្ងៃ Black Friday បានមកដល់។ អ្នកទិញរាប់លាននាក់បានសម្រុកចូលប្រើប្រាស់កម្មវិធី។ នៅម៉ោង ១២ ថ្ងៃត្រង់ នាយកផ្នែកទីផ្សារបានរត់មកតុរបស់តារា ញើសហូរស្រក់ពីក្បាល។ *«តារា! យើងទើបតែចុះហត្ថលេខាជាមួយក្រុមហ៊ុនផ្តល់សេវា SMS លំដាប់ខ្ពស់មួយដើម្បីគ្រប់គ្រងចរាចរណ៍ដ៏ធំនេះ! យើងត្រូវប្តូរ Twilio ចេញ ហើយបញ្ជូន SMS ទាំងអស់តាមរយៈ `PlivoSmsSender` ភ្លាមៗ! ឥឡូវនេះ!»*

ដៃរបស់តារាញ័រទទ្រើក។ គេបានបើកឯកសារ `NotificationService.java`។ វាមានប្រវែងជាង ២,០០០ បន្ទាត់ ពោរពេញដោយលក្ខខណ្ឌលំអៀង និងរញ៉េរញ៉ៃ។ នៅពេលគេព្យាយាមប្តូរ `new TwilioSmsSender()` ទៅជា `new PlivoSmsSender()` ដោយប្រុងប្រយ័ត្ន ម្រាមដៃរបស់គេបានរអិល។ គេបានភ្លេចសញ្ញា `;` (semicolon) និងធ្វើឱ្យខូច dependency import មួយ។

គេបានរុញកូដកែប្រែបន្ទាន់នោះទៅកាន់ Production Server។

ប្រព័ន្ធ Server បានគាំងទាំងស្រុង។ ការផ្ញើសារបញ្ជាក់ការទិញទំនិញត្រូវបានបញ្ឈប់។ ក្រុមហ៊ុនកំពុងខាតបង់ប្រាក់ ១០,០០០ ដុល្លារក្នុងមួយនាទី។ នាយកប្រតិបត្តិ (CEO) បានឈរនៅពីក្រោយខ្នងតារា ឱបដៃ និងសម្លឹងមើលកំហុសកូដដោយស្ងៀមស្ងាត់។ បញ្ហាគឺច្បាស់ណាស់៖ `NotificationService` ដឹងច្រើនពេកអំពីព័ត៌មាននៃការបង្កើត Concrete Senders។ ការផ្លាស់ប្តូរអ្នកផ្តល់សេវាតែមួយ ធ្វើឱ្យខូចម៉ាស៊ីនចែកចាយទាំងមូល។

---

## ៣. របកគំហើញវីរបុរស៖ ការណែនាំ Factory Method (The Climax & Solution)

### English
In the midst of the crisis, Dara took a deep breath. He remembered the advice of a senior architect: *"Decouple execution from creation. Let the parent run the flow, and let subclasses build the objects."*

Dara deleted the messy imports and stripped out all the `if/else` logic. He declared an abstract `createSender()` method inside `NotificationService`, turning it into a pure template of execution:
```java
public abstract class NotificationService {
    protected abstract Sender createSender(); // The Factory Method

    public void notifyUser(User user, String message) {
        Sender sender = createSender(); // Defer instantiation to subclasses
        sender.send(user, message);
    }
}
```
Then, he created two tiny, single-responsibility subclasses:
1. `EmailNotificationService` which returns `new SmtpEmailSender()`.
2. `SmsNotificationService` which returns `new PlivoSmsSender()`.

He deployed the refactored code. The server sprang back to life! Checking out was smooth again. 

When the marketing director came back the next day asking to add WhatsApp, Dara didn't touch a single line of `NotificationService`. He simply wrote a new subclass: `WhatsAppNotificationService`. The core engine remained perfectly locked against modifications, yet fully open to extension. Dara had vanquished the giant switch-statement monster forever using the **Factory Method Pattern**.

### Khmer
នៅក្នុងស្ថានភាពដ៏អាសន្ននោះ តារាបានដកដង្ហើមធំ។ គេបាននឹកឃើញដំបូន្មានរបស់ស្ថាបត្យករជាន់ខ្ពស់ម្នាក់៖ *«បំបែកការអនុវត្តកូដចេញពីការបង្កើត។ ទុកឱ្យ Parent Class ដំណើរការលំហូរការងារ និងទុកឱ្យ Subclasses ជាអ្នកបង្កើត Object។»*

តារាបានលុប Imports ដែលរញ៉េរញ៉ៃទាំងអស់ និងដកលក្ខខណ្ឌ `if/else` ចេញទាំងស្រុង។ គេបានប្រកាសមុខងារ abstract `createSender()` នៅក្នុង `NotificationService` ដោយបង្វែរវាទៅជាគំរូនៃការអនុវត្តដ៏ស្អាតស្អំ៖
```java
public abstract class NotificationService {
    protected abstract Sender createSender(); // The Factory Method

    public void notifyUser(User user, String message) {
        Sender sender = createSender(); // ផ្ទេរភារកិច្ចបង្កើតទៅឱ្យ subclasses
        sender.send(user, message);
    }
}
```
បន្ទាប់មក គេបានបង្កើត Subclasses តូចៗចំនួនពីរដែលមានការទទួលខុសត្រូវតែមួយ៖
1. `EmailNotificationService` ដែលហុចមកវិញនូវ `new SmtpEmailSender()`។
2. `SmsNotificationService` ដែលហុចមកវិញនូវ `new PlivoSmsSender()`។

គេបានដាក់ឱ្យដំណើរការកូដដែលបានកែសម្រួលរួច។ ម៉ាស៊ីនមេបានរស់ឡើងវិញភ្លាមៗ! ការទូទាត់ប្រាក់ដំណើរការយ៉ាងរលូនម្តងទៀត។

នៅពេលនាយកផ្នែកទីផ្សារត្រឡប់មកវិញនៅថ្ងៃបន្ទាប់ដើម្បីសុំបន្ថែម WhatsApp តារាមិនបានកែប្រែកូដសូម្បីតែមួយបន្ទាត់នៅក្នុង `NotificationService` ឡើយ។ គេគ្រាន់តែសរសេរ subclass ថ្មីមួយប៉ុណ្ណោះ៖ `WhatsAppNotificationService`។ ម៉ាស៊ីនស្នូលនៅតែរក្សាដដែលដោយមិនចាំបាច់មានការកែប្រែ ប៉ុន្តែវាបើកចំហសម្រាប់ការបន្ថែមជានិច្ច។ តារាបានយកឈ្នះបិសាច switch-statement ដ៏ធំធេងជារៀងរហូត ដោយប្រើប្រាស់ **Factory Method Pattern**។

---

## ៤. Related Posts

### 🔗 Explore All Viewpoints:
* 📖 **Read the Parable:** [The CEO and the Regional Managers (នាយកប្រតិបត្តិ និងអ្នកគ្រប់គ្រងតំបន់)](../../parables/77-the-ceo-and-regional-managers.md) — The emotional core of delegating local decisions.
* 🧠 **Read the First Principles Derivation:** [MIT Professor Strategy: Factory Method (គោលការណ៍គ្រឹះដំបូងនៃ Factory Method)](../01-mit-professor/02-factory-method.md) — Derives the pattern step-by-step from base interface dependency laws.
* 👶 **Read the Feynman Simplification:** [Feynman Technique: Factory Method (ការពន្យល់ពី Factory Method ដោយគ្មានពាក្យបច្ចេកទេស)](../02-feynman-technique/06-factory-method.md) — Breaks it down using the hotel cleaner recruitment agency.
* 👦 **Read the ELI5 Metaphor:** [ELI5: Factory Method (ការពន្យល់ពី Factory Method ដូចក្មេងអាយុ ៥ ឆ្នាំ)](../03-eli5/06-factory-method.md) — Teaches a five-year-old using the magic toy machine slot.
* 🌉 **Read the Analogy Bridge:** [Analogy Bridge: Factory Method (ស្ពានប្រៀបធៀបនៃ Factory Method)](../04-analogy-bridge/06-factory-method.md) — Maps regional postal transport hubs to virtual methods, outlining physical limitations.
* 🧐 **Read the Socratic Discovery:** [Socratic Method: Factory Method (ការបង្កើត Object តាមតម្រូវការយឺតយ៉ាវតាមវិធីសាស្ត្រសូក្រាត)](../05-socratic-method/06-factory-method.md) — Socrates guides your discovery out of switch block coupling.
* 📰 **Read the Journalist Summary:** [Journalist: Factory Method (ការបំបែកកូដបង្កើត Object ឱ្យមានសេរីភាពសម្រេចចិត្តលើ Subclass)](../06-journalist-inverted-pyramid/06-factory-method.md) — High-impact news lede, OCP compliance, and SRP isolation details first.
* 🎭 **Read the Storyteller Narrative:** [Storyteller: Factory Method (វីរបុរស Factory Method និងការដោះលែងប្រព័ន្ធផ្ញើសារពីរនរក switch)](../07-storyteller-narrative-arc/06-factory-method.md) — Junior developer Dara's battle to vanquish the switch statement monster on Black Friday.
* ⚙️ **Read the Engineer Spec:** [Engineer: Factory Method (ការបំបែកកូដបង្កើត Object តាមរយៈការវាយតម្លៃតម្រូវការ និងឧបសគ្គកំណត់)](../08-engineer-requirements-constraints-solution/04-factory-method.md) — Technical requirements, ADR candidate matrix, and SLA evaluation.
* 📊 **Read the Pros & Cons:** [Pros & Cons Compared: Factory Method (ការប្រៀបធៀបគុណសម្បត្តិ និងគុណវិបត្តិនៃ Factory Method)](../09-pros-and-cons-compared/03-factory-method.md) — Full trade-off analysis and decision matrix.
* 🛠️ **Read the Code Implementation:** [Creational Patterns: The Art of Instantiation](../../../clean-code/design-patterns/01-creational-patterns.md#the-factory-method) — Production-grade Java with subclass dispatch and Open/Closed Principle.
