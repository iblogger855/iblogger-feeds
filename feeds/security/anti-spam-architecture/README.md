# Anti-Spam & Trust Architecture

**Author:** ichamrong  
**Category:** Security & Architecture  
**Read Time:** ~5 min  

---

## 1. The Social Media War

If you are building a social media platform, standard CAPTCHAs are not enough. A human click-farm can easily bypass a CAPTCHA to create an account, and then use an automated script to spam 10,000 links an hour. 

To combat this, giant platforms like Facebook, Instagram, and X (Twitter) use a deeply integrated architectural pattern called **The Trust Engine**. 

Instead of blocking users outright at the login screen, the system monitors their behavior, scores their "Trust," and dynamically applies friction when they break the rules.

## 2. The Anti-Spam Library

This documentation suite breaks down exactly how to architect a backend system to catch massive botnets and spam rings on a social platform.

| Phase | Core Concept | Document |
| :--- | :--- | :--- |
| **1. Detection** | How to flag users based on Speed, Location, and Content. | [Trust & Velocity Scoring](./01-trust-and-velocity-scoring.md) |
| **2. Interception** | How to apply step-up friction (Soft, Medium, Hard locks). | [The Checkpoint Funnel](./02-the-checkpoint-funnel.md) |
| **3. Deception** | How to silence bots without them ever knowing they failed. | [Shadowbanning & Tarpits](./03-shadowbanning-and-tarpits.md) |
| **4. Marketplace Defense** | Specific strategies for Airbnb, Booking.com, and Doctolib. | [Marketplace Strategies](./04-marketplace-spam-strategies.md) |

---

*Last updated: 2026-05-17*
