# Security Groups Module

## Purpose

Creates all Security Groups required for the AWS DevOps Production Project.

## Resources

- ALB Security Group
- EC2 Security Group
- Jenkins Security Group

## Inbound Rules

### ALB Security Group

- HTTP (80) from Internet
- HTTPS (443) from Internet

### EC2 Security Group

- Port 3000 from ALB Security Group
- SSH (22) from Jenkins Security Group

### Jenkins Security Group

- SSH (22) from Internet
- Jenkins UI (8080) from Internet

## Outbound Rules

All Security Groups allow all outbound traffic.

## Outputs

- ALB Security Group ID
- EC2 Security Group ID
- Jenkins Security Group ID