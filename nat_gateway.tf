
# create NAT gateway to be utilized by pvt nodes of cluster so that they can utlize
# or pull docker repo or any dependency from internet

resource "google_compute_router_nat" "nat" {
  name                               = var.nat-gw-name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.mynat.self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  
  subnetwork {
    name = google_compute_subnetwork.my_subnet.self_link
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}