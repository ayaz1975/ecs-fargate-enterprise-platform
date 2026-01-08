variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/stage/prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "app_port" {
  type        = number
  description = "Backend container port"
  default     = 8000
}

