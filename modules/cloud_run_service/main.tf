locals {
  effective_cpu                   = var.cpu == null ? "1" : var.cpu
  effective_memory                = var.memory == null ? "512Mi" : var.memory
  effective_min_instances         = var.min_instances == null ? 0 : var.min_instances
  effective_max_instances         = var.max_instances == null ? 5 : var.max_instances
  effective_env                   = var.env != null ? var.env : {}
  effective_allow_unauthenticated = var.allow_unauthenticated == null ? false : var.allow_unauthenticated
}

resource "google_cloud_run_v2_service" "service" {
  name     = var.name
  location = var.region
  project  = var.project_id

  template {
    service_account = var.service_account

    containers {
      image = var.image

      resources {
        limits = {
          cpu    = local.effective_cpu
          memory = local.effective_memory
        }
      }

      dynamic "env" {
        for_each = local.effective_env
        content {
          name  = env.key
          value = env.value
        }
      }
    }

    scaling {
      min_instance_count = local.effective_min_instances
      max_instance_count = local.effective_max_instances
    }
  }

  ingress = "INGRESS_TRAFFIC_ALL"

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service_iam_member" "invoker" {
  count = local.effective_allow_unauthenticated ? 1 : 0

  project  = var.project_id
  location = var.region
  name     = google_cloud_run_v2_service.service.name

  role   = "roles/run.invoker"
  member = "allUsers"
}
