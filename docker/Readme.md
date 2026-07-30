# Docker Module

## Purpose

This module containerizes the Node.js application for local development, testing, and deployment through Jenkins CI/CD.

## Files

- Dockerfile
- docker-compose.yml
- .dockerignore

## Build Docker Image

```bash
docker build -t project786/nodeapp:latest -f docker/Dockerfile app
```

## Run Docker Container

```bash
docker run -d \
  --name nodeapp \
  -p 3000:3000 \
  -e PORT=3000 \
  project786/nodeapp:latest
```

## Run with Docker Compose

```bash
cd docker
docker compose up -d
```

## Stop Docker Compose

```bash
docker compose down
```

## Verify Running Containers

```bash
docker ps
```

## View Logs

```bash
docker logs nodeapp
```

## Remove Container

```bash
docker rm -f nodeapp
```

## Remove Image

```bash
docker rmi project786/nodeapp:latest
```