resource "docker_image" "nodejs_image" {
  name = "${var.ecr_repository}:latest"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = local.ecr_address
    password = data.aws_ecr_authorization_token.current.password
    username = data.aws_ecr_authorization_token.current.user_name
  }
}