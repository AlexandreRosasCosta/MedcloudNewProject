resource "aws_lb_target_group" "main" {
  name            = "application-load-balancer-tg"
  port            = var.container_port
  protocol        = "HTTP"
  target_type     = "alb"
  ip_address_type = "ipv4"
  vpc_id          = var.vpc_id
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}