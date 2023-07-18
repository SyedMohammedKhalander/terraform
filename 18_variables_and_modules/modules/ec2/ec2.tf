resource "aws_instance" "terraform_instance" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
