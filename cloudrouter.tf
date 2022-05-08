# lets create a cloud router so that NATgateway can later utilize it

resource "google_compute_router" "router" {
  name    = var.cloud_router_name
  project = var.project
  region  = var.region
  network = google_compute_network.vpc_network.id
}