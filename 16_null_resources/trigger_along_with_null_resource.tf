resource "aws_instance" "terraform_instance" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"
  count = 0
  tags = {
    Name = "HelloWorld"
  }
}

resource "null_resource" "ip_check" {
 triggers = {
    latest_ips = join(",", aws_instance.terraform_instance[*].public_ip)
  }
 provisioner "local-exec" {

    command = "echo Latest IPs are ${null_resource.ip_check.triggers.latest_ips} > sample.txt"
  }
}