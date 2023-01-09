
module "eks_cluster" {
  source = "git::https://github.com/ianuragsingh/simple-eks-cluster.git?ref=v0.0.8"
  
  cluster_name = "simple-eks-cluster"
  subnet_ids   = ["x", "y"]  # replace with your subnet ids or pass vpc name to create vpc
  
  desired_size   = 1
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.small"]
}

module "nginx-ingress-controller" {
  source     = "git::https://github.com/ianuragsingh/nginx-ingress-controller.git?ref=v0.0.2"
  
  cluster_id        = module.eks_cluster.cluster_name

  depends_on = [
    module.eks_cluster
  ]
}

output "eks_ingress_service_elb" {
  description = "External DNS name of ELB"
  value       = data.kubernetes_service.eks_ingress_service_elb
}
