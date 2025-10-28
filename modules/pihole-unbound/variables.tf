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
  description = "pihole custom dns entries"
  default = []
}