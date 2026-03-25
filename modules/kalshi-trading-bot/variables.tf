variable "anthropic_api_key" {
  description = "Anthropic API key for Claude AI"
  type        = string
  sensitive   = true
}

variable "kalshi_key_id" {
  description = "Kalshi API Key ID"
  type        = string
  sensitive   = true
}

variable "kalshi_private_key" {
  description = "Kalshi RSA Private Key"
  type        = string
  sensitive   = true
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "odds_api_key" {
  description = "The Odds API key for sportsbook odds (https://the-odds-api.com) — optional"
  type        = string
  sensitive   = true
  default     = ""
}
