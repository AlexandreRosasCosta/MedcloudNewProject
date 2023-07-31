variable "cidr_block" {
  type        = string
  description = "IP for VPC and subnets"
}

variable "container_port" {
  type        = number
  description = "Port for container traffic"
}

variable "dockerfile_source" {
  type        = string
  description = "Dockerfile for build"
}

variable "ecr_repository" {
  type        = string
  description = "Docker image"
}