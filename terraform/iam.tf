resource "google_service_account" "cloudrun_sa" {
  account_id   = "cr-backend-sa"
  display_name = "Cloud Run Backend SA"
}

resource "google_service_account" "apigw_sa" {
  account_id   = "apigw-sa"
  display_name = "API Gateway Invoker SA"
}

resource "google_project_iam_member" "cr_logs" {
  project = "sudharshan-480715"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.cloudrun_sa.email}"
}

resource "google_project_iam_member" "cr_metrics" {
  project = "sudharshan-480715"
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.cloudrun_sa.email}"
}

