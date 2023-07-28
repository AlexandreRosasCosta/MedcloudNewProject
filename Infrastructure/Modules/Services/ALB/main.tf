resource "aws_lb" "main" {
  name               = "ecs-load-balancer"
  load_balancer_type = "application"
  security_groups    = [var.lb_security_group]
  subnets            = [for subnet in var.subnets : subnet.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}