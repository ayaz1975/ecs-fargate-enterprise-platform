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

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for ALB"
}

variable "alb_sg_id" {
  type        = string
  description = "ALB security group id"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS listener"
}

variable "app_port" {
  type        = number
  description = "Backend port for target group"
  default     = 8000
}

variable "health_check_path" {
  type        = string
  description = "Health check path"
  default     = "/health"
}

