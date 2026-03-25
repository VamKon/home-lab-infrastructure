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

variable "pihole-hostname" {
  type = string
  description = "pihole hostname"
}

variable "pihole-domainname" {
  type = string
  description = "pihole domain name"
}

variable "pihole-custom-dns-entries" {
  type = list(string)
  description = "custom dns entries for pi-hole"
  default = []
}

variable "kubernetes_context" {
  type = string
  description = "Current Kubernetes context to use"
}

variable "install-kalshi-trading-bot" {
  type        = bool
  description = "install kalshi trading bot"
  default     = false
}

variable "anthropic_api_key" {
  type        = string
  description = "Anthropic API key for Claude AI"
  sensitive   = true
  default     = ""
}

variable "kalshi_key_id" {
  type        = string
  description = "Kalshi API Key ID"
  sensitive   = true
  default     = ""
}

variable "kalshi_private_key" {
  type        = string
  description = "Kalshi RSA Private Key (PEM format)"
  sensitive   = true
  default     = ""
}

variable "postgres_password" {
  type        = string
  description = "PostgreSQL password"
  sensitive   = true
  default     = ""
}

variable "odds_api_key" {
  type        = string
  description = "The Odds API key for sportsbook odds (optional)"
  sensitive   = true
  default     = ""
}