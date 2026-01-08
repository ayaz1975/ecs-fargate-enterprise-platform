variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "ecs_service_name" {
  type        = string
  description = "ECS service name"
}

variable "listener_arn" {
  type        = string
  description = "ALB HTTPS listener ARN"
}

variable "target_group_blue_name" {
  type        = string
  description = "Blue target group name"
}

variable "target_group_green_name" {
  type        = string
  description = "Green target group name"
}

