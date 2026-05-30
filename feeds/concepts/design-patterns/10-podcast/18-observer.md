# Podcast: Observer (កិច្ចសន្ទនា Podcast ជុំវិញ Observer)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #observer #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ថ្ងៃនេះយើងនិយាយពី **Observer Pattern** នៅក្នុងសម័យ Event-Driven។ ឧបមាថាអ្នកកំពុងរង់ចាំទិញទូរស័ព្ទ iPhone ថ្មី តើអ្នកគួរទៅសួរហាងរាល់ម៉ោងទេ (Polling)? ការសួរដដែលៗធ្វើឱ្យស៊ីធនធានកុំព្យូទ័រណាស់។

**Host B (បូរិទ្ធ - អ្នករៀន):** អត់ទេបង! ខ្ញុំគ្រាន់តែទុកលេខទូរស័ព្ទឱ្យហាង ពេលឥវ៉ាន់មកដល់ ហាងជាអ្នកខលប្រាប់ខ្ញុំវិញ វាស្រួលជាង។

**Host A (សិទ្ធិ):** ត្រឹមត្រូវ! ហ្នឹងហើយគឺ Observer Pattern។ ហាង (Subject) មានបញ្ជីអ្នកចុះឈ្មោះ (Subscribers)។ ពេលឥវ៉ាន់មកដល់ វាដើរតាមបញ្ជីនោះ ហើយហៅ Method `update()` ទៅកាន់ Observer ទាំងអស់ព្រមៗគ្នា (Broadcast)។

**Host B (បូរិទ្ធ):** សុំសួរមួយបង! ចុះបើខ្ញុំឆ្កួត... ខ្ញុំយកលេខទូរស័ព្ទរបស់ខ្ញុំដដែលហ្នឹង ទៅចុះឈ្មោះ (Subscribe) ជាមួយហាងហ្នឹងចំនួន ១លានដង! តើពេលមានទូរស័ព្ទថ្មីមកដល់ ហាងហ្នឹងវាមិនខលមកខ្ញុំ ១លានដង រហូតដល់ទូរស័ព្ទខ្ញុំផ្ទុះថ្មទេអីបង?

**Host A (សិទ្ធិ):** ហាហា... បើហាងនោះសរសេរកូដអន់ នោះទូរស័ព្ទលោកឯងនឹងផ្ទុះថ្មពិតមែន! ព្រោះបញ្ជី (List) នៅក្នុង Subject អាចផ្ទុក Object ដដែលៗបានប្រសិនបើយើងប្រើ `ArrayList` ធម្មតា។ 
ដើម្បីការពារការ Spam បែបនេះ នៅក្នុងកូដអ្នកជំនាញ គេច្រើនប្រើ `Set` ជាជាង `List` ក្នុងការរក្សាទុកបញ្ជី Observers ព្រោះ `Set` មិនអនុញ្ញាតឱ្យមានទិន្នន័យស្ទួន (Duplicates) ឡើយ។ ទោះលោកឯងខំ Subscribe ១លានដងទៀត ក៏មានឈ្មោះតែមួយដងក្នុងបញ្ជីដែរ!

**Host B (បូរិទ្ធ):** អូហូ! គេឆ្លាតមែន! ចុះបើខ្ញុំទិញបានទូរស័ព្ទហើយ ខ្ញុំភ្លេច Unsubscribe ចេញពីហាងនោះវិញ តើវាយ៉ាងម៉េចទៅបង?

**Host A (សិទ្ធិ):** អូហូ! នេះគឺជា "វិនាសកម្មដ៏ស្ងាត់កំបាំង" នៅក្នុងប្រព័ន្ធដែលប្រើ Observer គេហៅថា "Lapsed Listener Problem"។ បើអ្នកមិន Unsubscribe ទេ ហាងនៅតែកាន់ Reference របស់អ្នកជារៀងរហូត។ ពេលនោះ Garbage Collector មិនអាចសម្អាត Object របស់អ្នកចេញពី Memory បានឡើយ ធ្វើឱ្យកម្មវិធីកាន់តែស៊ី RAM ឡើងៗរហូតដល់គាំង (Memory Leak)។ ដូច្នេះ ត្រូវតែចាំបាច់ `unsubscribe()` នៅពេលលែងប្រើ!

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Observer Interface
public interface Observer {
    void update(String message);
}

public class EmailSubscriber implements Observer {
    private String email;
    public EmailSubscriber(String email) { this.email = email; }
    public void update(String msg) { System.out.println("Email to " + email + ": " + msg); }
}

// ២. Subject (អ្នកមានទិន្នន័យ និងបញ្ចេញ Event)
public class TechStore {
    // ប្រើ Set ដើម្បីការពារការ Subscribe លេងឆ្កួតៗរបស់បូរិទ្ធ
    private Set<Observer> subscribers = new HashSet<>();
    private String latestProduct;

    public void subscribe(Observer obs) { subscribers.add(obs); }
    public void unsubscribe(Observer obs) { subscribers.remove(obs); }

    public void setLatestProduct(String product) {
        this.latestProduct = product;
        notifySubscribers(); 
    }

    private void notifySubscribers() {
        for (Observer obs : subscribers) {
            obs.update("New product: " + latestProduct);
        }
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Open/Closed Principle:** អាចបន្ថែម Subscriber ថ្មីៗដោយសេរី។
- **Dynamic Relationships:** ភ្ជាប់ទំនាក់ទំនងរវាង Object នៅពេល Runtime។

**គុណវិបត្តិ (Cons):**
- **Memory Leaks:** បើភ្លេច Unsubscribe វាបង្កឱ្យមាន Memory Leaks យ៉ាងធ្ងន់ធ្ងរ។
- **Unpredictable Order:** មិនអាចគ្រប់គ្រងលំដាប់នៃការទទួល Notification បានទេ។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** Object ជាច្រើនត្រូវការដឹងភ្លាមៗនៅពេល Object ស្នូលមួយផ្លាស់ប្តូរស្ថានភាព។ ការប្រើ Polling ស៊ីធនធាន។
- **ដំណោះស្រាយ:** បង្កើតយន្តការ Publish-Subscribe ដោយឱ្យ Object ស្នូល (Subject) ប្រកាសផ្តល់ដំណឹង (Notify) ទៅអ្នកចុះឈ្មោះ (Observers) ទាំងអស់។
