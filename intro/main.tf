terraform {
  cloud {

    organization = "TF_003"

    workspaces {
      name = "TF_003"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }
}