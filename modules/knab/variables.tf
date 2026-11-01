variable "knab_master_key" {
  description = "AES-256 key for knab's encrypted secret store (base64 of 32 bytes: openssl rand -base64 32). Keep a copy outside the cluster: losing it makes stored Plaid tokens unreadable."
  type        = string
  sensitive   = true

  validation {
    # base64decode() rejects non-UTF-8 output, so random key bytes can't be decoded here;
    # 32 bytes is exactly 43 base64 characters plus one "=".
    condition     = can(regex("^[A-Za-z0-9+/]{43}=$", var.knab_master_key))
    error_message = "knab_master_key must be base64 that decodes to exactly 32 bytes."
  }
}

variable "ghcr_username" {
  description = "GitHub user that owns the private knab image on ghcr.io"
  type        = string
  default     = ""
}

variable "ghcr_token" {
  description = "GitHub classic token with only read:packages, for pulling the knab image (empty = no pull secret)"
  type        = string
  sensitive   = true
  default     = ""
}
