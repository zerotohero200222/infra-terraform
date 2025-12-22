# ===============================
# Core Project Variables
# ===============================

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

# ===============================
# Google Credentials (Terraform Cloud)
# ===============================

variable "google_credentials" {
  description = "GCP service account credentials JSON (provided via Terraform Cloud)"
  type        = any
  sensitive   = true
}

# ===============================
# Optional / Existing Variables
# (keep or remove as per your repo)
# ===============================

variable "services" {
  description = "Cloud Run services configuration"
  type        = map(any)
  default     = {}
}

variable "exchanges_topic_name" {
  description = "Pub/Sub topic name for exchanges"
  type        = string
}

variable "tracking_topic_name" {
  description = "Pub/Sub topic name for tracking"
  type        = string
}

variable "exchanges_subscription_name" {
  description = "Pub/Sub subscription name for exchanges"
  type        = string
}

variable "tracking_subscription_name" {
  description = "Pub/Sub subscription name for tracking"
  type        = string
}


