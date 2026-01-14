module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = "10.10.0.0/16"

  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.101.0/24", "10.10.102.0/24"]
}

module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  environment  = var.environment

  vpc_id   = module.vpc.vpc_id
  app_port = 8000
}

module "alb" {
  source = "../../modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  certificate_arn   = module.dns_acm.certificate_arn

  app_port          = 8000
  health_check_path = "/health"
}

module "dns_acm" {
  source = "../../modules/dns_acm"

  domain_name        = var.domain_name
  record_name        = var.record_name
  create_hosted_zone = false
  hosted_zone_id     = var.hosted_zone_id

  create_alias_record = true
  alb_dns_name        = module.alb.alb_dns_name
  alb_zone_id         = module.alb.alb_zone_id
}
module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment

  repository_name = "backend"
}
module "ecs" {
  source = "../../modules/ecs"

  project_name = var.project_name
  environment  = var.environment

  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_sg_id             = module.security.ecs_sg_id
  target_group_blue_arn = module.alb.target_group_blue_arn

  container_port = 8000
  desired_count  = 1
  cpu            = 256
  memory         = 512
  db_secret_arn  = module.rds.db_secret_arn

}
module "rds" {
  source = "../../modules/rds_postgres"

  project_name = var.project_name
  environment  = var.environment

  private_subnet_ids = module.vpc.private_subnet_ids
  rds_sg_id          = module.security.rds_sg_id

  db_name     = "appdb"
  db_username = "appuser"
}
module "codedeploy" {
  source = "../../modules/codedeploy_ecs"

  project_name = var.project_name
  environment  = var.environment

  ecs_cluster_name = module.ecs.ecs_cluster_name
  ecs_service_name = module.ecs.ecs_service_name

  listener_arn = module.alb.https_listener_arn

  target_group_blue_name  = "ecs-platform-dev-tg-blue"
  target_group_green_name = "ecs-platform-dev-tg-green"
}
module "github_oidc" {
  source = "../../modules/iam_github_oidc"

  project_name = var.project_name
  environment  = var.environment

  github_org  = "ayaz1975"
  github_repo = "ecs-fargate-enterprise-platform"

  aws_region = var.aws_region
}
module "monitoring" {
  source = "../../modules/monitoring"

  project_name = var.project_name
  environment  = var.environment

  alert_email = "mamedovayaz45@gmail.com"

  alb_arn_suffix               = module.alb.alb_arn_suffix
  target_group_blue_arn_suffix = module.alb.target_group_blue_arn_suffix

  ecs_cluster_name = module.ecs.ecs_cluster_name
  ecs_service_name = module.ecs.ecs_service_name
}

