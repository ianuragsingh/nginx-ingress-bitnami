#------------------- NGINX Ingress Controller --------------------

resource "helm_release" "nginx-ingress-controller" {
  name       = "nginx-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
  namespace  = var.namespace

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

