locals {
  common_tags = {
    Project   = "Terraform Course"
    Service   = "Static Website"
    CreatedAt = timestamp()
    Module    = "3"
  }
}
