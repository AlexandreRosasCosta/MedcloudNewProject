output "output_ecs_security_group" {
  value = aws_security_group.ecs_security_group.id
}

output "output_public_subnet_1a" {
  value = aws_subnet.pub-subnet-1a
}

output "output_public_subnet_1b" {
  value = aws_subnet.pub-subnet-1b
}

output "output_private_subnet_1a" {
  value = aws_subnet.priv_subnet_1a
}

output "output_private_subnet_1b" {
  value = aws_subnet.priv_subnet_1b
}

output "output_vpc" {
  value = aws_vpc.main.id
}