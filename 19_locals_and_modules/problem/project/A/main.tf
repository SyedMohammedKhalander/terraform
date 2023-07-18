module "ec2" {
  source = "../../modules/sg"
  app_port = 22 # u can see the user is able to change the port in his code because of using variable
  # but the module creater doesn't want to hard code the port every where in module
  # so we come up with the locals
}

