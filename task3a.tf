provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instances"

  vpc_id = aws_vpc.devops_vpc.id

  // Inbound rule allowing HTTP (Port 80) access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic by default
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict if required 
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  #IP access avalible for myself from anaywhere and also for 2020447
  }

}
