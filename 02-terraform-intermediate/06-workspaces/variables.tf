variable "aws_region" {
  description = "AWS region where the resources will be created"

  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "us-east-1"
    prod = "us-east-1"
  }
}

variable "aws_profile" {
  description = ""

  default = "terraform"
}

variable "instance" {
  description = "Instance configuration per workspace"

  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })
    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-08a52ddb321b32a8c"
      type   = "t3.micro"
      number = 1
    }
    prod = {
      ami    = "ami-0ff8a91507f77f867"
      type   = "t3.medium"
      number = 3
    }
  }
}
