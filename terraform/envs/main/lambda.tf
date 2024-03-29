module "csv-lambda-function" {
  source = "../../modules/lambda"

  lambda_function_name = "CSVParser"
  execution_role       = module.lambda-iam.arn
  image_uri            = "${module.csv-parser.repository_url}:latest"
  description          = "A lambda function which listens for S3 create events and writes the contents of the file to a DynamoDB table"
  s3_bucket_arn        = module.storage-bucket.arn
  s3_bucket_id         = module.storage-bucket.id
  variables = {
    "DYNAMODB_TABLE" = "csv-table-store"
  }
}
