terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "sudharshan-480715"
  region  = "us-central1"
}

provider "google-beta" {
  project = "sudharshan-480715"
  region  = "us-central1"
}

