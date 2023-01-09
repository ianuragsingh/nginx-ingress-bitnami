#------------------- Variables --------------------

variable "cluster_id" {
  description = "Name of the EKS cluster where the ingress nginx will be deployed"
  type        = string
  default     = null
}

variable "namespace" {
  description = "EKS cluster namespace where the ingress nginx will be deployed"
  type        = string
  default     = "default"
}

