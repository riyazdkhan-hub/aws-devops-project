# AWS DevOps Production Project Architecture

## Overview

This project provisions a production-style AWS infrastructure using Terraform. The infrastructure is modular, reusable, and follows Infrastructure as Code (IaC) principles.

## Technology Stack

- AWS
- Terraform
- Git
- GitHub
- Jenkins
- Docker
- Ansible
- Ubuntu Server 24.04 LTS
- CloudWatch

---

# Project Structure

```
aws-devops-production-project/

bootstrap/
terraform-infra/
modules/
docs/
docker/
ansible/
jenkins/
scripts/
```

---

# Infrastructure Components

## Networking

- VPC
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table
- Public Subnets
- Private Subnets

---

## Security

- IAM Role
- IAM Instance Profile
- Security Groups
- Encrypted EBS Volumes

---

## Compute

- Jenkins EC2 (Public Subnet)
- Application EC2 (Private Subnet)

---

## Future Components

- Application Load Balancer
- Auto Scaling Group
- CloudWatch
- Docker
- Jenkins Pipeline
- Ansible Automation

---

# Infrastructure Flow

```
Internet
     │
     ▼
Application Load Balancer
     │
     ▼
Target Group
     │
     ▼
Application EC2
```

---

# Automation Flow

```
Developer

↓

Git Push

↓

GitHub

↓

Jenkins

↓

Docker Build

↓

Docker Image

↓

Deploy to EC2

↓

Application
```

---

# Terraform Module Flow

```
Root Module

↓

VPC

↓

Security Groups

↓

IAM

↓

EC2

↓

ALB

↓

Auto Scaling

↓

CloudWatch
```

---

# Region

us-east-1

---

# Project Code

786

---

# Operating System

Ubuntu Server 24.04 LTS

---

# Infrastructure Style

- Modular
- Reusable
- Production Ready
- Infrastructure as Code