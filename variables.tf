variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "service_account_email" {
  description = "Service account email for Cloud Run and Pub/Sub"
  type        = string
}

variable "services" {
  description = "Map of Cloud Run services and configuration"
  type = map(object({
    image                 = string
    allow_unauthenticated = optional(bool)
    cpu                   = optional(string)
    memory                = optional(string)
    min_instances         = optional(number)
    max_instances         = optional(number)
    env                   = optional(map(string))
  }))
}

variable "exchanges_topic_name" {
  description = "Pub/Sub topic for exchanges"
  type        = string
  default     = "exchanges-topic"
}

variable "tracking_topic_name" {
  description = "Pub/Sub topic for tracking"
  type        = string
  default     = "tracking-topic"
}

variable "exchanges_subscription_name" {
  description = "Pub/Sub subscription for exchanges"
  type        = string
  default     = "exchanges-subscription"
}

variable "tracking_subscription_name" {
  description = "Pub/Sub subscription for tracking"
  type        = string
  default     = "tracking-subscription"
}

