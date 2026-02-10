resource "google_api_gateway_api" "api" {
  provider = google-beta
  api_id   = "backend-api-gw"
}

resource "google_api_gateway_api_config" "config" {
  provider = google-beta
  api      = google_api_gateway_api.api.api_id

  openapi_documents {
    document {
      path     = "openapi.yaml"
      contents = filebase64("../api-gateway/openapi.yaml")
    }
  }

  gateway_config {
    backend_config {
      google_service_account = google_service_account.apigw_sa.email
    }
  }
}

resource "google_api_gateway_gateway" "gateway" {
  provider   = google-beta
  gateway_id = "backend-gateway"
  api_config = google_api_gateway_api_config.config.id
  region    = "us-central1"
}

