data "aws_iam_policy_document" "bucket_policy" {
    statement {
      sid = 1

      actions = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
      ]

      resources = [
          "arn:aws:s3:::${var.bucket_name}/*"
      ]
    }
}

data "aws_iam_policy_document" "dynamodb_policy" {
    statement {
      sid = 1

      actions = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem",
      ]

      resources = [
          "arn:aws:dynamodb:*:*:${var.dynamodb_table}/*"
      ]
    }
}

resource "aws_iam_policy" "terraform_state_dynamodb_policy" {
    name = "terraform_state_dynamodb_policy"
    path = "/"
    policy = data.aws_iam_policy_document.dynamodb_policy.json
}

resource "aws_iam_policy" "terraform_state_policy" {
    name = "terraform_state_policy"
    path = "/"
    policy = data.aws_iam_policy_document.bucket_policy.json
}
