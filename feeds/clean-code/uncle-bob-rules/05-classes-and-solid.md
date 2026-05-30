# 🏛️ Classes & S.O.L.I.D.

> **Series:** Clean Code › Uncle Bob's Rules · **Level:** Advanced · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. Classes Should Be Small](#1-classes-should-be-small)
- [2. The Single Responsibility Principle (SRP)](#2-the-single-responsibility-principle-srp)
- [3. Cohesion](#3-cohesion)
- [4. The Rest of the S.O.L.I.D. Principles](#4-the-rest-of-the-solid-principles)

---

## 1. Classes Should Be Small

Just like functions, the first rule of classes is that they should be small. The second rule of classes is that they should be smaller than that.

With functions, we measure size by counting physical lines. With classes, we use a different measure: **We count responsibilities.**

If you cannot derive a concise name for a class, it’s likely too large. The more ambiguous the class name (like `Processor`, `Manager`, or `SuperSystem`), the more likely it has too many responsibilities.

---

## 2. The Single Responsibility Principle (SRP)

> *"A class or module should have one, and only one, reason to change."*

Consider a class named `Employee`. It has three methods:
- `calculatePay()`
- `saveToDatabase()`
- `reportHours()`

This class violates SRP completely. It has three reasons to change:
1. The Accounting team changes the logic for paying people.
2. The Database team switches from MySQL to MongoDB.
3. The HR team changes how hours are tracked.

If the Database team makes a change to `saveToDatabase()`, they might accidentally break the `calculatePay()` logic. 
**The Fix:** Split this into three classes. The `Employee` class should only hold the raw data. An `EmployeeDatabase` class handles saving. An `EmployeePayer` class handles money.

---

## 3. Cohesion

Classes should have a small number of instance variables. Each of the methods of a class should manipulate one or more of those variables. In general, the more variables a method manipulates, the more cohesive that method is to its class.

A class in which each variable is used by each method is maximally cohesive. 

When classes lose cohesion (for example, you add a bunch of methods that only use 1 of the 10 instance variables), it means the class should be broken apart into multiple smaller classes!

---

## 4. The Rest of the S.O.L.I.D. Principles

Robert C. Martin (Uncle Bob) is famous for compiling the SOLID principles of Object-Oriented Design. We covered SRP, here are the rest:

### Open/Closed Principle (OCP)
*Classes should be open for extension, but closed for modification.*
You should be able to add new functionality to a system without modifying existing, tested code. (This is achieved heavily through Polymorphism and Interfaces).

### Liskov Substitution Principle (LSP)
*Derived classes must be substitutable for their base classes.*
If `Bird` has a `fly()` method, and `Penguin` inherits from `Bird`, but you make `Penguin.fly()` throw a `NotSupportedException`, you have violated LSP. The program will crash when it tries to make a list of Birds fly.

### Interface Segregation Principle (ISP)
*Clients should not be forced to depend upon interfaces they do not use.*
Do not make "Fat Interfaces". If you have an `IWorker` interface with `work()` and `eat()`, and a `RobotWorker` implements it, the robot is forced to implement an `eat()` method it doesn't need. Split it into `IWorkable` and `IEatable`.

### Dependency Inversion Principle (DIP)
*Depend on abstractions, not concretions.*
High-level policy logic should not depend on low-level detail logic. Your business logic shouldn't instantiate a `MySQLDatabaseConnection`. It should rely on an interface `IDatabase`, and the framework should inject the MySQL implementation into the class (Dependency Injection).

---

*← [Error Handling](./04-error-handling-boundaries.md) · [Back to Series Overview](./README.md) →*

## Related

- [Refactoring Techniques](../refactoring/README.md)
- [Design Patterns](../design-patterns/README.md)
- [Software Architecture Patterns](../software-architecture/README.md)
