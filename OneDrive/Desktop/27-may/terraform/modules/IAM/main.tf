resource "aws_iam_role" "test_role" {
  name = var.role

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
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

resource "aws_iam_role_policy_attachment" "roleee" {
 role = aws_iam_role.test_role.name
 policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
