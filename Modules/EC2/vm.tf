resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file(var.public_key_path)
}

data "template_file" "user_data" {
  template = file(var.user_data_script)
}

resource "aws_instance" "vm" {
  ami                         = "ami-020cba7c55df1f615"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered

  tags = {
    Name = "vm-terraform"
  }
}