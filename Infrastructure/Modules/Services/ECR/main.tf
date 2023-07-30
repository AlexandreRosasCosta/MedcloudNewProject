resource "aws_ecr_repository" "main" {
  name = "web-application-repository"

  tags = {
    name = "ecr-web-application"
  }
}

data "aws_ecr_repository" "current" {
  repository_url = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${aws_ecr_repository.main.name}"
}

resource "docker_image" "this" {
  name = format("%v:%v", data.aws_ecr_repository, formatdate("YYYY-MM-DD'T'hh-mm-ss", timestamp()))

  build {
    context = var.dockerfile_source
  }
}

resource "docker_registry_image" "this" {
  keep_remotely = true
  name          = resource.docker_image.this.name
}