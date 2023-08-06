# URL repository
output "output_repository_url" {
  value = aws_ecr_repository.main.repository_url
}

# Repository name
output "output_repository_name" {
  value = aws_ecr_repository.main.name
}