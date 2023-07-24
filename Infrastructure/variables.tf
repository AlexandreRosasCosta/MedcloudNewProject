variable "cidr_block" {
  type        = string
  description = "IP for VPC and subnets"
}

variable "region" {
  type        = string
  description = "Region for project"
  default     = "us-east-1"
}