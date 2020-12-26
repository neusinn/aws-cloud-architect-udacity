//Run: terraform plan -var-file="secrets.tfvars"
variable "instance_count" {
  description = "Number of ec2 instances to create"
  type = number
}

variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "eu-central-1"
}

resource "aws_instance" "ud-tf-example" {
  ami = "ami-0bd39c806c2335b95"
  instance_type = "t2.micro"
  count = var.instance_count
  tags = {
    "name" = "ud-tf-ex1"
    "env" = "dev"
  }
}
