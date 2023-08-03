locals {
  ip_filepath = "ips.json"

  commom_tags = {
    Service     = "my-super-service"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "me"
  }
}
