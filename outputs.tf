output "service_urls" {
  description = "Cloud Run deployed service URLs"
  value = {
    for name, mod in module.cloud_run_services :
    name => mod.url
  }
}

output "exchanges_topic" {
  value = module.exchanges_topic.name
}

output "tracking_topic" {
  value = module.tracking_topic.name
}
