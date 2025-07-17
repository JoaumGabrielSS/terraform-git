terraform {
  required_version = ">=1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }

  backend "s3" {
    bucket = "gabriel-terraform-remote-state777"
    key    = "aws-env/terraform.tfstate"
    region = "us-east-1"
  }
}
