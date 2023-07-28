resource "aws_ecs_cluster" "main" {
  name = "ecs-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "ecs_infrastructure" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_task_definition" "main" {
  family                   = "nodeapp-task-definition"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "nodeapp-service"
      image     = "${var.ecr_repository}:latest"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "nodejs_ecs_service" {
  name            = "nodejs_service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  network_configuration {
    security_groups  = [var.ecs_security_group]
    subnets          = [for subnet in var.subnets : subnet.id]
    assign_public_ip = true
  }
}

resource "aws_ecs_task_set" "main" {
  service         = aws_ecs_service.nodejs_ecs_service.id
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn

  load_balancer {
    target_group_arn = var.alb_target_group
    container_name   = "nodeapp-service"
    container_port   = 8080
  }
}
