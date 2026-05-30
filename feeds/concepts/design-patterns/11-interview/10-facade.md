# វគ្គសម្ភាសន៍ការងារ: Facade (Interview Session)

**Author:** ichamrong  
**Date:** 2026-05-19  
**Tags:** #interview #design-patterns #facade #structural #clean-code  
**Category:** Concepts / Interview  
**Read Time:** ~8 min  

---

## 📌 មាតិកា (Table of Contents)
- [១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)](#១-កិច្ចសន្ទនាសម្ភាសន៍-interview-transcript)
- [២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)](#២-កូដដែលបេក្ខជនសរសេរ-candidates-code)
- [៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)](#៣-ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍-interviewers-evaluation)

---

## ១. កិច្ចសន្ទនាសម្ភាសន៍ (Interview Transcript)

**អ្នកសម្ភាសន៍ (លោកប្រធាន):** យើងទើបតែទិញ Library ថ្មីមួយសម្រាប់បម្លែង Video។ Library នេះមានកម្លាំងខ្លាំងណាស់ តែវាមាន Class ដល់ទៅ ៥០ ដូចជា `VideoCodec`, `BitrateReader`, `AudioMixer` ព្រមទាំងរនាំងស្មុគស្មាញជាច្រើន។ Developer របស់យើងត្អូញត្អែរថា ការគ្រាន់តែចង់បម្លែង MP4 ទៅ AVI តម្រូវឱ្យគេសរសេរកូដ ៣០បន្ទាត់ និងចងភ្ជាប់ (Couple) ជាមួយ Class ទាំង ៥០ នោះ! តើប្អូនមានយោបល់យ៉ាងណា?

**បេក្ខជន (សុខា):** លោកប្រធាន! នេះគឺជាពេលវេលាដ៏ស័ក្តិសមបំផុតសម្រាប់ **Facade Pattern**។ យើងមិនគួរអនុញ្ញាតឱ្យ Developer របស់យើងហៅកូដ Library នោះដោយផ្ទាល់ទេ។ ខ្ញុំនឹងបង្កើត Class ថ្មីមួយឈ្មោះ `VideoConverterFacade` ដែលមាន Method សាមញ្ញមួយគឺ `convert(fileName, format)`។ 
Facade នេះនឹងដើរតួជា "អ្នករត់តុ" ដែលទទួលការកុម្ម៉ង់ រួចដើរចូលទៅប្រើប្រាស់ Class ទាំង ៥០ នៅក្នុង Library នោះជំនួស Developer។ ធ្វើបែបនេះ កូដរបស់យើងនឹងមានចំណងធូររលុង (Loose Coupling) ជាមួយ Library ខាងក្រៅ។

**អ្នកសម្ភាសន៍ (សួរអន្ទាក់):** ល្អ! ចុះបើមាន Developer ម្នាក់ដែលជា "អ្នកជំនាញផ្នែក Video" គាត់ចង់ប្តូរ Bitrate ឬតម្រូវកម្រិតសំឡេងយ៉ាងលម្អិត តើគាត់អាចធ្វើបានទេ បើប្អូនយក Facade មកបាំងមុខអស់ហើយនោះ? តើ Facade ហាមឃាត់ការប្រើប្រាស់ Library ដោយផ្ទាល់មែនទេ?

**បេក្ខជន (សុខា - ញញឹម):** នេះជាការយល់ច្រឡំជាទូទៅលោកប្រធាន! Facade Pattern **មិនបានលាក់បាំង ឬហាមឃាត់** Client ពីការចូលទៅប្រើប្រាស់ Subsystem (Library) ដោយផ្ទាល់នោះទេ! វាគ្រាន់តែផ្តល់នូវ "ផ្លូវកាត់" (Shortcut) ដ៏ងាយស្រួលមួយសម្រាប់មនុស្ស ៩០% ដែលត្រូវការតែមុខងារទូទៅប៉ុណ្ណោះ។ ប្រសិនបើមាន "អ្នកជំនាញ" គាត់នៅតែអាចដើរវាង Facade រួចហៅ `BitrateReader` និង `AudioMixer` ដោយផ្ទាល់បានដោយសេរី!

**អ្នកសម្ភាសន៍:** ចុះបើ Facade ក្លាយជា Class ដែលធំសម្បើម មានកូដរាប់ម៉ឺនបន្ទាត់ ព្រោះវាដឹងពីគ្រប់យ៉ាងនៅក្នុងប្រព័ន្ធ តើប្អូនមានដំណោះស្រាយអ្វី?

**បេក្ខជន (សុខា):** បាទ! បើវាក្លាយជា God Object ខ្ញុំនឹងបំបែកវាទៅជា "Additional Facades" (Facade តូចៗជាច្រើន)។ ឧទាហរណ៍ `AudioFacade` សម្រាប់សំឡេង និង `VideoCompressionFacade` សម្រាប់រូបភាព។

**អ្នកសម្ភាសន៍ (ងក់ក្បាល):** ឆ្លាតណាស់! ការប្រើប្រាស់ Facade ត្រូវតែប្រយ័ត្នកុំឱ្យវាក្លាយជា God Object ពិតមែន!

---

## ២. កូដដែលបេក្ខជនសរសេរ (Candidate's Code)

```java
// ១. ភាពស្មុគស្មាញរបស់ 3rd-Party Library (Subsystem)
class VideoFile { /* ... */ }
class OggCompressionCodec { /* ... */ }
class MPEG4CompressionCodec { /* ... */ }
class CodecFactory { /* ... */ }
class BitrateReader { /* ... */ }
class AudioMixer { /* ... */ }

// ២. Facade (អ្នកបម្រើដ៏រួសរាយរាក់ទាក់)
public class VideoConverterFacade {
    
    // Method ដ៏សាមញ្ញបំផុត សម្រាប់មនុស្ស ៩០%
    public File convertVideo(String fileName, String format) {
        System.out.println("VideoConverterFacade: conversion started.");
        VideoFile file = new VideoFile(fileName);
        
        // លាក់បាំងភាពស្មុគស្មាញទាំងឡាយពី Client
        Codec sourceCodec = CodecFactory.extract(file);
        Codec destinationCodec;
        if (format.equals("mp4")) {
            destinationCodec = new MPEG4CompressionCodec();
        } else {
            destinationCodec = new OggCompressionCodec();
        }
        
        VideoFile buffer = BitrateReader.read(fileName, sourceCodec);
        VideoFile intermediateResult = BitrateReader.convert(buffer, destinationCodec);
        File result = (new AudioMixer()).fix(intermediateResult);
        
        System.out.println("VideoConverterFacade: conversion completed.");
        return result;
    }
}

// ៣. Client Code
public class App {
    public static void main(String[] args) {
        VideoConverterFacade converter = new VideoConverterFacade();
        // Client ហៅតែ ១ បន្ទាត់គត់ ដោយរំភើបញាប់ញ័រ!
        File mp4Video = converter.convertVideo("funny_cats.ogg", "mp4");
    }
}
```

---

## ៣. ការវាយតម្លៃរបស់អ្នកសម្ភាសន៍ (Interviewer's Evaluation)

✅ **ចំណុចខ្លាំង:** យល់ច្បាស់ពីតួនាទីរបស់ Facade ក្នុងការកាត់បន្ថយ Coupling ជាមួយ Library ខាងក្រៅ។ 
❌ **អន្ទាក់:** សួរអំពីការហាមឃាត់ Client មិនអោយប្រើ Subsystem។ បេក្ខជនបានបកស្រាយត្រឹមត្រូវថា Facade គ្រាន់តែជា "ជម្រើសបន្ថែម" មិនមែនជាការ "រឹតត្បិត" នោះទេ។ ព្រមទាំងដឹងពីបញ្ហា God Object Anti-pattern។
