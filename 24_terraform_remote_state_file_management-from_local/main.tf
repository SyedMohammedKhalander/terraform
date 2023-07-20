resource "aws_instance" "webapp" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}