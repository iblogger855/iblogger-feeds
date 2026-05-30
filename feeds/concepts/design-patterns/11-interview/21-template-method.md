# វគ្គសម្ភាសន៍ការងារ: Template Method (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #template-method #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងមានប្រព័ន្ធ Data Mining។ យើងត្រូវទាញយកទិន្នន័យពី PDF, CSV, និង Word។ ដំណើរការគឺមាន ៤ ជំហានដូចគ្នា: ១.បើកឯកសារ ២.ទាញយកទិន្នន័យ ៣.វិភាគទិន្នន័យ និង ៤.បិទឯកសារ។ កូនចៅខ្ញុំសរសេរ Class ៣ ដាច់ពីគ្នា ហើយ Copy-Paste ជំហាន "វិភាគទិន្នន័យ" និង "បិទឯកសារ" ដាក់គ្រប់ Class ទាំង ៣ ព្រោះវាដូចគ្នា! តើប្អូនមានយុទ្ធសាស្ត្រអ្វីដើម្បីលុបបំបាត់ Code Duplication ដ៏គួរអោយខ្មាសអៀននេះ?

**បេក្ខជន (សុខា):** បាទ! បញ្ហានេះដោះស្រាយបានយ៉ាងល្អឥតខ្ចោះដោយប្រើប្រាស់ **Template Method Pattern**។
ខ្ញុំនឹងបង្កើត Abstract Class មួយឈ្មោះ `DataMiner`។ នៅក្នុងនោះ ខ្ញុំបង្កើត Method មួយឈ្មោះ `mineData()` ដែលដើរតួជា "គ្រោងឆ្អឹង (Skeleton)"។ ខ្ញុំសរសេរហៅជំហានទាំង ៤ តាមលំដាប់លំដោយនៅក្នុង Method នេះ។ 
ជំហានដែល "ដូចគ្នា" (វិភាគ និង បិទ) ខ្ញុំសរសេរកូដ Implement វាអោយហើយនៅក្នុង Abstract Class នេះតែម្តង! ចំណែកជំហានដែល "ខុសគ្នា" (បើក និង ទាញយក) ខ្ញុំប្រកាសវាជា `abstract` ដើម្បីបង្ខំអោយ Subclass (PDFMiner, CSVMiner) ជាអ្នក Implement ទៅតាមទម្រង់របស់ពួកគេ។
ធ្វើបែបនេះ យើងលុបបំបាត់ Code Duplication ហើយរក្សាបាននូវលំដាប់លំដោយនៃ Algorithm យ៉ាងរឹងមាំ!

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អ! ចុះដើម្បីការពារកុំអោយ Subclass កំហូចណាមួយ លួចទៅ "Override" លើ Method គ្រោងឆ្អឹង `mineData()` នោះ រួចប្តូរលំដាប់លំដោយនៃ Algorithm របស់យើង តើប្អូនត្រូវធ្វើដូចម្តេច?

**បេក្ខជន (សុខា):** នេះជាចំណុចសំខាន់! ដើម្បីការពារគ្រោងឆ្អឹងនៃ Algorithm យើងត្រូវតែដាក់ពាក្យគន្លឹះ `final` ទៅលើ Template Method នោះ (ឧទាហរណ៍ `public final void mineData()`)! នៅក្នុង Java ពាក្យ `final` នឹងរារាំង Subclass មិនអោយ Override Method នេះបានជាដាច់ខាត!

**អ្នកសម្ភាសន៍:** ចុះប្អូនធ្លាប់លឺពាក្យ "Hollywood Principle" នៅក្នុង Design Pattern នេះទេ? តើវាមានន័យថាម៉េច?

**បេក្ខជន (សុខា):** បាទធ្លាប់លោកប្រធាន! "Don't call us, we'll call you" (កុំហៅពួកយើងអី ចាំពួកយើងអ្នកហៅទៅអ្នកឯងវិញ)! 
មានន័យថា ថ្នាក់កូន (Subclasses) មិនមានសិទ្ធិហៅ ឬសម្រេចចិត្តថាពេលណាត្រូវរត់ Algorithm នោះទេ។ វាជាការទទួលខុសត្រូវរបស់ ថ្នាក់មេ (Superclass - Template Method) ក្នុងការហៅកូដរបស់ថ្នាក់កូនយកមកប្រើ នៅពេលដែលពេលវេលាមកដល់ (Inversion of Control)! នេះធ្វើអោយ Superclass មានអំណាចក្តោបក្តាប់លំហូរនៃកម្មវិធីទាំងមូល។

**អ្នកសម្ភាសន៍ (ងក់ក្បាលពេញចិត្ត):** វិភាគបានល្អណាស់! ចម្លើយត្រឹមត្រូវទាំងបច្ចេកទេស និងទ្រឹស្តី។

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Abstract Class (អ្នកក្តោបក្តាប់អំណាច)
public abstract class DataMiner {

    // នេះគឺជា Template Method! ដាក់ final ដើម្បីការពារការបំផ្លាញរចនាសម្ព័ន្ធ
    public final void mineData(String path) {
        openFile(path);       // ទុកអោយកូនជាអ្នកធ្វើ
        extractData();        // ទុកអោយកូនជាអ្នកធ្វើ
        analyzeData();        // មេធ្វើអោយស្រាប់ (កូដស្ទួនត្រូវបំបាត់)
        closeFile();          // មេធ្វើអោយស្រាប់
    }

    // ជំហានដែលត្រូវបង្ខំអោយកូនៗធ្វើ (Primitive operations)
    protected abstract void openFile(String path);
    protected abstract void extractData();

    // ជំហានដែលអោយកូនៗប្រើរួមគ្នា (សន្សំកូដបានច្រើន)
    private void analyzeData() {
        System.out.println("Analyzing data with complex ML algorithms...");
    }
    
    private void closeFile() {
        System.out.println("Closing the file system securely.");
    }
}

// ២. Concrete Class (កូនអ្នកធ្វើការងារលម្អិត)
public class PDFMiner extends DataMiner {
    @Override
    protected void openFile(String path) {
        System.out.println("Opening PDF file with special Adobe libraries.");
    }

    @Override
    protected void extractData() {
        System.out.println("Extracting text and images from PDF.");
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** ដឹងពីរបៀបលុបបំបាត់ Code Duplication ដោយប្រើ Template Method។ ដឹងពីវិធីប្រើប្រាស់ `final` ដើម្បីការពារការលួច Override លំដាប់លំដោយនៃ Algorithm (គ្រោងឆ្អឹង)។
❌ **អន្ទាក់:** សួរអំពី Hollywood Principle។ បេក្ខជនពន្យល់បានយ៉ាងច្បាស់អំពី Inversion of Control ដែលកើតឡើងដោយសារ Pattern នេះ។
