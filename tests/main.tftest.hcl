
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  service_name = "test-service"
  env = "test-env"
}

run "attributes_validation" {
  assert {
    condition     = local.service_name == "test-service-test-env"
    error_message = "incorrect service name"
  }

  assert {
    condition     = aws_vpc.default.cidr_block == "10.0.0.0/16"
    error_message = "incorrect VPC CIDR block"
  }

  assert {
    condition     = aws_internet_gateway.default.vpc_id == aws_vpc.default.id
    error_message = "incorrect VPC ID for internet gateway"
  }

  assert {
    condition     = aws_route.internet_access.route_table_id == aws_vpc.default.main_route_table_id
    error_message = "incorrect route table ID for internet access"
  }

  assert {
    condition     = aws_route.internet_access.gateway_id == aws_internet_gateway.default.id
    error_message = "incorrect gateway ID for internet access"
  }

  assert {
    condition     = aws_subnet.instance.vpc_id == aws_vpc.default.id
    error_message = "incorrect VPC ID for instance subnet"
  }

  assert {
    condition     = aws_subnet.lb.vpc_id == aws_vpc.default.id
    error_message = "incorrect VPC ID for lb subnet"
  }

  assert {
    condition     = aws_security_group.instance.vpc_id == aws_vpc.default.id
    error_message = "incorrect VPC ID for security group"
  }

  assert {
    condition     = aws_instance.webserver.ami == data.aws_ami.amazon-2.id
    error_message = "incorrect AMI for webserver instance"
  }

  # assert {
  #   condition     = aws_instance.webserver.vpc_security_group_ids[0] == aws_security_group.instance.id
  #   error_message = "incorrect security group ID for webserver instance"
  # }

  assert {
    condition     = aws_instance.webserver.subnet_id == aws_subnet.instance.id
    error_message = "incorrect subnet ID for webserver instance"
  }

  # assert {
  #   condition     = aws_lb.lb.subnets[0] == aws_subnet.lb.id
  #   error_message = "incorrect subnet ID for load balancer"
  # }

  assert {
    condition     = aws_lb_listener.tcp_http.load_balancer_arn == aws_lb.lb.arn
    error_message = "incorrect load balancer ARN for listener"
  }

  assert {
    condition     = aws_lb_target_group.tcp_http.vpc_id == aws_vpc.default.id
    error_message = "incorrect VPC ID for target group"
  }

  assert {
    condition     = aws_lb_target_group_attachment.tcp_http.target_group_arn == aws_lb_target_group.tcp_http.arn
    error_message = "incorrect target group ARN for attachment"
  }

  assert {
    condition     = aws_lb_target_group_attachment.tcp_http.target_id == aws_instance.webserver.id
    error_message = "incorrect target ID for attachment"
  }
}