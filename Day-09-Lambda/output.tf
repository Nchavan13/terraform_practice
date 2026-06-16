output "lambda_name" {
  value = aws_lambda_function.hello_lambda.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.hello_lambda.arn
}

output "iam_role_arn" {
  value = aws_iam_role.lambda_role.arn
}