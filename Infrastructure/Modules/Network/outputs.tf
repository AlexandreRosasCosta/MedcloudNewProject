# Security Group
output "output_ecs_security_group" {
  value = aws_security_group.ecs_security_group.id
}


# ALB Security group
output "output_application_lb_security_group" {
  value = aws_security_group.application_lb_security_group.id
}


# Subnets
output "output_public_subnet_1a" {
  value = aws_subnet.public_subnet_1a
}

output "output_public_subnet_1b" {
  value = aws_subnet.public_subnet_1b
}

output "output_private_subnet_1a" {
  value = aws_subnet.private_subnet_1a
}

output "output_private_subnet_1b" {
  value = aws_subnet.private_subnet_1b
}


# VPC
output "output_vpc" {
  value = aws_vpc.main.id
}