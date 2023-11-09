resource "aws_s3_bucket" "CRC" {
  bucket = "zachhanleycloudresumechallenge2023"
}

resource "aws_s3_bucket_website_configuration" "CRCWEB" {
  bucket = aws_s3_bucket.CRC.id

  index_document {
    suffix = "resume.html"
  }

  error_document {
    key = "error.html"
  }
   tags = {
    Name        = "CloudResumeChallenge"
    Owner       = "Terraform"
  }
}
resource "aws_s3_bucket_public_access_block" "BlockPublic" {
  bucket = aws_s3_bucket.CRC.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}