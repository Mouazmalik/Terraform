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



module "network" {
  source = "./modules/network"

  vpc_name    = "staging-vpc"
  subnet_name = "staging-subnet"
  region      = var.region
}

module "compute" {
  source = "./modules/compute"

  vm_name    = "staging-vm"
  zone       = "us-central1-a"

  network_id = module.network.network_id
}
