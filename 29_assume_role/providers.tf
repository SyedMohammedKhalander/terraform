provider "aws" {
  region     =  "us-west-1"
  assume_role {
    role_arn = "arn://"
    session_name = "dummy_name"
  }
}