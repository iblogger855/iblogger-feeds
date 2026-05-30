# Design Patterns Cheat Sheet — Full GoF Reference

**Part of:** [Design Patterns Series](./README.md)  
**Tags:** #design-patterns #gof #reference  
**Read Time:** ~5 min

---

## 📌 Table of Contents
- [The Complete 23 Gang of Four Patterns](#the-complete-23-gang-of-four-patterns)
- [Decision Guide: Which Pattern Do I Need?](#decision-guide-which-pattern-do-i-need)
- [Patterns That Are Commonly Confused](#patterns-that-are-commonly-confused)
- [Pattern Combinations Used Together](#pattern-combinations-used-together)
- [Anti-Patterns: When NOT to Use Patterns](#anti-patterns-when-not-to-use-patterns)
- [References](#references)

---

## The Complete 23 Gang of Four Patterns

| Category | Pattern | Intent | When to Apply | Avoid When |
| :--- | :--- | :--- | :--- | :--- |
| 🟠 **Creational** | **Singleton** | One instance, globally accessible | Shared resource: pool, cache, config | Test isolation is needed |
| | **Builder** | Construct complex object step-by-step | Many optional constructor params | Object is simple, ≤3 params |
| | **Factory Method** | Subclass decides what to create | Type unknown at compile time | Type is always the same |
| | **Abstract Factory** | Create families of related objects | Multiple product variants must match | Only one product type |
| | **Prototype** | Clone existing object instead of new | Construction is expensive | Object is trivially cheap to create |
| 🔵 **Structural** | **Adapter** | Convert one interface to another | Integrating incompatible 3rd-party APIs | You can modify the source |
| | **Decorator** | Wrap object to add behavior dynamically | Optional, stackable features | Behavior is always present |
| | **Bridge** | Decouple abstraction from implementation | Two independent variation dimensions | Only one dimension varies |
| | **Composite** | Treat single and group objects uniformly | Tree structures (file systems, UI) | No hierarchical structure |
| | **Facade** | Simplified interface to complex subsystem | Subsystem has many classes/steps | Subsystem is already simple |
| | **Flyweight** | Share intrinsic state across many objects | Thousands of similar fine-grained objects | Objects are few |
| | **Proxy** | Control access to another object | Auth, caching, lazy loading, logging | Direct access is sufficient |
| 🟢 **Behavioral** | **Strategy** | Family of interchangeable algorithms | Algorithm choice depends on runtime context | Only one algorithm exists |
| | **Observer** | Notify many objects of a state change | Event-driven, pub/sub, reactive systems | Synchronous, direct call is fine |
| | **Command** | Encapsulate a request as an object | Undo/redo, queuing, macro recording | No need for deferred execution |
| | **State** | Behavior changes with internal state | Object has many states + complex transitions | 1-2 state checks |
| | **Template Method** | Algorithm skeleton, steps in subclasses | Same structure, different step logic | Steps don't vary across types |
| | **Iterator** | Sequential access without exposing internals | Custom collections or lazy sequences | Using built-in Java collections |
| | **Mediator** | Centralize many-to-many communication | Many objects tightly coupled | Only 2-3 objects interact |
| | **Memento** | Save/restore state without breaking encapsulation | Undo/redo, save states, rollback | State is trivial to reconstruct |
| | **Chain of Resp.** | Pass request along handler chain | Middleware, filters, escalation chains | Single handler is always responsible |
| | **Visitor** | Add operations without modifying classes | Frequent new operations on stable structure | Operations don't vary; structure changes often |
| | **Interpreter** | Evaluate sentences of a grammar | DSLs, expression parsers, rule engines | Grammar is complex — use ANTLR |

---

## Decision Guide: Which Pattern Do I Need?

```
I need to...
│
├── Control object CREATION
│   ├── Ensure only one exists? ........................... Singleton
│   ├── Build with many optional params? .................. Builder
│   ├── Create objects without knowing exact type? ......... Factory Method
│   ├── Create matching families of objects? ............... Abstract Factory
│   └── Copy an existing object cheaply? .................. Prototype
│
├── Compose objects into STRUCTURES
│   ├── Bridge incompatible interfaces? .................... Adapter
│   ├── Add behavior at runtime without subclassing? ........ Decorator
│   ├── Separate abstraction from implementation? .......... Bridge
│   ├── Treat trees and leaves uniformly? .................. Composite
│   ├── Simplify a complex subsystem? ...................... Facade
│   ├── Share state across many similar objects? ........... Flyweight
│   └── Control access (auth, cache, lazy)? ................ Proxy
│
└── Define COMMUNICATION between objects
    ├── Pass request through processing steps? .............. Chain of Responsibility
    ├── Traverse a collection without exposing structure? ... Iterator
    ├── Swap algorithms at runtime? ......................... Strategy
    ├── Centralize many-to-many communication? .............. Mediator
    ├── Snapshot and restore state? ......................... Memento
    ├── Notify many objects on change? ...................... Observer
    ├── Encapsulate a request for queuing/undo? ............. Command
    ├── Change behavior based on state? ..................... State
    ├── Define algorithm skeleton, vary steps? .............. Template Method
    ├── Add operations to objects without modifying? ........ Visitor
    └── Parse and evaluate a language/expression? ........... Interpreter
```

---

## Patterns That Are Commonly Confused

| Confused Pair | Key Distinction |
| :--- | :--- |
| **Strategy vs. State** | Strategy is chosen externally; State transitions internally |
| **Decorator vs. Proxy** | Decorator adds behavior; Proxy controls access to the same behavior |
| **Adapter vs. Facade** | Adapter wraps one class to change its interface; Facade wraps many classes to simplify them |
| **Factory Method vs. Abstract Factory** | Factory Method uses inheritance (one product); Abstract Factory uses composition (product families) |
| **Composite vs. Decorator** | Composite manages children; Decorator adds to a single object |
| **Command vs. Strategy** | Command represents an action (with undo); Strategy represents an algorithm |
| **Template Method vs. Strategy** | Template Method uses inheritance; Strategy uses composition |

---

## Pattern Combinations Used Together

| Combination | Common Use Case |
| :--- | :--- |
| **Factory + Singleton** | `getInstance()` is a factory method on a singleton |
| **Builder + Factory** | Factory picks which Builder to use based on type |
| **Composite + Visitor** | Visit every node in a tree (AST, document, file system) |
| **Command + Memento** | Undoable commands save state before executing |
| **Observer + Mediator** | Mediator uses observers internally to broadcast |
| **Decorator + Strategy** | Stacked decorators where each contains a strategy |
| **State + Command** | Commands trigger state transitions |
| **Proxy + Decorator** | Layered wrappers: proxy for access control, decorator for behavior |

---

## Anti-Patterns: When NOT to Use Patterns

| Smell | What You're Probably Doing Wrong |
| :--- | :--- |
| Singleton everywhere | Using it as a shortcut for global variables — use DI instead |
| Abstract Factory for one product | Overkill — just use a Factory Method |
| Strategy with one strategy | You just have a method call — don't wrap it |
| Mediator that knows too much | You've replaced tight coupling with a god object |
| Chain of Responsibility with one handler | Just call the method directly |
| Visitor when structure changes often | Every new element type breaks all visitors |

---

## References

- **Gamma, E., Helm, R., Johnson, R., Vlissides, J.** — *Design Patterns: Elements of Reusable Object-Oriented Software* (1994). "The GoF Book."
- **Refactoring.Guru** — Pattern catalog with multi-language examples
- **Martin Fowler** — *Patterns of Enterprise Application Architecture* (2002)
- **Joshua Bloch** — *Effective Java* (3rd ed.) — Builder, Singleton, Factory patterns in Java
- **Head First Design Patterns** — Freeman & Robson (2nd ed.) — Visual, beginner-friendly

---

**Navigation:** [← Behavioral Patterns](./03-behavioral-patterns.md) | [Back to Index →](./README.md)

*Last updated: 2026-05-16*

## Related

- [Software Architecture Patterns](../software-architecture/README.md)
- [Refactoring Techniques](../refactoring/README.md)
- [Uncle Bob's Clean Code Rules](../uncle-bob-rules/README.md)
