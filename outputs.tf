#------------------- Outputs --------------------

output "eks_ingress_service_elb" {
  description = "External DNS name of elastic load balancer"
  value       = data.kubernetes_service.nginx_ingress_service.status.0.load_balancer.0.ingress.0.hostname
}
