variable "project" {
  default = "tf-testing-348604"
}
variable "cluster_name" {
  default = "tf-gke-pvt-cluster"
}
variable "pod-address-range" {
    default = "10.220.0.0/14"
}
variable "service-address-range" {
    default = "10.224.0.0/20"
}
variable "nat_eip_name"{
    default = "mynetgw-eip"
}

variable "prefix"{
    default = "tf-test"
}

variable "TERRAFORM_SA"{
    default = "anthos-service-mesh"
}
variable "region" {
    default = "us-central1"
}


variable "gcp_project" {
  default = "tf-testing-348604"
}
variable "nat-gw-name" {
  default = "tf-ngw"
}
variable "cloud_router_name" {
  default = "my-cloudrouter"
}
variable "network"{
  default = "tf-gke-vpc"
}

variable "subnetwork"{
  default = "tf-gke-subnet"
}


variable "subnetwork_range"{
  default = "10.20.0.0/16"
}

variable "cluster_zone"{
    default = "us-central1-c"
}

variable "cluster_region"{
    default = "us-central1"
}
variable "master_cidr"{
  default = "172.16.0.0/28"
}

variable "node_count" {
  default = 2
}

variable "disk_size_gb" {
  default = 20
}


variable "disk_type" {
  default = "pd-standard"
}


variable "PROJECT_NUMBER" {
  default = "348604"
}

variable "machine_type" {
  default = "e2-standard-4"
}




variable "cluster_secondary_range"{
  default = "10.4.0.0/14"
}

variable "cluster_service_range"{
  default = "10.0.32.0/20"
}