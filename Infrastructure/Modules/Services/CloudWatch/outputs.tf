output "output_cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.main.name
}

output "output_aws_cloudwatch_metric_alarm_cpu" {
  value = aws_cloudwatch_metric_alarm.cpu_ecs_metric_alarm.alarm_name
}

output "output_aws_cloudwatch_metric_alarm_memory" {
  value = aws_cloudwatch_metric_alarm.memory_ecs_metric_alarm.alarm_name
}