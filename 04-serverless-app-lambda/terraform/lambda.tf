data "archive_file" "s3" {
  type        = "zip"
  source_file = "${local.lambdas_path}/s3/index.js"
  output_path = "files/s3-artefact.zip"
}

resource "aws_lambda_function" "s3" {
  function_name = "s3"
  handler       = "index.handler"
  role          = aws_iam_role.s3.arn
  runtime       = "nodejs14.x"

  filename         = data.archive_file.s3.output_path
  source_code_hash = data.archive_file.s3.output_base64sha256

  # layers = [aws_lambda_layer_version.joi.arn]

  # environment {
  #   variables = {
  #     TOPIC_ARN = aws_sns_topic.this.arn
  #   }
  # }

  tags = local.common_tags
}
