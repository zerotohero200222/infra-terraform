resource "google_pubsub_subscription" "subscription" {
  project = var.project_id
  name    = var.subscription_name
  topic   = var.topic_name

  ack_deadline_seconds       = var.ack_deadline_seconds
  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = false

  expiration_policy {
    ttl = ""
  }

  retry_policy {
    minimum_backoff = "10s"
    maximum_backoff = "600s"
  }

  labels = {
    managed-by = "terraform"
  }
}
