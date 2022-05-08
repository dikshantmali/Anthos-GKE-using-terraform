#____________________Networking starts__________________




# we will access k8s master using Jump host means by a specific IP








#------------------let's start the cluster creation part---------------


resource "google_container_cluster" "cluster" {
  name               = var.cluster_name

## Add location for multi AZ worker nodes
#location           = var.region

  location           = var.cluster_zone
  project            = var.project
  network            = var.network
  subnetwork         = google_compute_subnetwork.my_subnet.self_link
  remove_default_node_pool = "true"
  initial_node_count       = 1
  ip_allocation_policy{
  cluster_ipv4_cidr_block = "${var.pod-address-range}"
    services_ipv4_cidr_block = "${var.service-address-range}"  
  }

  private_cluster_config {
    # make below option false if u want to use  master_authorized_networks_config option with
    # your own public ip so that only this public ip can connect to it...falsing below option allow
    # connection using both private and public end point of cluster
    enable_private_endpoint = false
    enable_private_nodes = true
    master_ipv4_cidr_block = var.master_cidr
  }
   release_channel {
    channel = "REGULAR"
  }
  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

# resource_labels = {
#       mesh_id = "proj-${var.PROJECT_NUMBER}"
#     }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "0.0.0.0/0"
    }

  }

}


resource "google_container_node_pool" "mynodepool" {
  cluster      = google_container_cluster.cluster.name
#Add region for multi AZ worker nodes terraform will auto detect and make cluster regional
  location     = var.cluster_zone
  project      = var.project
  name    = "tf-nodepool"
  node_count = var.node_count
  node_config {
    preemptible  = true
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    machine_type = var.machine_type  
  }
 
}
