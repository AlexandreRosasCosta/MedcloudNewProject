variable "image" {
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

variable "vpc_id" {
  type        = string
  description = "VPC for ECS subnets"
}

variable "subnets" {
  type        = list(any)
  description = "List of subnets for ECS"
}

variable "alb_target_group" {
  type        = string
  description = "Target group for ECS"
}

variable "container_port" {
  type        = string
  description = "Container port for ECS task definition"
}

variable "region" {
  type        = string
  description = "Region for container definition"
}

variable "cloudwatch-log-group" {
  type        = string
  description = "Log group for container definition"
}