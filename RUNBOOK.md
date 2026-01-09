# Deployment Runbook (ECS Blue/Green)

## 1) Day-0 Setup (one time)
1. Bootstrap Terraform backend (S3 state + DynamoDB lock)
2. Create/verify Route53 hosted zone for domain
3. Verify GitHub OIDC role is created and workflow exists

## 2) Deploy / Update (normal release)
Deployment happens via GitHub Actions:
1. Push to `main`
2. Workflow builds Docker image
3. Pushes image to ECR
4. Registers new ECS task definition
5. Creates CodeDeploy deployment (Blue/Green)

## 3) Verify after deploy
- Health:
  - `curl -i https://api-dev.aazprojects.com/health`
- AWS Console checks:
  - CodeDeploy deployment status = Succeeded
  - ALB target group healthy hosts > 0
  - ECS service running tasks = desired count

## 4) Rollback
### Option A (recommended)
- Use CodeDeploy rollback in AWS Console (deployment history)

### Option B (re-deploy previous revision)
- Re-run workflow with an older image tag (previous commit SHA)

## 5) Common failures
### OIDC assume role fails
- Check GitHub org/repo in role trust policy

### CodeDeploy permission denied
- Add missing codedeploy permissions in GitHub OIDC IAM policy

### Target group unhealthy
- Confirm container listens on port 8000
- Confirm /health returns 200
- Confirm SG allows ALB -> ECS port 8000

### RDS secret issues
- If secret name conflict (scheduled deletion), use unique suffix

## 6) Destroy environment
```bash
cd envs/dev
terraform destroy

