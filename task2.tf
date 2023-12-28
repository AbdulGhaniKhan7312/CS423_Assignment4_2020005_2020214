provider "aws" {
  region = "eu-north-1"
}

resource "aws_vpc" "devops_assignment_4" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-assignment-4"
  }
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.devops_assignment_4.id
  cidr_block              = "10.0.1.0/24" // Change as needed
  availability_zone       = "eu-north-2a"   // Replace with your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "cs423-devops-public-1"
  }
}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id                  = aws_vpc.devops_assignment_4.id
  cidr_block              = "10.0.101.0/24" // Change as needed
  availability_zone       = "eu-north-2a"     // Replace with your desired AZ

  tags = {
    Name = "cs423-devops-private-1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.devops_assignment_4.id
  cidr_block              = "10.0.2.0/24" // Change as needed
  availability_zone       = "eu-north-2b"   // Replace with your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "cs423-devops-public-2"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id                  = aws_vpc.devops_assignment_4.id
  cidr_block              = "10.0.102.0/24" // Change as needed
  availability_zone       = "eu-north-2b"     // Replace with your desired AZ

  tags = {
    Name = "cs423-devops-private-2"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.devops_assignment_4.id

  tags = {
    Name = "${aws_vpc.devops_assignment_4.tags.Name}-private-route-table2
  }
}

resource "aws_route" "no_internet_access" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devops_igw.id
}

resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_assignment_4.id

  tags = {
    Name = "devops-igw"
  }
}
