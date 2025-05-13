# CI/CD Dockerized Project with Jenkins, GitHub Integration and Server Automation

## 📌 Project Overview

This project demonstrates a complete DevOps workflow including Dockerization, CI/CD with Jenkins, GitHub integration and infrastructure provisioning via shell scripts and Ansible.

---

## 🔀 Branch Information

- `main` – Base setup  
- `develop` – Active working branch (**clone and switch to this** for setup)

---

## 🛠️ Technologies Used

- Docker & Docker Compose  
- NGINX (as a reverse proxy container)  
- Jenkins (freestyle job pipeline)  
- GitHub (repository + webhook)  
- Ansible & Shell Scripting  

---

## 🚀 Quick Start Guide

### 1️⃣ Clone & Setup

```bash
git clone https://github.com/d-Akkya/task-ci-cd.git
cd task-ci-cd
git checkout develop
```

---

### 2️⃣ Phase 3: Server Configuration

> Automates installation of essential tools via a shell script.

```bash
bash configuration_management.sh
```

**Tools Installed:**

- Docker  
- Docker Compose  
- NGINX  
- Jenkins  

_Note: Even though NGINX is containerized, it's installed manually as per project requirement._

---

### 3️⃣ Phase 1: Dockerized App Deployment

> Brings up all containers: Apache-based web app and NGINX reverse proxy.

```bash
docker-compose up -d --build
```

- Apache containers are load balanced by NGINX (running in its own container).
- Each Apache container responds with a unique ID (1, 2, 3...).

---

### 4️⃣ Phase 2: CI/CD with Jenkins + GitHub

> Automates pull & redeploy using Jenkins freestyle job.

**Steps:**

1. Go to Jenkins → Create a Freestyle Job  
2. Configure:  
   - Source Code Management: Git → use `develop` branch  
   - Build Triggers: GitHub Webhook  
   - Build Steps:
     ```bash
     cd task-ci-cd
     git pull origin develop
     docker-compose down
     docker-compose up -d --build
     ```

3. Add your GitHub webhook:  
   - Go to your repo → Settings → Webhooks → Add webhook  
   - Use URL:  
     ```
     http://<jenkins-ip>:8080/github-webhook/
     ```

---

## ✅ Final Notes

- Project is fully automated and ready to deploy.
- Tested on Ubuntu EC2 instance.
- Ideal for DevOps demo, interviews, or learning pipeline creation end-to-end.
