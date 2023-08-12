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

  backend "s3" {
    bucket  = "tfstate-215785215210"
    key     = "03-static-website/terraform.tfstate"
    region  = "us-east-1"
    profile = "terraform"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

resource "random_pet" "site" {
  length = 5
}
