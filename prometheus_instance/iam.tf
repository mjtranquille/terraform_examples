data "aws_iam_policy_document" "ec2_policy" {
    statement {
      sid = 1

      actions = [
          "ec2:DescribeInstances",
      ]

      resources = [
          "*"
      ]
    }
}

resource "aws_iam_policy" "ec2_describe_policy" {
    name = "ec2_describe_policy"
    path = "/"
    policy = data.aws_iam_policy_document.ec2_policy.json
}

resource "aws_iam_role_policy_attachment" "role_attach" {
    role = aws_iam_role.prometheus_role.name
    policy_arn = aws_iam_policy.ec2_describe_policy.arn
}


resource "aws_iam_role" "prometheus_role" {
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
    
}

resource "aws_iam_instance_profile" "prometheus_profile" {
  name = "prometheus_profile"
  role = aws_iam_role.prometheus_role.name
}

