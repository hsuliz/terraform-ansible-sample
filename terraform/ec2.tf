resource "tls_private_key" "server" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "server" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.server.public_key_openssh
  provisioner "local-exec" {
    command = "echo '${ tls_private_key.server.private_key_pem }' > '${ var.private_key_name }'"
  }
}

data "aws_vpc" "this" {
  id = var.aws_vpc_id
}

resource "aws_security_group" "server" {
  name   = "server-sg"
  vpc_id = data.aws_vpc.this.id
}

resource "aws_vpc_security_group_egress_rule" "server" {
  security_group_id = aws_security_group.server.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "server_allow_ssh" {
  security_group_id = aws_security_group.server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "server_allow_http" {
  security_group_id = aws_security_group.server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_instance" "server" {
  ami = "ami-0e54671bdf3c8ed8d" // Amazon Linux 2023
  instance_type = "t2.micro"
  key_name      = aws_key_pair.server.key_name
  vpc_security_group_ids = [aws_security_group.server.id]
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${ path.module }/templates/inventory.tftpl", {
    ec2_public_ip                = aws_instance.server.public_ip
    ansible_ssh_private_key_file = var.private_key_name
  })
  filename = "inventory"
}
