terraform {
  # Terraform cli version
  required_version = ">= 1.6.0"
  # Backend on Terraform Cloud or Terraform Enterprise
  # comment the cloud{} block to work with local state.
  # cloud {
  #   organization = "richard-russell-org"
  #   hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io. Update with TFE hostname if required
  #   workspaces {
  #     name    = "aws-terraform-demo-ec2-nlb" //update me
  #     project = "terraform-modules"
  #   }
  # }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.aws_default_tags
  }
}