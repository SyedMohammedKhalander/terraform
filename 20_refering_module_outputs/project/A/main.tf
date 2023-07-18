module "sgmodule" {
  source = "../../modules/sg"
}

resource "aws_instance" "web" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}

output "sg_id_output" {
  value = module.sgmodule.sg_id
}