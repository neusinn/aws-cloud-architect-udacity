//Run: terraform plan -var-file="secrets.tfvars"

# TODO: Designate a cloud provider, region, and credentials
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity-t2" {
  ami = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  count = 4
  tags = {
    Name = "Udacity T2"
  }
  subnet_id = "subnet-0cd08336cbdef86af"
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacity-m4" {
  ami = "ami-0be2609ba883822ec"
  instance_type = "m4.large"
  count = 0
  tags = {
    Name = "Udacity M4"
  }
  subnet_id = "subnet-0cd08336cbdef86af"
}