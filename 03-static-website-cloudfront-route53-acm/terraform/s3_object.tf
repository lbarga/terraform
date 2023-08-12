resource "aws_s3_object" "site" {
  bucket = aws_s3_bucket.site.id

  for_each     = fileset(local.src, "**/*")
  key          = each.value
  source       = "${local.src}/${each.value}"
  etag         = filemd5("${local.src}/${each.value}")
  content_type = lookup(local.mime_types, regex("\\.([^.]+)$", each.value)[0], null)
}
