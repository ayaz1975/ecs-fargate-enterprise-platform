terraform {
  backend "s3" {
    bucket         = "aaz-tfstate-636851749897-eu-north-1"
    key            = "ecs-platform/dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "aaz-tf-locks"
    encrypt        = true
  }
}

