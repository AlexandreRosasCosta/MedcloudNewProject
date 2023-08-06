# ALB target group
output "output_alb_target_group_arn" {
  value = aws_lb_target_group.main.arn
}

# ALB name
output "output_alb_name" {
  value = aws_lb.main.name
}