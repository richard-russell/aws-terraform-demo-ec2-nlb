# mock_provider "aws" {}

variables {
  service_name = "test-service"
  env = "test-env"
}

override_data {
  target = data.http.this
  values = {
    status_code = 401
  }
}

run "override_return_code" {
  expect_failures = [
    check.response
  ]
}