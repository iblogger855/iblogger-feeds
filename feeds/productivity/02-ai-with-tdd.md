# Using AI with Test-Driven Development (TDD)

**Author:** ichamrong  
**Date:** 2026-05-18  
**Tags:** #tdd #ai-tools #testing #workflow #productivity #clean-code #junit #pytest #dor #dod #agile  
**Category:** Productivity  
**Read Time:** ~25 min  

---

## 📌 Table of Contents
- [Why TDD and AI Feel Like They Conflict](#why-tdd-and-ai-feel-like-they-conflict)
- [The Test Pyramid — What You Are Building Toward](#the-test-pyramid-what-you-are-building-toward)
- [The Core Mental Model: AI as a Pair Programmer](#the-core-mental-model-ai-as-a-pair-programmer)
- [Part 1 — The Full Procedure: DoR to DoD with AI-TDD](#part-1-the-full-procedure-dor-to-dod-with-ai-tdd)
  - [The Two Gates](#the-two-gates)
  - [Stage 1: Definition of Ready (DoR) — Before You Touch Code](#stage-1-definition-of-ready-dor-before-you-touch-code)
  - [Stage 2: Sprint Planning — Translate Story to Test Cases](#stage-2-sprint-planning-translate-story-to-test-cases)
  - [Stage 3: Red — Write Failing Tests](#stage-3-red-write-failing-tests)
  - [Stage 4: Green — AI Writes the Implementation](#stage-4-green-ai-writes-the-implementation)
  - [Stage 5: Refactor — AI Cleans Up, You Review](#stage-5-refactor-ai-cleans-up-you-review)
  - [Stage 6: Definition of Done (DoD) — Exit Gate](#stage-6-definition-of-done-dod-exit-gate)
  - [Full DoR-to-DoD Pipeline Diagram](#full-dor-to-dod-pipeline-diagram)
- [Part 2 — The Red-Green-Refactor Loop with AI (Deep Dive)](#part-2-the-red-green-refactor-loop-with-ai-deep-dive)
  - [Red: Write the Failing Test (You Own This)](#red-write-the-failing-test-you-own-this)
  - [Green: Let AI Write the Implementation](#green-let-ai-write-the-implementation)
  - [Refactor: AI Cleans Up, You Review](#refactor-ai-cleans-up-you-review)
- [Part 3 — Prompt Patterns That Work](#part-3-prompt-patterns-that-work)
  - [The Test-First Prompt](#the-test-first-prompt)
  - [The Edge Case Discovery Prompt](#the-edge-case-discovery-prompt)
  - [The Refactor Prompt](#the-refactor-prompt)
  - [The "Why Does This Test Fail?" Prompt](#the-why-does-this-test-fail-prompt)
- [Part 4 — Language-Specific Workflows](#part-4-language-specific-workflows)
  - [Java + JUnit 5](#java-junit-5)
  - [Python + pytest](#python-pytest)
  - [JavaScript + Jest](#javascript-jest)
- [Part 5 — Where AI Helps Most (and Least)](#part-5-where-ai-helps-most-and-least)
- [Part 6 — The Complete AI-TDD Cheat Sheet](#part-6-the-complete-ai-tdd-cheat-sheet)
- [Common Pitfalls](#common-pitfalls)
- [📚 Cross-References & Related Reading](#cross-references-related-reading)

---

## Why TDD and AI Feel Like They Conflict

Most engineers use AI by describing what they want and letting it generate code. TDD says the opposite: *write the test first, then write the code that makes it pass*. At first glance, AI seems to skip the discipline entirely — it just produces a working function and you're done.

That shortcut is the trap.

AI-generated code without tests is untested code. It may look correct. It often is correct — for the happy path you described. But it hasn't been forced to handle the constraint you haven't thought of yet. The test is the constraint. Without it, you're just doing **vibes-driven development**.

The insight is this: **AI doesn't replace TDD — it accelerates each phase of it.**

- You still write the test. AI helps you think of what to test.
- AI writes the implementation. You verify it passes your test.
- AI refactors the result. You verify nothing breaks.

The discipline stays yours. The grunt work moves to AI.

---

## The Test Pyramid — What You Are Building Toward

Before writing a single test, you need to know *what kind* of test to write. TDD does not mean "write only unit tests." It means writing the right test at the right layer — and knowing which layer gives you the most value for a given piece of code.

```
                        ▲
                       /E\
                      / 2 \
                     / E   \
                    /  End  \          Slow · expensive · few
                   /─────────\         Tests real user journeys
                  /Integration\        Verifies services talk correctly
                 /─────────────\       Moderate speed · moderate cost
                /               \
               /   Unit Tests    \     Fast · cheap · many
              /───────────────────\    Tests one function in isolation
             /─────────────────────\

    UNIT (base — widest)   →  70%  of your test suite
    INTEGRATION (middle)   →  20%  of your test suite
    E2E / End-to-End (top) →  10%  of your test suite
```

### The Three Layers

**Unit Tests — the foundation (70%)**

Test a single function, method, or class in complete isolation. All dependencies are replaced with mocks or stubs. No database, no network, no filesystem.

```
What they test:   Pure business logic — one function at a time
Speed:            Milliseconds — run thousands in seconds
When they fail:   The logic inside that function is wrong
What they miss:   Whether components work together

Example:
  validateEmail("user@example.com")  → true
  validateEmail("notanemail")         → false
  validateEmail(null)                 → false
  ← No database, no HTTP — just the function
```

**Integration Tests — the middle layer (20%)**

Test how two or more components work together. Typically: a controller + service + real database (via Testcontainers), or a service + a real message queue. No mocks for the components under test — mocks only for external systems outside your control (third-party APIs, payment gateways).

```
What they test:   "Does my service actually talk to the DB correctly?"
                  "Does my API endpoint return the right JSON shape?"
Speed:            Seconds — slower due to real DB / real network
When they fail:   A boundary between components is broken
What they miss:   Full user journeys, browser behavior, real infrastructure

Example:
  POST /auth/login with valid credentials
  → controller calls AuthService
  → AuthService queries real PostgreSQL (Testcontainers)
  → returns HTTP 200 with JWT
  ← tests the whole vertical slice, not just the function
```

**E2E Tests — the top (10%)**

Test the full system from the user's perspective — through a real browser or real API client, against a deployed staging environment. Covers complete user journeys: "log in → enroll MFA → log out → log back in with TOTP."

```
What they test:   Complete user workflows on a real deployed environment
Speed:            Minutes — slowest, most expensive to run and maintain
When they fail:   A real user cannot complete a real task
What they miss:   Nothing — but they break for many unrelated reasons (flaky)

Example:
  Playwright test:
    1. Open browser → navigate to /login
    2. Enter credentials → click Continue
    3. Enter TOTP code → click Verify
    4. Assert: dashboard page loaded
    5. Assert: user name shown in header
  ← real browser, real staging, real TOTP
```

---

### Why the Ratio Matters

```
COMMON MISTAKE: Inverted pyramid
         ▲
        /E\
       / 2 \
      / E   \          ← too many E2E tests
     /  End  \
    /─────────\
   /   few     \       ← almost no integration tests
  /  Integration\
 /───────────────\
/   no unit tests \    ← foundation missing

Result: test suite takes 45 minutes to run
        breaks for unrelated reasons (flaky selectors, slow CI)
        nobody runs it locally — CI is the only feedback
        when it breaks, nobody knows which layer failed

CORRECT: pyramid shape
  few slow E2E (10%)   → prove the journey works
  some integration (20%) → prove components connect
  many fast units (70%) → prove each function is correct

Result: unit tests run in < 30 seconds locally
        integration tests in < 2 minutes
        E2E in < 10 minutes on CI
        when something breaks, the failing layer tells you exactly where
```

---

### Where AI Helps at Each Layer

| Layer | AI writes | You write | AI prompt pattern |
|:------|:----------|:----------|:-----------------|
| **Unit** | Implementation from your tests | Every unit test | `"Write minimal impl that passes these unit tests"` |
| **Integration** | Boilerplate setup (Testcontainers config, MockMvc wiring) | Integration test scenarios and assertions | `"Write the Testcontainers setup for a Spring Boot + PostgreSQL integration test"` |
| **E2E** | Page object boilerplate, selectors | User journey scripts and assertions | `"Generate Playwright page objects for this login flow: [paste HTML]"` |

**The rule across all layers:** AI writes the code under test. You write the test that defines what "correct" means. If AI writes both, you have no independent contract.

---

### Applying the Pyramid in TDD

When you translate an AC into test names (RED phase), decide the layer first:

```
AC: "User can log in with valid email and password"

Unit test (pure logic — no DB):
  → shouldReturnTrueForValidPasswordHash()
  → shouldReturnFalseForWrongPassword()
  → shouldReturnFalseForNullInput()

Integration test (controller + service + real DB):
  → POST /auth/login with valid credentials returns 200 + JWT
  → POST /auth/login with wrong password returns 401

E2E test (full browser — only if this is a core user journey):
  → user can log in and reach dashboard (Playwright)
  ← one E2E covers the journey; unit + integration cover the logic
```

Write units first in TDD. Add one integration test per API endpoint. Add E2E only for journeys a user would call the core use case of the feature.

---



Think of AI as a junior pair programmer who is extremely fast at writing boilerplate but needs you to drive. In classical pair programming:

- **Driver** writes the code.
- **Navigator** thinks about what to write next and catches mistakes.

With AI-TDD:

- **You are the navigator.** You define the contract (the test), review the output, and decide when it's done.
- **AI is the driver.** It produces the implementation and suggests refactors.

```
You (Navigator)          AI (Driver)
─────────────────        ─────────────────────────────────
Write failing test  ──►  [can help suggest edge cases]
                   ◄──   Writes implementation
Review + run tests  ──►  [fix if failing]
                   ◄──   Refactors passing code
Code review         ──►  Done
```

The moment you let AI write the test *and* the implementation, you've lost the navigator seat. The code may work — but you don't own it.

---

## Part 1 — The Full Procedure: DoR to DoD with AI-TDD

Most TDD guides start at "write a failing test." But in a real sprint, you don't start there. You start with a story in the backlog. AI-TDD fits inside the full Agile lifecycle — and knowing *exactly where* each tool applies prevents wasted work and late-stage surprises.

### The Two Gates

Every story in a sprint passes through two quality gates:

```
BACKLOG ──► [ DoR Gate ] ──► SPRINT ──► [ DoD Gate ] ──► DONE
               │                              │
          "Ready to start"             "Ready to ship"
          (before coding)              (after coding)
```

- **Definition of Ready (DoR):** The story is clear enough to start. Acceptance criteria exist, design is agreed, dependencies are unblocked.
- **Definition of Done (DoD):** The story is complete. Code is written, tests pass, reviewed, deployed to staging, acceptance criteria verified.

AI-TDD lives entirely *inside* the sprint — between these two gates. But what happens before DoR directly determines how useful AI will be when you reach the coding stage.

---

### Stage 1: Definition of Ready (DoR) — Before You Touch Code

A story that fails DoR should not enter the sprint. AI cannot save a poorly-defined story — it will generate code for the wrong contract.

**DoR checklist for AI-TDD:**

| # | Condition | Why It Matters for AI-TDD |
|:--|:----------|:--------------------------|
| 1 | Acceptance criteria are written in clear, testable language | These become your test names directly |
| 2 | Input/output contracts are defined (what goes in, what comes out) | AI needs this to generate valid implementation |
| 3 | Edge cases are discussed at story level | Catches domain-specific constraints AI won't know |
| 4 | Dependencies (APIs, services, DB schema) are confirmed ready | Tests cannot be written against a moving contract |
| 5 | Story is small enough to complete in one sprint | Large stories produce untestable units |

**AI's role at this stage:** Ask AI to help rewrite vague acceptance criteria into testable statements.

```
Prompt: "Here is a user story acceptance criterion:
'The system should handle errors gracefully.'

Rewrite this as 3–5 specific, testable acceptance criteria
that a developer could directly translate into unit tests."
```

AI output (example):
```
1. When the API returns a 500 error, the system logs the error
   and returns a user-friendly message without exposing stack traces.
2. When the API returns a 404, the system returns null (not throws).
3. When the network times out after 10s, the system retries once
   then returns a TimeoutException to the caller.
```

These are now directly writable as test cases. The story is ready.

---

### Stage 2: Sprint Planning — Translate Story to Test Cases

The sprint starts. Before writing a single line of code, translate each acceptance criterion into a test case name. This is the bridge between product requirements and engineering contracts.

**Template:**
```
AC: "User can log in with valid credentials"
→  shouldReturnJwtTokenForValidCredentials()
→  shouldRejectLoginWithWrongPassword()
→  shouldLockAccountAfterFiveFailedAttempts()
→  shouldRejectExpiredCredentials()
```

**AI's role at this stage:** Given the acceptance criteria, ask AI to propose test method names only (not code).

```
Prompt: "Here are the acceptance criteria for a login feature:
[paste ACs]

Propose test method names for these criteria.
Use the format: should[Behavior]When[Condition]()
Group as: happy path / error cases / edge cases.
Names only — no code."
```

You review, adjust for your domain knowledge, and finalize the test list. This becomes your sprint task breakdown — one test = one unit of verifiable work.

---

### Stage 3: Red — Write Failing Tests

You now have a list of test method names. Write the test bodies. This is still your work — you own the contract.

```java
// Story: User Login
// AC: "System locks account after 5 failed attempts"

@Test
void shouldLockAccountAfterFiveFailedAttempts() {
    AuthService auth = new AuthService(userRepository, lockPolicy);

    for (int i = 0; i < 5; i++) {
        auth.login("user@example.com", "wrongpassword");
    }

    assertThrows(AccountLockedException.class,
        () -> auth.login("user@example.com", "correctpassword"));
}
```

Run all tests. They fail. **Red.** Confirm each one fails for the *right reason* — a missing class or method, not a logic error you accidentally wrote into the test.

**AI's role at this stage:** Edge case discovery only.

```
Prompt: "Here are my login tests so far: [paste tests]
What edge cases am I missing based on these acceptance criteria: [paste ACs]
List only — no code."
```

---

### Stage 4: Green — AI Writes the Implementation

You have a full failing test suite that precisely describes what the feature must do. Now hand it to AI.

```
Prompt: "Here are my failing JUnit 5 tests for AuthService:
[paste full test file]

Write the minimal implementation that makes all these tests pass.
Do not add any behavior not required by the tests.
The implementation should:
- Use Java 17
- Throw IllegalArgumentException for null inputs
- Not use any frameworks — plain Java only"
```

Run the tests after AI returns code. Two outcomes:

- **All pass → Green.** Move to Stage 5.
- **Some fail → paste failure output back to AI:** `"These tests still fail: [paste]. Fix only what is needed."`

Never accept AI's first attempt without running the tests. AI is confident but not always correct.

---

### Stage 5: Refactor — AI Cleans Up, You Review

Green does not mean done. The minimal implementation AI produced may be correct but verbose, or correct but not idiomatic for your codebase. Refactor now — while the tests protect you.

```
Prompt: "Here is my passing implementation:
[paste code]

Here are the tests it must continue to pass:
[paste tests]

Refactor for: [pick one or more]
- Readability: extract methods, rename variables
- Performance: reduce unnecessary allocations
- Idiom: use Java 17 features (records, switch expressions, text blocks)

Do not change behavior. All tests must still pass."
```

After refactoring: **run the tests again.** This is non-negotiable.

---

### Stage 6: Definition of Done (DoD) — Exit Gate

Code is green and refactored. Now the story must pass DoD before it is marked Done.

**DoD checklist for AI-TDD:**

| # | Condition | AI-TDD Connection |
|:--|:----------|:------------------|
| 1 | All unit tests pass | Tests are green from Stage 4–5 |
| 2 | Test coverage meets team threshold (e.g. ≥ 80%) | Ask AI: "What branches are untested?" |
| 3 | Code reviewed by at least one peer | Reviewer checks tests match ACs, not just that code looks right |
| 4 | Integration/E2E tests pass (if applicable) | Unit tests alone are not enough for APIs and DB interactions |
| 5 | No new Sonar / lint violations | Ask AI: "Any code smells or anti-patterns here?" |
| 6 | Acceptance criteria manually verified (demo or staging) | Tests verify contracts, not UX — humans verify the experience |
| 7 | Documentation updated (if public API) | Use the [Fast Documentation Workflow](./01-fast-documentation-workflow.md) |

**AI's role at DoD:**

```
Prompt: "Here is my implementation and test suite:
[paste both]

1. What lines of code have no test coverage?
2. What edge cases might still fail in production?
3. Are there any obvious code smells?"
```

Use the answer to close gaps before the PR is merged — not after.

---

### Full DoR-to-DoD Pipeline Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│              COMPLETE AI-TDD PROCEDURE: DoR → DoD                          │
└─────────────────────────────────────────────────────────────────────────────┘

  BACKLOG REFINEMENT
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Stage 1: DoR Gate                                                   │
  │  □ ACs written in testable language (AI can help rewrite vague ACs) │
  │  □ Input/output contracts defined                                    │
  │  □ Dependencies confirmed ready                                      │
  │  □ Story is sprint-sized                                             │
  └──────────────────────────────┬───────────────────────────────────────┘
                                  │  story is ready ✓
                                  ▼
  SPRINT PLANNING
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Stage 2: AC → Test Names                                            │
  │  You: AC → should[Behavior]When[Condition]() names                  │
  │  AI:  suggest test name list from ACs                                │
  └──────────────────────────────┬───────────────────────────────────────┘
                                  │  test names agreed ✓
                                  ▼
  DEVELOPMENT
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Stage 3: RED                                                        │
  │  You:  write test bodies from names                                  │
  │  AI:   suggest missing edge cases                                    │
  │  Run:  confirm all tests FAIL ✗                                      │
  └──────────────────────────────┬───────────────────────────────────────┘
                                  │ all tests red ✗
                                  ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Stage 4: GREEN                                                      │
  │  AI:   write minimal implementation from test suite                 │
  │  Run:  tests pass ✓ / fail ✗ → paste failures back to AI, repeat   │
  └──────────────────────────────┬───────────────────────────────────────┘
                                  │ all tests green ✓
                                  ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Stage 5: REFACTOR                                                   │
  │  AI:   refactor for clarity/idiom/performance                       │
  │  Run:  tests still pass ✓ / fail ✗ → regression, fix and re-run    │
  └──────────────────────────────┬───────────────────────────────────────┘
                                  │ green after refactor ✓
                                  ▼
  REVIEW & DELIVERY
  ┌──────────────────────────────────────────────────────────────────────┐
  │  Stage 6: DoD Gate                                                   │
  │  □ All unit tests pass                                               │
  │  □ Coverage threshold met (AI: "what's untested?")                  │
  │  □ Peer code review complete                                         │
  │  □ Integration tests pass                                            │
  │  □ No new lint/Sonar violations (AI: "any code smells?")            │
  │  □ ACs manually verified on staging                                  │
  │  □ Docs updated if needed                                            │
  └──────────────────────────────┬───────────────────────────────────────┘
                                  │  all DoD items checked ✓
                                  ▼
                              STORY DONE ✓
```

---

## Part 2 — The Red-Green-Refactor Loop with AI (Deep Dive)

### Red: Write the Failing Test (You Own This)

This phase is yours. The test defines the contract — what the function must do, what it must reject, and what it must return. AI can help you discover *which tests to write*, but you write them.

**Good use of AI in Red phase:**

```
Prompt: "I'm writing a function validateEmail(email: String): Boolean.
What edge cases should I test for? Give me a list only — no code."
```

AI response (example):
```
- Empty string
- Null input
- Missing @ symbol
- Multiple @ symbols
- Domain without TLD (user@domain)
- Leading/trailing whitespace
- Valid email with subdomain (user@mail.example.com)
- Internationalized domain (user@münchen.de)
- Very long email (> 254 characters per RFC 5321)
```

You pick which cases matter for your domain, then write the tests yourself:

```java
// You write this — AI does not
@Test
void shouldRejectEmailWithoutAtSymbol() {
    assertFalse(EmailValidator.validate("userdomain.com"));
}

@Test
void shouldRejectNullInput() {
    assertFalse(EmailValidator.validate(null));
}

@Test
void shouldAcceptValidSubdomainEmail() {
    assertTrue(EmailValidator.validate("user@mail.example.com"));
}
```

Run the tests. They fail. Red. Good.

---

### Green: Let AI Write the Implementation

Now you have a failing test suite and a clear contract. Hand both to AI:

```
Prompt: "Here are my failing JUnit 5 tests for EmailValidator.validate():

[paste your test file]

Write the minimal implementation that makes all these tests pass.
Use Java. Do not add any logic not required by the tests."
```

Key phrase: **minimal implementation that makes the tests pass.** This keeps AI from over-engineering. Without that constraint, AI will add features you don't have tests for — which is untested code hiding inside your "TDD" project.

Run the tests. If they pass: Green. If they don't: paste the failure output back to AI.

```
Prompt: "These tests are still failing:
[paste failure output]

Here is the current implementation:
[paste code]

Fix only what is needed to make the failing tests pass."
```

---

### Refactor: AI Cleans Up, You Review

Green doesn't mean done. The implementation AI produced might be readable but repetitive, or correct but not idiomatic for your codebase. Now you refactor.

```
Prompt: "Here is my implementation that passes all tests:

[paste code]

Refactor it for clarity and idiom. Do not change behavior.
The tests must still pass after your changes."
```

After AI returns the refactored code: **run your tests again.** If anything breaks, the refactor introduced a regression. Paste the failure back and iterate.

This is the safety net TDD gives you. The tests make refactoring safe — even when the refactoring is done by AI.

---

## Part 3 — Prompt Patterns That Work

### The Test-First Prompt

Use before writing any implementation. Forces AI to think about contracts, not code.

```
I need to implement [function name] with this behavior:
- Input: [describe input]
- Output: [describe output]
- Constraints: [list rules]

Before writing any code, list the test cases I should cover.
Group them as: happy path / edge cases / error cases.
```

---

### The Edge Case Discovery Prompt

Use when you think you've covered all cases but want a second opinion.

```
Here are my existing tests for [function name]:

[paste test file]

What important cases am I missing? Focus on:
- Boundary values
- Invalid inputs
- Concurrency issues (if applicable)
- Performance edge cases (if applicable)

List only. No code.
```

---

### The Refactor Prompt

Use after Green. Keeps AI from changing behavior.

```
Here is code that passes all my tests:

[paste implementation]

Here are the tests:

[paste test file]

Refactor for [readability / performance / idiom].
The tests must still pass. Do not add new behavior.
```

---

### The "Why Does This Test Fail?" Prompt

Use when you're stuck on a red test and don't understand why.

```
This test is failing:

[paste test]

Here is the implementation:

[paste implementation]

Here is the failure output:

[paste stack trace / assertion error]

Explain why it's failing. Do not fix it yet — just explain.
```

Getting the explanation before the fix builds your understanding. An AI that jumps straight to a fix teaches you nothing.

---

## Part 4 — Language-Specific Workflows

### Java + JUnit 5

```java
// 1. You write the test
@Test
void shouldCalculateCompoundInterest() {
    double result = FinanceCalc.compoundInterest(1000, 0.05, 12);
    assertEquals(1795.86, result, 0.01);
}

// 2. Prompt AI:
// "Write the minimal Java implementation for FinanceCalc.compoundInterest(
//  principal, rate, periods) that passes this JUnit 5 test."

// 3. AI produces:
public class FinanceCalc {
    public static double compoundInterest(double principal, double rate, int periods) {
        return principal * Math.pow(1 + rate, periods);
    }
}

// 4. Run test → Green → Refactor if needed
```

**Useful AI prompt addition for Java:** `"Use Java 17+. Prefer records over POJOs where applicable. Throw IllegalArgumentException for invalid inputs, not checked exceptions."`

---

### Python + pytest

```python
# 1. You write the test
def test_slugify_converts_spaces_to_hyphens():
    assert slugify("Hello World") == "hello-world"

def test_slugify_removes_special_characters():
    assert slugify("Hello, World!") == "hello-world"

def test_slugify_handles_empty_string():
    assert slugify("") == ""

# 2. Prompt AI:
# "Write the minimal Python implementation for slugify(text: str) -> str
# that passes these pytest tests."

# 3. AI produces, you run: pytest test_slugify.py
```

**Useful AI prompt addition for Python:** `"Use only the standard library. Type-annotate all parameters and return values. Follow PEP 8."`

---

### JavaScript + Jest

```javascript
// 1. You write the test
test('truncates long strings with ellipsis', () => {
  expect(truncate('Hello World', 5)).toBe('Hello...');
});

test('returns original string if shorter than limit', () => {
  expect(truncate('Hi', 10)).toBe('Hi');
});

test('handles empty string', () => {
  expect(truncate('', 5)).toBe('');
});

// 2. Prompt AI:
// "Write the minimal JavaScript implementation for truncate(str, limit)
// that passes these Jest tests."
```

**Useful AI prompt addition for JS:** `"Use ES2022+. No external dependencies. Export as a named export."`

---

## Part 5 — Where AI Helps Most (and Least)

```
┌─────────────────────────────────┬──────────────┬─────────────────────────────┐
│ Task                            │ AI Value     │ Notes                       │
├─────────────────────────────────┼──────────────┼─────────────────────────────┤
│ Discovering edge cases          │ ★★★★★       │ AI's best contribution      │
│ Writing implementation (Green)  │ ★★★★★       │ Fast, accurate for clear    │
│                                 │              │ contracts                   │
│ Refactoring passing code        │ ★★★★☆       │ Always re-run tests after   │
│ Explaining test failures        │ ★★★★☆       │ Ask "explain" before "fix"  │
│ Writing the tests themselves    │ ★★☆☆☆       │ You should own this phase   │
│ Designing the contract          │ ★☆☆☆☆       │ This is your architecture   │
│ Deciding when tests are         │ ★☆☆☆☆       │ Only you know your domain   │
│ "enough"                        │              │ requirements                │
└─────────────────────────────────┴──────────────┴─────────────────────────────┘
```

The bottom two rows are where teams get burned. AI cannot decide what your software must guarantee — that's a product and domain decision. The test is the specification. Delegating the specification to AI means you don't have one.

---

## Part 6 — The Complete AI-TDD Cheat Sheet

### Red-Green-Refactor Quick Reference

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        AI-TDD LOOP (inside the sprint)                  │
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  RED PHASE (You drive)                                          │   │
│  │                                                                 │   │
│  │  1. Ask AI: "What edge cases should I test for [X]?"           │   │
│  │  2. You select relevant cases for your domain                   │   │
│  │  3. You write the failing tests                                 │   │
│  │  4. Run → Confirm they fail (don't skip this!)                 │   │
│  └─────────────────────┬───────────────────────────────────────────┘   │
│                         │ tests fail ✗                                  │
│                         ▼                                               │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  GREEN PHASE (AI drives)                                        │   │
│  │                                                                 │   │
│  │  5. Paste tests to AI: "Write minimal impl that passes these"  │   │
│  │  6. Run tests                                                   │   │
│  │  7a. All pass → move to Refactor                                │   │
│  │  7b. Some fail → paste failure to AI, iterate                  │   │
│  └─────────────────────┬───────────────────────────────────────────┘   │
│                         │ all tests pass ✓                              │
│                         ▼                                               │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  REFACTOR PHASE (AI drives, you verify)                        │   │
│  │                                                                 │   │
│  │  8. Paste impl to AI: "Refactor for clarity, no behavior       │   │
│  │     change, tests must still pass"                             │   │
│  │  9. Run tests again                                             │   │
│  │  10. If anything fails → regression, paste failure to AI       │   │
│  │  11. If all pass → done ✓                                      │   │
│  └─────────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────┘
```

---

### Cheat Sheet: AI Prompt by TDD Phase

| Phase | What to Ask AI | What NOT to Ask AI |
|:------|:--------------|:-------------------|
| **Red** | "What edge cases should I test for X?" | "Write the tests for X" |
| **Red** | "Is this test name clear and idiomatic?" | "Is this test complete enough?" |
| **Green** | "Write minimal impl that passes these tests" | "Write a good implementation of X" |
| **Green** | "This test still fails — explain why" | "Fix all my failing tests" |
| **Refactor** | "Refactor this passing code for clarity" | "Improve my code" (too vague) |
| **Refactor** | "What code smells do you see here?" | "Rewrite this from scratch" |

---

## Common Pitfalls

**Pitfall 1: Asking AI to write tests and implementation together**

```
❌ "Write a function to validate emails with full test coverage."
✓  "What test cases should I cover for email validation?" (Red)
   then: "Write impl that passes these tests:" (Green)
```

When AI writes both, you get tests that are designed to pass the implementation — not tests that specify the contract independently. They'll always be green and tell you nothing.

---

**Pitfall 2: Skipping the "confirm it fails" step**

A test that was never red might not be testing anything. AI-generated implementations sometimes accidentally satisfy a test that was supposed to be a failing constraint. Always run tests before pasting to AI for the Green phase.

---

**Pitfall 3: Accepting AI refactors without re-running tests**

AI refactors are usually correct. "Usually" is not "always." One line change in a refactor can flip edge case behavior. The test suite costs nothing to re-run. Always run it.

---

**Pitfall 4: Using AI to decide "are these tests enough?"**

AI will often say yes. It doesn't know your SLA, your user base, or what a production failure costs your team. Coverage decisions belong to you.

---

**Pitfall 5: Prompting without context**

```
❌ "Write a test for the payment function"
✓  "Here is the PaymentService interface: [paste]
    Here are the business rules: [paste]
    Write test cases (names + descriptions only) for processPayment()"
```

AI produces better output when it has the full contract to work from.

---

## 📚 Cross-References & Related Reading

- **Process:** [Definition of Ready vs Definition of Done](../management/02-dor-and-dod-guide.md) — the two gates this procedure is built around; understand DoR/DoD deeply before applying AI-TDD
- **Code Review:** [Code Review & PR Flow](../procedures/software-delivery/04-code-review-and-pr.md) — how reviewers use the test pyramid to check whether the right layer of test was written
- **Workflow:** [Fast Documentation Workflow for Engineers](./01-fast-documentation-workflow.md) — apply the same AI-first workflow to writing docs alongside your tests
- **Design Patterns:** [Creational Patterns](../clean-code/design-patterns/01-creational-patterns.md) — TDD is most valuable when testing patterns like Builder and Factory Method
- **Clean Code:** [Uncle Bob's Rules](../clean-code/uncle-bob-rules/README.md) — TDD is one of the three core practices of Clean Code

---

*Last updated: 2026-05-18*
