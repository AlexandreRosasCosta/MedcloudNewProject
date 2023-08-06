# Network
variable "cidr_block" {
  type        = string
  description = "IP for VPC"
}

# ECS
variable "container_port" {
  type        = number
  description = "Container por for ECS task definition"
}

# Provider
variable "region" {
  type = string
}