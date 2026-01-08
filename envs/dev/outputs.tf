output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "availability_zones" {
  value = module.vpc.availability_zones
}
output "alb_sg_id" {
  value = module.security.alb_sg_id
}

output "ecs_sg_id" {
  value = module.security.ecs_sg_id
}

output "rds_sg_id" {
  value = module.security.rds_sg_id
}
output "hosted_zone_id" {
  value = module.dns_acm.hosted_zone_id
}

output "certificate_arn" {
  value = module.dns_acm.certificate_arn
}
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "target_group_blue_arn" {
  value = module.alb.target_group_blue_arn
}

output "target_group_green_arn" {
  value = module.alb.target_group_green_arn
}

output "https_listener_arn" {
  value = module.alb.https_listener_arn
}
output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  value = module.ecs.ecs_task_definition_arn
}

output "ecs_log_group_name" {
  value = module.ecs.ecs_log_group_name
}
output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "db_secret_arn" {
  value = module.rds.db_secret_arn
}
output "codedeploy_app_name" {
  value = module.codedeploy.codedeploy_app_name
}

output "deployment_group_name" {
  value = module.codedeploy.deployment_group_name
}
output "github_actions_role_arn" {
  value = module.github_oidc.github_actions_role_arn
}

