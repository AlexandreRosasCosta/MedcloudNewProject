resource "aws_cloudwatch_log_group" "main" {
  name = "nodejs-log-group"

  tags = {
    name = "cloudwatch-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "main" {
  name           = "log-stream-cloudwatch"
  log_group_name = aws_cloudwatch_log_group.main.name
}