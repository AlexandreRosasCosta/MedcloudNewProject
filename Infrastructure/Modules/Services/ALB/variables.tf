variable "lb_security_group" {
  type        = string
  description = "Security Group for ECS network"
}

variable "vpc_id" {
  type        = string
  description = "VPC for ECS subnets"
}

variable "container_port" {
  type        = number
  description = "Container port for load balancer to point to ecs service"
}

variable "public_subnets" {
  type        = list(any)
  description = "List of subnets for ECS"
}