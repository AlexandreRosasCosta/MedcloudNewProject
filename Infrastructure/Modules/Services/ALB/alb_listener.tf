resource "aws_lb_target_group" "main" {
  name            = "application-load-balancer-tg"
  port            = var.container_port
  protocol        = "HTTP"
  target_type     = "ip"
  ip_address_type = "ipv4"
  vpc_id          = var.vpc_id

  lifecycle { 
    create_before_destroy=true 
  }

  health_check {
    path = "/healthcheck"
    port = 8080
    healthy_threshold = 5 
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    matcher = "200"  
  }

  tags = merge(
    "${var.tags}",
    {
      Name    = "application-load-balancer-tg"
      Service = "Application-Load-Balancer"
  })
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
  
  tags = merge(
    "${var.tags}",
    {
      Name    = "load-balancer-listener"
      Service = "Application-Load-Balancer"
  })
}