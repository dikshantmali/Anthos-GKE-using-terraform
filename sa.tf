
# module "anthos-service_accounts" {
#   source     = "terraform-google-modules/service-accounts/google"
#   project_id = var.project
#   names      = ["${var.TERRAFORM_SA}"]
#   project_roles = [
#     "${var.gcp_project}=>roles/resourcemanager.projectIamAdmin",
#     "${var.gcp_project}=>roles/compute.admin",
#     "${var.gcp_project}=>roles/gkehub.admin",
#     "${var.gcp_project}=>roles/storage.admin",
#     "${var.gcp_project}=>roles/container.admin",
#     "${var.gcp_project}=>roles/meshconfig.admin",
#     "${var.gcp_project}=>roles/iam.serviceAccountAdmin",
#     "${var.gcp_project}=>roles/iam.serviceAccountKeyAdmin",
#     "${var.gcp_project}=>roles/iam.serviceAccountUser",
#     "${var.gcp_project}=>roles/servicemanagement.admin",
#     "${var.gcp_project}=>roles/serviceusage.serviceUsageAdmin",
#     "${var.gcp_project}=>roles/container.clusterAdmin",
#   ]
# }