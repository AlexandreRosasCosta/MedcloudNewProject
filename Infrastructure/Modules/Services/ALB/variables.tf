variable "lb_security_group" {
  type        = string
  description = "Security Group for ECS network"
}

variable "vpc_id" {
  type        = string
  description = "VPC for ECS subnets"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets for ECS"
}