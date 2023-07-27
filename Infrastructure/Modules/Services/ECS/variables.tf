variable "ecr_repository" {
  type        = string
  description = "Repository for ECS"
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
  type        = list
  description = "List of subnets for ECS"
}