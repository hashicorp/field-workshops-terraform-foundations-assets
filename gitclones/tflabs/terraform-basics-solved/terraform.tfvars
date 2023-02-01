# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Rename or copy this file to terraform.tfvars
# Prefix must be all lowercase letters, digits, and hyphens.
# Make sure it is at least 5 characters long.

# We started your prefix.  Please set a value
prefix = "tflabs"
region = "us-east-2" # example of overriding a variables.tf setting.  This is set to us-east-1 as a default
vpc_cidr = "10.0.0.0/16"
subnet_cidr = "10.0.0.0/24"

# Set values for your "vpc_cidr", "subnet_cidr", "region" and/or "environment".
# These will override your variables.tf default values
