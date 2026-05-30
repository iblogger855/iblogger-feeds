# Network Security & Data Transit

**Author:** ichamrong  
**Category:** Security & Architecture  
**Read Time:** ~3 min  

---

## 1. The Perimeter is Everywhere
When building modern applications, you cannot assume the network between the user and your server is safe. Users connect from coffee shops, airports, and compromised home routers. If your architectural transit layer is weak, attackers don't need to hack your servers—they just intercept the data in mid-air.

## 2. The Network Security Library

| Threat | Core Concept | Document |
| :--- | :--- | :--- |
| **1. The Evil Twin** | Rogue Free Wi-Fi, Captive Portals, and real-time OTP theft. | [View Guide](./01-evil-twins-and-captive-portals.md) |
| **2. Transit & Logging** | The dangers of HTTP and leaking credentials into Access Logs. | [View Guide](./02-transit-and-logging-failures.md) |

---

*Last updated: 2026-05-17*
