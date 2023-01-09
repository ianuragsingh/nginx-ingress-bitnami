
data "aws_region" "current" {}

data "aws_eks_cluster" "this" {
  name = var.cluster_id
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_id
}

data "kubernetes_service" "ingress_nginx" {
  metadata {
    name      = "nginx-ingress-controller"
    namespace = helm_release.nginx-ingress-controller.namespace
  }

  depends_on = [
    helm_release.nginx-ingress-controller
  ]
}