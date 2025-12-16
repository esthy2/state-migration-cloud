# Terraform State Migration: Local to Terraform Cloud

## 📌 Overview

This project demonstrates how to provision AWS infrastructure using Terraform with a **local backend**, then migrate the Terraform state to **Terraform Cloud** and continue managing the infrastructure remotely using a **CLI-driven workflow**.

The project showcases real-world Terraform state migration, remote state management, and Terraform Cloud best practices.

---

## 🎯 Objectives

* Provision AWS resources using Terraform
* Create and manage infrastructure with a local Terraform state
* Migrate Terraform state from local backend to Terraform Cloud
* Continue managing infrastructure using Terraform Cloud workspaces
* Validate state consistency after migration

---

## 🛠️ Technologies Used

* **Terraform**
* **Terraform Cloud** (CLI-driven workflow)
* **AWS EC2**
* **Git & GitHub**

---

## 📂 Project Structure

```text
migrate-state-cloud/
├── ami-datasource.tf
├── apache-install.sh
├── main.tf
├── outputs.tf
├── variables.tf
├── versions.tf
```

---

## 🚀 Project Workflow

### 1️⃣ Create Terraform Configuration Files

Terraform configuration files are created to:

* Fetch the latest Amazon Linux 2 AMI
* Provision security groups
* Launch EC2 instances
* Install Apache using a user-data script

---

### 2️⃣ Provision Infrastructure Locally

The infrastructure is first created using a **local Terraform state file**.

```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

---

### 3️⃣ Create Terraform Cloud Workspace

A Terraform Cloud workspace is created using the **CLI-driven workflow**:

* Workspace Name: `state-migration`

---

### 4️⃣ Configure Remote Backend

The Terraform backend configuration is updated to point to Terraform Cloud by uncommenting the remote backend block in `versions.tf`.

---

### 5️⃣ Migrate Terraform State to Terraform Cloud

Terraform is authenticated with Terraform Cloud and the state is migrated:

```bash
terraform login
terraform init
```

When prompted, Terraform copies the existing local state to Terraform Cloud.

---

### 6️⃣ Configure AWS Credentials in Terraform Cloud

AWS credentials are securely added as **Environment Variables** in the Terraform Cloud workspace:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

---

### 7️⃣ Validate State Migration

* Local state file is removed
* Resource count is updated
* Terraform applies changes using the remote state

Terraform correctly provisions only the additional required resources, confirming successful state migration.

---

### 8️⃣ Destroy and Clean Up

Resources are destroyed directly from Terraform Cloud using a **Destroy Plan**, ensuring proper cleanup and no ongoing AWS costs.

---

## ✅ Key Learning Outcomes

* Terraform backend migration (local → remote)
* Terraform Cloud authentication and workspace usage
* Remote state management
* Safe infrastructure updates after state migration
* Real-world Terraform Cloud workflow

---

## 🧹 Cleanup

All AWS resources are destroyed using Terraform Cloud. Local Terraform artifacts are removed to keep the workspace clean.

---

👩‍💻 **Author**: EsthyTech
📌 Built as part of hands-on Terraform Cloud & DevOps practice
