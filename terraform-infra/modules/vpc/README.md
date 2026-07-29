# VPC Module

## Purpose

Creates the networking layer for the AWS DevOps Production Project.

## Resources

- VPC
- Internet Gateway
- 2 Public Subnets
- 2 Private Subnets
- Elastic IP
- NAT Gateway
- Public Route Table
- Private Route Table
- Route Table Associations

## Architecture

```text
Internet
    │
Internet Gateway
    │
──────── Public Route Table ────────
│                                  │
Public Subnet 1              Public Subnet 2
│
NAT Gateway
│
──────── Private Route Table ──────
│                                  │
Private Subnet 1             Private Subnet 2
```

## Outputs

- VPC ID
- Public Subnet IDs
- Private Subnet IDs
- Internet Gateway ID
- NAT Gateway ID