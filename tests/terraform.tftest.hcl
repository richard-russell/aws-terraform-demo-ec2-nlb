
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "terraform_validation" {
  assert {
    condition     = terraform.required_version == ">= 1.6.0"
    error_message = "incorrect required version"
  }

  assert {
    condition     = provider.aws.region == var.aws_region
    error_message = "incorrect AWS region"
  }
}