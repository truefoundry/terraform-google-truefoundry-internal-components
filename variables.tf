variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags common to all the resources created"
}

variable "project" {
  description = "GCP Project"
  type        = string
}

variable "truefoundry_bucket_name" {
  description = "Name of truefoundry bucket"
  type        = string
}

#### MLFoundry

variable "mlfoundry_name" {
  description = "Name of mlfoundry deployment"
  type        = string
}

variable "mlfoundry_k8s_service_account" {
  description = "The k8s mlfoundry service account name"
  type        = string
}

variable "mlfoundry_k8s_namespace" {
  description = "The k8s mlfoundry namespace"
  type        = string
}
##### svcfoundry

variable "svcfoundry_name" {
  description = "Name of svcfoundry deployment"
  type        = string
}


variable "svcfoundry_k8s_service_account" {
  description = "The k8s svcfoundry service account name"
  type        = string
}

variable "svcfoundry_k8s_namespace" {
  description = "The k8s svcfoundry namespace"
  type        = string
}