provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

data "terraform_remote_state" "vpc" {
    backend = "local"
    config = {
        path = "../project_1/terraform.tfstate"
    }
}

module "apache" {
  source  = "ExamProCo/apache-example/aws"
  version = "1.1.0"
	vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
	my_ip_with_cidr = var.my_ip_with_cidr
	public_key = var.public_key
	instance_type = var.instance_type
 	server_name = var.server_name
}

output "public_ip" {
  value = module.apache.public_ip
}