variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for ECS tasks"
}

variable "ecs_sg_id" {
  type        = string
  description = "ECS tasks security group id"
}

variable "target_group_blue_arn" {
  type        = string
  description = "ALB target group ARN (blue)"
}

variable "container_port" {
  type        = number
  description = "App container port"
  default     = 8000
}

variable "desired_count" {
  type        = number
  description = "Desired tasks count"
  default     = 1
}

variable "cpu" {
  type        = number
  description = "Fargate CPU units"
  default     = 256
}

variable "memory" {
  type        = number
  description = "Fargate memory (MiB)"
  default     = 512
}
variable "db_secret_arn" {
  type        = string
  description = "Secrets Manager ARN with DB credentials"
}

