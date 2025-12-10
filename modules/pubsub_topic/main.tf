resource "google_pubsub_subscription" "subscription" {
  project = var.project_id
  name    = var.subscription_name
  topic   = var.topic_name

  ack_deadline_seconds       = 20
  message_retention_duration = "604800s" # 7 days
  retain_acked_messages      = false

  expiration_policy {
    ttl = "2678400s" # 31 days
  }

  retry_policy {
    minimum_backoff = "10s"
    maximum_backoff = "600s"
  }

  labels = {
    managed-by = "terraform"
  }
}
