module "storage-bucket" {
  source = "../../modules/s3"

  bucket_name           = "csv-storage-bucket-qqzztt"
  lambda_execution_role = module.lambda-iam.arn
}
