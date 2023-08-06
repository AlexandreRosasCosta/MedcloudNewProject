resource "aws_ecs_cluster" "main" {
  name = "cluster-ecs"
  
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  
  tags = merge(
    "${var.tags}",
    {
    Name      = "cluster-ecs"
    Service   = "ECS"
  })
}