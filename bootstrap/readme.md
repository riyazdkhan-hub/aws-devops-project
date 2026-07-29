# Terraform Bootstrap

## Purpose

This Terraform project creates the infrastructure required to store Terraform remote state.

It is executed only once before deploying the main infrastructure.

---

## Resources Created

- Amazon S3 Bucket
- Bucket Versioning
- Server-Side Encryption
- Public Access Block
- DynamoDB Lock Table

---

## Workflow

```
Local Backend
      │
terraform apply
      │
      ▼
Creates

S3 Bucket

+

DynamoDB Table

      │
      ▼

terraform-infra

uses

Remote S3 Backend
```

---

## Project Information

Project Code : 786

Region : us-east-1

Environment : dev

---

## Commands

Initialize Terraform

```bash
terraform init
```

Format Code

```bash
terraform fmt
```

Validate Configuration

```bash
terraform validate
```

Review Changes

```bash
terraform plan
```

Create Infrastructure

```bash
terraform apply
```

---

## Notes

After the bootstrap project successfully creates the S3 bucket and DynamoDB table, update the backend configuration in the main Terraform project to use the remote S3 backend.