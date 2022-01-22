terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = ""
    key            = ""
    dynamodb_table = ""
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.34.0"
    }
  }
}
