terraform {
  required_version = ">=1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }

  backend "s3" {
    bucket = "bucket-test12213"
    key    = "aws-env/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      owner      = var.owner
      managed-by = "IaC-Terraform"
    }
  }
}

module "vpc" {
  source = "../Modules/VPC"
}

module "s3" {
  source = "../Modules/Bucket"
}

module "ec2" {
  source            = "../Modules/EC2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
  public_key_path   = var.public_key_path
  user_data_script  = "C:/keys/script.sh"
}

output "vm_public_ip" {
  description = "IP público da instância EC2"
  value       = module.ec2.vm_ip
}
