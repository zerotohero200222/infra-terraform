############################################
# Enable required APIs
############################################

resource "google_project_service" "apis" {
  for_each = toset([
    "run.googleapis.com",
    "pubsub.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "logging.googleapis.com",
    "iam.googleapis.com"
  ])

  project = var.project_id
  service = each.key

  disable_on_destroy = false
}

############################################
# Pub/Sub topics
############################################

module "exchanges_topic" {
  source     = "./modules/pubsub_topic"
  topic_id   = var.exchanges_topic_name
  project_id = var.project_id
}

module "tracking_topic" {
  source     = "./modules/pubsub_topic"
  topic_id   = var.tracking_topic_name
  project_id = var.project_id
}

############################################
# Cloud Run Services
############################################

module "cloud_run_services" {
  for_each  = var.services
  source    = "./modules/cloud_run_service"

  project_id = var.project_id
  region     = var.region
  name       = each.key
  image      = each.value.image

  allow_unauthenticated = try(each.value.allow_unauthenticated, false)

  cpu            = try(each.value.cpu, null)
  memory         = try(each.value.memory, null)
  min_instances  = try(each.value.min_instances, null)
  max_instances  = try(each.value.max_instances, null)
  env            = try(each.value.env, null)
}
