# 💬 Comments & Formatting

> **Series:** Clean Code › Uncle Bob's Rules · **Level:** Fundamental · **Read Time:** ~6 min

---

## 📖 Table of Contents

- [1. Comments Represent Failure](#1-comments-represent-failure)
- [2. Good Comments vs Bad Comments](#2-good-comments-vs-bad-comments)
- [3. Vertical Formatting (The Newspaper Metaphor)](#3-vertical-formatting-the-newspaper-metaphor)
- [4. Horizontal Formatting](#4-horizontal-formatting)

---

## 1. Comments Represent Failure

> *"Don't comment bad code—rewrite it."* — Brian W. Kernighan

Uncle Bob takes a controversial stance: **Comments are always failures.** We use comments because we fail to express ourselves in code. Code is the *only* source of truth. Comments lie; they become outdated, they get detached from the code they describe during refactoring, and they actively deceive developers.

If you feel the need to write a comment explaining a complex `if` statement, you should extract that `if` statement into a well-named boolean function instead.

**❌ Bad:**
```java
// Check to see if the employee is eligible for full benefits
if ((employee.flags & HOURLY_FLAG) && (employee.age > 65)) { ... }
```

**✅ Good (No comment needed):**
```java
if (employee.isEligibleForFullBenefits()) { ... }
```

---

## 2. Good Comments vs Bad Comments

### The Rare "Good" Comments
1. **Legal Comments:** Copyright and license statements at the top of a file.
2. **Warning of Consequences:** `// WARNING: This test takes 25 minutes to run.`
3. **Clarification of weird business logic:** Why are you adding +1 to this obscure algorithm? (But only if you absolutely cannot express it via code).

### The Evil "Bad" Comments
1. **Redundant Comments:** 
   ```java
   // Returns the day of the month
   public int getDayOfMonth() { return dayOfMonth; }
   ```
2. **Commented-Out Code:** This is an atrocity. Other developers are terrified to delete it because they think it's there for a reason. *Delete it.* Git will remember it.
3. **Journal Comments:** Adding a log of who changed what at the top of the file. That is what version control (Git) is for.

---

## 3. Vertical Formatting (The Newspaper Metaphor)

Think of a source file like a newspaper article. 
- At the top, you expect a headline that tells you what the story is about (The Class Name).
- The first paragraph gives a synopsis of the story (The highest-level functions).
- As you read downward, the details increase, until you have all the dates, names, and quotes at the bottom (The lowest-level private helper functions).

### Vertical Density and Distance
Concepts that are closely related should be kept vertically close to each other. 
Variables should be declared as close to their usage as possible. 
If Function A calls Function B, they should be vertically close, and the caller should be *above* the callee.

---

## 4. Horizontal Formatting

How wide should a line be? 
Uncle Bob suggests that you should never have to scroll to the right. Usually, an upper limit of **100 to 120 characters** is the absolute maximum. 

If your lines are longer than 120 characters, it is a symptom of deeply nested `if/else` logic, which violates the "Do One Thing" rule of functions.

---

*← [Functions & Methods](./02-functions-and-methods.md) · Next: [Error Handling & Boundaries](./04-error-handling-boundaries.md) →*

## Related

- [Refactoring Techniques](../refactoring/README.md)
- [Design Patterns](../design-patterns/README.md)
- [Software Architecture Patterns](../software-architecture/README.md)
