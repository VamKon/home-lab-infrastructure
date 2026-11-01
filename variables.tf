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

variable "kubernetes_context" {
  type = string
  description = "Current Kubernetes context to use"
}

variable "install-twingate-connector" {
  type        = bool
  description = "install twingate connector"
  default     = false
}

variable "twingate_network" {
  type        = string
  description = "Twingate network name (e.g. mycompany.twingate.com)"
  default     = ""
}

variable "twingate_access_token" {
  type        = string
  description = "Twingate connector access token"
  sensitive   = true
  default     = ""
}

variable "twingate_refresh_token" {
  type        = string
  description = "Twingate connector refresh token"
  sensitive   = true
  default     = ""
}

variable "kube_prometheus_alert_manager_slack_webhook_url" {
  type        = string
  description = "Slack webhook URL for Alertmanager"
  sensitive   = true
}