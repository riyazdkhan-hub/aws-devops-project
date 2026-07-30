# Ansible Configuration

## Purpose

This Ansible project configures the infrastructure created by Terraform.

The playbooks automate:

- System updates
- Docker installation
- Docker Compose installation
- Docker service configuration
- Node.js application deployment
- Container verification

---

## Folder Structure

```
ansible/
├── ansible.cfg
├── inventory
├── playbook.yml
├── group_vars/
│   └── all.yml
└── roles/
    ├── common/
    ├── docker/
    └── nodeapp/
```

---

## Verify Ansible Installation

```bash
ansible --version
```

---

## Verify Inventory

```bash
ansible all -i inventory --list-hosts
```

---

## Test Connectivity

```bash
ansible all -i inventory -m ping
```

---

## Execute Playbook

```bash
ansible-playbook playbook.yml
```

---

## Execute With Inventory

```bash
ansible-playbook -i inventory playbook.yml
```

---

## Check Docker

```bash
docker --version
```

---

## Check Running Containers

```bash
docker ps
```

---

## Verify Application

```bash
curl http://localhost:3000
```