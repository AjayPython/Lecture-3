terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Subnet_1"]
  }
}

resource "aws_instance" "ec2_1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.selected.id
  key_name      = "jyotisna1979"
  tags = {
    Name = "HelloWorld"
  }
}