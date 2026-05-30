# វគ្គសម្ភាសន៍ការងារ: Command (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #command #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** នៅក្នុង UI របស់យើង យើងមានប៊ូតុង "Save" នៅក្នុង Toolbar និងនៅក្នុង Context Menu។ Developer មុនបានសរសេរកូដ Save ចូលទៅក្នុង Event Listener របស់ប៊ូតុងទាំងពីរដោយផ្ទាល់ ធ្វើអោយកូដស្ទួនគ្នា។ ម្យ៉ាងទៀត មេធំចង់អោយមានមុខងាររៀបជាជួរ (Queue) និងមានមុខងារ "Undo" សម្រាប់រាល់សកម្មភាពទាំងអស់។ តើប្អូនមានដំណោះស្រាយអ្វី?

**បេក្ខជន (សុខា):** បាទ! ដើម្បីដោះស្រាយបញ្ហានេះ ខ្ញុំនឹងប្រើប្រាស់ **Command Pattern**។ 
ខ្ញុំនឹងបំប្លែង "សកម្មភាព (Action)" នីមួយៗអោយក្លាយទៅជា Object មួយដាច់ដោយឡែក ដែលយើងហៅថា Command។ ប៊ូតុងទាំងឡាយ (Invokers) មិនបាច់ដឹងពីរបៀប Save ទេ ពួកវាគ្រាន់តែកាន់ `SaveCommand Object` ហើយហៅ `execute()`។
អត្ថប្រយោជន៍ដ៏ធំគឺ ដោយសារសកម្មភាពវាជា Object យើងអាចយកវាទៅដាក់ជាជួរ (Queue) ក្នុង List, អាចផ្អាកវា, ឬអាចអោយវាមាន Method `undo()` ដើម្បីថយក្រោយវិញបានយ៉ាងងាយស្រួល!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អណាស់! ចុះឧបមាថា ខ្ញុំមាន Command ឈ្មោះ `CopyCommand`។ តើ `CopyCommand` នោះគួរតែមានផ្ទុកកូដ (Logic) សម្រាប់ Copy ទិន្នន័យដោយខ្លួនវាផ្ទាល់ ឫក៏ត្រូវមានអ្នកផ្សេងធ្វើការងារនោះ?

**បេក្ខជន (សុខា):** នេះជាចំណុចដ៏សំខាន់លោកប្រធាន! បើយោងតាមទ្រឹស្តីកម្រិតខ្ពស់ Command មិនគួរធ្វើការងារ "ធ្ងន់ធ្ងរ (Business Logic)" ដោយខ្លួនឯងឡើយ! 
វាគួរតែដើរតួត្រឹមតែជា "អ្នកនាំសារ (Delegator)" ប៉ុណ្ណោះ។ វាត្រូវមានអ្នកទទួលការងារ (Receiver) នៅពីក្រោយខ្នង ឧទាហរណ៍ `TextEditorService`។ ពេលគេហៅ `execute()` Command គ្រាន់តែបន្តបញ្ជាទៅ Receiver ថា `editor.copyText()` ជាការស្រេច។ ការធ្វើបែបនេះទើបធានាបាននូវការបំបែកកូដ (Decoupling) ដ៏ល្អឥតខ្ចោះរវាងអ្នកចុច (Invoker) និងអ្នកធ្វើការ (Receiver)។

**អ្នកសម្ភាសន៍:** ចុះការធ្វើ Undo ដោយប្រើ Command នេះ ខុសពី Memento យ៉ាងម៉េចទៅ?

**បេក្ខជន (សុខា):** 
- **Memento:** ថតរូប (Snapshot) នូវ "ស្ថានភាព (State)" ទាំងមូលរបស់ប្រព័ន្ធ យកទៅលាក់ទុក។
- **Command Undo:** មិនថតរូបប្រព័ន្ធទេ តែវាកត់ត្រានូវ "ប្រតិបត្តិការ (Operation)" ដែលទើបនឹងធ្វើ។ ពេល Undo វាគ្រាន់តែធ្វើសកម្មភាពផ្ទុយ (Reverse action)។ ឧទាហរណ៍ បើ `execute()` គឺការបូកលុយ ១០$ នោះ `undo()` គឺការដកលុយ ១០$ វិញ។ វាស៊ី Memory តិចជាង Memento ឆ្ងាយណាស់!

**អ្នកសម្ភាសន៍ (ទះដៃ):** ចម្លើយកម្រិតកំពូល! ប្អូនយល់ពីសិល្បៈនៃការលាយបញ្ចូលគ្នា និងការប្រៀបធៀប Pattern យ៉ាងល្អ!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Command Interface (មុខមាត់រួម)
public interface Command {
    void execute();
    void undo(); // អាវុធសម្ងាត់របស់ក្បួននេះ
}

// ២. Receiver (អ្នកជំនាញដែលធ្វើការងារពិតប្រាកដ)
public class TextEditor {
    public void copy() { System.out.println("Text copied."); }
    public void paste() { System.out.println("Text pasted."); }
    public void deleteLastPaste() { System.out.println("Pasted text removed."); }
}

// ៣. Concrete Command (អ្នកនាំសារ)
public class PasteCommand implements Command {
    private TextEditor editor; // កាន់ Reference ទៅកាន់ Receiver

    public PasteCommand(TextEditor editor) {
        this.editor = editor;
    }

    @Override
    public void execute() {
        editor.paste(); // ប្រើ Receiver អោយធ្វើការ
    }

    @Override
    public void undo() {
        editor.deleteLastPaste(); // ធ្វើសកម្មភាពផ្ទុយ
    }
}

// ៤. Invoker (ប៊ូតុងចុច មិនខ្វល់ថាខាងក្រោយធ្វើអីទេ)
public class Button {
    private Command command;
    public void setCommand(Command cmd) { this.command = cmd; }
    public void click() { command.execute(); }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីការប្រើប្រាស់ Command សម្រាប់មុខងារ Undo និង Queue។ ពន្យល់យ៉ាងច្បាស់អំពីតួនាទីរបស់ Receiver ជៀសវាងការដាក់ Business Logic ក្នុង Command។ បកស្រាយភាពខុសគ្នារវាង Command Undo នឹង Memento បានយ៉ាងមុតស្រួច។
❌ **អន្ទាក់:** សួរអំពីការផ្ទុក Logic ក្នុង Command ផ្ទាល់។ បេក្ខជនបដិសេធ និងបានបង្ហាញពីការ Decouple រវាង Invoker នឹង Receiver តាមរយៈ Command យ៉ាងត្រឹមត្រូវ។
