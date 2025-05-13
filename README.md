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

## 📸 Output

Below are screenshots from various stages of the project:

### ✅ Shell Script Installation Output
![image](https://github.com/user-attachments/assets/cb37fc7a-a89f-4e03-96fe-98ba8870712a)


### ✅ Docker Containers Running
![image](https://github.com/user-attachments/assets/d25c3b60-9e84-44f4-824e-aefa25f10f50)


### ✅ Web App via NGINX Load Balancer
![Screenshot 2025-05-13 133450](https://github.com/user-attachments/assets/3e6494b3-b4f0-4db4-b4f6-2ae312caec27)
![Screenshot 2025-05-13 133457](https://github.com/user-attachments/assets/3a282011-0a38-4e69-ad88-140d9ee002c1)
![Screenshot 2025-05-13 133512](https://github.com/user-attachments/assets/82b8995b-645e-4162-95e8-fb966ea789ba)

### ✅ Checking Load Balancing via curl
![Screenshot 2025-05-13 133641](https://github.com/user-attachments/assets/69a95584-ac94-407b-acaf-f790e473eb59)


### ✅ Jenkins Job Console Output
![image](https://github.com/user-attachments/assets/0e36d7db-6446-4fff-8df5-a976bb595c95)
![image](https://github.com/user-attachments/assets/6579d18b-08c9-4137-8d5b-378e9aa1a3c2)


### ✅ Changes in the code is reflected through Jenkins CI/CD pipeline
![image](https://github.com/user-attachments/assets/94b460d0-d155-4890-8640-5b2652c6aac1)
![image](https://github.com/user-attachments/assets/84204063-e725-457d-9b74-f933806f71ec)
![Screenshot 2025-05-13 132925](https://github.com/user-attachments/assets/9272f3c0-aecd-43bd-8452-9fddabfaf7a4)
![Screenshot 2025-05-13 132948](https://github.com/user-attachments/assets/bd96d612-10e7-42fe-af73-b802f759d70e)
![Screenshot 2025-05-13 132955](https://github.com/user-attachments/assets/de774467-0bec-4b5e-997e-463c4d73b206)



---

## ✅ Final Notes

- Project is fully automated and ready to deploy.
- Tested on Ubuntu EC2 instance.
- Ideal for DevOps demo, interviews, or learning pipeline creation end-to-end.
