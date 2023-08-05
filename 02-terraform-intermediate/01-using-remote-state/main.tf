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

  backend "s3" {}
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

# terraform init -backend=true -backend-config="backend.hcl"
# terraform plan -var-file="dev.tfvars"
