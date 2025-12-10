output "service_urls" {
  description = "Map of Cloud Run service URLs"
  value = {
    for name, mod in module.cloud_run_services :
    name => mod.url
  }
}

output "exchanges_topic" {
  description = "Exchanges Pub/Sub topic name"
  value       = module.exchanges_topic.name
}

output "tracking_topic" {
  description = "Tracking Pub/Sub topic name"
  value       = module.tracking_topic.name
}

output "exchanges_subscription" {
  description = "Exchanges Pub/Sub subscription name"
  value       = module.exchanges_subscription.name
}

output "tracking_subscription" {
  description = "Tracking Pub/Sub subscription name"
  value       = module.tracking_subscription.name
}

output "service_account" {
  description = "Service account used by Cloud Run and Pub/Sub"
  value       = var.service_account_email
}
