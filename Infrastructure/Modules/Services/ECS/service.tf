resource "aws_ecs_service" "nodejs_ecs_service" {
  name            = "nodejs-service"
  cluster         = aws_ecs_cluster.main.arn
  task_definition = aws_ecs_task_definition.main.arn
  launch_type     = "FARGATE"
  desired_count   = 2

  load_balancer {
    container_name   = "nodeapp-service"
    container_port   = var.container_port
    target_group_arn = var.alb_target_group
  }

  network_configuration {
    security_groups  = [var.ecs_security_group]
    subnets          = [for subnet in var.public_subnets : subnet.id]
    assign_public_ip = true
  }

  alarms {
    enable   = true
    rollback = true
    alarm_names = [
      "${var.aws_cloudwatch_metric_alarm_cpu}",
      "${var.aws_cloudwatch_metric_alarm_memory}"
    ]
  }

  tags {
    Name      = "nodejs-service"
    Project   = "ECS project"
    CreatedAt = "2023-08-04"
    Owner     = "Alexandre Rosas Costa"
    Service   = "ECS"
  }
}

