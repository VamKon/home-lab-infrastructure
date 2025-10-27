variable "install-argo-cd" {
  type = bool
  description = "install argo-cd"
}

variable "install-kube-prometheus-stack" {
  type = bool
  description = "enable kube-prometheus-stack"
}
variable "install-cert-manager" {
  type = bool
  description = "install cert-manager"
}
variable "cert-manager-acme-email" {
    type = string
    description = "email for cert-manager acme validation"
}

variable "install-pihole" {
  type = bool
  description = "install pi-hole"
}

variable "pihole-admin-password" {
  type = string
  description = "pihole admin password"
}

variable "pihole-loadbalancer-ip" {
  type = string
  description = "pihole loadbalancer ip" 
}

variable "kubernetes_context" {
  type = string
  description = "Current Kubernetes context to use"
}