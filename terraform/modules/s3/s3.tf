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

data "aws_iam_policy_document" "allow_lambda_access" {
  statement {
    sid = "0"
    principals {
      type = "AWS"
      identifiers = [
        var.lambda_execution_role
      ]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "allow_lambda_access" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.allow_lambda_access.json
}
