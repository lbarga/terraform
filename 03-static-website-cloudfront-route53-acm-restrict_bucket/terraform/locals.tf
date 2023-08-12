locals {
  domain = "develop777.com"

  src        = "../${path.root}/website/build"
  mime_types = jsondecode(file("./mime.json"))

  common_tags = {
    Project   = "Terraform Course"
    Service   = "Static Website"
    CreatedAt = timestamp()
    Module    = "3"
  }
}
