# Copyright (c) Çetin ARDAL
# SPDX-License-Identifier: MIT

locals {
  formatted_timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
}

variable "aws_default_tags" {
  type        = map(string)
  description = "a set of tags to watermark the resources you deployed with Terraform."
  default = {
    owner       = "richard" // update me
    terraformed = "Do not edit manually."
  }
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = ""
}

variable "service_name" {
  description = "Name of the service to be created by the module"

  validation {
    condition     = length(var.service_name) < 20
    error_message = "Service Name must be no longer than 20 characters (is ${length(var.service_name)})"
  }
  validation {
    condition     = length(var.service_name) > 0
    error_message = "Service Name must be 1 or more characters (is ${length(var.service_name)})"
  }
}