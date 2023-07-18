resource "aws_instance" "myec2" {
   ami = "ami-057752b3f1d6c4d6c"
   instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}

# terraform workspace show
# terraform workspace list
# terraform workspace --help
# terraform workspace new prd
# terraform workspace new dev
# terraform plan
# terraform workspace select prd
# terraform plan
