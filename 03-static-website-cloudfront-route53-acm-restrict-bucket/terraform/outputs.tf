output "website-s3-url" {
  value = aws_s3_bucket_website_configuration.site.website_endpoint
}

output "website-cloudfront-url" {
  value = aws_cloudfront_distribution.cloudfront.domain_name
}
