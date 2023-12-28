provider "aws" {
  region = "eu-north-1"
}

resource "aws_key_pair" "assignment4_key" {
  key_name   = "cs423-assignment4-key"
  public_key = file("~/Desktop/CS423_Assignment4_2020005_2020214/assignment4_key.pub")
}

output "key_name" {
  value = aws_key_pair.assignment4_key.key_name
}