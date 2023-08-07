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

  # backend "s3" {
  #   bucket  = "tfstate-215785215210"
  #   key     = "dev/03-data-source/terraform.tfstate"
  #   region  = "us-east-1"
  #   profile = "terraform"
  # }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
