# វគ្គគ្រូនិងសិស្ស: Template Method (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #template-method #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(អាម៉ាប់កំពុងសរសេរកម្មវិធីឆុងកាហ្វេ និងឆុងតែ អោយហាងកាហ្វេ។ គេ Copy-Paste កូដដាំទឹកពុះ និងចាក់ចូលកែវ ចំនួន ១០០បន្ទាត់ ពី Class តែ ទៅដាក់ក្នុង Class កាហ្វេ លោកគ្រូយក្សដើរមកដល់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរស្អីហ្នឹង? គ្រាន់តែដាំទឹក និងចាក់ទឹកចូលកែវសោះ ហែងកូពីកូដពីថ្នាក់ `Tea` ទៅដាក់ក្នុងថ្នាក់ `Coffee` ធ្វើអី? បើថ្ងៃក្រោយថៅកែចង់អោយទឹកពុះនៅសីតុណ្ហភាព 95 អង្សាវិញ តើហែងត្រូវរត់ទៅកែកូដទាំង ២កន្លែងហ្នឹងមែនទេ?

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំខ្ជិលសរសេរថ្មី ខ្ញុំកូពីទៅវាលឿនជាង! ហើយវាមាន ៤ ជំហានដូចគ្នា! ដាំទឹក, ចាក់គ្រឿងផ្សំ, ចាក់ចូលកែវ, និងថែមក្រូចឆ្មា!

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថា "កូដសម្រាម (Code Duplication)"! គេត្រូវប្រើ **Template Method Pattern** វើយ! 
ហែងត្រូវបង្កើត Class មេមួយឈ្មោះ `Beverage`! ហើយនៅក្នុងនោះហែងបង្កើត Method គ្រោងឆ្អឹងមួយដែលហៅ ៤ ជំហានហ្នឹងតាមលំដាប់! អាការងារ "ដាំទឹក" និង "ចាក់ចូលកែវ" វាដូចគ្នា ហែងសរសេរវាអោយហើយនៅក្នុង Class មេហ្នឹងទៅ! ហែងទុកតែអាការងារ "ចាក់គ្រឿងផ្សំ (តែ ឫ កាហ្វេ)" អោយ Class កូនៗវាជាអ្នកសរសេរបន្ថែមបានហើយ! សន្សំកូដបានច្រើនណាស់!

**អាម៉ាប់ (អេះក្បាល):** អូហូ! ឡូយមែន! អញ្ចឹងខ្ញុំជា Class កូន ខ្ញុំមានសិទ្ធិចូលទៅ "Override (សរសេរជាន់)" អា Method គ្រោងឆ្អឹងរបស់ Class មេហ្នឹងបានអត់គ្រូ? ខ្ញុំចង់ប្តូរលំដាប់លំដោយ! ខ្ញុំចង់ចាក់កាហ្វេចូលកែវមុន រួចចាំចាក់ទឹកឆៅចូល ហើយចាំយកទៅដាំពុះលើចង្ក្រានទាំងអស់គ្នាតែម្តង! លឿន!

**លោកគ្រូយក្ស (សម្លក់មុខ):** អាគំនិតបំផ្លាញជាតិ! បើហែងធ្វើអញ្ចឹង កែវកាហ្វេវាមិនបែកខ្ទេចលើចង្ក្រានហើយទេអី? ដើម្បីការពារកុំអោយសត្វចម្លែកដូចហែង ទៅបំផ្លាញគ្រោងឆ្អឹង (Algorithm Skeleton) របស់មេបាន គេត្រូវដាក់ពាក្យគន្លឹះ `final` នៅពីមុខ Template Method ហ្នឹងវើយ! ពេលនោះ បើហែងហ៊ាន Override វានឹងលោត Error ចាក់ភ្នែកហែងភ្លាម! 

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. Class មេ (អ្នកក្តោបក្តាប់អំណាច និងរៀបចំគ្រោងឆ្អឹង)
abstract class Beverage {
    
    // នេះហើយជា Template Method! ដាក់ final ការពារអាម៉ាប់កុំអោយលួចកែរចនាសម្ព័ន្ធ!
    public final void prepareRecipe() {
        boilWater();       // កូដស្ទួន មេធ្វើអោយ
        brew();            // កូនត្រូវធ្វើខ្លួនឯង
        pourInCup();       // កូដស្ទួន មេធ្វើអោយ
        addCondiments();   // កូនត្រូវធ្វើខ្លួនឯង
    }

    // ជំហានដែលកូនត្រូវធ្វើដោយខ្លួនឯង (Abstract methods)
    protected abstract void brew();
    protected abstract void addCondiments();

    // ជំហានដែលប្រើរួមគ្នា (សន្សំកូដកុំអោយអាម៉ាប់ Copy-Paste)
    private void boilWater() { System.out.println("កំពុងដាំទឹកអោយពុះ..."); }
    private void pourInCup() { System.out.println("ចាក់ចូលកែវ..."); }
}

// ២. Class កូន (អ្នកទទួលបញ្ជា)
class Coffee extends Beverage {
    protected void brew() { System.out.println("ចម្រោះកាហ្វេក្នុងតម្រង..."); }
    protected void addCondiments() { System.out.println("បន្ថែមស្ករ និងទឹកដោះគោ..."); }
}

class Tea extends Beverage {
    protected void brew() { System.out.println("ត្រាំស្លឹកតែក្នុងទឹកក្តៅ..."); }
    protected void addCondiments() { System.out.println("បន្ថែមក្រូចឆ្មា..."); }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅដាំទឹកឆុងកាហ្វេអោយលោកគ្រូ ៥០ កែវ បើហ៊ានលួចចាក់ទឹកឆៅចូលកែវហើយយកទៅដាំ គ្រូនឹងអោយទិញកែវថ្មីសងសាលា!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** កូដនៃ Algorithm ដែលមានលំដាប់លំដោយដូចគ្នា ត្រូវបាន Copy-Paste ច្រើនកន្លែងក្នុង Subclasses ដែលបណ្តាលអោយពិបាកក្នុងការថែទាំ។
- **ដំណោះស្រាយ:** បង្កើត Template Method នៅក្នុង Superclass ដើម្បីកំណត់គ្រោងឆ្អឹងនៃ Algorithm ហើយទម្លាក់តែជំហានដែលខុសគ្នា (Abstract) ទៅអោយ Subclass ជាអ្នក Implement ចំណែកជំហានដូចគ្នារក្សាទុកក្នុង Superclass។ ប្រើ `final` ដើម្បីការពារការ Override គ្រោងឆ្អឹង។
