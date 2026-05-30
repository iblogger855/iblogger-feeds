# 🐙 GitHub Actions — Modern Standard

> **Series:** DevOps › CI/CD Pipelines · **Level:** Intermediate · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. What Are GitHub Actions?](#1-what-are-github-actions)
- [2. The YAML Workflow](#2-the-yaml-workflow)
- [3. The Actions Marketplace](#3-the-actions-marketplace)
- [4. Hosted vs Self-Hosted Runners](#4-hosted-vs-self-hosted-runners)
- [5. Why It Won the CI/CD War](#5-why-it-won-the-cicd-war)

---

## 1. What Are GitHub Actions?

**GitHub Actions** is a CI/CD platform integrated directly into GitHub. It allows you to automate your build, test, and deployment pipelines without leaving the GitHub interface. 

Because it is built into the place where your code lives, it can trigger workflows based on almost *any* GitHub event (a push, a pull request, an issue being opened, a comment being posted, or a scheduled cron job).

---

## 2. The YAML Workflow

Workflows are defined in YAML files stored in the `.github/workflows/` directory of your repository.

```yaml
name: Node.js CI

# 1. Triggers
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

# 2. Jobs
jobs:
  build-and-test:
    runs-on: ubuntu-latest # Runs on GitHub's hosted servers
    
    # 3. Steps
    steps:
    - name: Check out the repository
      uses: actions/checkout@v4

    - name: Set up Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '20'

    - name: Install dependencies and Run Tests
      run: |
        npm ci
        npm run test
```

### Key Concepts:
- **Workflow:** The automated process (the whole YAML file).
- **Event (`on`):** The trigger (e.g., `push`).
- **Job:** A set of steps that execute on the same server. Jobs run in parallel by default.
- **Step:** An individual task (either running a shell command or calling an "Action").
- **Runner (`runs-on`):** The server that executes the job.

---

## 3. The Actions Marketplace

The secret to GitHub Actions' success is the **Marketplace**. Instead of writing complex bash scripts to install Node, configure AWS credentials, or deploy to Kubernetes, you just `use` an Action written by the community or the vendor.

```yaml
    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        aws-region: us-east-1
        role-to-assume: arn:aws:iam::1234567890:role/my-github-role
```

This functions exactly like Jenkins Plugins, but because they are version-controlled, open-source repositories (`uses: owner/repo@version`), they are significantly less brittle and easier to audit.

---

## 4. Hosted vs Self-Hosted Runners

1. **GitHub-Hosted Runners:** By default, jobs run on fresh, ephemeral Virtual Machines hosted by GitHub (Ubuntu, Windows, or macOS). You get a clean environment every time. You don't manage any infrastructure.
2. **Self-Hosted Runners:** If your code needs to access an internal corporate database behind a firewall, or if you need massive GPU servers to train an AI model, you can install the GitHub Runner agent on your own AWS EC2 instance. GitHub will orchestrate the job, but it will execute on your hardware.

---

## 5. Why It Won the CI/CD War

GitHub Actions has largely replaced Jenkins, Travis CI, and CircleCI for modern projects for several reasons:

1. **Proximity to Code:** Developers are already in GitHub all day. Seeing the CI/CD status right next to their Pull Request is a massive UX improvement.
2. **Zero Maintenance:** No servers to patch, no Java to update.
3. **OIDC Integration:** GitHub Actions supports **OpenID Connect (OIDC)**. This means your pipeline can request temporary, short-lived cloud credentials from AWS/GCP without you ever having to store long-lived, dangerous secret keys in GitHub.
4. **Community:** If you need to do something, someone has already written an Action for it.

---

*← [Jenkins](./02-jenkins.md) · Next: [GitLab CI/CD](./04-gitlab-ci.md) →*

## Related

- [Container Orchestration](../container-orchestration/README.md)
- [Infrastructure as Code](../infrastructure-as-code/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
