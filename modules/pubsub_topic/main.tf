resource "google_pubsub_topic" "topic" {
  name    = var.topic_name
  project = var.project_id
  labels  = var.labels
}

resource "google_pubsub_subscription" "subscription" {
  name                       = var.subscription_name
  project                    = var.project_id
  topic                      = google_pubsub_topic.topic.name
  ack_deadline_seconds       = 10
  message_retention_duration = "604800s"

  expiration_policy {
    ttl = ""
  }
}

