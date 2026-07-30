# EC2 Module

## Purpose

Creates the compute infrastructure for the AWS DevOps Production Project.

## Resources

- Jenkins EC2 Instance

## Architecture

```text
Internet
    │
    ▼
Jenkins EC2 (Public Subnet)
    │
Terraform
Docker
Ansible
Jenkins
AWS CLI
    │
    ▼
Application EC2 (Private Subnet)
    │
Docker
Node.js Application
```

## Outputs

- Jenkins Instance ID
- Jenkins Public IP
- Application Instance ID
- Application Private IP