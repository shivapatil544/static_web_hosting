terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "my_s3_module" {
  source        = "./s3_module"
  bucket_name   = var.input_bucket_name
  bucket_acl    = var.input_bucket_acl
  policy_path   = var.input_policy_path
  html_css_path = var.input_html_css_path
}
