resource "google_pubsub_topic" "topic" {
  name      = var.topic_name
  project   = var.project_id
  labels    = var.labels
}

resource "google_pubsub_subscription" "subscription" {
  name                         = var.subscription_name
  project                      = var.project_id
  topic                        = google_pubsub_topic.topic.name
  ack_deadline_seconds         = var.ack_deadline_seconds
  message_retention_duration   = var.message_retention_duration

  expiration_policy {
    ttl = ""
  }

  labels = {
    managed-by = "terraform"
  }
}
