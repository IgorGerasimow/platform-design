# Platform Design

This repository contains a reference architecture and DevOps setup for a modern cloud-native platform using:

## Core Technologies

### Infrastructure & DevOps
- AWS (EKS, S3, RDS, etc.)
- Kubernetes (Helm, Kustomize)
- Terraform
- ArgoCD
- Cloudflare (DNS, CDN)
- GitHub Actions (CI/CD)

### Backend and API
- Golang (microservices)
- Node.js (optional frontend or tools)
- Swagger (API documentation)

### Data Stores
- PostgreSQL (relational data)
- MongoDB (document data)
- Kafka (stream processing)

## Structure

- `docs/` - platform documentation
- `services/example-api/` - simple API in Go with healthcheck
- `terraform/`, `helm/`, `kustomize/`, `argocd/` - coming soon

## Getting Started

```bash
cd services/example-api
docker build -t example-api .
docker run -p 8080:8080 example-api
```
