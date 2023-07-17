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

resource "aws_instance" "taint_instance" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"
  count = 2
  tags = {
    Name = "HelloWorld${count.index}"
  }
}
/*
to replace delete the old and replace it by new because have done manual changes on resource
terraform apply -replace="aws_instance.taint_instance[0]" -replace="aws_instance.taint_instance[1]"
if only single resource terraform apply -replace="aws_instance.taint_instance"
*/

output "ip" {
  value = aws_instance.taint_instance[*].public_ip
  
}
# in output block * is the splat expression which is used to indicate all 
