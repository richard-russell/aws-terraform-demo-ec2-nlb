run "service_name_too_long" {
  command = plan

  variables {
    service_name = "servicenameistooolong"
    env = "dev"
  }

  expect_failures = [
    var.service_name,
  ]
}

run "service_name_too_short" {
  command = plan

  variables {
    service_name = ""
    env = "dev"
  }

  expect_failures = [
    var.service_name,
  ]
}
