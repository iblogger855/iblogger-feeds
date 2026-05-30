# វគ្គសម្ភាសន៍ការងារ: Visitor (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #visitor #behavioral #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងមានកម្មវិធីវិភាគកូដ (Code Analyzer) ដែលមានរចនាសម្ព័ន្ធដើមឈើ AST (Abstract Syntax Tree) មានរាប់រយ Nodes ដូចជា `IfNode`, `WhileNode`, `AssignmentNode` ជាដើម។ ថ្មីៗនេះ មេធំចង់អោយយើងបន្ថែមមុខងារ "Export to XML" សម្រាប់ Nodes ទាំងអស់នោះ។ Developer យើងបានរត់ទៅចូលកែ Class Node ទាំងរាប់រយនោះ ដើម្បីថែម Method `exportXML()` អោយវាម្នាក់មួយៗ! កូដប្រឡាក់ប្រឡូស ហើយប្រឈមនឹងការខូចខាត (Bugs) ពេញប្រព័ន្ធ។ តើប្អូនមានដំណោះស្រាយអ្វីដែលមិនប៉ះពាល់ដល់ Class ចាស់ៗទាំងនោះទេ?

**បេក្ខជន (សុខា):** បាទលោកប្រធាន! បញ្ហានេះស័ក្តិសមបំផុតជាមួយការប្រើប្រាស់ **Visitor Pattern**។
គោលដៅរបស់ Visitor គឺអនុញ្ញាតឱ្យយើង "បន្ថែមមុខងារថ្មី (Operations)" ទៅលើ Objects មួយស៊េរី ដោយមិនចាំបាច់កែប្រែ (Modify) កូដនៅក្នុង Objects ទាំងនោះឡើយ! (ស្របតាមគោលការណ៍ Open/Closed Principle)។
ខ្ញុំនឹងបង្កើត Class ថ្មីមួយឈ្មោះ `XMLExportVisitor` ដែលមាន Method `visit(IfNode)`, `visit(WhileNode)`។ រីឯនៅក្នុង Nodes ទាំងឡាយ ខ្ញុំគ្រាន់តែទុក "ទ្វារស្វាគមន៍" មួយឈ្មោះថា `accept(Visitor v)` ដើម្បីអនុញ្ញាតអោយភ្ញៀវ (Visitor) ចូលមកយកទិន្នន័យពីវាទៅចាត់ចែងនៅខាងក្រៅ។ 

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ឆ្លាតណាស់! ចុះហេតុអ្វីបានជាយើងមិនប្រើ Method Overloading ធម្មតា `visitor.visit(node)` នៅខាងក្រៅរចនាសម្ព័ន្ធដើមឈើទៅ? ហេតុអ្វីចាំបាច់ត្រូវសរសេរ Method `accept(Visitor v)` នៅខាងក្នុង Node រួចអោយ Node នោះហៅត្រលប់ទៅ Visitor វិញ `v.visit(this)`? តើវាមិនស្មុគស្មាញ (វិលវល់) ពេកទេឬ?

**បេក្ខជន (សុខា - ញញឹម):** នេះគឺជាបេះដូងរបស់ Visitor ដែលគេហៅថា **"Double Dispatch"**! 
នៅក្នុង Java (និងភាសាភាគច្រើន) ការហៅ Method គឺអាស្រ័យលើ Dynamic Binding តែសម្រាប់ Receiver ប៉ុណ្ណោះ (Single Dispatch) ចំណែក Parameter គឺត្រូវបានសម្រេចនៅពេល Compile-time។ បើយើងហៅ `visitor.visit(node)` ខាងក្រៅ ខណៈពេលដែល `node` ត្រូវបានប្រកាសជាទម្រង់ Interface `Node` នោះ Compiler នឹងមិនដឹងថាត្រូវហៅ Method មួយណាអោយប្រាកដនោះទេ (វានឹងហៅ `visit(Node)` ដែលខុសគោលដៅ)!
ប៉ុន្តែនៅពេលយើងប្រើ `accept(Visitor v)` នៅខាងក្នុង `IfNode` ពាក្យ `this` មាន Type ជា `IfNode` យ៉ាងច្បាស់លាស់នៅពេល Compile-time។ ពេលវាហៅ `v.visit(this)` វាបង្ខំអោយ Compiler ជ្រើសរើស Method `visit(IfNode)` ដោយស្វ័យប្រវត្តិ និងត្រឹមត្រូវ ១០០%!

**អ្នកសម្ភាសន៍:** ចុះបើស្អែកខ្ញុំចង់ថែម "ប្រភេទ Node ថ្មី (ឧទាហរណ៍ `TryCatchNode`)" ចូលទៅក្នុងរចនាសម្ព័ន្ធដើមឈើ តើ Visitor នឹងជួបបញ្ហាអ្វី?

**បេក្ខជន (សុខា):** នេះជាចំណុចខ្សោយរបស់ Visitor លោកប្រធាន! បើយើងថែម Node ថ្មី យើងត្រូវរត់ទៅកែ (Update) "គ្រប់" Visitor Classes ទាំងអស់ដែលយើងធ្លាប់មាន (XMLExportVisitor, TypeCheckVisitor, CodeGenVisitor) ដើម្បីថែម Method `visit(TryCatchNode)`។ ដូច្នេះ Pattern នេះស័ក្តិសមតែក្នុងករណីដែល "រចនាសម្ព័ន្ធ (Object Structure)" មានស្ថិរភាព (មិនងាយប្រែប្រួល) តែយើងឧស្សាហ៍ថែម "មុខងារថ្មី (Operations)" ញឹកញាប់!

**អ្នកសម្ភាសន៍ (ទះដៃ):** អស្ចារ្យណាស់! ការពន្យល់ពី Double Dispatch គឺច្បាស់លាស់ អាចអោយ Junior ស្តាប់យល់បានភ្លាម!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. Visitor Interface (អ្នកមានមុខងារថ្មីៗជាច្រើន)
public interface Visitor {
    void visit(IfNode node);
    void visit(WhileNode node);
}

// ២. Node Interface (អ្នកផ្តល់ទ្វារស្វាគមន៍)
public interface Node {
    void accept(Visitor visitor); // ទ្វារស្វាគមន៍ភ្ញៀវ
}

// ៣. Concrete Nodes (រក្សាទម្រង់ដើម មិនបាច់ថែម Logic មុខងារថ្មីចូលទេ)
public class IfNode implements Node {
    public void accept(Visitor visitor) {
        visitor.visit(this); // ពាក្យ this ជួយអោយ Visitor ស្គាល់ Type ពិតប្រាកដ (Double Dispatch)
    }
}

public class WhileNode implements Node {
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}

// ៤. Concrete Visitor (កន្លែងផ្ទុកមុខងារថ្មីដែលទើបនឹងថែម)
public class XMLExportVisitor implements Visitor {
    public void visit(IfNode node) {
        System.out.println("Exporting IfNode to <if>...</if>");
    }

    public void visit(WhileNode node) {
        System.out.println("Exporting WhileNode to <while>...</while>");
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីអំណាចរបស់ Visitor ក្នុងការគោរព OCP ពេលថែមមុខងារថ្មី។ ការពន្យល់ពីយន្តការលាក់កំបាំង "Double Dispatch" គឺត្រឹមត្រូវឥតខ្ចោះ ដែលជាសំណួរធ្លាក់ភាគច្រើនសម្រាប់ Senior Developers។ ដឹងពីចំណុចខ្សោយ (Fragility) ពេលមានការថែម Node ថ្មី។
❌ **អន្ទាក់:** សួរអំពីមូលហេតុដែលមិនប្រើ Method Overloading ធម្មតា។ បេក្ខជនបានបកស្រាយពីដែនកំណត់នៃ Single Dispatch របស់ Java យ៉ាងល្អ។
