resource "aws_s3_bucket" "bucket_api_resources" {
  bucket = lower("${var.project_name}-${var.project_environment}")
  tags = {
    project = var.project_name
    environment = var.project_environment
  }
}

resource "aws_s3_bucket_cors_configuration" "bucket_api_cors" {
  bucket = aws_s3_bucket.bucket_api_resources.id

  cors_rule {
    allowed_headers = [
      "*",
    ]
    allowed_methods = [
      "GET",
      "HEAD",
      "POST",
    ]
    allowed_origins = [
      var.site_domain
    ]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_public_access_block" "allow_public_access_bucket_policy" {
  bucket = aws_s3_bucket.bucket_api_resources.id

  block_public_acls = false
  ignore_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
}
