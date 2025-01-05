resource "aws_iam_role" "oidc-role" {
  name = "oidc-role"
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRoleWithWebIdentity"
          Condition = {
            StringEquals = {
              "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            }
            StringLike = {
              "token.actions.githubusercontent.com:sub" = "repo:openn-ai/*"
            }
          }
          Effect = "Allow"
          Principal = {
            Federated = "arn:aws:iam::854955106828:oidc-provider/token.actions.githubusercontent.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
}

resource "aws_iam_role_policy" "openn-ai-management" {
  name = "openn-ai-management"
  role = aws_iam_role.oidc-role.id
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "s3:GetObject"
          Effect = "Allow"
          Resource = [
            aws_s3_bucket.openn-ai.arn,
            "${aws_s3_bucket.openn-ai.arn}/*"
          ]
        },
      ]
      Version = "2012-10-17"
    }
  )
}
