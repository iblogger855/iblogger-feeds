# 🏷️ Meaningful Names

> **Series:** Clean Code › Uncle Bob's Rules · **Level:** Fundamental · **Read Time:** ~6 min

---

## 📖 Table of Contents

- [1. Intention-Revealing Names](#1-intention-revealing-names)
- [2. Avoid Disinformation](#2-avoid-disinformation)
- [3. Use Pronounceable & Searchable Names](#3-use-pronounceable-searchable-names)
- [4. Classes vs Methods](#4-classes-vs-methods)

---

## 1. Intention-Revealing Names

The name of a variable, function, or class must answer three questions:
1. Why does it exist?
2. What does it do?
3. How is it used?

If a name requires a comment, the name does not reveal its intent.

**❌ Bad:**
```java
int d; // elapsed time in days
```

**✅ Good:**
```java
int elapsedTimeInDays;
int daysSinceCreation;
int fileAgeInDays;
```

---

## 2. Avoid Disinformation

Do not leave false clues that obscure the meaning of code. Avoid words whose entrenched meanings vary from our intended meaning.

**❌ Bad:**
```java
// Do not use the word 'List' unless the data structure is actually a List!
Account[] accountList; 
```

**✅ Good:**
```java
Account[] accountGroup;
Account[] accounts; // Better
```

---

## 3. Use Pronounceable & Searchable Names

If you can't pronounce it, you can't discuss it with your team without sounding like an idiot.
If a variable is used across a massive codebase, it must be easily searchable. Single-letter variables (`e`, `t`, `i`) are impossible to search for.

**❌ Bad:**
```java
class DtaRcrd102 {
    private Date genymdhms; // Generation year, month, day, hour, minute, second
}
```

**✅ Good:**
```java
class Customer {
    private Date generationTimestamp;
}
```

*Note: Single-letter variables are ONLY acceptable as loop counters inside tiny, 2-line `for` loops.*

---

## 4. Classes vs Methods

### Classes
Classes and objects should have **Noun** or noun phrase names like `Customer`, `WikiPage`, `Account`, or `AddressParser`.
Avoid words like `Manager`, `Processor`, `Data`, or `Info` in the name of a class (e.g., `UserDataManager` is a terrible name because it implies the class does way too many things).

### Methods
Methods should have **Verb** or verb phrase names like `postPayment`, `deletePage`, or `save`.
Accessors, mutators, and predicates should be named for their value and prefixed with `get`, `set`, and `is`.

```java
string name = employee.getName();
if (paycheck.isPosted()) { ... }
```

---

*← [Series Overview](./README.md) · Next: [Functions & Methods](./02-functions-and-methods.md) →*

## Related

- [Refactoring Techniques](../refactoring/README.md)
- [Design Patterns](../design-patterns/README.md)
- [Software Architecture Patterns](../software-architecture/README.md)
