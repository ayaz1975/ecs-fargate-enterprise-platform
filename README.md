# ECS Fargate Enterprise Platform (Terraform)

Production-ready AWS ECS Fargate platform with:
- Blue/Green deployments
- GitHub Actions CI/CD (OIDC, no AWS keys)
- ALB + HTTPS
- RDS PostgreSQL
- Monitoring & Alerts
- Modular Terraform (dev / stage / prod)

---

## Architecture

- VPC (public + private subnets)
- Application Load Balancer (HTTPS, HTTP → HTTPS)
- ECS Fargate (Blue/Green via CodeDeploy)
- Amazon ECR (Docker images)
- RDS PostgreSQL (private subnets)
- AWS Secrets Manager
- CloudWatch Logs & Alarms
- SNS Email Alerts
- GitHub Actions (OIDC)

---

## Environments

- `envs/dev`
- `envs/stage`
- `envs/prod`

Each environment:
- Separate Terraform state
- Separate infrastructure
- Same reusable modules

---

## Prerequisites

- AWS account
- Terraform >= 1.5
- AWS CLI
- GitHub repository
- Domain in Route53
- Docker (for backend images)

---

## Bootstrap (one time)

Creates:
- S3 backend for Terraform state
- DynamoDB lock table

```bash
cd bootstrap
terraform init
terraform apply



