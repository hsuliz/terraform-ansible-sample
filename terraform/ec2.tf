//resource "tls_private_key" "oei-key" {
//  algorithm = "RSA"
//  rsa_bits  = 4096
//}
//
//resource "aws_key_pair" "oei-key-pair" {
//  key_name   = "oei-key-pair"
//  public_key = tls_private_key.oei-key.public_key_openssh
//  provisioner "local-exec" {
//    command = "echo '${tls_private_key.oei-key.private_key_pem}' > ./myKey.pem"
//  }
//}
//
//data "aws_vpc" "this" {
//  id = var.aws_vpc_id
//}
//
//resource "aws_security_group" "server" {
//  name   = "server-sg"
//  vpc_id = data.aws_vpc.this.id
//}
//
//resource "aws_vpc_security_group_egress_rule" "server" {
//  security_group_id = aws_security_group.server.id
//
//  cidr_ipv4   = "0.0.0.0/0"
//  ip_protocol = "-1"
//}
//
//resource "aws_vpc_security_group_ingress_rule" "server_allow_ssh" {
//  security_group_id = aws_security_group.server.id
//
//  cidr_ipv4   = "0.0.0.0/0"
//  from_port   = 22
//  ip_protocol = "tcp"
//  to_port     = 22
//}
//
//resource "aws_vpc_security_group_ingress_rule" "server_allow_http" {
//  security_group_id = aws_security_group.server.id
//
//  cidr_ipv4   = "0.0.0.0/0"
//  from_port   = 80
//  ip_protocol = "tcp"
//  to_port     = 80
//}
//
//resource "aws_instance" "server" {
//  ami = "ami-0e54671bdf3c8ed8d" // Amazon Linux 2023
//  instance_type = "t2.micro"
//  key_name      = "oei-key-pair"
//
//  vpc_security_group_ids = [aws_security_group.server.id]
//}
//
//output "ec2_ip" {
//  value = aws_instance.server.public_ip
//}
//
output "ec2_ip" {
  value = "im ip address"
}
