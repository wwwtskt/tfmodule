resource "aws_ecs_cluster" "this" {
  name = "${var.cluster_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "${var.cluster_name}-cluster"
  }
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}


resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/aws/ecs/${var.cluster_name}"
  retention_in_days = var.log_retention_days

  tags = {
    Name = "${var.cluster_name}-ecs-logs"
  }
}