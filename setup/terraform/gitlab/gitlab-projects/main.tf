# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

//Gitlab Projects
provider "gitlab" {
    base_url = "http://${var.GITLAB_PUBLIC_ADDRESS}/api/v4"
}

resource "gitlab_group" "networkteam" {
  name        = "Network Team"
  path        = "Network-Team"
  visibility_level = "public"
}

resource "gitlab_project" "terraform-aws-webapp-networking" {
  name         = "Terraform AWS WebApp Networking"
  namespace_id = gitlab_group.networkteam.id
  visibility_level = "public"
}

resource "gitlab_group" "devteam" {
  name        = "Development Team"
  path        = "Development-Team"
  visibility_level = "public"
}

resource "gitlab_project" "hashicat-aws" {
  name         = "HashiCat AWS"
  namespace_id = gitlab_group.devteam.id
  visibility_level = "public"
}

resource "gitlab_group" "tflabs" {
  name        = "Terraform Labs"
  path        = "Terraform-Labs"
  visibility_level = "public"
}

resource "gitlab_project" "tflabs" {
  name         = "Terraform Labs"
  namespace_id = gitlab_group.tflabs.id
  visibility_level = "public"
}