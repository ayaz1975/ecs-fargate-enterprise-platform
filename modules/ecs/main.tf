locals {
  name = "${var.project_name}-${var.environment}"
}

resource "aws_ecs_cluster" "this" {
  name = "${local.name}-cluster"
}

resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${local.name}"
  retention_in_days = 14
}

