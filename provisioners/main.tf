terraform {
  cloud {

    organization = "TF_003"

    workspaces {
      name = "Provisioners"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO/Fbg7Xw99EDTaDb/Xc6F6sOPG5Mu1NInRGf3bZhSkzwcruMbWzTUbmBZPw8JzUPiNN8WeRH42oq/2rl3tiUwK+uq78coy4rKIbmMPmICSGj9rKvCyNPqsXby4+BhiZZQ/mapjVX87YW7xcGS/5uwtgHQ+UZxNHAPnk284Wirc68qklQZIjskRXDGawYo5GOIrrCRapG5x58VWuZWVo5kRplyf99OMfTSPRr4yJUxlAt6Ucx2OanEno3yK0j0tExyZkC5tckQhnhKatq2rT+e5XFckRklrEbGbTl/OjWgqDlKrtu1VPz7SPy76t/sqrwZdZQ+E89l5WgzedWWRcChHFqKUev3PeeSnQxIFm4Fp9VdVbSAwGFZJE2PpWnbZGtk8dSvNPhYRfCdwssf0PQoP58tR/e0faDnrUw1dQgN6K/kzCpsm4jkLtoAE4QKDNFEEi8ihLsLi5j3MU9H8YjcpH6Vuu9DEpdBTgn7VWGkQjBaNmec/cxuHYNpPqmJ2tE= root@Harjot"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-00a929b66ed6e0de6"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.default_sg.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

data "aws_vpc" "mainvpc" {
  id = "vpc-089c3fb3edd0fab5f"
}

resource "aws_security_group" "default_sg" {
  name        = "default_sg"
  description = "allow http/ssh"
  vpc_id      = data.aws_vpc.mainvpc.id


  ingress {
    description      = "HTTP"
    protocol         = "tcp"
    from_port        = 80
    to_port          = 80
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
  ingress {
    description      = "ssh"
    protocol         = "tcp"
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["184.147.237.29/32"]
    ipv6_cidr_blocks = []
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "user_data" {
  template = file("./userdata.yaml")
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
