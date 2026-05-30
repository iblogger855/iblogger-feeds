# វគ្គសម្ភាសន៍ការងារ: Observer (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #observer #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** នៅក្នុងប្រព័ន្ធ E-commerce របស់យើង ពេលអតិថិជន Checkout រួច ប្រព័ន្ធត្រូវជូនដំណឹងទៅ Invoice Service, Email Service, និង Inventory Service។ Developer មុនបានសរសេរកូដ `while(true) { checkDatabase() }` (Polling) ដើម្បីចាំឆែកមើលរាល់វិនាទី ធ្វើអោយ Database របស់យើងគាំងស្លាប់! តើប្អូនមានដំណោះស្រាយបែបណា?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! ការធ្វើ Polling គឺស៊ីធនធានខ្លាំងណាស់ (High CPU & DB Load)។ ខ្ញុំនឹងប្រើប្រាស់យន្តការ Event-Driven តាមរយៈ **Observer Pattern** (Publish-Subscribe)។
`CheckoutService` នឹងដើរតួជា Subject (Publisher) ដែលមានបញ្ជីអ្នករង់ចាំទទួលដំណឹង (Observers) ដូចជា Invoice, Email និង Inventory។ នៅពេល Checkout ជោគជ័យ វាគ្រាន់តែដើរតាមបញ្ជីនោះ ហើយហៅ Method `update()` ទៅកាន់ Observer ទាំងអស់ព្រមៗគ្នា! មិនបាច់មានអ្នកណាអង្គុយសួរ Database រាល់វិនាទីទៀតទេ។

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អ! ចុះឧបមាថា មានអ្នកប្រើប្រាស់ម្នាក់ គាត់ Subscribe ទទួលការជូនដំណឹងពីហាងយើង។ ប៉ុន្តែក្រោយមក គាត់លុបគណនី (Delete Account) ចោលបាត់ទៅហើយ។ តែហាងយើងនៅតែបន្ត Push ដំណឹងទៅអោយគាត់រហូត! តើបញ្ហានេះកើតឡើងដោយសារអ្វី ហើយគ្រោះថ្នាក់កម្រិតណា?

**បេក្ខជន (សុខា - ញញឹមប្រុងប្រយ័ត្ន):** នេះគឺជាគ្រោះថ្នាក់ដ៏កាចសាហាវបំផុតនៅក្នុង Observer Pattern ដែលហៅថា **"Lapsed Listener Problem"** (បញ្ហាអ្នកស្តាប់ដែលបាត់បង់)! 
បញ្ហាកើតឡើងនៅពេលដែលយើងភ្លេចហៅ Method `unsubscribe()`! បើយើងមិន Unsubscribe ទេ `CheckoutService` នឹងនៅតែកាន់ Reference របស់ Object នោះជារៀងរហូតនៅក្នុងបញ្ជី `List` របស់វា។ ពេលនោះ Garbage Collector នៅក្នុង Java មិនអាចសម្អាត Object នោះចេញពី Memory បានឡើយ! យូរៗទៅ វានឹងកកកុញ បង្កឱ្យមាន **Memory Leak** យ៉ាងធ្ងន់ធ្ងររហូតដល់គាំង Server ទាំងមូល (OutOfMemoryError)!
ដើម្បីការពារ ខ្ញុំតែងតែប្រើប្រាស់ `WeakReference` សម្រាប់ការរក្សាទុកបញ្ជី Observer ឬក៏ប្រាកដប្រជាថាត្រូវ `unsubscribe()` នៅពេលលែងត្រូវការ។

**អ្នកសម្ភាសន៍ (ទះដៃ):** ចម្លើយកម្រិត Senior ទៀតហើយ! ការលើកឡើងពី `WeakReference` បង្ហាញថាប្អូនយល់ច្បាស់ពី Memory Management នៅក្នុង Java ពិតប្រាកដ!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Observer Interface (អ្នករង់ចាំទទួលដំណឹង)
public interface Observer {
    void update(String orderId);
}

// ២. Concrete Observers
public class EmailService implements Observer {
    public void update(String orderId) { System.out.println("Email sent for Order: " + orderId); }
}
public class InventoryService implements Observer {
    public void update(String orderId) { System.out.println("Inventory updated for Order: " + orderId); }
}

// ៣. Subject (អ្នកមានដំណឹង)
public class CheckoutService {
    // ប្រើ Set ដើម្បីការពារការ Subscribe ត្រួតគ្នាស្ទួនៗ
    private Set<Observer> subscribers = new HashSet<>();

    public void subscribe(Observer obs) { subscribers.add(obs); }
    
    // ចំណុចសំខាន់ដើម្បីការពារកុំអោយមាន Lapsed Listener Problem (Memory Leak)
    public void unsubscribe(Observer obs) { subscribers.remove(obs); }

    public void completeCheckout(String orderId) {
        System.out.println("Checkout Complete!");
        notifySubscribers(orderId); // ប្រកាសដំណឹង
    }

    private void notifySubscribers(String orderId) {
        for (Observer obs : subscribers) {
            obs.update(orderId);
        }
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីអត្ថប្រយោជន៍នៃការប្តូរពី Polling មកជា Event-Driven (Push model)។ 
❌ **អន្ទាក់:** ការសួរពី "Lapsed Listener Problem" គឺជាសំណួរកម្រិតពិបាកដែលទាមទារអោយយល់ពី Garbage Collection និង Memory Leaks។ បេក្ខជនឆ្លើយបានយ៉ាងអស្ចារ្យ និងមានការស្នើដំណោះស្រាយដោយប្រើ `WeakReference` ទៀតផង។
