// Resources Terraform AWS Lambda resource: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function


    provider "aws" {
        access_key = "XXX"
        secret_key = "XXX"
        region = var.aws_region
    }

# IAM
resource "aws_iam_role" "iam_for_lambda" {
    name = "iam_for_lambda"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": { "Service": "lambda.amazonaws.com" },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

# This is to optionally manage the CloudWatch Log Group for the Lambda Function.
# If skipping this resource configuration, also add "logs:CreateLogGroup" to the IAM policy below.
resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/greet_lambda"
  retention_in_days = 14
}

# policy for logging
resource "aws_iam_policy" "lambda_logging" {
    name        = "lambda_logging"
    path        = "/"
    description = "IAM policy for logging lambda"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}


data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "greet_lambda.zip"
  source_file = "greet_lambda.py"
}


resource "aws_iam_role_policy_attachment" "lambda_logs" {
    role       = aws_iam_role.iam_for_lambda.name
    policy_arn = aws_iam_policy.lambda_logging.arn
}


# Lambda function definition
resource "aws_lambda_function" "greet_lambda" {
    handler       = "greet_lambda.lambda_handler"
    function_name = "greet_lambda"
    role          = aws_iam_role.iam_for_lambda.arn
    
    runtime       = "python3.6"
    filename      = "greet_lambda.zip"

    depends_on = [
        aws_iam_role_policy_attachment.lambda_logs,
        aws_cloudwatch_log_group.example,
    ]

    environment {
        variables = {
        greeting = "Namaste"
        }
    }
}

