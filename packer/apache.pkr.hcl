packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_id" {
  default = "ami-00a929b66ed6e0de6"
  type        = string
}
locals {
    app_name = "apache"
}

source "amazon-ebs" "httpd" {
  ami_name      = "my-apache-server-${local.app_name}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = var.ami_id
  ssh_username  = "ec2-user"
  tags = {
    Name = local.app_name
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}