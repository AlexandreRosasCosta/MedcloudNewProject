resource "aws_ecs_cluster" "main" {
  name = "ecs-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "ecs_infrastructure" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 20
    weight            = 50
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
      image     = "${var.image}:latest"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          aws-logs-region       = var.region
          awslogs-group         = var.cloudwatch-log-group
          awslogs-stream-prefix = "nodejs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "nodejs_ecs_service" {
  name            = "nodejs-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn

  load_balancer {
    container_name   = "nodeapp-service"
    container_port   = var.container_port
    target_group_arn = var.alb_target_group
  }

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
}
