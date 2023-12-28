provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_user" "terraform_user" {
  name = "terraform-cs423-devops"
}

resource "aws_iam_user_policy_attachment" "attach_admin_policy" {
  user       = aws_iam_user.terraform_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "terraform_user_access_key" {
  user = aws_iam_user.terraform_user.name
}

output "terraform_user_access_key_id" {
  value = aws_iam_access_key.terraform_user_access_key.id
}