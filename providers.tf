terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.45.0"
    }
  }

  backend "gcs" {
    bucket = "jo-terraform-states"
    prefix = "cloud-logging-demo"
  }
}

provider "google" {
  project = "jo-shared-services-lzzo"
  region  = "us-central1"
}

provider "google" {
  alias   = "target"
  project = "jo-cloud-logging-demo-rjlx"
  region  = "us-central1"
}
