output "id" {
  value       = aws_s3_bucket.bucket.id
  description = "The name of the S3 bucket"
}

output "arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
  description = "The regional domain name of the created S3 bucket"
}
