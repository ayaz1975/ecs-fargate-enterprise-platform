variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "repository_name" {
  type        = string
  description = "ECR repository name (without env prefix)"
  default     = "backend"
}

