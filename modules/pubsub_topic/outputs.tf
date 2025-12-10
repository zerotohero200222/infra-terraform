output "name" {
  description = "Pub/Sub subscription name"
  value       = google_pubsub_subscription.subscription.name
}

output "id" {
  description = "Pub/Sub subscription ID"
  value       = google_pubsub_subscription.subscription.id
}
