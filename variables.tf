variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "google_credentials" {
  description = "GCP service account credentials"
  type        = any
  sensitive   = true
}




