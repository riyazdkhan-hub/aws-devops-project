# Network Flow

```
                 Internet
                     │
                     ▼
        Internet Gateway (IGW)
                     │
         ┌───────────┴───────────┐
         │                       │
         ▼                       ▼
 Public Subnet 1            Public Subnet 2
         │
         ▼
 Application Load Balancer
         │
         ▼
 Target Group
         │
         ▼
 Private Subnet 1
         │
         ▼
 Application EC2
         │
         ▼
 Docker Container
```

---

## Jenkins Flow

```
Developer

↓

GitHub

↓

Jenkins EC2

↓

Terraform

↓

Ansible

↓

Docker

↓

Application EC2
```

---

## Internet Access

Public Subnet

↓

Internet Gateway

↓

Internet

Private Subnet

↓

NAT Gateway

↓

Internet Gateway

↓

Internet