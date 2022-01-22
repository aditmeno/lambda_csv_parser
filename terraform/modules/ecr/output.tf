output "repository_url" {
  value       = aws_ecr_repository.repository.repository_url
  description = "The URI associated with the ECR repository"
}
