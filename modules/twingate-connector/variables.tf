variable "twingate_network" {
  type        = string
  description = "Twingate network name (e.g. mycompany.twingate.com)"
}

variable "twingate_access_token" {
  type        = string
  description = "Twingate connector access token"
  sensitive   = true
}

variable "twingate_refresh_token" {
  type        = string
  description = "Twingate connector refresh token"
  sensitive   = true
}

variable "connector_name" {
  type        = string
  description = "Name for the Twingate connector Helm release"
  default     = "twingate-connector"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace to deploy the connector into"
  default     = "twingate"
}
