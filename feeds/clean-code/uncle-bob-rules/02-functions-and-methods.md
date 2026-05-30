# ⚙️ Functions & Methods

> **Series:** Clean Code › Uncle Bob's Rules · **Level:** Intermediate · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. Small! (The First Rule)](#1-small-the-first-rule)
- [2. Do One Thing](#2-do-one-thing)
- [3. Function Arguments](#3-function-arguments)
- [4. Command Query Separation](#4-command-query-separation)

---

## 1. Small! (The First Rule)

The first rule of functions is that they should be small. The second rule of functions is that **they should be smaller than that.**

Uncle Bob argues that functions should rarely be 20 lines long, and almost never 100 lines long. Every function should tell a story. If your function is scrolling down the screen, it is doing too much.

---

## 2. Do One Thing

> *"Functions should do one thing. They should do it well. They should do it only."*

If a function handles parsing a CSV, verifying user permissions, and saving to a database, it is doing three things. 
If you can extract *another* function from your function with a name that is not merely a restatement of its implementation, then your function is doing more than one thing.

**❌ Bad:**
```java
public void processUserPayload(String payload) {
    // 1. Parse JSON
    User user = json.parse(payload);
    // 2. Validate
    if (user.age < 18) throw new Error();
    // 3. Save
    db.save(user);
}
```

**✅ Good:**
```java
public void processUserPayload(String payload) {
    User user = parseUser(payload);
    validateUser(user);
    saveUser(user);
}
```

---

## 3. Function Arguments

The ideal number of arguments for a function is zero (niladic). Next comes one (monadic), followed closely by two (dyadic). Three arguments (triadic) should be avoided where possible. More than three (polyadic) requires very special justification—and then shouldn't be used anyway.

When a function takes many arguments, it becomes incredibly difficult to test all the combinations.

**❌ Bad (Flag Arguments):**
```java
// Flag arguments boldly proclaim that this function does MORE than one thing!
public void renderPage(boolean isSuite) { ... }
```

**✅ Good (Split into two):**
```java
public void renderForSuite() { ... }
public void renderForSingleTest() { ... }
```

**If you need 3+ arguments, wrap them in an Object:**
```java
// Bad
Circle makeCircle(double x, double y, double radius);

// Good
Circle makeCircle(Point center, double radius);
```

---

## 4. Command Query Separation

Functions should either do something (Command) or answer something (Query), but not both.
A function should change the state of an object, or it should return some information about that object. Doing both causes immense confusion.

**❌ Bad:**
```java
// Returns true if the password was successfully updated
if (set("username", "unclebob")) { ... } 
```

**✅ Good:**
```java
if (attributeExists("username")) {
    setAttribute("username", "unclebob");
}
```

---

*← [Meaningful Names](./01-meaningful-names.md) · Next: [Comments & Formatting](./03-comments-and-formatting.md) →*

## Related

- [Refactoring Techniques](../refactoring/README.md)
- [Design Patterns](../design-patterns/README.md)
- [Software Architecture Patterns](../software-architecture/README.md)
