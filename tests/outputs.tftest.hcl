
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  service_name = "test-service"
  env = "test-env"
}

run "outputs_validation" {
  assert {
    condition     = output.server_url == "http://${aws_instance.webserver.public_ip}"
    error_message = "incorrect server URL"
  }

  assert {
    condition     = output.lb_url == "http://${aws_lb.lb.dns_name}"
    error_message = "incorrect load balancer URL"
  }
}