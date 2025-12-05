variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for Cloud Run"
  type        = string
  default     = "us-central1"
}

variable "services" {
  description = <<EOT
Map of Cloud Run services to deploy.

Key   = logical service name (also used as Cloud Run service name)
Value = {
  image                = container image
  allow_unauthenticated = optional(bool)
  cpu                  = optional(string)
  memory               = optional(string)
  min_instances        = optional(number)
  max_instances        = optional(number)
  env                  = optional(map(string))
}
EOT

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

# Pub/Sub topic names
variable "exchanges_topic_name" {
  type        = string
  default     = "exchanges-topic"
  description = "Pub/Sub topic for Exchanges"
}

variable "tracking_topic_name" {
  type        = string
  default     = "tracking-topic"
  description = "Pub/Sub topic for Tracking"
}

