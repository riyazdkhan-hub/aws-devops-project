# Jenkins CI/CD Pipeline

## Pipeline Flow

GitHub

↓

Jenkins

↓

Checkout Source

↓

Build Docker Image

↓

Login to Amazon ECR

↓

Tag Docker Image

↓

Push Image to Amazon ECR

↓

Execute Ansible Playbook

↓

Deploy Application

## Required Software

- Jenkins
- Docker
- AWS CLI
- Git
- Ansible

## Required Jenkins Credentials

- aws-creds
- github-creds
- ec2-ssh-key

## Trigger

- Manual Build
- GitHub Webhook (Optional)