output "topic_name" {
  description = "Pub/Sub Topic name"
  value       = google_pubsub_topic.topic.name
}

output "subscription_name" {
  description = "Pub/Sub Subscription name"
  value       = google_pubsub_subscription.subscription.name
}

