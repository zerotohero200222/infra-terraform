terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.45"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region

  # FORCE Terraform Cloud to use the variable
  credentials = jsonencode(var.google_credentials)
}



