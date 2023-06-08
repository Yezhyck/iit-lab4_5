provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "eu-north-1"
}

resource "aws_security_group" "lab6-team3-security-group" {
  name        = "lab6-team3-security-group"
  description = "Allow HTTP and SSH traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lab6-team3-security-group"
  }
}

resource "aws_instance" "lab6-team3-instance" {
  ami                         = "ami-0989fb15ce71ba39e"
  instance_type               = "t3.micro"
  key_name                    = "keyforlab4"
  vpc_security_group_ids      = [aws_security_group.lab6-team3-security-group.id]
  associate_public_ip_address = true
  user_data                   = file("user-data.sh")

  tags = {
    Name = "lab6-team3-instance"
  }
}
