# Data Structures — Non-Linear Structures

**Tags:** #dsa #hash-tables #trees #graphs #heaps

---

## 1. Hash Tables — O(1) or a Lie?

A hash table maps keys to values using a hash function. Average-case get/set/delete is O(1). Worst-case (all keys hash to the same bucket) is O(n). In practice, with a good hash function and load factor < 0.75, O(1) holds.

**Collision strategies:** chaining (linked list per bucket) vs open addressing (linear/quadratic probing).

**Parable:** [The Apothecary's Cabinet](../parables/101-the-apothecarys-cabinet.md)

---

## 2. Trees & Tries — Navigating Hierarchy

**Binary Search Tree:** Each node has at most two children. Left subtree < node < right subtree. Search, insert, delete are O(log n) when balanced, O(n) when degenerate.

**Balanced BSTs (AVL, Red-Black):** Self-balancing. Guarantee O(log n) operations.

**Trie:** A tree where each path from root to leaf spells a string. Used for autocomplete, prefix search, IP routing. O(m) where m = key length.

**Parable:** [The Family Tree of Kings](../parables/102-the-family-tree-of-kings.md)

---

## 3. Graphs — The Universal Model

A graph is a set of vertices connected by edges. Directed or undirected. Weighted or unweighted. Cyclic or acyclic.

**Representations:** adjacency matrix (O(V²) space, O(1) edge lookup) vs adjacency list (O(V+E) space, O(degree) edge lookup).

**Traversals:** BFS (shortest path in unweighted graph) · DFS (topological sort, cycle detection, connected components).

**Parable:** [The Web of Friendship](../parables/103-the-web-of-friendship.md)

---

## 4. Heaps — The Priority Engine

A heap is a complete binary tree satisfying the heap property: every parent is ≥ (max-heap) or ≤ (min-heap) its children.

- Insert: O(log n) — bubble up
- Extract min/max: O(log n) — bubble down
- Peek min/max: O(1)

Used for: priority queues, Dijkstra's algorithm, heap sort, scheduling.

**Parable:** [The Emergency Room Triage](../parables/104-the-emergency-room-triage.md)
