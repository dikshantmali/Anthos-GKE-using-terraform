# provider "google" {
#   project     = "tf-testing-348604"
#   region      = "us-central1"
# }

# provider "google-beta" {
  
#   project     = "tf-testing-348604"
#   region      = "us-central1"
# }

provider "google-beta" {
  project     = "tf-testing-348604"

 region      = "us-central1"
}

provider "google" {
  
  project     = "tf-testing-348604"
 region      = "us-central1"
}
data "google_client_config" "default" {}



provider "kubernetes" {
  host                   = "https://${google_container_cluster.cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
}
