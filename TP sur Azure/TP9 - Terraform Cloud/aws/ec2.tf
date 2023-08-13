provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-012cc038cc685a0d7"
  instance_type = "t2.micro"
  key_name      = "devops"
  tags = {
    Name = "ec2-eazytraining"
  }
  root_block_device {
    delete_on_termination = true
  }
}