# Writing Useful Code Comments

**Tags:** #english #technical #code-quality #writing  
**Read Time:** ~5 min

> The best comment is the one you didn't need to write because the code was already clear. The second best is one that explains something the code cannot say by itself.

---

## The Rule

**Comment the WHY. Never the WHAT.**

The code already says what it does. A comment that repeats it adds noise without adding knowledge.

```typescript
// Bad — restates the code
// Increment i by 1
i++;

// Bad — explains what is obvious
// Returns true if user is active
return user.status === 'active';

// Good — explains a non-obvious reason
// Multiply by 1000 to convert seconds to milliseconds —
// the payment gateway SDK expects Unix time in ms, not seconds.
const timestamp = Date.now() * 1000;
```

---

## When Comments ARE Needed

### 1. A non-obvious business rule
```typescript
// Minimum charge is $0.50 — Stripe rejects anything lower.
// See: https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts
if (amount < 50) {
  amount = 50;
}
```

### 2. A workaround for a bug or library quirk
```typescript
// React 18 StrictMode mounts components twice in development.
// This ref prevents the effect from running twice on initial mount.
const initialized = useRef(false);
```

### 3. A warning about a non-obvious side effect
```typescript
// This function mutates the input array. Do not pass a reference
// you intend to use again.
function sortInPlace(items: Item[]): void { ... }
```

### 4. Why you chose this approach over the obvious one
```typescript
// Using a Map instead of a plain object here because key insertion
// order is guaranteed in Map (spec), whereas plain object order
// depends on key type and engine implementation.
const lookup = new Map<string, User>();
```

### 5. TODO with context
```typescript
// TODO(dara): Remove this fallback once the migration to UUIDs is
// complete. Ticket: BK-2025-0891. Expected: Q3 2026.
const id = user.uuid ?? user.legacyId;
```

---

## Comment Grammar Rules

| Rule | Wrong | Right |
|:-----|:------|:------|
| Start with a capital letter | `// returns the user` | `// Returns the user` |
| End with a period (multi-sentence) | `// This is a workaround. it prevents X` | `// This is a workaround. It prevents X.` |
| Use complete sentences for block comments | `// bad input check` | `// Validates that the input is a non-empty string.` |
| No trailing whitespace after `//` | `//Returns user` | `// Returns user` |

---

## Phrases That Work in Comments

| Situation | Comment phrase |
|:----------|:--------------|
| Explaining a workaround | `// Workaround for [library/bug]: ...` |
| Non-obvious constraint | `// [System/API] requires X to be Y — see [link]` |
| Intentional empty block | `// Intentionally empty — X handles this case upstream` |
| Temporary code | `// TODO([name]): Remove after [condition]. Ticket: [ref]` |
| Magic number | `// 86400 = seconds in a day` |
| Counter-intuitive logic | `// This looks backwards — we negate because X expects Y` |

---

## JSDoc / Function Documentation

Use JSDoc only for **public APIs** — functions other developers will call without reading your implementation.

```typescript
/**
 * Calculates the platform fee for a given transaction amount.
 *
 * @param amount - Transaction amount in cents (USD)
 * @param tier - Provider pricing tier: 'standard' | 'premium'
 * @returns Fee amount in cents, rounded up to the nearest cent
 *
 * @example
 * calculateFee(10000, 'standard') // returns 150 (1.5%)
 */
function calculateFee(amount: number, tier: PricingTier): number { ... }
```

Do **not** write JSDoc for:
- Private helper functions
- Functions whose name and types are already self-documenting
- Everything — JSDoc on every function is noise

---

## Related

- [README Files](./04-readme-files.md) — comments at the project level
- [Technical Documentation](./05-technical-documentation.md) — comments at the architecture level
