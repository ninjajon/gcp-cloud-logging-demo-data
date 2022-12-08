resource "google_bigquery_dataset" "dataset" {
  provider      = google.target
  dataset_id    = "logging_demo_dataset"
  friendly_name = "Logging Demo Dataset"
  location      = var.region
}

resource "google_logging_project_sink" "bigquery_sink" {
  provider    = google.target
  name        = "${var.prefix}-bq-sink"
  description = "BigQuery Sink"
  destination = "bigquery.googleapis.com/projects/${var.project}/datasets/${google_bigquery_dataset.dataset.dataset_id}"
  filter                 = "resource.labels.container_name=\"cloud-logging-demo-app\""
  unique_writer_identity = true
}

resource "google_project_iam_member" "workload_identity_sa_bindings" {
  provider = google.target
  role     = "roles/bigquery.dataEditor"
  member   = google_logging_project_sink.bigquery_sink.writer_identity
  project  = var.project
}
