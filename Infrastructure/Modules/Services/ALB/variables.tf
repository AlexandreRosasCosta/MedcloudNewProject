# Load Balancer
variable "lb_security_group" {
  type        = string
  description = "Security Group for ECS network"
}

# Network
variable "vpc_id" {
  type        = string
  description = "VPC for ECS subnets"
}

variable "public_subnets" {
  type        = list(any)
  description = "List of subnets for the ECS"
}

# ECS
variable "container_port" {
  type        = number
  description = "Container port for load balancer to point to ecs service"
}

# Tags
variable "tags" {
  type        = map(string)
  description = "Tags for terraform"
}