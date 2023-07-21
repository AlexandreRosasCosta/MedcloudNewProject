resource "aws_ecr_repository" "main" {
  name = "web-application-repository"

  tags = {
    name = "ecr-web-application"
  }
}