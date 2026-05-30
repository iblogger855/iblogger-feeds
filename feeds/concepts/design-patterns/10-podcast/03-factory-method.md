# Podcast: Factory Method (កិច្ចសន្ទនា Podcast ជុំវិញ Factory Method)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #factory-method #creational #clean-code  
**Category:** Concepts / Podcast  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនា (Podcast Transcript)](#១-កិច្ចសន្ទនា-podcast-transcript)
- [២. ការបកប្រែទៅជាកូដ (Translating to Code)](#២-ការបកប្រែទៅជាកូដ-translating-to-code)
- [៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)](#៣-គុណសម្បត្តិ-និងគុណវិបត្តិ-pros-cons)
- [៤. ចំណុចសំខាន់ៗ (Key Takeaways)](#៤-ចំណុចសំខាន់ៗ-key-takeaways)

---

## ១. កិច្ចសន្ទនា (Podcast Transcript)

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងនិយាយពី **Factory Method** ដែលជាអ្នកសង្គ្រោះកូដរបស់យើងពី `if/else` រញ៉េរញ៉ៃ។ បូរិទ្ធ ធ្លាប់សរសេរកូដបញ្ជូនសារ (Notification) ដែលប្រើ `if (type == "email") new Email() else if ("sms") new Sms()` ទេ?

**Host B (បូរិទ្ធ - អ្នករៀន):** ធ្លាប់បង! ហើយរាល់ដងដែលមានប្រភេទថ្មី ដូចជា Telegram ឬ Pigeon (ព្រាបនាំសារ) ខ្ញុំត្រូវមកថែម `else if` ទៀតរហូត។ វែងអន្លាយណាស់!

**Host A (សិទ្ធិ):** Factory Method ជួយដោះស្រាយរឿងនេះ។ ស្រមៃមើលនាយកប្រតិបត្តិ (CEO) ម្នាក់។ គាត់ប្រាប់អ្នកគ្រប់គ្រងតំបន់ (Regional Managers) ថា "ខ្ញុំត្រូវការអ្នកជំនាញ!"។ អ្នកគ្រប់គ្រងនៅជប៉ុន នឹងជួលវិស្វករជប៉ុន ចំណែកនៅអឺរ៉ុប ជួលវិស្វករអឺរ៉ុប។ CEO អត់ខ្វល់ទេ ឱ្យតែចេះធ្វើការ។ ក្នុងកូដ CEO គឺជា Class មេ ដែលប្រកាស `createNotifier()` (Factory Method) ហើយកូនៗជាអ្នកសម្រេចចិត្តថាត្រូវបង្កើត Object អ្វីពិតប្រាកដ។

**Host B (បូរិទ្ធ):** សុំសួរឆ្កួតៗមួយបង! ចុះបើ CEO ហ្នឹងកាចពេក គាត់បញ្ឈប់អ្នកគ្រប់គ្រងតំបន់ចេញអស់ ហើយគាត់ក៏ភ្លេចជួលអ្នកថ្មី តើរោងចក្រហ្នឹងនឹងផលិតចេញជាស្អីទៅ? ខ្យល់?

**Host A (សិទ្ធិ):** ហាហា សំណួរនេះកូរមែន! នៅក្នុងកូដ បើ "CEO" មិនមាន "អ្នកគ្រប់គ្រងតំបន់" (Subclasses) ទេ នោះកម្មវិធីវានឹងលោត Error តាំងពីកន្លែង Compile មកម្ល៉េះ! ព្រោះ `createNotifier()` គឺជា `abstract method` ដែលបង្ខំឱ្យត្រូវតែមានអ្នក Implement វា។ បើគ្មានអ្នក Implement ទេ កម្មវិធីមិនដើរទេ។ អញ្ចឹងទោះ CEO ចង់កាច ក៏ Compiler មិនព្រមដែរ!

**Host B (បូរិទ្ធ):** ហាហា ចុះបើខ្ញុំរឹងក្បាល... ខ្ញុំបង្កើត អ្នកគ្រប់គ្រងតំបន់ថ្មីឈ្មោះ "តំបន់ព្រៃអាម៉ាហ្សូន" ហើយឱ្យវាបង្កើតអ្នកនាំសារជា "សត្វស្វា" (`MonkeyNotifier`) តើ CEO ព្រមទទួលយកទេបង? គាត់ប្រហែលជាភ័យសន្លប់ហើយ!

**Host A (សិទ្ធិ):** គាត់មិនភ័យទេ! ព្រោះ CEO បានកំណត់ច្បាប់ទម្លាប់រួចហើយគឺ `Interface Notifier`។ ឱ្យតែសត្វស្វារបស់លោកឯង ចេះអនុវត្ត (Implement) Method `send(String msg)` ត្រឹមត្រូវ នោះ CEO នឹងប្រើវាដោយក្តីរីករាយបំផុត! នេះហើយគឺជាថាមពលនៃ Polymorphism និង Open/Closed Principle។ អ្នកអាចបង្កើតអីក៏បាន ឱ្យតែគោរពកិច្ចសន្យា (Interface)។ កូដ CEO មិនបាច់កែប្រែសូម្បីមួយអក្សរ!

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Interface សម្រាប់កិច្ចសន្យា (ទោះស្វាក៏ត្រូវគោរពដែរ)
public interface Notifier {
    void send(String message);
}

// ២. Concrete Product (ស្វានាំសាររបស់បូរិទ្ធ)
public class MonkeyNotifier implements Notifier {
    public void send(String msg) { 
        System.out.println("Monkey screaming the message: Ooh Ooh Ah Ah! " + msg); 
    }
}

// ៣. Creator (CEO)
public abstract class NotificationService {
    // Factory Method ដែលបង្ខំឱ្យកូនត្រូវតែ Implement
    protected abstract Notifier createNotifier();

    public void notifyUser(String message) {
        Notifier notifier = createNotifier(); 
        notifier.send(message); // CEO អត់ខ្វល់ថាជាស្វា ឬមនុស្សទេ
    }
}

// ៤. Concrete Creator (អ្នកគ្រប់គ្រងតំបន់អាម៉ាហ្សូន)
public class AmazonNotificationService extends NotificationService {
    @Override
    protected Notifier createNotifier() {
        return new MonkeyNotifier(); // ជួលស្វា
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Open/Closed Principle:** អ្នកអាចបន្ថែម Product ថ្មីៗបានដោយមិនចាំបាច់កែប្រែ Base Class។
- **Loose Coupling:** Base Class មិនចងភ្ជាប់ជាមួយ Concrete Classes នោះទេ វាធ្វើការជាមួយ Interface។

**គុណវិបត្តិ (Cons):**
- **ថៅកែច្រើនជាងកម្មករ:** បើមានប្រភេទ Product តិចតួច ការប្រើ Factory Method នឹងបង្កើត Class ដ៏ច្រើនឥតប្រយោជន៍ (Over-engineering)។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ការបង្កើត Object ដោយផ្ទាល់ជាមួយ `new` រួមផ្សំជាមួយ `if/else` ច្រើនជាន់។
- **ដំណោះស្រាយ:** ប្រគល់តួនាទីបង្កើត Object ទៅឱ្យ Subclasses តាមរយៈ Abstract Method មួយ។
