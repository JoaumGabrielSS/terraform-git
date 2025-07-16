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

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "Gabriel"
      managed-by = "terraform"
    }
  }
}

module "vpc" {
  source = "../Modules/VPC"
}

module "ec2" {
  source = "../Modules/EC2"

  subnet_id          = module.vpc.subnet_id
  security_group_id  = module.vpc.security_group_id

  public_key_path    = "C:/keys/aws-key.pub"
  user_data_script   = "${path.module}/script.sh"
}

output "vm_public_ip" {
  description = "IP público da instância EC2"
  value       = module.ec2.vm_ip
}
