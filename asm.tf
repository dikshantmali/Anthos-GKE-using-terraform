# link for asm

# https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/v20.0.0/modules/asm/hub.tf


# module "hub" {
#   source           = "./module/terraform-google-kubernetes-engine/modules/hub"
#   project_id       = var.project
#   cluster_name     = var.cluster_name
#   location         = var.cluster_zone
#   cluster_endpoint = google_container_cluster.cluster.endpoint
#   enable_gke_hub_registration	= true
#   gke_hub_membership_name = var.cluster_name
#   use_tf_google_credentials_env_var = false
# }



module "anthos-service_accounts" {
  source     = "terraform-google-modules/service-accounts/google"
  project_id = var.gcp_project
  names      = ["${var.TERRAFORM_SA}"]
  project_roles = [
    "${var.gcp_project}=>roles/resourcemanager.projectIamAdmin",
    "${var.gcp_project}=>roles/compute.admin",
    "${var.gcp_project}=>roles/gkehub.admin",
    "${var.gcp_project}=>roles/storage.admin",
    "${var.gcp_project}=>roles/container.admin",
    "${var.gcp_project}=>roles/meshconfig.admin",
    "${var.gcp_project}=>roles/iam.serviceAccountAdmin",
    "${var.gcp_project}=>roles/iam.serviceAccountKeyAdmin",
    "${var.gcp_project}=>roles/iam.serviceAccountUser",
    "${var.gcp_project}=>roles/servicemanagement.admin",
    "${var.gcp_project}=>roles/serviceusage.serviceUsageAdmin",
    "${var.gcp_project}=>roles/container.clusterAdmin",
  ]
}



# first clone the version branch git clone https://github.com/terraform-google-modules/terraform-google-kubernetes-engine.git -b release-v18.0.0

# module "asm" {
#   source                = "./module/terraform-google-kubernetes-engine/modules/asm"
#   cluster_name          = google_container_cluster.cluster.name
#   cluster_endpoint      = google_container_cluster.cluster.endpoint
#   project_id            = "${var.gcp_project}"
#   location              = google_container_cluster.cluster.location
#   enable_all            = true
#   asm_version           = "1.10"
#   service_account       = module.anthos-service_accounts.email
#   key_file              = "./${var.TERRAFORM_SA}.json"
# }



