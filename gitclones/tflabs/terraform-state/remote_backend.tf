# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "UpdateThisWithYourOrgName"

    workspaces {
      name = "tflabs"
    }
  }
}