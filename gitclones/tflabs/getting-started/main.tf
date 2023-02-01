# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

/*
  Providers are going to be configured with different parameters based on the
  resources that it will be configurating.  Below we have an example of what the
  provider resource block would look like for AWS
*/

/*
  AWS provider reference documentation
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
*/

provider "aws" {
 # Region is a required parameter
 # Define 'us-east-2' as the region
}

/*  
  Blocks - A container for other content
  The example below has a type of "resource".  Each block type has a determined
  number of labels that follow the type keyword.  The block body is delimited
  by bracket { and } characters.  The block body will contain further arguments
  and blocks may be nested.  Referring to the blocks documentation for required
  and optional arguments would be required 

  In the example below we are creating an AWS VPC.  Here would be the documentation
  on the resource.

  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

  In the documentation it states that only the `cidr_block` argument is required.
  There are many other arguments that can be used to further customize your VPC
  configuration.  For example, we added additional resource tags to this VPC and
  we also enable DNS hostnames, which is disabled by default
*/

resource "aws_vpc" "tflabs" {
  # Fill in the required parameters
  # Reference the notes and URL above for syntax
}
