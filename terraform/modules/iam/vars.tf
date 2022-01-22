variable "name" {
  type        = string
  description = "The name associated with the IAM role"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket the lambda functions has read access to"
}

variable "policy_name" {
  type        = string
  description = "The name of the policy granting lambda function access to AWS resources"
}

variable "table_arn" {
  type        = string
  description = "The ARN of the table the lambda has access to"
}
