provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "myec2" {
  ami           = "ami-012cc038cc685a0d7"
  instance_type = "t2.micro"
  key_name      = "devops-dirane"
  tags = {
    Name = "ec2-dirane"
  }
  root_block_device {
    delete_on_termination = true
  }
}
