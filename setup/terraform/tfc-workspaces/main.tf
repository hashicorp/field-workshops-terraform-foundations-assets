# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_id" "suffix" {
  byte_length = 4
}

resource "tfe_organization" "Terraform-Foundations" {
  name  = "Terraform-Foundations-${random_id.suffix.hex}"
  email = "tflabs.student@hashicorp.com"
}

resource "tfe_oauth_client" "oauth-client" {
   organization = tfe_organization.Terraform-Foundations.name
   api_url          = "http://${var.GITLAB_PUBLIC_ADDRESS}/api/v4"
   http_url         = "http://${var.GITLAB_PUBLIC_ADDRESS}/"
   oauth_token      = var.GITLAB_TOKEN
   service_provider = "gitlab_community_edition"
}

resource "tfe_workspace" "hashicat_prod" {
  name         = "HashiCat-Prod"
  organization = tfe_organization.Terraform-Foundations.name
  auto_apply = false
}

resource "tfe_workspace" "hashicat_stage" {
  name         = "HashiCat-Stage"
  organization = tfe_organization.Terraform-Foundations.name
  auto_apply = false
}

resource "tfe_workspace" "hashicat_dev" {
  name         = "HashiCat-Development"
  organization = tfe_organization.Terraform-Foundations.name
  auto_apply = false
}

resource "tfe_variable" "prod_aws_access_key" {
  key = "AWS_ACCESS_KEY_ID"
  value = var.AWS_ACCESS_KEY_ID
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.hashicat_prod.id
}

resource "tfe_variable" "prod_aws_secret_key" {
  key = "AWS_SECRET_ACCESS_KEY"
  value = var.AWS_SECRET_ACCESS_KEY
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.hashicat_prod.id
}

resource "tfe_variable" "prod-prefix" {
  key = "prefix"
  value = "hashicat"
  category = "terraform"
  sensitive = false
  workspace_id = tfe_workspace.hashicat_prod.id
}

resource "tfe_variable" "prod_environment" {
  key = "environment"
  value = "production"
  category = "terraform"
  sensitive = false
  workspace_id = tfe_workspace.hashicat_prod.id
}

resource "tfe_variable" "stage_aws_access_key" {
  key = "AWS_ACCESS_KEY_ID"
  value = var.AWS_ACCESS_KEY_ID
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.hashicat_stage.id
}

resource "tfe_variable" "stage_aws_secret_key" {
  key = "AWS_SECRET_ACCESS_KEY"
  value = var.AWS_SECRET_ACCESS_KEY
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.hashicat_stage.id
}

resource "tfe_variable" "stage_prefix" {
  key = "prefix"
  value = "hashicat"
  category = "terraform"
  sensitive = false
  workspace_id = tfe_workspace.hashicat_stage.id
}

resource "tfe_variable" "stage_environment" {
  key = "environment"
  value = "stage"
  category = "terraform"
  sensitive = false
  workspace_id = tfe_workspace.hashicat_stage.id
}

resource "tfe_variable" "dev_aws_access_key" {
  key = "AWS_ACCESS_KEY_ID"
  value = var.AWS_ACCESS_KEY_ID
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.hashicat_dev.id
}

resource "tfe_variable" "dev_aws_secret_key" {
  key = "AWS_SECRET_ACCESS_KEY"
  value = var.AWS_SECRET_ACCESS_KEY
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.hashicat_dev.id
}

resource "tfe_variable" "dev_prefix" {
  key = "prefix"
  value = "hashicat"
  category = "terraform"
  sensitive = false
  workspace_id = tfe_workspace.hashicat_dev.id
}

resource "tfe_variable" "dev_environment" {
  key = "environment"
  value = "development"
  category = "terraform"
  sensitive = false
  workspace_id = tfe_workspace.hashicat_dev.id
}

output "oauth_token_id" {
  value = tfe_oauth_client.oauth-client.oauth_token_id
}