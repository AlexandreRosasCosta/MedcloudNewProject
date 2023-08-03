resource "aws_ecs_cluster" "main" {
  name = "cluster-ecs"

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_log_group_name = var.cloudwatch_log_group_name
      }
    }
  }
}