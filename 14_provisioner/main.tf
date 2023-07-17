resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP access to application nginx"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform_instance" {
  ami           = "ami-0d13e3e640877b0b9"
  instance_type = "t2.micro"
  key_name      = "terraform_ec2_key"
  vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform_ec2_key.pem")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.terraform_instance.public_ip} >> public_ips.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
      "sudo yum -y remove nginx"
    ]
  }

  provisioner "local-exec" {
    when = destroy
    command = "rm public_ips.txt"
  }

  tags = {
    Name = "Welcome_to_nginx"
  }
}

