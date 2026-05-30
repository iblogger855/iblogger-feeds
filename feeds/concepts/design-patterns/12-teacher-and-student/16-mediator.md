# វគ្គគ្រូនិងសិស្ស: Mediator (Teacher and Student Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #classroom #design-patterns #mediator #behavioral #clean-code  
**Category:** Concepts / Teacher & Student  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)](#១-ទិដ្ឋភាពក្នុងថ្នាក់រៀន-classroom-dialogue)
- [២. កូដនៅលើក្តារខៀន (Code on the Blackboard)](#២-កូដនៅលើក្តារខៀន-code-on-the-blackboard)
- [៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)](#៣-ពិន័យ-និងមេរៀន-punishment-lesson-learned)

---

## ១. ទិដ្ឋភាពក្នុងថ្នាក់រៀន (Classroom Dialogue)

*(ក្នុងម៉ោងរៀនសរសេរកម្មវិធីគ្រប់គ្រងយន្តហោះ អាម៉ាប់អោយយន្តហោះនីមួយៗ Call ប្រាប់គ្នាពីទីតាំង លោកគ្រូយក្សដើរមកដល់)*

**លោកគ្រូយក្ស:** អាម៉ាប់! ហែងសរសេរស្អីហ្នឹង? យន្តហោះទី១ ខលទៅប្រាប់យន្តហោះទី២, ទី៣, ទី៤... រួចយន្តហោះទី២ ខលទៅប្រាប់ទី១, ទី៣, ទី៤... បើមានយន្តហោះ ៥០គ្រឿង វាមិនខលគ្នាញ៉ែតពេញអាកាស រហូតដល់បុកគ្នាស្លាប់អស់ហើយទេអី?

**អាម៉ាប់:** លោកគ្រូ! ខ្ញុំអោយវាប្រាប់គ្នា ដើម្បីកុំអោយវាហោះបុកគ្នាហ្នឹងណា! បើអត់ប្រាប់គ្នាម៉េចដឹង?

**លោកគ្រូយក្ស (គប់ហ្វឺត):** អាភ្លើ! ហ្នឹងគេហៅថា "Tight Coupling"! បើមានយន្តហោះមួយខូចវិទ្យុទាក់ទង គឺវិនាសអន្តរាយទាំងអស់គ្នា! គេត្រូវប្រើ **Mediator Pattern** វើយ! គេត្រូវសាងសង់ "ប្រាង្គអាកាស" (Control Tower) មួយនៅកណ្តាលព្រលាន!
យន្តហោះទាំងអស់ ហាមដាច់ខាតនិយាយរកគ្នា! ពួកវាត្រូវនិយាយទៅកាន់ "ប្រាង្គអាកាស" តែមួយគត់! ហើយប្រាង្គអាកាស ជាអ្នកបញ្ជាថា "អាទី១ ចុះមុន!", "អាទី២ ហោះក្រឡឹងសិន!"។ 

**អាម៉ាប់ (អេះក្បាល):** អូហូ! មានអ្នកកណ្តាលចាត់ចែង! ចុះសុំសួរមួយគ្រូ! បើអ្នកបញ្ជានៅប្រាង្គអាកាសហ្នឹង (Mediator)... គាត់ស្រាប់តែលង់ស្រលាញ់ (Crush) យន្តហោះពណ៌ផ្កាឈូកមួយ! រួចគាត់ "លំអៀង" អោយតែយន្តហោះហ្នឹងចុះចតមុនគេរហូត ទោះបីយន្តហោះផ្សេងជិតអស់សាំងក៏ដោយ! តើព្រលានហ្នឹងមិនវិនាសទេអីគ្រូ?

**លោកគ្រូយក្ស (ទាញត្រចៀក):** បើប្រាង្គអាកាស "លំអៀង" មានន័យថាហែងសរសេរ Logic នៅក្នុង Mediator ហ្នឹងខុស (មានកំហុស Bug) អោយវាផ្តល់អាទិភាពខុសប្រក្រតី! 
នេះហើយគឺជា "ចំណុចខ្សោយសាហាវបំផុត" របស់ Mediator! បើហែងប្រមូល Logic ការសម្រេចចិត្តទាំងអស់ យកមកគរទុកនៅប្រាង្គអាកាសតែមួយ វានឹងកើនឡើងកូដរាប់ម៉ឺនបន្ទាត់ ក្លាយជា "God Object" (បិសាច)! ពេលហែងកែ Logic ខុសបន្តិច យន្តហោះបុកគ្នាស្លាប់ពិតមែន! ដូច្នេះត្រូវបំបែកប្រាង្គអាកាសជាប៉ុស្តិ៍តូចៗ (Sub-mediators) កុំអោយវាក្តោបក្តាប់អំណាចតែឯង!

---

## ២. កូដនៅលើក្តារខៀន (Code on the Blackboard)

```java
// ១. ប្រាង្គអាកាស (Mediator Interface)
public interface ControlTower {
    void requestLanding(Airplane airplane);
}

// ២. យន្តហោះ (Component ដែលត្រូវគោរពតាមប្រាង្គ)
public class Airplane {
    private ControlTower tower;
    private String name;

    public Airplane(String name, ControlTower tower) {
        this.name = name;
        this.tower = tower;
    }

    public void land() {
        System.out.println(name + " is requesting to land...");
        tower.requestLanding(this); // ប្រាប់ទៅប្រាង្គអាកាស
    }
}

// ៣. ប្រាង្គអាកាសពិតប្រាកដ (អ្នកសម្រេចចិត្ត - ប្រយ័ត្នក្លាយជា God Object)
public class JFKControlTower implements ControlTower {
    private boolean isRunwayClear = true;

    @Override
    public void requestLanding(Airplane airplane) {
        // Logic បញ្ជាចរាចរណ៍ (ការពារការលំអៀងរបស់អាម៉ាប់!)
        if (isRunwayClear) {
            System.out.println("Clear to land! Welcome.");
            isRunwayClear = false; // បិទផ្លូវ
        } else {
            System.out.println("Runway busy! Please hold.");
        }
    }
}
```

---

## ៣. ពិន័យ និងមេរៀន (Punishment & Lesson Learned)

**ពិន័យសម្រាប់អាម៉ាប់:**
- ត្រូវទៅឈរនៅកណ្តាលសាលា ធ្វើជាប្រាង្គអាកាសសម្របសម្រួលសិស្សដើរចេញពីថ្នាក់ បើហ៊ានលំអៀងអោយស្រីៗចេញមុន គ្រូនឹងកាត់ពិន្ទុ!

**មេរៀនដែលទទួលបាន (Lesson Learned):**
- **បញ្ហា:** Components ជាច្រើនទាក់ទងគ្នាខ្វាត់ខ្វែងដោយផ្ទាល់ បង្កើតជាចំណងដ៏ស្អិតរមួត (Tight Coupling) ដែលពិបាកកែប្រែនិងយកទៅប្រើឡើងវិញ។
- **ដំណោះស្រាយ:** បង្កើត Object កណ្តាលមួយ (Mediator) ដើម្បីទទួលបន្ទុកសម្របសម្រួលទំនាក់ទំនងរវាង Components ទាំងអស់។ Components ទាំងអស់គ្រាន់តែរាយការណ៍ទៅ Mediator ប៉ុណ្ណោះ។ ត្រូវប្រយ័ត្នកុំឱ្យ Mediator ក្លាយជា God Object ដែលមានកូដច្រើនលើសលប់។
