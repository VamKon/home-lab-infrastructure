variable "cloudflare_api_token" {
  description = "Cloudflare API token limited to Zone:DNS:Edit + Zone:Zone:Read on kondas.org, for cert-manager DNS-01"
  type        = string
  sensitive   = true
}
