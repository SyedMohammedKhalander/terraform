terraform {
  cloud {
    organization = "example-org-c9843e"

    workspaces {
      name = "terraform-cloud-remote"
    }
  }
}

# terraform computing is done in cloud
#  tf state file is also saved in terraform cloud