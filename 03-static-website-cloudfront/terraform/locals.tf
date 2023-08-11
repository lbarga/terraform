locals {
  # static
  bucket_name = random_pet.site.id
  src         = "../${path.root}/website/build"
  mime_types  = jsondecode(file("./mime.json"))

  # cloudfront
  # domain               = local.has_domain ? var.domain : random_pet.site.id
  domain               = random_pet.site.id
  service              = var.service
  stage                = var.stage
  resource_prefix_name = "${var.service}-${var.stage}"
  cdn_domain           = var.cdn_domain
  # route53_private_zone = var.route53_private_zone
  # route53_base_domain  = var.route53_zone_domain

  common_tags = {
    Project   = "Terraform Course"
    Service   = "Static Website"
    CreatedAt = timestamp()
    Module    = "3"
  }
}

# Get AWS Account ID
data "aws_caller_identity" "current" {}

# Get Route53 Zone
# data "aws_route53_zone" "domain_zone" {
#   name         = "${local.route53_base_domain}."
#   private_zone = local.route53_private_zone
# }
