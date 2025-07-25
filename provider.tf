terraform {
  backend "s3" {
    bucket = "weslley-cloud-terraform"
    key = "terraform/state"
    region = "us-east-1"
    dynamodb_table = "weslley-cloud-lock-id"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }
  required_version = "~> 1.12"
}

provider "aws" {
  region = var.region
}
