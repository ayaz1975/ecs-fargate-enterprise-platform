variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}

variable "tfstate_bucket_name" {
  type        = string
  description = "Unique S3 bucket name for Terraform state"
}

variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB table name for Terraform state locking"
  default     = "aaz-tf-locks"
}

