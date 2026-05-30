# 🦊 GitLab CI/CD — The Unified Platform

> **Series:** DevOps › CI/CD Pipelines · **Level:** Intermediate · **Read Time:** ~8 min

---

## 📖 Table of Contents

- [1. What Is GitLab CI/CD?](#1-what-is-gitlab-cicd)
- [2. The Architecture (GitLab Runners)](#2-the-architecture-gitlab-runners)
- [3. The `.gitlab-ci.yml` File](#3-the-gitlab-ciyml-file)
- [4. Auto DevOps](#4-auto-devops)
- [5. GitLab vs GitHub Actions](#5-gitlab-vs-github-actions)

---

## 1. What Is GitLab CI/CD?

**GitLab CI/CD** is a powerful automation engine built directly into GitLab. Long before GitHub introduced Actions, GitLab was leading the industry in proving that source code management (Git) and CI/CD should exist in the exact same application.

GitLab’s philosophy is to provide a **single application for the entire DevOps lifecycle**—from issue tracking and code review, to CI/CD pipelines, security scanning, and container registries.

---

## 2. The Architecture (GitLab Runners)

Similar to Jenkins and GitHub Actions, GitLab splits the "controller" from the "executor."

- **GitLab Instance:** The web UI where your code lives and pipelines are tracked.
- **GitLab Runner:** A lightweight agent written in Go that executes the jobs. 

GitLab Runners are incredibly versatile. You can install them on Linux, macOS, Windows, or deploy them in a Kubernetes cluster. 
The most popular executor type is the **Docker Executor**, where the Runner spins up a fresh Docker container, executes your script inside it, and then destroys the container. This guarantees a clean environment every time.

---

## 3. The `.gitlab-ci.yml` File

Pipelines are defined by a `.gitlab-ci.yml` file placed at the root of your repository. 

GitLab uses a **Stage-based** approach. Jobs in the same stage run in parallel. Jobs in the next stage wait for the previous stage to complete successfully.

```yaml
# 1. Define the stages
stages:
  - build
  - test
  - deploy

# 2. Define a Job (runs in the 'build' stage)
build_app:
  stage: build
  image: node:20 # Run this job inside a Node 20 Docker container
  script:
    - npm ci
    - npm run build
  artifacts: # Save the output folder to pass to the next stage
    paths:
      - dist/

# 3. Define a Job (runs in the 'test' stage)
test_app:
  stage: test
  image: node:20
  script:
    - npm run test

# 4. Define a Job (runs in the 'deploy' stage)
deploy_production:
  stage: deploy
  script:
    - echo "Deploying to production server..."
    - ./deploy.sh
  only:
    - main # Only run this job when pushing to the main branch
  environment:
    name: production
```

---

## 4. Auto DevOps

One of GitLab's standout features is **Auto DevOps**. 

If you have a standard application (like a Spring Boot Java app, a Ruby on Rails app, or a standard Node.js app) and you connect your GitLab repo to a Kubernetes cluster, you don't even have to write a `.gitlab-ci.yml` file.

GitLab will automatically detect your language, build the Docker image, run SAST (Static Application Security Testing) code scans, run dependency scans, and deploy it to Kubernetes automatically. 

---

## 5. GitLab vs GitHub Actions

| Feature | GitLab CI/CD | GitHub Actions |
| :--- | :--- | :--- |
| **Paradigm** | Stage-based (Sequential phases) | Event-based (Trigger anything) |
| **Marketplace** | Uses "Includes" / Templates | Uses third-party "Actions" |
| **Self-Hosting** | Entire platform can be self-hosted | Only Runners can be self-hosted (Enterprise server is pricey) |
| **Security Scanning**| Unmatched (Built-in SAST/DAST) | Relies heavily on third parties |

> **Recommendation:** If you are an enterprise that needs to self-host your entire codebase for compliance reasons, **GitLab** is the ultimate choice. If you want a perfectly integrated suite where security testing, Docker registries, and CI/CD just work together without configuring 10 different SaaS products, choose GitLab. If you want maximum flexibility and community plugins, choose GitHub Actions.

---

*← [GitHub Actions](./03-github-actions.md) · Next: [GitOps (ArgoCD) ](./05-gitops-argocd.md) →*

## Related

- [Container Orchestration](../container-orchestration/README.md)
- [Infrastructure as Code](../infrastructure-as-code/README.md)
- [API Gateways & Reverse Proxies](../api-gateways/README.md)
