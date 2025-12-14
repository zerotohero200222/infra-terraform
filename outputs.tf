output "exchanges_topic" {
  description = "Exchanges Pub/Sub topic"
  value       = module.exchanges_topic.name
}

output "tracking_topic" {
  description = "Tracking Pub/Sub topic"
  value       = module.tracking_topic.name
}

output "exchanges_subscription" {
  description = "Exchanges subscription"
  value       = module.exchanges_subscription.name
}

output "tracking_subscription" {
  description = "Tracking subscription"
  value       = module.tracking_subscription.name
}

