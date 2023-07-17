terraform {
#   required_version = "~> 1.3.7" --> u can used this in code when u want to develop a infra in particular version so it forces 
#                                    developer install the same specific version of terraform  
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

resource "aws_instance" "myec2" {
   ami = "ami-057752b3f1d6c4d6c"
   instance_type = "t2.mdeium"
}

output "instance_public_ip" {
  value = aws_instance.myec2.public_ip
}

/*
"terraform plan --out=demopath"
terraform plan is saved in demopath
even if we change anything in .tf file we can run the terraform apply using the previous plan 
that we have saved in demopath by "terraform apply demopath"
u can se the instance type is t2.micro in file(.tf) but change it to t2.medium in .tf file and then 
 terraform apply demopath 
 u can see the t2.micro as instance_type in instance created
 */



/*
"terraform output" command
 u can get the output of any resource by tfstate file or u can u self can fetch it from the file 
 terraform output instance_public_ip
 terraform output <output_name>
 */
