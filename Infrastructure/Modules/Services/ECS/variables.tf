variable "ecr_repository" {
  type        = string
  description = "Repository for ECS"
}

variable "ecs_security_group" {
  type        = string
  description = "Security Group for ECS network"
}

variable "subnets" {
  type        = map(string)
  description = "Subnets for ECS"
}

variable "ecs_task_execution_role" {
  default     = "ecs_task_execution_role"
  description = "ECS task execution role name"
}