# 👴 Jenkins — The Enterprise Veteran

> **Series:** DevOps › CI/CD Pipelines · **Level:** Intermediate · **Read Time:** ~10 min

---

## 📖 Table of Contents

- [1. What Is Jenkins?](#1-what-is-jenkins)
- [2. The Jenkinsfile (Pipeline as Code)](#2-the-jenkinsfile-pipeline-as-code)
- [3. The Plugin Ecosystem (Blessing and Curse)](#3-the-plugin-ecosystem-blessing-and-curse)
- [4. Master/Slave Architecture](#4-masterslave-architecture)
- [5. Why Is the Industry Moving Away?](#5-why-is-the-industry-moving-away)

---

## 1. What Is Jenkins?

Created in 2004, **Jenkins** is the most widely adopted open-source automation server in the world. It is a self-hosted Java application that allows you to automate almost any task related to building, testing, delivering, or deploying software.

For over a decade, if a company was doing "CI/CD," they were doing it with Jenkins.

---

## 2. The Jenkinsfile (Pipeline as Code)

Originally, Jenkins jobs were configured manually through the web UI (clicking checkboxes). This was a disaster for version control.

Jenkins evolved by introducing the **Jenkinsfile**—a text file checked into Git that defines the pipeline using a domain-specific language based on **Groovy**.

```groovy
pipeline {
    agent any // Run on any available Jenkins worker node
    
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'npm run test'
            }
        }
        stage('Deploy') {
            when {
                branch 'main' // Only deploy if on the main branch
            }
            steps {
                sh './deploy.sh'
            }
        }
    }
    post {
        failure {
            slackSend(color: 'danger', message: "Build Failed: ${env.BUILD_URL}")
        }
    }
}
```

Because Groovy is a full programming language, Jenkins pipelines can have incredibly complex logic (`if/else` statements, loops, exception handling) that is very difficult to achieve in modern YAML-based CI tools.

---

## 3. The Plugin Ecosystem (Blessing and Curse)

Jenkins' greatest strength is its plugin ecosystem (over 1,800 plugins). If you need Jenkins to talk to AWS, Docker, Kubernetes, Slack, Jira, or a 20-year-old IBM mainframe, there is a plugin for it.

**The Curse:**
Jenkins plugins are notoriously brittle. Upgrading the Jenkins core often breaks plugins. Plugins often conflict with each other. A significant portion of a DevOps engineer's job in a Jenkins environment is performing "plugin maintenance" and fixing the server when an update breaks the build pipeline.

---

## 4. Master/Slave Architecture

Jenkins uses a distributed architecture to handle heavy workloads:

1. **Jenkins Master (Controller):** The central server that hosts the web UI, stores configurations, and schedules jobs.
2. **Jenkins Agents (Slaves):** Separate servers (Linux, Windows, macOS) that actually execute the shell scripts and run the builds.

This allows Jenkins to scale horizontally. You can have a Windows Agent dedicated to compiling C# code, and a macOS Agent dedicated to building iOS apps.

---

## 5. Why Is the Industry Moving Away?

Despite its power, Jenkins is losing market share to GitHub Actions and GitLab CI/CD. Why?

1. **Maintenance Overhead:** You have to patch the underlying Linux OS, update Java, update Jenkins, update plugins, and manage the infrastructure for all the Agents.
2. **Security:** Self-hosted Jenkins instances have historically been prime targets for hackers (due to outdated plugins or exposed dashboards).
3. **Groovy Complexity:** Modern developers don't want to learn Groovy just to run `npm test`. They prefer simple, declarative YAML.
4. **Lack of Native Git Integration:** Because Jenkins is standalone, it has to use webhooks to communicate with GitHub/GitLab, which is clunkier than having the CI/CD engine built directly into the Git provider.

> **Conclusion:** Jenkins is still essential for massive enterprises with complex, legacy, on-premise infrastructure. However, if you are starting a new project today in the cloud, you should avoid Jenkins and use GitHub Actions or GitLab CI/CD.

---

*← [CI/CD Comparison Matrix](./01-cicd-comparison.md) · Next: [GitHub Actions](./03-github-actions.md) →*

## Related

- [Container Orchestration](../container-orchestration/README.md)
- [Infrastructure as Code](../infrastructure-as-code/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
