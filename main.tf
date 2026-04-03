provider "google" {
  project = "scrapemore"
  region  = "us-central1"
}

resource "google_storage_bucket" "tf_state" {
  name          = "mouaz-tf-state-12345"  # 
  location      = "US"
  force_destroy = false

  # Versioning enable
  versioning {
    enabled = true
  }

  # Security best practice
  uniform_bucket_level_access = true
}