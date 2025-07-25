terraform {
  backend "s3" {
    bucket = var.bucket_tf_state
    key = "terraform/state"
    region = var.region
    dynamodb_table = var.ddb_lock_id
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
