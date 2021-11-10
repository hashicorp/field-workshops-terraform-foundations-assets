terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "UpdateThisWithYourOrgName"

    workspaces {
      name = "tflabs"
    }
  }
}