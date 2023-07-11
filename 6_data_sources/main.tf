terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

data "aws_ami" "example" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "Description"
    values = ["Amazon Linux 2023 AMI 2023.1.20230705.0 x86_64 HVM kernel-6.1"]
  }
}

resource "aws_instance" "data_sources" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

