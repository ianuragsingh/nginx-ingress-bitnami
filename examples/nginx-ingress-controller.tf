
data "aws_eks_cluster" "this" {
  name = module.eks_cluster.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks_cluster.cluster_name
}

#--------- Ingress Controller configurations --------

module "nginx-ingress-controller" {
  source     = "git::https://github.com/ianuragsingh/nginx-ingress-controller.git?ref=v0.0.6"
  cluster_id = module.eks_cluster.cluster_name
}

output "eks_ingress_service_elb" {
  description = "External DNS name of ELB"
  value       = module.nginx-ingress-controller.eks_ingress_service_elb
}
