#É importante ir no main.tf e declarar a bucket que será feito o backend

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "owner" {
  description = "Dono dos recursos"
  type        = string
  default     = "Gabriel"
}

variable "public_key_path" {
  description = "Caminho do arquivo de chave pública para EC2"
  type        = string
  default     = "/opt/keys/aws-key.pub"
}
