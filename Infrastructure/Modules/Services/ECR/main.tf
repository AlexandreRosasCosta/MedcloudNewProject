resource "aws_ecr_repository" "main" {
  name = "web-application-repository"

  tags = {
    name = "ecr-web-application"
  }
}

data "aws_ecr_repository" "current" {
  name = aws_ecr_repository.main.name
}