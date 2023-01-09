resource "kubernetes_ingress_v1" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "simple-fanout-ingress"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      http {
        path {
          backend {
            service {
              name = "app1-service"
              port {
                number = 8888
              }
            }
          }

          path = "/app1"
        }

        path {
          backend {
            service {
              name = "app2-service"
              port {
                number = 8888
              }
            }
          }

          path = "/app2"
        }
      }
    }

  }
}