# 🛡️ Error Handling & Boundaries

> **Series:** Clean Code › Uncle Bob's Rules · **Level:** Intermediate · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. Use Exceptions Rather Than Return Codes](#1-use-exceptions-rather-than-return-codes)
- [2. Write Your Try-Catch-Finally Statement First](#2-write-your-try-catch-finally-statement-first)
- [3. Don't Return Null](#3-dont-return-null)
- [4. Clean Boundaries (Wrapping Third-Party APIs)](#4-clean-boundaries-wrapping-third-party-apis)

---

## 1. Use Exceptions Rather Than Return Codes

In older languages like C, developers had to return integer flags (like `-1` or `0`) to indicate if a function failed.

```c
// ❌ The ugly, nested "C" way
DeviceHandle handle = getHandle();
if (handle != DeviceHandle.INVALID) {
    if (handle.pause() != DeviceHandle.ERROR) {
        // ... nested hell
    }
}
```

This deeply clutters the caller code. The caller must check for errors immediately after the call. Unfortunately, it's easy to forget.
Instead, you should **throw Exceptions**. This separates the business logic (the happy path) from the error handling logic.

```java
// ✅ The Clean Way
try {
    pauseDevice();
    clearDeviceWorkQueue();
    closeDevice();
} catch (DeviceShutDownError e) {
    logger.log(e);
}
```

---

## 2. Write Your Try-Catch-Finally Statement First

When you are writing code that could throw exceptions, start by writing the `try-catch-finally` block. This helps you define what the user of that code should expect, no matter what goes wrong with the code executed in the `try`.

You should provide context with your exceptions. Create informative error messages and pass them along with your exceptions. Mention the operation that failed and the type of failure so the poor soul reading the logs at 3:00 AM can fix it quickly.

---

## 3. Don't Return Null

> *"I call it my billion-dollar mistake. It was the invention of the null reference in 1965."* — Tony Hoare

Returning `null` creates massive amounts of work for yourself and your team. If you return `null` from a function, the caller is forced to write an `if (object != null)` check. If they forget, the application crashes with a `NullPointerException`.

**The Fix (Special Case Pattern):**
Instead of returning `null`, return an empty object or throw an exception.
If a user is querying the database for a list of employees, and none are found, do not return `null`. Return `Collections.emptyList()`. Now the caller can confidently write `for (Employee e : list)` without worrying about crashing the server.

---

## 4. Clean Boundaries (Wrapping Third-Party APIs)

When you use a third-party library (like the AWS SDK or a payment gateway), do not let that library leak throughout your entire codebase.

If you pass a `com.stripe.Payment` object directly into your core business logic, you are permanently coupling your company's architecture to Stripe. If you later decide to switch to PayPal, you will have to rewrite your entire codebase.

**The Fix:**
Wrap the third-party API in your own interface.

```java
// Our clean interface
public interface PaymentGateway {
    boolean charge(Money amount);
}

// The dirty wrapper class that talks to the 3rd party
public class StripeAdapter implements PaymentGateway {
    public boolean charge(Money amount) {
        // ... messy Stripe API code here
        return true;
    }
}
```
Now, the rest of your application only knows about `PaymentGateway`. You have created a secure boundary protecting your clean code from the messy outside world.

---

*← [Comments & Formatting](./03-comments-and-formatting.md) · Next: [Classes & S.O.L.I.D.](./05-classes-and-solid.md) →*

## Related

- [Refactoring Techniques](../refactoring/README.md)
- [Design Patterns](../design-patterns/README.md)
- [Software Architecture Patterns](../software-architecture/README.md)
