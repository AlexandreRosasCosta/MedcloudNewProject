resource "aws_ecs_task_definition" "main" {
  family                   = "nodeapp-task-definition"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = "nodeapp-service"
      image     = "${var.ecr_image}:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-region        = data.aws_region.current.name
          awslogs-group         = var.cloudwatch_log_group_name
          awslogs-stream-prefix = "nodejs"
        }
      }
    }
  ])

  tags = merge(
    "${var.tags}",
    {
      Name    = "nodeapp-task-definition"
      Service = "ECS"
  })
}
