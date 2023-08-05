resource "aws_ecs_cluster" "main" {
  name = "cluster-ecs"
  
  tags = merge(
    "${var.tags}",
    {
    Name      = "cluster-ecs"
    Service   = "ECS"
  })
}