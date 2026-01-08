variable "domain_name" {
  type        = string
  description = "Base domain (e.g. example.com)"
}

variable "record_name" {
  type        = string
  description = "Record name (e.g. api.example.com). Use full FQDN."
}

variable "create_hosted_zone" {
  type        = bool
  description = "Create Route53 hosted zone for domain_name"
  default     = false
}

variable "hosted_zone_id" {
  type        = string
  description = "Existing hosted zone id (if create_hosted_zone=false)"
  default     = ""
}
variable "create_alias_record" {
  type        = bool
  description = "Create Route53 ALIAS record to ALB"
  default     = false
}

variable "alb_dns_name" {
  type        = string
  description = "ALB DNS name"
  default     = ""
}

variable "alb_zone_id" {
  type        = string
  description = "ALB zone id"
  default     = ""
}

