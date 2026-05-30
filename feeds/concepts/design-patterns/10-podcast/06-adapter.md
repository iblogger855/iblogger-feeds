# Podcast: Adapter (កិច្ចសន្ទនា Podcast ជុំវិញ Adapter)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #adapter #structural #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ថ្ងៃនេះយើងចូលដល់ Structural Patterns វិញម្តង ដោយចាប់ផ្តើមពី **Adapter Pattern**។ តើធ្លាប់យកកុំព្យូទ័រយួរដៃ (Laptop) ទៅប្រើនៅប្រទេសផ្សេង ដូចជាអឺរ៉ុប ហើយស្រាប់តែដោតឌុយភ្លើងមិនចូលទេ?

**Host B (បូរិទ្ធ - អ្នករៀន):** អូហូ! ធ្លាប់តើបង! ឌុយគេជារន្ធមូល ឯកុំព្យូទ័រខ្ញុំជារន្ធសំប៉ែត ធ្វើឱ្យខ្ញុំត្រូវរកទិញឌុយបំប្លែង (Adapter) មកដោតកាត់កណ្តាលទើបអាចប្រើបាន។ បើខ្ញុំមិនទិញ Adapter ទេ ប្រហែលជាខ្ញុំត្រូវកាត់ខ្សែភ្លើងកុំព្យូទ័រចោល ដើម្បីប្តូរជើងវាថ្មីឱ្យត្រូវនឹងព្រីរបស់គេហើយ។

**Host A (សិទ្ធិ):** ហ្នឹងហើយគឺជា Adapter Pattern នៅក្នុងការសរសេរកូដ! ស្រមៃថាយើងកំពុងសរសេរកម្មវិធីទូទាត់ប្រាក់។ ប្រព័ន្ធរបស់យើងប្រើ Interface ឈ្មោះ `PaymentGateway` ដែលទទួលតម្លៃជាប្រាក់រៀល និងប្រើ Method `pay()`. ថ្ងៃមួយ មេប្រាប់ឱ្យភ្ជាប់ជាមួយ Stripe API ដែលទាមទារទិន្នន័យជាដុល្លារ (US Cents) និងមាន Method ឈ្មោះ `createCharge()`។ បើយើងកែកូដប្រព័ន្ធយើងឱ្យទៅតាម Stripe វាច្បាស់ជាខូចកូដចាស់ៗអស់ហើយ។

**Host B (បូរិទ្ធ):** សុំសួរឡប់ៗមួយបង! ចុះបើខ្ញុំយក Adapter ហ្នឹងទៅដោតនឹងព្រីភ្លើងអគ្គិសនី ហើយដោតចុងម្ខាងទៀតចូល "ទុយោទឹក" វិញ តើវានឹងមានទឹកឬភ្លើងចេញមកបង?

**Host A (សិទ្ធិ):** ហាហា... លោកឯងនេះចេះតែមានគំនិតចម្លែកៗមែន! នៅក្នុងកូដ "ការដោតចូលទុយោទឹក" គឺស្មើនឹងការបំប្លែង Interface ពីរដែល "គ្មានទំនាក់ទំនងគ្នាទាល់តែសោះ"។ ឧទាហរណ៍ យក `PaymentGateway` ទៅភ្ជាប់ជាមួយ `PrinterDriver`។ បើលោកឯងបង្ខំសរសេរ Adapter នោះមែន កម្មវិធីប្រហែលជាបោះពុម្ពក្រដាសចេញមកមានរូបលុយ តែលុយពិតប្រាកដអត់បានកាត់ពីកុងធនាគារទេ! Adapter មានប្រយោជន៍តែជាមួយ Object ដែលមានគោលដៅស្រដៀងគ្នា (ឧ. បង់លុយដូចគ្នា) គ្រាន់តែខុសទម្រង់ Method ឬ Data ប៉ុណ្ណោះ។

**Host B (បូរិទ្ធ):** ហាហា យល់ហើយ! អញ្ចឹងមានន័យថា Adapter គ្រាន់តែជា "អ្នកបកប្រែភាសា" ទេ។ ដូចជា `StripeAdapter` វានឹងទទួល Method `pay(50000_Riels)` ពីយើង រួចវាទៅបកប្រែលុយរៀលនោះជា US Cents ហើយហៅ `stripe.createCharge(1250_Cents)` ទៅឱ្យ Stripe ជាការស្រេចមែនទេបង?

**Host A (សិទ្ធិ):** ត្រឹមត្រូវណាស់! ធ្វើបែបនេះ Checkout Service របស់យើងនៅតែដដែល មិនចាំបាច់កែប្រែសូម្បីមួយបន្ទាត់ ព្រោះវាគិតថាវាកំពុងនិយាយជាមួយប្រព័ន្ធ Payment របស់យើងធម្មតា។ នេះជួយការពារកុំឱ្យ SDK របស់គេមកបំពុលកូដរបស់យើង (Vendor lock-in) ទៀតផង។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Target Interface (ស្តង់ដារប្រព័ន្ធយើង គឺព្រីភ្លើងសំប៉ែត)
public interface PaymentGateway {
    boolean pay(long amountInRiels);
}

// ២. Adaptee (3rd Party ដែលមានស្រាប់ តែជារន្ធមូល)
public class StripeSDK {
    public boolean createCharge(int amountInCents, String currency) {
        System.out.println("Charging " + amountInCents + " cents via Stripe.");
        return true;
    }
}

// ៣. Adapter (អ្នកបកប្រែ / ក្បាលព្រីបំប្លែង)
public class StripeAdapter implements PaymentGateway {
    private StripeSDK stripe;

    public StripeAdapter(StripeSDK stripe) {
        this.stripe = stripe;
    }

    @Override
    public boolean pay(long amountInRiels) {
        // បំប្លែងរៀល ទៅ Cents (នេះជាកន្លែងដែល Adapter ធ្វើការ)
        int amountInCents = (int) (amountInRiels / 4000) * 100;
        
        // ហៅ Method របស់ 3rd Party
        return stripe.createCharge(amountInCents, "USD");
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Single Responsibility Principle:** កូដបំប្លែងទិន្នន័យ ត្រូវបានប្រមូលផ្តុំនៅក្នុង Adapter តែមួយ។
- **Open/Closed Principle:** អាចបន្ថែម Adapters ថ្មីៗដោយសេរី ដោយមិនចាំបាច់កែប្រែ Client Code។

**គុណវិបត្តិ (Cons):**
- **កើនឡើងភាពស្មុគស្មាញ:** ត្រូវបង្កើត Interface និង Class ថ្មីៗជាច្រើនគ្រាន់តែដើម្បីបំប្លែង Method មួយ។ 

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** កូដពីរផ្នែកមាន Interface ខុសគ្នាទាំងស្រុង មិនអាចធ្វើការជាមួយគ្នាបាន។
- **ដំណោះស្រាយ:** បង្កើត Adapter Class មកបំប្លែង Interface មួយទៅ Interface មួយទៀត។
