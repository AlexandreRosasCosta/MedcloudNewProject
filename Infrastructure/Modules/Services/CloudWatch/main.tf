resource "aws_cloudwatch_log_group" "main" {
  name = "cloudwatch-log-group"
}

resource "aws_cloudwatch_metric_alarm" "cpu_ecs_metric_alarm" {
  alarm_name          = "container_cpu_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 4
  metric_name         = "CPUUtilization"
  namespace           = "ECS/ContainerInsights"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors ecs container cpu utilization"
}

resource "aws_cloudwatch_metric_alarm" "memory_ecs_metric_alarm" {
  alarm_name          = "container_memory_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 4
  metric_name         = "MemoryUtilized"
  namespace           = "ECS/ContainerInsights"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors ecs container cpu utilization"
}