variable "account_id" {
  type        = string
  description = "Account ID for ECR"
}

variable "region" {
  type        = string
  description = "Region for ECR"
}

variable "dockerfile_source" {
  type        = string
  description = "Dockerfile for build"
}