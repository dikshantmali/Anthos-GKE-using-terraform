# below resource add subnet to the VPC

resource "google_compute_subnetwork" "my_subnet" {
  project       = var.project
  name          = var.subnetwork
  ip_cidr_range = var.subnetwork_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
