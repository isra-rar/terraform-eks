locals {
  oidc = split("/", var.oidc_provider)[4]
}