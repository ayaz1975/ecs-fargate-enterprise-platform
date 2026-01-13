variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "alert_email" {
  type = string
}

# optional inputs (for future alarms)
variable "alb_arn_suffix" {
  type    = string
  default = null
}

variable "target_group_blue_arn_suffix" {
  type    = string
  default = null
}

variable "ecs_cluster_name" {
  type    = string
  default = null
}

variable "ecs_service_name" {
  type    = string
  default = null
}
