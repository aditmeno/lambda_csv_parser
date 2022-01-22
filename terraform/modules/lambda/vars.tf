variable "lambda_function_name" {
  type        = string
  description = "The of the lambda function"
}

variable "execution_role" {
  type        = string
  description = "The IAM role associated with the lambda function"
}

variable "image_uri" {
  type        = string
  description = "The ECR repository URL where the lambda function is hosted"
}

variable "memory_size" {
  type        = string
  description = "The amount of memory allocated to the function"
  default     = "128"
}

variable "package_type" {
  type        = string
  description = "The format of the asset used by the lambda fucntion"
  default     = "Image"
}

variable "description" {
  type        = string
  description = "The description associated with the lambda function"
}

variable "variables" {
  type        = map(string)
  description = "The environment variables made available to the fucntion"
}

variable "s3_bucket_arn" {
  type        = string
  description = "The ARN of S3 bucket triggerign the lambda"
}

variable "s3_bucket_id" {
  type        = string
  description = "The ID of S3 bucket triggerign the lambda"
}
