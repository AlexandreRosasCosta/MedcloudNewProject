resource "aws_ecr_repository" "main" {
  name = "web-application-repository"
 
  tags = merge(
    "${var.tags}",
    {
      Name    = "web-application-repository"
      Service = "Elastic-Container-Registry"
  })
}
