variable "cert-manager-acme-email" {
    type = string
    description = "email for cert-manager acme validation"
}

variable "pihole-admin-password" {
  type = string
  description = "pihole admin password"
}

variable "kubernetes_context" {
  type = string
  description = "Current Kubernetes context to use"
}