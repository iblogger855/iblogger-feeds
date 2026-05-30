# 🐫 Enterprise Integration (Apache Camel)

> **Series:** DevOps › Message Brokers & Integration · **Level:** Advanced · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. What Is Enterprise Integration?](#1-what-is-enterprise-integration)
- [2. Enterprise Integration Patterns (EIPs)](#2-enterprise-integration-patterns-eips)
- [3. What Is Apache Camel?](#3-what-is-apache-camel)
- [4. The ESB vs Microservices Debate](#4-the-esb-vs-microservices-debate)
- [5. Competitors (MuleSoft, WSO2)](#5-competitors-mulesoft-wso2)

---

## 1. What Is Enterprise Integration?

In a large enterprise, you rarely have the luxury of building everything from scratch using modern JSON/REST APIs. 

You might have:
- An ancient IBM Mainframe that exports CSV files to an FTP server every night at 2:00 AM.
- A modern Salesforce CRM that expects JSON webhooks.
- An accounting system that communicates exclusively via legacy XML SOAP APIs.

**Enterprise Integration** is the art of connecting all these completely incompatible systems together. It involves extracting data from one format, transforming it, routing it based on logic, and loading it into the destination.

---

## 2. Enterprise Integration Patterns (EIPs)

In 2003, Gregor Hohpe and Bobby Woolf published the famous book *Enterprise Integration Patterns*. They documented 65 standard patterns for connecting systems. 

Common EIPs include:
1. **Content-Based Router:** Read the message; if `country=US`, send to Queue A, else send to Queue B.
2. **Splitter:** Take a massive XML file with 1,000 orders and split it into 1,000 individual JSON messages.
3. **Aggregator:** Wait to receive messages from three different systems, merge them into one giant payload, and send it forward.
4. **Dead Letter Channel:** If a message fails to process after 5 retries, move it to a special "Dead Letter" queue so a human can inspect it later.

---

## 3. What Is Apache Camel?

**Apache Camel** is an open-source Java framework that implements *every single one* of those 65 Enterprise Integration Patterns natively in code.

It uses a concept called **URIs** to connect to over 300 different technologies instantly.

```java
// A simple Apache Camel Route written in Java
public class MyRouteBuilder extends RouteBuilder {
    public void configure() {
        
        // 1. Consume files from an FTP server
        from("ftp://admin@myserver.com/incoming?password=secret")
        
        // 2. Unmarshal (convert) the CSV into a Java Object
        .unmarshal().csv()
        
        // 3. EIP: Content-Based Router
        .choice()
            .when(simple("${body.country} == 'USA'"))
                // 4. Transform to JSON and send to RabbitMQ Queue
                .marshal().json()
                .to("rabbitmq:myExchange?routingKey=usa.orders")
            .otherwise()
                // 5. Send directly to a Salesforce API
                .to("salesforce:createOpportunity")
        .end();
    }
}
```
With 15 lines of code, Camel connects an FTP server, a Message Queue, and a SaaS CRM, handling all the network retries and threading automatically.

---

## 4. The ESB vs Microservices Debate

Historically, companies bought massive, expensive **Enterprise Service Buses (ESBs)** (like IBM WebSphere or Oracle SOA). The ESB was a giant, centralized server that handled *all* integration for the entire company.

**The Problem:** ESBs became a single point of failure and a massive bottleneck. If you wanted to add a new route, you had to file a ticket with the central "ESB Team," which took months.

**The Microservices Shift:** Today, centralized ESBs are considered an anti-pattern. Instead, developers embed lightweight frameworks like **Apache Camel** directly into their standalone Spring Boot or Quarkus microservices. This decentralizes the integration logic ("Smart endpoints, dumb pipes").

---

## 5. Competitors (MuleSoft, WSO2)

| Tool | Type | Description |
| :--- | :--- | :--- |
| **Apache Camel** | Open-Source Framework | Requires writing Java/XML code. Extremely fast, lightweight, and standard in modern Spring Boot apps. |
| **MuleSoft (Salesforce)** | Commercial ESB / iPaaS | Massive enterprise platform. Provides a drag-and-drop GUI for integration without coding. Extremely expensive. |
| **WSO2** | Open-Source ESB | Provides a full middleware stack. Uses a custom language (Ballerina) for integration. |
| **Dell Boomi** | iPaaS (Cloud) | Cloud-native, drag-and-drop integration platform. |

> **Recommendation:** If you have a team of Java engineers, use **Apache Camel** embedded in Spring Boot microservices. It is free, infinitely scalable, and prevents vendor lock-in. If your company relies heavily on Salesforce and wants non-programmers to visually drag-and-drop data flows, pay for **MuleSoft**.

---

*← [Series Overview](./README.md) · Next: [Message Queues (RabbitMQ)](./02-message-queues-rabbitmq.md) →*

## Related

- [Distributed Architecture Patterns](../../clean-code/software-architecture/distributed-patterns/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
- [Observability & Monitoring](../observability/README.md)
