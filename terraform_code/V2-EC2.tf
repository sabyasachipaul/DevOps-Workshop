provider "aws" {
 region = "us-east-1"
 
}
resource "aws_instance" "demo-server"{
    ami = "ami-07860a2d7eb515d9a"
    instance_type = "t3.micro"
    key_name = "dpp"
    security_groups = ["demo-sg"]
}
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"
 // vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Shh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   // ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}