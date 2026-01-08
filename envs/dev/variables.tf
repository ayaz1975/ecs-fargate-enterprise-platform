variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}

variable "project_name" {
  type        = string
  description = "Project name prefix"
  default     = "ecs-platform"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}
variable "domain_name" {
  type        = string
  description = "Base domain (e.g. aazprojects.com)"
}

variable "record_name" {
  type        = string
  description = "Full record name (e.g. api-dev.aazprojects.com)"
}

variable "hosted_zone_id" {
  type        = string
  description = "Route53 hosted zone id for domain_name"
}

