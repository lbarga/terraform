resource "random_pet" "bucket_policy" {
  length = 5
}

resource "aws_s3_bucket" "this" {
  bucket = var.name
  policy = var.policy
  tags   = var.tags

  #   dynamic "website" {
  #     for_each = length(keys(var.website)) == 0 ? [] : [var.website]
  #     content {
  #       index_document           = lookup(website.value, "index_document", null)
  #       error_document           = lookup(website.value, "error_document", null)
  #       redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
  #       routing_rules            = lookup(website.value, "routing_rules", null)
  #     }
  #   }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "this-configuration" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# use this to turn s3 bucket public
resource "aws_s3_bucket_policy" "this-policy" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
        ],
      },
    ],
  })
}

module "objects" {
  source = "./s3_object"

  for_each = var.files != "" ? fileset(var.files, "**") : []

  bucket = aws_s3_bucket.this.bucket
  key    = "${var.key_prefix}/${each.value}"
  src    = "${var.files}/${each.value}"
}
