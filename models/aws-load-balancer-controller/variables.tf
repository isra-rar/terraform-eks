variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name Tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "oidc_provider" {
  type        = string
  description = "HTTPS url from OIDC provider of the EKS cluster"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}