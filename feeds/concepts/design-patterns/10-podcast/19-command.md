# Podcast: Command (កិច្ចសន្ទនា Podcast ជុំវិញ Command)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #command #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីអ្នកទាំងអស់គ្នា! ថ្ងៃនេះយើងជជែកអំពី **Command Pattern**។ បូរិទ្ធ ពេលទៅញ៉ាំអីនៅភោជនីយដ្ឋាន លោកកម្ម៉ង់ប្រាប់អ្នករត់តុ អ្នករត់តុកត់ចូលក្នុងក្រដាស (Order Ticket) រួចយកទៅបិទនៅលើជញ្ជាំងក្នុងផ្ទះបាយ។ ចុងភៅយកក្រដាសនោះទៅមើលទើបចាប់ផ្តើមធ្វើ។ នេះគឺ Command Pattern!

**Host B (បូរិទ្ធ - អ្នករៀន):** អូ! យល់បង! ការបញ្ជា (Request) ត្រូវបានវេចខ្ចប់ជា "ក្រដាសបញ្ជា" (Command Object) ដែលមាន Method `execute()` មួយ។ អ្នករត់តុ (Invoker) មិនខ្វល់ថាខាងក្នុងក្រដាសនោះសរសេរពីអីទេ វាគ្រាន់តែស្រែកថា "Execute!"។ 
តែសុំសួរមួយបង! ចុះបើខ្ញុំខឹង... ខ្ញុំយក "ក្រដាសបញ្ជា" ហ្នឹងទៅដុតចោលក្នុងប្រព័ន្ធ តើចុងភៅវានឹងធ្វើម្ហូបចេញមកជាផេះមែនទេបង?

**Host A (សិទ្ធិ):** ហាហា... បើលោកឯង "ដុតក្រដាសចោល" នៅក្នុងកូដ មានន័យថាលោកឯងលុប (Nullify) Command Object នោះចោលមុនពេលចុងភៅបានឃើញវា។ ពេលចុងភៅ (Receiver) ព្យាយាមហៅ Method របស់វា វានឹងលោត `NullPointerException` (សម្លាប់កម្មវិធីទាំងមូលតែម្តង) មិនមែនចេញជាផេះទេ។ 
ប៉ុន្តែអត្ថប្រយោជន៍ដ៏ធំនៃការមាន "ក្រដាសបញ្ជា" នេះគឺ យើងអាចរក្សាទុកវា (Save), ដាក់តម្រង់ជួរ (Queue) ឬយកទៅរៀបចំកាលវិភាគ (Schedule) បាន! ឧទាហរណ៍ដូចជាជួរក្រដាសបញ្ជាក្នុងផ្ទះបាយអញ្ចឹង។

**Host B (បូរិទ្ធ):** ឡូយមែនទែន! ហើយចុះរឿងមុខងារ `Ctrl+Z` (Undo) នៅក្នុងកម្មវិធីធំៗ ដូចជា Photoshop តើវាពាក់ព័ន្ធនឹង Pattern នេះដែរទេ?

**Host A (សិទ្ធិ):** ពាក់ព័ន្ធ ១០០%! Command Object តែងតែមាន Method `undo()` មួយទៀត។ ពេលយើងចុច `Ctrl+Z` ប្រព័ន្ធគ្រាន់តែយក Command ចុងក្រោយគេពី History Stack មកហៅ `undo()` នោះវានឹងត្រលប់ទៅសភាពដើមវិញយ៉ាងងាយស្រួល! បើយើងមិនមាន Command Object ទេ ការសរសេរមុខងារ Undo គឺជាសុបិនអាក្រក់បំផុត។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Command Interface (ក្រដាសបញ្ជា)
public interface Command {
    void execute();
    void undo();
}

// ២. Receiver (ចុងភៅអ្នកធ្វើការ)
public class Light {
    public void turnOn() { System.out.println("Light ON"); }
    public void turnOff() { System.out.println("Light OFF"); }
}

// ៣. Concrete Command (ក្រដាសបញ្ជាជាក់លាក់)
public class LightOnCommand implements Command {
    private Light light;
    public LightOnCommand(Light light) { this.light = light; }

    public void execute() { light.turnOn(); }
    public void undo() { light.turnOff(); } // ធ្វើផ្ទុយមកវិញ
}

// ៤. Invoker (អ្នករត់តុ ឬ UI Button)
public class RemoteControl {
    private Stack<Command> history = new Stack<>();

    public void pressButton(Command command) {
        if (command == null) return; // ការពារបូរិទ្ធដុតក្រដាសបញ្ជាចោល
        command.execute();
        history.push(command); // កត់ត្រាប្រវត្តិ
    }

    public void pressUndo() {
        if (!history.isEmpty()) {
            Command lastCmd = history.pop();
            lastCmd.undo();
        }
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Single Responsibility Principle:** បំបែក UI/Invoker ចេញពី Object ដែលធ្វើការងារពិតប្រាកដ។
- **Advanced Features:** គាំទ្រយ៉ាងរលូនសម្រាប់មុខងារ Undo/Redo, ការកត់ត្រាប្រវត្តិ (Logging), និង Task Queue។

**គុណវិបត្តិ (Cons):**
- **Code Bloat:** រាល់សកម្មភាពតូចមួយ (ឧ. បើកភ្លើង បិទភ្លើង) តម្រូវឱ្យបង្កើត Class ថ្មីមួយដាច់ដោយឡែក ដែលធ្វើឱ្យចំនួន Class កើនឡើងខ្លាំង។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** កូដអ្នកបញ្ជា (Invoker) និងកូដអ្នកទទួលបញ្ជា (Receiver) ចងភ្ជាប់គ្នាផ្ទាល់ ពិបាកគ្រប់គ្រងជួរ និងប្រវត្តិ។
- **ដំណោះស្រាយ:** វេចខ្ចប់រាល់ការបញ្ជាទាំងអស់ទៅជា Object (Command) ឯករាជ្យដែលមាន `execute()` និង `undo()`។
