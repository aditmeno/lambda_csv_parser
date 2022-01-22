output "arn" {
  value       = aws_dynamodb_table.table.arn
  description = "The ARN associated with the table"
}
