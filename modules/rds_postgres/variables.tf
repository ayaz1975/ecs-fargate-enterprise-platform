variable "project_name" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for DB subnet group"
}

variable "rds_sg_id" {
  type        = string
  description = "RDS security group id"
}

variable "db_name" {
  type        = string
  default     = "appdb"
}

variable "db_username" {
  type        = string
  default     = "appuser"
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "instance_class" {
  type        = string
  default     = "db.t4g.micro"
}

variable "backup_retention_period" {
  type        = number
  default     = 7
}

