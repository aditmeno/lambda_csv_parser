resource "aws_lambda_function" "lambda" {
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

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "0"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.s3_bucket_id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}
