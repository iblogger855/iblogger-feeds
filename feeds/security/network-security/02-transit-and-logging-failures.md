# Transit & Logging Failures (Cleartext)

**Author:** ichamrong  
**Category:** Security & Architecture  
**Read Time:** ~8 min  

---

## 📌 Table of Contents
- [1. Missing HTTPS (The Cleartext Vulnerability)](#1-missing-https-the-cleartext-vulnerability)
- [2. The Cardinal Sin: Passwords in Access Logs](#2-the-cardinal-sin-passwords-in-access-logs)
  - [The GET Request Failure](#the-get-request-failure)
  - [The Catastrophic Consequence](#the-catastrophic-consequence)
- [📚 References & Tools](#references-tools)

---

## 1. Missing HTTPS (The Cleartext Vulnerability)

If a user connects to a public Wi-Fi network (even a legitimate one) and your website does not strictly enforce **HTTPS** (SSL/TLS Encryption), you are transmitting data in "Cleartext."

**The Attack:** An attacker sitting in the same coffee shop can run a simple packet sniffer (like Wireshark). Every password, session cookie, and private message sent over unencrypted HTTP is visible in plain text floating through the air.

**The Prevention:**
- **Strict Transport Security (HSTS):** Your server must return the `Strict-Transport-Security` header. This forces the browser to *never* attempt an HTTP connection to your domain, even if the user manually types `http://`.
- **API Gateways:** SSL termination should happen at the Edge (Cloudflare) or the Gateway (Kong/Nginx), ensuring all external traffic is deeply encrypted.

---

## 2. The Cardinal Sin: Passwords in Access Logs

Even if your site has perfect HTTPS, developers often make massive architectural errors that expose user credentials on the backend server.

When a user interacts with your site, Gateways like Nginx and Apache automatically record every request in an `access.log` file for debugging. 

### The GET Request Failure
A junior developer creates a login form, but accidentally sets the HTML form method to `GET` instead of `POST`. 
When the user submits the form, the browser attaches the credentials directly to the URL string:
`https://myapp.com/api/login?user=admin&password=MySecretPassword123`

Because the connection uses HTTPS, the network transit is secure from coffee-shop hackers. **However**, when the request hits the Nginx reverse proxy, Nginx writes the full URL into the `/var/log/nginx/access.log` file on the server disk:
```text
192.168.1.5 - - [17/May/2026:01:45:00] "GET /api/login?user=admin&password=MySecretPassword123 HTTP/2.0" 200
```

### The Catastrophic Consequence
1. **Log Aggregation:** Those Nginx logs are usually forwarded automatically to tools like Splunk, Datadog, or the ELK Stack. Now, every single user's plaintext password is permanently searchable by any DevOps engineer, Junior Developer, or Support Agent in your company.
2. **Server Breach:** If an attacker gets basic read-access to the server, they don't even need to hack your highly encrypted SQL database. They simply run `cat access.log | grep password` and steal tens of thousands of plaintext passwords in seconds.

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': {'primaryColor': '#01579b', 'primaryTextColor': '#ffffff', 'lineColor': '#29b6f6',
    'background': '#1e1e1e'},
  'themeCSS': 'svg { background-color: #1e1e1e !important; padding: 1rem !important; border-radius: 8px !important; } .edgeLabel rect { fill: #1e1e1e !important; } text, tspan, .messageText, .signalText, .edgeLabel, .edgeLabel span, .pointLabel, .axisLabel, .quadrantTitle, .quadrantLabel { fill: #ffffff !important; color: #ffffff !important; stroke: none !important; }'
}}%%
flowchart LR
    classDef user fill:#4a148c,stroke:#6a1b9a,color:#fff
    classDef proxy fill:#01579b,stroke:#003c8f,color:#fff
    classDef risk fill:#b71c1c,stroke:#7f0000,color:#fff
    
    A[User Submits Form]:::user -->|HTTPS GET Request| B[Nginx Gateway]:::proxy
    B --> C[Backend API]:::proxy
    B -->|Writes URL to file| D[access.log]:::risk
    D -->|Forwards Logs to| E[Datadog / Splunk<br/>Visible to Everyone!]:::risk
```

**The Lesson & Prevention:**
1. **Always use POST:** Login forms, API keys, and sensitive data *must* use `POST`, `PUT`, or `PATCH`. In a `POST` request, the payload is stored securely in the HTTP Body, which Nginx/Apache do not log by default.
2. **Log Sanitization:** Configure your API Gateway (Kong/Gravitee) to actively sanitize logs. You can write a rule that automatically masks fields like `password`, `token`, and `credit_card` with `***` before writing them to the disk.

## 📚 References & Tools
- **Mozilla SSL Configuration Generator** — [ssl-config.mozilla.org](https://ssl-config.mozilla.org/)
- **OWASP Logging Cheat Sheet** — [cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html)

---

**Navigation:** [Previous: The Evil Twin Attack](./01-evil-twins-and-captive-portals.md) | [Network Security Index](./README.md)

*Last updated: 2026-05-17*

## Related

- [Social Engineering & Pretexting](../social-engineering/README.md)
- [Authentication & Identity Patterns](../auth-and-identity-patterns/README.md)
- [DDoS Defense & Rate Limiting](../ddos-defense/README.md)
