output "name" {
  description = "Pub/Sub Subscription ID"
  value       = google_pubsub_subscription.subscription.id
}
