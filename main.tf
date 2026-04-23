provider "google" {
  project = "scrapemore"
  region  = "us-central1"
}

resource "google_storage_bucket" "tf_state" {
  name          = "mouaz-tf-state-12345" # 
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
   # subnet_name = "staging-subnet"
  region      = var.region
  private_subnet  = "staging-private-subnet"
  public_subnet  = "staging-public-subnet"

}

# the compute enfine code is temporary commnet

# module "compute" {
#   source = "./modules/compute"

#   vm_name = "staging-vm"
#   zone    = "us-west1-a"

#   network_id = module.network.network_id
#   subnet_id  = module.network.private_subnet_id

# }

# module "gke" {
#   source = "./modules/gke"

#   cluster_name   = "staging-gke"
#   region         = var.region

#   network_id     = module.network.network_id
#   subnet_id      = module.network.private_subnet_id

#   pods_range     = module.network.pods_range_name
#   services_range = module.network.services_range_name
# }
