resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl_type

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = merge(tomap({ "Name" = var.bucket_name }), var.additional_bucket_tags)
}

resource "aws_s3_bucket_public_access_block" "bucket_private_acl" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
