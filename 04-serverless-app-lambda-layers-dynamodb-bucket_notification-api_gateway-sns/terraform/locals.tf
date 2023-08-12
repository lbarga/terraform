locals {
  lambdas_path = "${path.module}/../app/lambdas"
  layers_path  = "${path.module}/../app/layers/nodejs"
  layer_name   = "joi.zip"

  common_tags = {
    Project   = "Terraform Course"
    Service   = "Static Website"
    CreatedAt = timestamp()
    Module    = "3"
  }

  aws_account_id = data.aws_caller_identity.current.account_id
}
