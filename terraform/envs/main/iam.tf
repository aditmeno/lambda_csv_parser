module "lambda-iam" {
  source = "../../modules/iam"

  name        = "lambda-role"
  policy_name = "lambda-policy"
  bucket_name = module.storage-bucket.id
  table_arn   = module.csv-table-store.arn
}
