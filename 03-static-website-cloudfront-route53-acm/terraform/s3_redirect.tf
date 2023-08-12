resource "aws_s3_bucket" "www_site" {
  bucket = "www.${local.domain}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "www_site" {
  depends_on = [aws_s3_bucket.www_site]

  bucket = aws_s3_bucket.www_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "www_site" {
  depends_on = [aws_s3_bucket.www_site, aws_s3_bucket_public_access_block.www_site]

  bucket = aws_s3_bucket.www_site.id

  redirect_all_requests_to {
    host_name = aws_s3_bucket_website_configuration.site.website_endpoint
  }
}


resource "aws_s3_bucket_policy" "redirect_policy" {
  depends_on = [aws_s3_bucket.www_site, aws_s3_bucket_public_access_block.www_site, aws_s3_bucket_website_configuration.www_site]

  bucket = aws_s3_bucket.www_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.www_site.arn,
          "${aws_s3_bucket.www_site.arn}/*",
        ]
      },
    ]
  })
}
