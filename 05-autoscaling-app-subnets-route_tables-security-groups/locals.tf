locals {
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }

  common_tags = {
    Project   = "Terraform Course"
    Service   = "Static Website"
    CreatedAt = "August/2023"
    Module    = "3"
  }
}
