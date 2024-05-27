resource "aws_instance" "raghu" {
  ami=var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet
}
