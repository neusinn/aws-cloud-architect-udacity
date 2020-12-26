# TODO: Define the output variable for the lambda function.
output "lambda_function_arn" {
  description = "ARN udacity of lamda function"
  value = "${aws_lambda_function.greet_lamda.arn}"
}