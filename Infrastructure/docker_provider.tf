data "aws_ecr_repository" "service" {
  name = var.ecr_repository
}

resource "docker_image" "this" {
  name = format("%v:%v", data.aws_ecr_repository.service, formatdate("YYYY-MM-DD'T'hh-mm-ss", timestamp()))

  build {
    context = var.dockerfile_source
  }
}

resource "docker_registry_image" "this" {
  keep_remotely = true
  name          = resource.docker_image.this.name
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = local.ecr_address
    password = data.aws_ecr_authorization_token.current.password
    username = data.aws_ecr_authorization_token.current.user_name
  }
}