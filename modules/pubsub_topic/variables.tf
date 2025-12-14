variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "topic_name" {
  type        = string
  description = "Name of the Pub/Sub Topic"
}

variable "subscription_name" {
  type        = string
  description = "Name of the Pub/Sub Subscription"
}

variable "labels" {
  type        = map(string)
  default     = {}
}


