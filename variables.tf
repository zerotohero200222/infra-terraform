variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Cloud Run region"
  type        = string
  default     = "us-central1"
}

variable "services" {
  description = "Map of Cloud Run services"
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
  type        = string
  default     = "exchanges-topic"
}

variable "tracking_topic_name" {
  type        = string
  default     = "tracking-topic"
}
