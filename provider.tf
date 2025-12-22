############################################
# Terraform & Providers
############################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.45"
    }
  }
}

############################################
# Google Provider
############################################

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.google_credentials
}





