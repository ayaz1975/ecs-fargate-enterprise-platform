# Client Handover Checklist

## Access
- [ ] AWS account access confirmed
- [ ] Route53 hosted zone access confirmed
- [ ] GitHub repo access confirmed

## URLs
- [ ] Production URL shared
- [ ] Health endpoint shared

## CI/CD
- [ ] GitHub Actions enabled
- [ ] OIDC role configured (no AWS keys)
- [ ] Successful deployment demonstrated
- [ ] Rollback demonstrated

## Infrastructure
- [ ] Terraform state location documented (S3 + DynamoDB)
- [ ] Environment variables / secrets documented (Secrets Manager)
- [ ] RDS endpoint and rotation process documented

## Monitoring
- [ ] SNS email subscription confirmed
- [ ] Alarms list shared
- [ ] Where to check logs (CloudWatch log group) shared

## Operations
- [ ] Runbook delivered (RUNBOOK.md)
- [ ] Destroy procedure documented
- [ ] Cost notes shared (NAT + RDS are main costs)

