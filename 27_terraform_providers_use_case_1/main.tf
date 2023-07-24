resource "aws_instance" "terraform_instance" {
  ami           = "ami-0e11606aa0b434627"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "terraform_instance_2" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  provider = aws.mumbai
}