terraform {
  required_version = ">= 1.5.0"

  cloud {
    organization = "YOUR_TERRAFORM_CLOUD_ORG_NAME"

    workspaces {
      name = "gcp-infra-dev"
    }
  }

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
  credentials = var.google_credentials
}




