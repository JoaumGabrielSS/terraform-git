#É importante ir no main.tf e declarar a bucket que será feito o backend

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "backend_bucket" {
  description = "Nome do bucket S3 para armazenar o tfstate remoto"
  type        = string
  default     = "gabriel-terraform-remote-state777"
}

variable "owner" {
  description = "Dono dos recursos"
  type        = string
  default     = "Gabriel"
}

variable "public_key_path" {
  description = "Caminho do arquivo de chave pública para EC2"
  type        = string
  default     = "C:/Users/Lesley/Documents/Curso-gabriel/AWS-Keys/key/aws-key.pub"
}

variable "user_data_script" {
  description = "Caminho do script user-data para EC2 (Caso queira enviar um arquivo ao EC2)"
  type        = string
  default     = "C:/Users/Lesley/Documents/Curso-gabriel/Terraform/AWS-infra/Environment/script.sh"
}
