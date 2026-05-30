# Podcast: Iterator (កិច្ចសន្ទនា Podcast ជុំវិញ Iterator)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #podcast #design-patterns #iterator #behavioral #clean-code  
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

**Host A (សិទ្ធិ - អ្នកជំនាញ):** សួស្តីបូរិទ្ធ! ថ្ងៃនេះយើងជជែកពី **Iterator Pattern** ដែលអ្នកសរសេរកម្មវិធីតែងតែប្រើ (ដូចជា `for` ឫ `foreach` loop) តែមិនសូវចាប់អារម្មណ៍ពីថាមពលរបស់វា។ ស្រមៃថាអ្នកមានទូសៀវភៅមួយ។ អ្វីដែលអ្នកត្រូវការគឺ "អ្នកជំនួយការ" (Iterator) ម្នាក់ដែលអ្នកអាចប្រាប់ថា "សុំសៀវភៅបន្ទាប់ទៀត" (`next()`) រហូតដល់អស់ (`hasNext() == false`) ដោយមិនបាច់ខ្វល់ថាទូនោះជារចនាសម្ព័ន្ធបែបម៉េចទេ។

**Host B (បូរិទ្ធ - អ្នករៀន):** អូ! យល់បង! វានឹងលាក់បាំងភាពស្មុគស្មាញនៃប្រភពទិន្នន័យពីយើង (មិនថាជា Array, Tree, ឬ API)។ 
តែសុំសួរមួយបង! ចុះបើខ្ញុំរឹងក្បាល... សៀវភៅក្នុងទូមានតែ ៣ក្បាលសោះ ហើយវាក៏លោត `hasNext()` ថា `false` បាត់ទៅហើយ។ តែខ្ញុំខឹង! ខ្ញុំនៅតែបន្តហៅ Method `next()` ហ្នឹង ១លានដងទៀត! តើ Iterator វាទៅកកាយយកទិន្នន័យពីឋាននរកមកឱ្យខ្ញុំ ឬក៏វានឹងជេរខ្ញុំបង?

**Host A (សិទ្ធិ):** ហាហា... បើលោកឯងរឹងក្បាលហៅ `next()` ទាំងដែលអត់មានរបស់ នោះ Iterator វានឹងគប់គ្រាប់បែក `NoSuchElementException` ចំកណ្តាលមុខលោកឯងភ្លាម! វាប្រៀបដូចជាលោកឯងលូកដៃចូលក្នុងទូទទេ ហើយខំប្រឹងស្រវាចាប់ខ្យល់អញ្ចឹង ម៉ាស៊ីនវានឹង Error! ដូច្នេះជាច្បាប់ទម្លាប់ អ្នកសរសេរកូដត្រូវតែឆែក `hasNext()` ជានិច្ច មុននឹងហៅ `next()`។

**Host B (បូរិទ្ធ):** អូហូ... ច្បាស់លាស់ណាស់បង! ចុះបើទិន្នន័យនោះមាន ១សែននាក់ក្នុង Database តើវានឹងទាញយកមកទាំងអស់ដាក់ក្នុង Memory តែម្តងមែនទេ?

**Host A (សិទ្ធិ):** នេះជាថាមពលពិសេសរបស់វា គេហៅថា "Lazy Traversal"! Iterator មិនចាំបាច់ទាញយកទាំងអស់ទេ។ វាអាចទាញយក ១០០នាក់មកទុកក្នុង Buffer។ ពេលលោកឯងហៅ `next()` អស់ពី Buffer វានឹងទៅទាញយកទំព័របន្ទាប់ពី Database ដោយស្វ័យប្រវត្តិ។ កូដខាងក្រៅរបស់អ្នកនៅតែមើលឃើញត្រឹមតែការ Loop `foreach` ធម្មតាដដែល!

**Host B (បូរិទ្ធ):** ឡូយមែនទែនបង! បំបែកកូដដែលទាញយកទិន្នន័យ (Traversal logic) ចេញពីកូដដែលយកទិន្នន័យទៅប្រើប្រាស់ (Business logic) ពិតជាធ្វើឱ្យកូដស្អាតណាស់។

## ២. ការបកប្រែទៅជាកូដ (Translating to Code)

```java
// ១. Iterator Interface (អ្នកជំនួយការ)
public interface Iterator<T> {
    boolean hasNext();
    T next();
}

// ២. Iterable Interface (ប្រកាសថាខ្លួនអាចត្រូវគេ Loop បាន)
public interface IterableCollection<T> {
    Iterator<T> createIterator();
}

// ៣. Concrete Collection
public class BookCollection implements IterableCollection<String> {
    private String[] books = {"Design Patterns", "Clean Code", "Refactoring"};

    public Iterator<String> createIterator() {
        return new BookIterator(this); 
    }
    public String[] getBooks() { return books; }
}

// ៤. Concrete Iterator
public class BookIterator implements Iterator<String> {
    private BookCollection collection;
    private int currentIndex = 0;

    public BookIterator(BookCollection collection) {
        this.collection = collection;
    }

    @Override
    public boolean hasNext() {
        return currentIndex < collection.getBooks().length;
    }

    @Override
    public String next() {
        // ការពារភាពរឹងក្បាលរបស់បូរិទ្ធ!
        if (!hasNext()) throw new NoSuchElementException("No more books, bro!");
        return collection.getBooks()[currentIndex++];
    }
}
```

## ៣. គុណសម្បត្តិ និងគុណវិបត្តិ (Pros & Cons)

**គុណសម្បត្តិ (Pros):**
- **Single Responsibility Principle:** សម្អាតកូដ Business Logic ពីយន្តការ Traversal ដ៏ស្មុគស្មាញ។
- **Open/Closed Principle:** អាចបន្ថែម Iterator ថ្មី (ឧ. Reverse Iterator) ដោយមិនប៉ះពាល់ Collection ពិតប្រាកដ។

**គុណវិបត្តិ (Cons):**
- **Overkill សម្រាប់ Array សាមញ្ញ:** ការបង្កើត Class សម្រាប់តែ Array ដែលមានស្រាប់ គឺជាការសរសេរកូដធ្ងន់ធ្ងរពេក។

## ៤. ចំណុចសំខាន់ៗ (Key Takeaways)

- **បញ្ហា:** ទិន្នន័យត្រូវបានរក្សាទុកក្នុងទម្រង់ផ្សេងៗគ្នា ធ្វើឱ្យកូដអានវាត្រូវសរសេរយន្តការចម្រុះ។
- **ដំណោះស្រាយ:** បង្កើត Iterator Object មួយដែលផ្តល់ច្រកចូលរួម `hasNext()` និង `next()` ដើម្បីទាញយកទិន្នន័យ ដោយលាក់បាំងរចនាសម្ព័ន្ធពិតពីក្រោយខ្នង។
