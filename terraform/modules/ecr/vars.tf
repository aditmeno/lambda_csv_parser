variable "name" {
  type        = string
  description = "Name of the ECR Repository"
}

variable "encryption_type" {
  type        = string
  description = "The encryption algorithm used to encrypt and store the images"
  default     = "AES256"
}

variable "image_tag_mutability" {
  type        = string
  description = "A flag which decides if images can be overwritten"
  default     = "MUTABLE"
}

variable "scan_on_push" {
  type        = bool
  description = "Boolean flag which decides if images should be scanned for vulnerabilities"
  default     = true
}
