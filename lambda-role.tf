resource "aws_iam_role" "lambda-exec-role" {
  name = "lambda-exec-role"
  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = "sts:AssumeRole"
          Principal = {
            "Service" = "lambda.amazonaws.com"
          }
        }
      ]
    }
  )
}

resource "aws_iam_role_policy" "ec2-role" {
  role = aws_iam_role.lambda-exec-role.id
  policy = jsonencode(
    {
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "autoscaling:CompleteLifecycleAction",
            "ec2:AttachNetworkInterface",
            "ec2:CreateNetworkInterface",
            "ec2:DeleteNetworkInterface",
            "ec2:DescribeInstances",
            "ec2:DescribeNetworkInterfaces",
          ]
          Resource = "*"
        }
      ]
    }
  )
}
