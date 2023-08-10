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
    bucket         = "tfstate-215785215210"
    key            = "06-workspaces/terraform.tfstate"
    region         = "us-east-1"
    profile        = "terraform"
    dynamodb_table = "tflock-tfstate-215785215210"
  }
}

provider "aws" {
  region  = lookup(var.aws_region, local.env)
  profile = var.aws_profile
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "web:${local.env}"
    Env  = local.env
  }
}
