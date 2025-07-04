# EKS + Fargate Support Portal

**Multi‑tier employee directory** running on Amazon EKS with a hybrid workload:

| Tier      | Runtime | Namespace |
|-----------|---------|-----------|
| React UI  | Fargate | `frontend` |
| Flask API | EC2     | `backend`  |
| RDS       | DB      | —         |

## Repository Layout

```
.
├── frontend/              # React SPA
├── backend/               # Flask REST API
├── k8s/                   # Kubernetes manifests (ingress, services, HPA)
├── modules/               # Re‑usable Terraform modules
├── environments/          # Per‑environment tfvars
├── main.tf                # Root Terraform calling modules
└── .github/workflows/     # CI/CD pipelines
```

## Quick Start

```bash
# 1. Provision infra (requires AWS credentials & S3 backend bucket)
terraform init
terraform apply -var-file=environments/dev.tfvars

# 2. Build & push images
docker build -t flask-backend ./backend
docker build -t react-frontend ./frontend
docker push <ECR>/flask-backend:latest
docker push <ECR>/react-frontend:latest

# 3. Deploy manifests
kubectl apply -f k8s/00-namespaces.yaml
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/ingress.yaml
```

GitHub Actions automates steps 1–3 when you push to **main**.
