data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "terraform-locking-demo"
    key    = "project1/eip.tfstate"
    region = "ap-south-1"
    }
  }