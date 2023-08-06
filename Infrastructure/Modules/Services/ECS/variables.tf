# Load Balancer
variable "alb_target_group" {
  type        = string
  description = "Target group for ECS"
}

variable "alb_name" {
  type        = string
  description = "ALB name for ECS service"  
}

# CloudWatch
variable "cloudwatch_log_group_name" {
  type        = string
  description = "Log group for ECS cluster"
}

variable "aws_cloudwatch_metric_alarm_cpu" {
  type        = string
  description = "CloudWatch alarm for ECS cluster CPU"
}

variable "aws_cloudwatch_metric_alarm_memory" {
  type        = string
  description = "CloudWatch alarm for ECS cluster memory"
}

# ECS
variable "container_port" {
  type        = number
  description = "Container port for ECS task definition"
}

variable "ecs_security_group" {
  type        = string
  description = "Security Group for ECS network"
}

variable "ecs_task_execution_role" {
  type        = string
  default     = "ecs_task_execution_role"
  description = "ECS task execution role name"
}

# ECR
variable "ecr_image" {
  type        = string
  description = "Image for ECS"
}

# Network
variable "public_subnets" {
  type        = list(any)
  description = "List of subnets for ECS"
}

variable "vpc_id" {
  type        = string
  description = "VPC for ECS subnets"
}

# Tags
variable "tags" {
  type        = map(string)
  description = "Tags for terraform"
}