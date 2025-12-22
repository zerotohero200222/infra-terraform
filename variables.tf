############################################
# Root Module Variables
############################################

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "google_credentials" {
  description = "GCP service account credentials JSON"
  type        = string
  sensitive   = true
}






