# Data Structures — Linear Structures

**Tags:** #dsa #arrays #linked-lists #stacks #queues  

---

## 1. Arrays — Contiguous Power

An array stores elements in a contiguous block of memory. Random access is O(1) — the computer calculates the address of element N directly from the base address plus offset.

**When to use:** When you need fast random access and the size is known.  
**Trade-off:** Insertion and deletion in the middle is O(n) — everything shifts.

**Parable:** [The Cinema Seats](../parables/98-the-cinema-seats.md)

---

## 2. Linked Lists — Dynamic Flexibility

A linked list stores elements in nodes, each holding a value and a pointer to the next node. Insertion and deletion are O(1) at known positions — just repoint the pointers. Access by index is O(n) — you traverse from the head.

**When to use:** When you insert/delete frequently and don't need random access.  
**Trade-off:** No cache locality — pointer-chasing is slow on modern hardware.

**Parable:** [The Spy's Treasure Hunt](../parables/99-the-spys-treasure-hunt.md)

---

## 3. Stacks & Queues — Order With Constraints

**Stack (LIFO):** Last In, First Out. Push to top, pop from top. Used for: call stacks, undo history, DFS, expression parsing.

**Queue (FIFO):** First In, First Out. Enqueue at back, dequeue from front. Used for: BFS, job queues, event processing, rate limiting.

Both are O(1) for their primary operations.

**Parable:** [The Dish Stack and the Ticket Queue](../parables/100-the-dish-stack-and-the-ticket-queue.md)
