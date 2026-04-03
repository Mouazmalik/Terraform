terraform {
  backend "gcs" {
    bucket  = "mouaz-tf-state-12345"
    prefix  = "dev"
  }
}