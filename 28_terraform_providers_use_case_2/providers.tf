provider "aws" {
  region     =  "us-west-1"
}

provider "aws" {
  alias      =  "aws02"
  profile    =  "account02"
}

#  multiple resource in deifferent accounts