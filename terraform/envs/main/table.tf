module "csv-table-store" {
  source = "../../modules/dynamodb"

  table_name = "csv-table-store"
  hash_key   = "deviceID"
  range_key  = "deviceName"
}
