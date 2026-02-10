resource "google_cloud_run_service" "backend" {
  name     = "backend-api"
  location = "us-central1"

  template {
    spec {
      service_account_name = google_service_account.cloudrun_sa.email

      containers {
        image = var.backend_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.backend.name
  location = google_cloud_run_service.backend.location
  role     = "roles/run.invoker"
  member   = "serviceAccount:${google_service_account.apigw_sa.email}"
}

