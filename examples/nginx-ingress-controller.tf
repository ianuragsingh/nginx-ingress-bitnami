#-------------------- Cluster and Ingress Controller configurations ------------------

data "aws_eks_cluster" "this" {
  name = module.eks_cluster.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks_cluster.cluster_name
}

module "eks_cluster" {
  source = "git::https://github.com/ianuragsingh/simple-eks-cluster.git?ref=v0.0.9"
  
  cluster_name = "simple-eks-cluster"
  subnet_ids   = ["subnet-0898b2ad84aa9814a", "subnet-0d892159af601e7b0"]  # Replace with your subnet ids or pass vpc name to create vpc
  
  desired_size   = 1
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.medium"]
}

module "nginx-ingress-controller" {
  source            = "git::https://github.com/ianuragsingh/nginx-ingress-controller.git?ref=v0.0.6"
  cluster_id        = module.eks_cluster.cluster_name
}

output "eks_ingress_service_elb" {
  description = "External DNS name of ELB"
  value       = module.nginx-ingress-controller.eks_ingress_service_elb
}

