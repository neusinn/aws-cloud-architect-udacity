provider "aws" {
  access_key = "AKIAJWZY77MTMSEJNT2Q"
  secret_key = "JBxexqbA6TcF/BfuFJYybY8cIrWmkgFXZNwlyUpT"
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami = "ami-0bd39c806c2335b95"
  instance_type = "t2.micro"
}
