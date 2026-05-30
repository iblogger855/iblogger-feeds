# Token Lifecycles & Rotation

**Author:** ichamrong  
**Category:** Authentication Architecture  
**Read Time:** ~10 min  

---

## 📌 Table of Contents
- [1. The Access Token & Refresh Token Paradigm](#1-the-access-token-refresh-token-paradigm)
- [2. Refresh Token Rotation (RTR)](#2-refresh-token-rotation-rtr)
  - [The Threat Detection Mechanism](#the-threat-detection-mechanism)
- [3. Sliding Windows vs. Absolute Expiry](#3-sliding-windows-vs-absolute-expiry)
- [📚 References & Tools](#references-tools)

---

## Table of Contents
- [1. The Access Token & Refresh Token Paradigm](#1-the-access-token-refresh-token-paradigm)
- [2. Refresh Token Rotation (RTR)](#2-refresh-token-rotation-rtr)
  - [The Threat Detection Mechanism](#the-threat-detection-mechanism)
- [3. Sliding Windows vs. Absolute Expiry](#3-sliding-windows-vs-absolute-expiry)
---

A token that lasts forever is a password that cannot be changed. Establishing rigorous token lifecycles and rotation strategies is the only way to mitigate the risk of token theft.

## 1. The Access Token & Refresh Token Paradigm

> **💡 The Core Concept:** Access Tokens expire quickly to limit damage if stolen. Refresh Tokens live longer but are securely checked against the database to negotiate new Access Tokens.

**The "ELI5" Analogy (The Hotel Room Key vs. The Front Desk):**
When you stay at a hotel, you don't get a key that works forever. 
- **The Access Token is your plastic room key.** It gets you through the door quickly, but it expires every single day at noon. If you lose it in the hallway, a thief can only use it for a few hours. 
- **The Refresh Token is you going back to the Front Desk.** When your plastic key stops working, you must walk to the front desk, prove you are still a guest (by showing your ID), and they hand you a *new* plastic room key for another 24 hours. The thief cannot do this because they don't have your ID.

**The MIT Professor Explanation (First Principles):**
When dealing with stateless Access Tokens (JWTs) that cannot be easily revoked via database lookup, the primary architectural defense is **Time**. 
- **Access Token:** A highly privileged, short-lived bearer token (5 to 15 minutes). It minimizes the window of exploitation if exfiltrated.
- **Refresh Token:** A highly restricted, long-lived credential (7 to 30 days) used *exclusively* to negotiate a new Access Token against the Authorization Server. Because it is evaluated centrally by the Auth Server rather than distributed Resource Servers, it inherently possesses state and can be instantaneously revoked.

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'actorBkg': '#1b5e20', 'actorBorder': '#003300', 'actorTextColor': '#ffffff', 'signalColor': '#4caf50', 'signalTextColor': '#ffffff', 'noteBkgColor': '#004d40', 'noteBorderColor': '#003300', 'noteTextColor': '#ffffff', 'activationBkgColor': '#2e7d32', 'activationBorderColor': '#003300', 'labelBoxBkgColor': '#003300', 'labelTextColor': '#ffffff', 'loopTextColor': '#ffffff',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
sequenceDiagram
    participant Client
    participant API as Resource Server
    participant Auth as Auth Server (DB)

    Client->>Auth: Initial Login
    Auth-->>Client: Returns [Access Token (15m)] + [Refresh Token (7d)]

    loop Every 15 minutes
        Client->>API: Request with Access Token
        API-->>Client: 401 Unauthorized (Token Expired)
        
        Client->>Auth: Send [Refresh Token] to /token endpoint
        Auth->>Auth: Validate Refresh Token in DB
        Auth-->>Client: Returns NEW [Access Token (15m)]
    end
```

## 2. Refresh Token Rotation (RTR)

While Refresh Tokens are harder to steal, they are not immune. If an attacker steals a 30-day Refresh Token, they can generate Access Tokens for a month.

**Refresh Token Rotation** solves this by treating the Refresh Token as single-use. 
1. The user uses `Refresh Token A` to get a new Access Token.
2. The server invalidates `Refresh Token A` and returns a new Access Token AND a brand new `Refresh Token B`.

### The Threat Detection Mechanism
Because RTR forces single-use, it inherently detects theft:
1. Attacker steals `Refresh Token A`.
2. Legitimate user is offline.
3. Attacker uses `Refresh Token A`. The server accepts it, gives the attacker `Refresh Token B`, and invalidates `A`.
4. Legitimate user comes online and tries to use their stored `Refresh Token A`.
5. The server sees an attempt to use an **already-used** Refresh Token.
6. The server realizes a theft has occurred and instantly revokes the entire family of tokens (including `B`). Both the attacker and the user are logged out.

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'actorBkg': '#1b5e20', 'actorBorder': '#003300', 'actorTextColor': '#ffffff', 'signalColor': '#4caf50', 'signalTextColor': '#ffffff', 'noteBkgColor': '#004d40', 'noteBorderColor': '#003300', 'noteTextColor': '#ffffff', 'activationBkgColor': '#2e7d32', 'activationBorderColor': '#003300', 'labelBoxBkgColor': '#003300', 'labelTextColor': '#ffffff', 'loopTextColor': '#ffffff',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
sequenceDiagram
    autonumber
    actor U as Legitimate User
    actor A as Attacker
    participant S as Auth Server (Database)

    Note over U, A: Both hold Refresh Token A (Stolen!)
    
    A->>S: 1. POST /token (Exchange Refresh Token A)
    Note over S: 2. Validates 'A' in DB<br/>Marks 'A' as USED/REVOKED
    S-->>A: 3. Returns Access Token + Refresh Token B (Attacker is inside)

    U->>S: 4. POST /token (Exchange Refresh Token A)
    Note over S: BREACH DETECTED!<br/>5. Attempted reuse of already-used Refresh Token A!
    Note over S: 6. Instantly revokes entire family:<br/>Tokens A, B, and current user session!
    S-->>U: 7. 400 Bad Request (Re-authenticate required)
    
    A->>S: 8. GET /profile (Presented with Token B)
    S-->>A: 9. 401 Unauthorized (Attacker kicked out!)
```

## 3. Sliding Windows vs. Absolute Expiry

When designing session lengths, you must configure two distinct timeouts:

- **Idle Timeout (Sliding Window):** If the user is inactive for X hours, the session expires. Every time they are active, the timer resets. 
- **Absolute Expiry:** Regardless of activity, the user must re-authenticate every Y days. This prevents a stolen token from being kept alive indefinitely by an automated script pinging the server every hour.

In enterprise systems (banking, medical), Idle Timeouts are strict (15 minutes) and Absolute Expiries are aggressive (24 hours).

## 📚 References & Tools
- **OAuth 2.0 Security Best Current Practice** — [datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics)
- **Auth0 Refresh Token Rotation** — [auth0.com/docs/secure/tokens/refresh-tokens/refresh-token-rotation](https://auth0.com/docs/secure/tokens/refresh-tokens/refresh-token-rotation)

---

**Navigation:** [Previous: OpenID Connect](./03-openid-connect-and-sso.md) | [Auth & Identity Index](./README.md)

## Related

- [Session & Cookie Security](../session-and-cookie-security/README.md)
- [OWASP ASVS 5.0 Verification](../owasp-asvs-5.0/README.md)
- [Bot Protection & CAPTCHAs](../bot-protection/README.md)
