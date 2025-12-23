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

variable "service_account_email" {
  description = "Service account email for Cloud Run services"
  type        = string
}

variable "exchanges_topic_name" {
  description = "Name of the exchanges Pub/Sub topic"
  type        = string
  default     = "exchanges-topic"
}

variable "tracking_topic_name" {
  description = "Name of the tracking Pub/Sub topic"
  type        = string
  default     = "tracking-topic"
}

variable "exchanges_subscription_name" {
  description = "Name of the exchanges Pub/Sub subscription"
  type        = string
  default     = "exchanges-subscription"
}

variable "tracking_subscription_name" {
  description = "Name of the tracking Pub/Sub subscription"
  type        = string
  default     = "tracking-subscription"
}

variable "services" {
  description = "Map of Cloud Run services to deploy"
  type = map(object({
    image                 = string
    allow_unauthenticated = optional(bool, false)
    cpu                   = optional(string, "1")
    memory                = optional(string, "512Mi")
    min_instances         = optional(number, 0)
    max_instances         = optional(number, 10)
    env                   = optional(map(string), {})
  }))
  default = {}
}
```






