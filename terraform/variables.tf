variable "aws_vpc_id" {
  type = string
}

variable "key_pair_name" {
  type = string
  description = "Key pair name"
  default = "taws-key-pair"
}

variable "private_key_name" {
  type = string
  description = "Private key name"
  default = "private_key.pem"
}