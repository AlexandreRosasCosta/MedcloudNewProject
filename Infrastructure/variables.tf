variable "cidr_block" {
  type        = string
  description = "IP for VPC"
}

variable "container_port" {
  type        = number
  description = "Container por for ECS task definition"
}

variable "region" {
  type = string
}