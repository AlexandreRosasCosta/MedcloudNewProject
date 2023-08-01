resource "aws_cloudwatch_log_group" "main" {
  name = "nodejs-log-group"

  tags = {
    name = "cloudwatch-log-group"
  }
}

