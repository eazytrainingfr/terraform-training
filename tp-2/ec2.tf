provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0083662ba17882949"
  instance_type = "t2.micro"
  key_name      = "devops-dirane"
  tags = {
    Name = "ec2-dirane"
  }
}
