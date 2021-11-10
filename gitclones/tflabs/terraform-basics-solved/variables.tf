##############################################################################
# Variables File
#
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

# Uncomment the lines below to get started declaring your variables

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  default = "tflabs"
}

variable "environment" {
  description = "This will be our target environment name tags"
  default = "development"
}

variable "region" {
  description = "This will set our target region in AWS"
  default = "us-east-1"
}

variable "vpc_cidr" {
  # We will set this in our terraform.tfvars file
  description = "This prefix will be included in the name of most resources."
}

variable "subnet_cidr" {
  # We will set this in our terraform.tfvars file
  description = "This prefix will be included in the name of most resources."
}