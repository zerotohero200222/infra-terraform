variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "google_credentials" {
  description = "GCP service account credentials JSON"
  type        = string
  sensitive   = true
}





