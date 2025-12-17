terraform {
  required_version = ">= 1.5.0"

  # Terraform Cloud Backend
  cloud {
    organization = "your-org-name"  # Replace with your org name

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
  project = var.project_id
  region  = var.region
  
  # Credentials are provided via GOOGLE_CREDENTIALS env var in Terraform Cloud
}
