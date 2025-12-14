variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "subscription_name" {
  description = "Pub/Sub subscription name"
  type        = string
}

variable "topic_name" {
  description = "Pub/Sub topic name to subscribe to"
  type        = string
}

variable "ack_deadline_seconds" {
  description = "Acknowledgment deadline in seconds"
  type        = number
  default     = 10
}

variable "message_retention_duration" {
  description = "Message retention duration"
  type        = string
  default     = "604800s"
}
