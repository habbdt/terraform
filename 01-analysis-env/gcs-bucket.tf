resource "google_storage_bucket" "gcs-bucket-01" {
  name          = var.gcs_bucket_01
  project       = var.gcp_project
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }
}