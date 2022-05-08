# Make vpc in GCP

resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = var.network
  auto_create_subnetworks = false
  mtu                     = 1460
}


# below is the firewall rule for that jump host

resource "google_compute_firewall" "allow-nodes" {
  name    = "tf-fw-allow-tf-vpc"
  project = var.project
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  source_ranges = ["172.16.0.0/28" , "10.20.0.0/16"]
}


resource "google_compute_firewall" "allow-nodes-1" {
  name    = "tf-fw-allow-auto-sidecar-injection"
  project = var.project
  network = google_compute_network.vpc_network.id
  
  allow {
    protocol = "TCP"
    ports    = ["15017"]
  }
  source_ranges = ["0.0.0.0/0"]
}
