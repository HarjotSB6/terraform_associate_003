locals {
  project_name = "Harjot"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00a929b66ed6e0de6"
  instance_type = var.instance_type

  tags = {
    Name = "ExampleAppServerInstance-${local.project_name}"
  }
}
