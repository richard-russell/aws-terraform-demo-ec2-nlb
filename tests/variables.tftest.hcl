
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "variables_validation" {
  assert {
    condition     = var.aws_region == "eu-west-1"
    error_message = "incorrect AWS region"
  }

  assert {
    condition     = var.env == ""
    error_message = "incorrect environment name"
  }
}