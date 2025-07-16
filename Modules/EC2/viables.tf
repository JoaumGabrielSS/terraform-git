variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "public_key_path" {
  description = "Caminho do arquivo .pub para criar a key pair"
  type        = string
}

variable "user_data_script" {
  description = "Caminho para o script de instalação do NGINX"
  type        = string
}