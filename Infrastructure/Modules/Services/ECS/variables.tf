variable "alb_target_group" {
  type        = string
  description = "Target group for ECS"
}

variable "cloudwatch_log_group_name" {
  type        = string
  description = "Log group for ECS cluster"
}

variable "container_port" {
  type        = number
  description = "Container port for ECS task definition"
}

variable "ecr_image" {
  type        = string
  description = "Image for ECS"
}

variable "ecs_security_group" {
  type        = string
  description = "Security Group for ECS network"
}

variable "ecs_task_execution_role" {
  default     = "ecs_task_execution_role"
  description = "ECS task execution role name"
}

variable "public_subnets" {
  type        = list(any)
  description = "List of subnets for ECS"
}

variable "vpc_id" {
  type        = string
  description = "VPC for ECS subnets"
}

variable "aws_cloudwatch_metric_alarm_cpu" {
  type        = string
  description = "CloudWatch alarm for the ECS service"
}

variable "aws_cloudwatch_metric_alarm_memory" {
  type        = string
  description = "CloudWatch alarm for the ECS service"
}

variable "tags" {
  type        = map(string)
  description = "Tags for terraform"
}