resource "google_pubsub_subscription" "subscription" {
  name                          = var.subscription_name
  topic                         = var.topic_name
  project                       = var.project_id
  ack_deadline_seconds          = var.ack_deadline_seconds
  message_retention_duration    = var.message_retention_duration

  expiration_policy {
    ttl = ""
  }

  labels = var.labels
}
