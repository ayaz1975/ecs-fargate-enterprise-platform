variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "github_org" {
  type        = string
  description = "GitHub org/user name"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}

