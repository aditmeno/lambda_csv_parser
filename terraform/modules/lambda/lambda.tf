resource "aws_lambda_function" "test_lambda" {
  function_name = var.lambda_function_name
  role          = var.execution_role
  image_uri     = var.image_uri
  memory_size   = var.memory_size
  package_type  = var.package_type
  description   = var.description

  environment {
    variables = var.variables
  }
}
