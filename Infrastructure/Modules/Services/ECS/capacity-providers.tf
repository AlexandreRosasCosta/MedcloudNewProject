resource "aws_ecs_cluster_capacity_providers" "example" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 20
    weight            = 50
    capacity_provider = "FARGATE"
  }
}