locals {
  name = "${var.project_name}-${var.environment}"
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.name}-db-subnets"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${local.name}-db-subnets"
  }
}

resource "random_password" "db" {
  length  = 20
  special = true
  override_special = "!#$%&()*+-.:;<=>?[]^_{|}~"
}

resource "random_id" "secret_suffix" {
  byte_length = 4
}

resource "aws_secretsmanager_secret" "db" {
  name = "${local.name}/db-${random_id.secret_suffix.hex}"
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id

  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db.result
    dbname   = var.db_name
  })
}

resource "aws_db_instance" "this" {
  identifier = "${local.name}-postgres"

  engine         = "postgres"
  engine_version = "15"
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = random_password.db.result

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.rds_sg_id]
  publicly_accessible    = false

  backup_retention_period = var.backup_retention_period

  skip_final_snapshot = true

  tags = {
    Name = "${local.name}-postgres"
  }
}

