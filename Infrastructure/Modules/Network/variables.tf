variable "cidr_block" {
  type        = string
  description = "IP for VPC"
}

variable "tags" {
  type        = map(string)
  description = "Tags for terraform"
}