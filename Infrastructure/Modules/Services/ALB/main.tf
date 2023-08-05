resource "aws_lb" "main" {
  name               = "ecs-load-balancer"
  load_balancer_type = "application"
  security_groups    = [var.lb_security_group]
  subnets            = [for subnet in var.public_subnets : subnet.id]

  tags = merge(
    "${var.tags}",
    {
      Name    = "ecs-load-balancer"
      Service = "Application-Load-Balancer"
  })
}