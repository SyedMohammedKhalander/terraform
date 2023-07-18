module "ec2" {
  source = "../../modules/sg"
  app_port = 22 
}

# u can see that app_port variable doesn't effect the module's sg ports

