# Algorithms — Search, Sort, and Dynamic Programming

**Tags:** #dsa #algorithms #binary-search #sorting #dynamic-programming #two-pointers

---

## 1. Binary Search — The Logarithmic Scalpel

Binary search finds a target in a **sorted** array by repeatedly halving the search space. O(log n) — 1 billion elements requires at most 30 comparisons.

**Precondition:** the array must be sorted.  
**Pattern:** left + right pointers, mid = left + (right - left) / 2, compare target to mid, move pointer.

**Parable:** [The Dictionary of Secrets](../parables/105-the-dictionary-of-secrets.md)

---

## 2. Two Pointers & Sliding Window

**Two pointers:** Start one pointer at each end of a sorted array and move them toward each other. Used for: pair sum, palindrome check, container with most water. O(n).

**Sliding window:** Maintain a window of elements, expand right, shrink left when condition violated. Used for: longest substring without repeating chars, maximum sum subarray of size k. O(n).

Both avoid the O(n²) brute-force nested loop.

**Parable:** [The Photographer's Lens](../parables/106-the-photographers-lens.md)

---

## 3. Sorting — Stability, Why It Matters in Production

**Stable sort:** preserves relative order of equal elements. Critical when sorting records with multiple fields.

| Algorithm | Best | Average | Worst | Stable | Space |
|:----------|:-----|:--------|:------|:-------|:------|
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | Yes | O(n) |
| Quick Sort | O(n log n) | O(n log n) | O(n²) | No | O(log n) |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | No | O(1) |
| Timsort | O(n) | O(n log n) | O(n log n) | Yes | O(n) |

Most language standard libraries use Timsort (Python, Java) or Introsort (C++) in practice.

**Parable:** [The Graduating Class](../parables/107-the-graduating-class.md)

---

## 4. Dynamic Programming — The Memoization Masterclass

DP solves problems by breaking them into overlapping subproblems, solving each once, and storing the result.

**Two approaches:**
- **Top-down (memoization):** recursive + cache. Write the recursion, add a memo table.
- **Bottom-up (tabulation):** iterative. Build the table from base cases up.

**Identifying DP problems:** "find the optimal/count/maximum/minimum", overlapping subproblems, optimal substructure.

**Classic problems:** Fibonacci, coin change, longest common subsequence, 0/1 knapsack, edit distance.

**Parable:** [The Fibonacci Staircase](../parables/108-the-fibonacci-staircase.md)
