terraform {
  backend "s3" {
    bucket = "terraform-locking-demo"
    key    = "project1/eip.tfstate"                #tfstate file is stored here 
    region = "ap-south-1"
    dynamodb_table = "terraform-locking-demo" #DynamoDB provides locking to ensure that no user runs Terraform plan or apply simultaneously, preventing conflicts during changes.
  }
}