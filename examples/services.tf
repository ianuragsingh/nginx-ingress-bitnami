resource "kubernetes_service_v1" "app1_service" {
  metadata {
    name = "app1-service"
  }
  spec {
    selector = {
      app = kubernetes_pod_v1.app1.metadata.0.labels.app
    }
    port {
      port = 8888
    }
  }
}

resource "kubernetes_service_v1" "app2_service" {
  metadata {
    name = "app2-service"
  }
  spec {
    selector = {
      app = kubernetes_pod_v1.app2.metadata.0.labels.app
    }
    port {
      port = 8888
    }
  }
}