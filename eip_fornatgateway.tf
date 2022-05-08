# create external IP for NAT gateway 

resource "google_compute_address" "mynat" {
  name = var.nat_eip_name
}
