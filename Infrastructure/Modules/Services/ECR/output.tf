output "output_repository_arn" {
  value = aws_ecr_repository.main.arn
}

output "output_repository_name" {
  value = aws_ecr_repository.main.name
}