output "arn" {
  value       = aws_dynamodb_table.table.arn
  description = "The ARN associated with the table"
}

output "id" {
  value       = aws_dynamodb_table.table.arn
  description = "The name of the table"
}
