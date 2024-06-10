terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "cutydog-organization-admin-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
