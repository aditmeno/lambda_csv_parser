resource "aws_dynamodb_table" "table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key

  attribute {
    name = var.hash_key
    type = "N"
  }

  attribute {
    name = var.range_key
    type = "S"
  }

  tags = merge(tomap({ "Name" = var.table_name }), var.additional_table_tags)
}
