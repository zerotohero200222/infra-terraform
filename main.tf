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
  source            = "./modules/pubsub_topic"
  project_id        = var.project_id
  topic_name        = var.exchanges_topic_name
  subscription_name = var.exchanges_subscription_name
}

module "tracking_topic" {
  source            = "./modules/pubsub_topic"
  project_id        = var.project_id
  topic_name        = var.tracking_topic_name
  subscription_name = var.tracking_subscription_name
}

############################################
# Pub/Sub Subscriptions
############################################

module "exchanges_subscription" {
  source = "./modules/pubsub_subscription"

  project_id        = var.project_id
  subscription_name = var.exchanges_subscription_name
  topic_name        = module.exchanges_topic.topic_name
  service_account   = var.service_account_email

  depends_on = [module.exchanges_topic]
}

module "tracking_subscription" {
  source = "./modules/pubsub_subscription"

  project_id        = var.project_id
  subscription_name = var.tracking_subscription_name
  topic_name        = module.tracking_topic.topic_name
  service_account   = var.service_account_email

  depends_on = [module.tracking_topic]
}

############################################
# Grant Pub/Sub IAM permissions
############################################

# Grant publisher role on exchanges topic
resource "google_pubsub_topic_iam_member" "exchanges_publisher" {
  project = var.project_id
  topic   = module.exchanges_topic.name
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${var.service_account_email}"

  depends_on = [module.exchanges_topic]
}

# Grant publisher role on tracking topic
resource "google_pubsub_topic_iam_member" "tracking_publisher" {
  project = var.project_id
  topic   = module.tracking_topic.name
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${var.service_account_email}"

  depends_on = [module.tracking_topic]
}

# Grant subscriber role on exchanges subscription
resource "google_pubsub_subscription_iam_member" "exchanges_subscriber" {
  project      = var.project_id
  subscription = module.exchanges_subscription.name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${var.service_account_email}"

  depends_on = [module.exchanges_subscription]
}

# Grant subscriber role on tracking subscription
resource "google_pubsub_subscription_iam_member" "tracking_subscriber" {
  project      = var.project_id
  subscription = module.tracking_subscription.name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${var.service_account_email}"

  depends_on = [module.tracking_subscription]
}

############################################
# Cloud Run Services
############################################

module "cloud_run_services" {
  for_each = var.services
  source   = "./modules/cloud_run_service"

  project_id = var.project_id
  region     = var.region
  name       = each.key
  image      = each.value.image

  service_account       = var.service_account_email
  allow_unauthenticated = try(each.value.allow_unauthenticated, false)

  cpu           = try(each.value.cpu, null)
  memory        = try(each.value.memory, null)
  min_instances = try(each.value.min_instances, null)
  max_instances = try(each.value.max_instances, null)
  env           = try(each.value.env, {})
}
