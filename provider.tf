terraform {
  required_version = ">= 1.5.0"

  # Terraform Cloud Backend
  cloud {
    organization = "YOUR_TERRAFORM_CLOUD_ORG"  # 🔴 CHANGE THIS

    workspaces {
      name = "gcp-infra-dev"                   # 🔴 CHANGE IF NEEDED
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.45"
    }
  }
}

# ===============================
# Google Provider Configuration
# ===============================
provider "google" {
  project     = var.project_id
  region      = var.region

  # 🔐 Credentials provided via Terraform Cloud Variable (HCL)
  credentials = jsonencode(var.google_credentials)
}

