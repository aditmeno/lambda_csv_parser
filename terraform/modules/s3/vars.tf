variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "acl_type" {
  type        = string
  description = "The acl type of the S3 bucket" #
  default     = "private"
}

variable "block_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should block public ACLs for buckets in this account"
  default     = true
}

variable "block_public_policy" {
  type        = bool
  description = "Whether Amazon S3 should block public bucket policies for buckets in this account"
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should ignore public ACLs for buckets in this account"
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether Amazon S3 should restrict public bucket policies for buckets in this account"
  default     = true
}

variable "additional_bucket_tags" {
  type        = map(string)
  description = "The tags you want to associate with the bucket"
  default     = {}
}

