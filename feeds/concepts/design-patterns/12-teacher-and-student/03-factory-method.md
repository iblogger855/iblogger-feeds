# វគ្គគ្រូនិងសិស្ស: Factory Method (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #factory-method #creational #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(ម៉ោង ៣ រសៀល អាម៉ាប់កំពុងអង្គុយកែកូដដោយញើសហូរជោកថ្ងាស ស្រាប់តែលោកគ្រូយក្សដើរមកពីក្រោយខ្នង។)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងកំពុងធ្វើស្អីហ្នឹង? គ្រាន់តែឱ្យថែមមុខងារ "Login ជាមួយ Apple" សោះ ម៉េចក៏ហែងទៅរុះរើកូដ File មេ `AuthManager.java` រហូតដល់ Error ក្រហមពេញអេក្រង់អញ្ចឹង?

**អាម៉ាប់:** លោកគ្រូអើយ! File នេះវាមាន `switch (type)` ច្រើនពេក! បើ Type "Facebook" វា `new FBLogin()`។ អញ្ចឹងដើម្បីថែម "Apple" ខ្ញុំត្រូវទៅថែម `case "Apple": return new AppleLogin()` រួចហើយខ្ញុំភ្លេចដាក់ `break;` វាធ្លាក់កូដចូលគ្នាវ៉ល់ពេញហ្នឹង! ខ្ញុំថាមិនអីទេលោកគ្រូ ចាំខ្ញុំអង្គុយកែវា...

**លោកគ្រូយក្ស (ទះក្បាលអាម៉ាប់មួយផាំង):** អាភ្លើ! ហែងមានដឹងទេថា File `AuthManager` ហ្នឹងជា File ស្នូលរបស់ប្រព័ន្ធ? បើហែងចូលទៅកែរាល់ដងដែលមាន Login ថ្មី ចុះបើហែងកែខុស ប្រព័ន្ធទាំងមូលមិនគាំងហើយទេអី? ហែងបំពានច្បាប់ **Open/Closed Principle (OCP)** ហើយ! ឯកសារគេអនុញ្ញាតឱ្យ "បន្ថែម" (Open for extension) តែហាមដាច់ខាតមិនឱ្យ "កែប្រែកូដចាស់" (Closed for modification)! គេត្រូវប្រើក្បាច់ **Factory Method** វើយ!

**អាម៉ាប់ (ភាំង):** Factory Method ហ្នឹងម៉េចទៅលោកគ្រូ? តើខ្ញុំត្រូវបើករោងចក្រនៅណា?

**លោកគ្រូយក្ស:** ហែងគ្រាន់តែបង្កើត Class `AuthService` (រោងចក្រមេ) ដែលមាន Method ទទេមួយឈ្មោះ `createLogin()`។ រួចហែងបង្កើត Class កូនៗ ដូចជា `AppleAuthService` ហើយឱ្យវាជាអ្នកបញ្ចេញ `AppleLogin`។ ពេលហែងចង់បានរថយន្ត Apple ហែងទៅហៅរោងចក្រ Apple ទៅ! មិនបាច់មកកែរោងចក្រចាស់របស់ Facebook ទេ!

**អាម៉ាប់:** អូហូ! ខ្ញុំយល់ហើយ! អញ្ចឹងគឺបំបែក Class ជាកង់ៗ! ចុះបើ... ខ្ញុំខ្ជិល! ខ្ញុំមិនចង់បង្កើត Class ថ្មីច្រើនទេលោកគ្រូ! ខ្ញុំបង្កើតតែ Method មួយ `getAuth(String type)` រួចញាត់ `if/else` ក្នុងហ្នឹងដដែល គ្រាន់តែលាក់វាមិនឱ្យគេឃើញ ម៉េចដែរគ្រូ?

**លោកគ្រូយក្ស:** អានោះគេហៅថា **Simple Factory**! វាស្រួលមើលជាងមុនមែន តែវានៅតែល្មើសច្បាប់ OCP ដដែល! ព្រោះពេលថែមថ្មី ហែងនៅតែត្រូវចូលទៅកែ `if/else` ហ្នឹងដដែល។ បើហែងធ្វើការជាក្រុម (Team) មនុស្ស១០នាក់ចូលទៅកែ File តែមួយព្រមគ្នា វានឹងបង្កើត "Merge Conflict" ដោះស្រាយបែកក្បាលមិនខាន! បើប្រើ Factory Method (GoF) ម្នាក់ៗកាន់ Class ថ្មីរៀងៗខ្លួន គ្មានជាន់ជើងគ្នាទេអាភ្លើ!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. Product Interface (កិច្ចសន្យាអោយរោងចក្រគោរពតាម)
public interface LoginProvider {
    void authenticate();
}

// ២. Concrete Products (រថយន្តខុសៗម៉ាក)
public class FacebookLogin implements LoginProvider {
    public void authenticate() { System.out.println("Logging in via FB..."); }
}
public class AppleLogin implements LoginProvider {
    public void authenticate() { System.out.println("Logging in via Apple FaceID..."); }
}

// ៣. Creator (រោងចក្រមេ ដែលអនុវត្ត Business Logic រួម)
public abstract class AuthService {
    
    // នេះហើយគឺ Factory Method! បង្ខំអោយកូនជាអ្នកបញ្ចេញផលិតផល
    protected abstract LoginProvider createProvider();

    // កូដដំណើរការរួម ដែលអត់ខ្វល់ថាជា FB ឬ Apple ទេ វានឹងរត់ដោយរលូន
    public void startLoginProcess() {
        System.out.println("Preparing system for login...");
        LoginProvider provider = createProvider(); // កូនអ្នកបង្កើត យើងអ្នកប្រើ
        provider.authenticate();
        System.out.println("Login finished, updating database...");
    }
}

// ៤. Concrete Creators (កូនៗនីមួយៗ ទទួលខុសត្រូវរៀងៗខ្លួន)
public class FacebookAuthService extends AuthService {
    @Override
    protected LoginProvider createProvider() {
        return new FacebookLogin();
    }
}

// អាម៉ាប់ ចង់បន្ថែម Apple គ្រាន់តែបង្កើត Class ថ្មីនេះមួយ ជាការស្រេច! មិនបាច់កែ File មេទេ!
public class AppleAuthService extends AuthService {
    @Override
    protected LoginProvider createProvider() {
        return new AppleLogin();
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅសរសេរពាក្យ "ខ្ញុំនឹងមិនប្រើ Switch Case ដ៏វែងអន្លាយក្នុង Core Business Logic ទៀតទេ" ចំនួន ៥០០ ដង!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កូដពោរពេញដោយ `if/else` ឬ `switch` វែងអន្លាយក្នុងការបង្កើត Object ដែលធ្វើឱ្យវាពិបាកថែទាំ ងាយមាន Bug និងងាយជាន់គ្នា (Merge Conflict) នៅពេលអ្នកអភិវឌ្ឍន៍ច្រើននាក់ធ្វើការជាមួយគ្នា។
- **ដំណោះស្រាយ:** បំបែកការទទួលខុសត្រូវនៃការ "បង្កើត Object" ទៅឱ្យ Class កូនៗ (Subclasses) តាមរយៈ Abstract Method (Factory Method)។ វិធីនេះធានាបាននូវគោលការណ៍ Open/Closed Principle (OCP) គឺបើចង់បន្ថែមប្រភេទថ្មី គ្រាន់តែបង្កើត Class ថ្មីដោយមិនកែប្រែកូដចាស់។
