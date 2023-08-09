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

resource "random_pet" "website" {
  length = 5
}

module "website" {
  source = "./s3_module"

  name  = random_pet.website.id
  acl   = "public-read"
  files = "${path.root}/website"

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

}
