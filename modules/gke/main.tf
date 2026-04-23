# resource "google_container_cluster" "gke" {
#   name     = var.cluster_name
#   location = var.region

#   network    = var.network_id
#   subnetwork = var.subnet_id

#   remove_default_node_pool = true
#   initial_node_count       = 1

#   # 👇 VERY IMPORTANT (GKE networking)
#   ip_allocation_policy {
#     cluster_secondary_range_name  = var.pods_range
#     services_secondary_range_name = var.services_range
#   }

#   # 👇 Private cluster (production best practice)
#   private_cluster_config {
#     enable_private_nodes    = true
#     enable_private_endpoint = false
#   }
# }

# # 🔥 Node Pool (actual machines)
# resource "google_container_node_pool" "nodes" {
#   name     = "primary-node-pool"
#   cluster  = google_container_cluster.gke.name
#   location = var.region

#   node_count = 1

#   node_config {
#     machine_type = "e2-micro"

#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }