terraform {
    required_version = "1.5.4"

    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "5.10.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
    profile = "terraform"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "bucket-terraform-lmpb"

  tags = {
    Name        = "created_at 23/07/28"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
