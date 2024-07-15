terraform {
  backend "s3" {
    bucket = "mytodoappbuckett"
    key    = "eks/terraform.tfstate"
    region = "us-east-2"
  }
}