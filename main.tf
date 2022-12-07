# BigQuery table

module "vpc" {
  source = "./modules/vpc"
  providers = {
    google = google.target
  }
  prefix = var.prefix
}


# Cloud Logging sink to BQ