resource "aws_lambda_function" "openn-ai-lambda" {
  function_name = "openn-ai-lambda"
  s3_bucket = aws_s3_bucket.openn-ai.id
  s3_key = "lambda/hello.zip"

  runtime = "python3.12"
  handler = "hello.lambda_handler"

  role = aws_iam_role.lambda-exec-role.arn

  vpc_config {
    security_group_ids = [
      aws_security_group.openn-ai-sg.id
    ]
    subnet_ids = [
      aws_subnet.openn-ai-subnet-pub-1a.id,
      aws_subnet.openn-ai-subnet-pub-1b.id
    ]
  }
}
