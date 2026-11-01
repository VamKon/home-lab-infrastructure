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
variable "install-knab" {
  type        = bool
  description = "create the knab namespace and secrets (the app is deployed by Argo CD)"
  default     = false
}

variable "knab_master_key" {
  type        = string
  description = "knab secret-store key, base64 of 32 bytes"
  sensitive   = true
  default     = ""
}

variable "ghcr_username" {
  type        = string
  description = "GitHub user for pulling private ghcr.io images (optional)"
  default     = ""
}

variable "ghcr_token" {
  type        = string
  description = "GitHub classic token with only read:packages (optional)"
  sensitive   = true
  default     = ""
}

variable "install-cert-manager-cloudflare" {
  type        = bool
  description = "create the Cloudflare token Secret for cert-manager DNS-01 (Let's Encrypt)"
  default     = false
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token, Zone:DNS:Edit + Zone:Zone:Read on kondas.org only"
  sensitive   = true
  default     = ""
}
