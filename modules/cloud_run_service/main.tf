locals {
  cpu           = var.cpu == null ? "1" : var.cpu
  memory        = var.memory == null ? "512Mi" : var.memory
  min_instances = var.min_instances == null ? 0 : var.min_instances
  max_instances = var.max_instances == null ? 5 : var.max_instances
}

resource "google_cloud_run_v2_service" "service" {
  name     = var.name
  location = var.region
  project  = var.project_id

  template {
    containers {
      image = var.image

      resources {
        limits = {
          cpu    = local.cpu
          memory = local.memory
        }
      }

      dynamic "env" {
        for_each = var.env
        content {
          name  = env.key
          value = env.value
        }
      }
    }

    scaling {
      min_instance_count = local.min_instances
      max_instance_count = local.max_instances
    }
  }

  ingress = "INGRESS_TRAFFIC_ALL"

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service_iam_member" "public" {
  count = var.allow_unauthenticated ? 1 : 0

  project  = var.project_id
  location = var.region
  name     = google_cloud_run_v2_service.service.name

  role   = "roles/run.invoker"
  member = "allUsers"
}
