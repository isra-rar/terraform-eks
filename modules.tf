module "eks_network" {
  source       = "./models/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
}

module "eks_cluster" {
  source           = "./models/cluster"
  project_name     = var.project_name
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  tags             = var.tags
}

module "managed_node_group" {
  source            = "./models/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags              = var.tags
}

module "aws_load_balancer_controller" {
  source        = "./models/aws-load-balancer-controller"
  project_name  = var.project_name
  tags          = var.tags
  oidc_provider = module.eks_cluster.oidc_provider
  cluster_name  = module.eks_cluster.cluster_name
}