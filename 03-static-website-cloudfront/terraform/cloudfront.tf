resource "aws_cloudfront_origin_access_identity" "origin_access" {
  comment = local.domain
}

resource "aws_cloudfront_distribution" "cloudfront" {
  enabled = true

  is_ipv6_enabled = true

  comment = "Managed by Terraform"

  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["HEAD", "GET", "OPTIONS"]

    cached_methods = ["HEAD", "GET"]

    target_origin_id = aws_s3_bucket.site.bucket_regional_domain_name

    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

  }

  origin {
    domain_name = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.site.bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access.cloudfront_access_identity_path
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = local.common_tags
}
