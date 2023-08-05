terraform {
  required_version = "1.5.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

# used to get informations from the current aws account similar to HTTP GET
data "aws_caller_identity" "current" {}

# used to push informations from the current aws account similar to HTTP POST
resource "aws_s3_bucket" "remote_state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  # WARNING DEPRECATED
  #   versioning {
  #     enabled = true
  #   }

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "lmpb"
    CreatedAt   = timestamp()
  }
}

resource "aws_s3_bucket_versioning" "remote_state" {
  bucket = aws_s3_bucket.remote_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote_state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote_state.arn
}
