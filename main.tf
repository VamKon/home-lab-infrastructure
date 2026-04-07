module "argo-cd" {
  source = "./modules/argo-cd"

  count = var.install-argo-cd ? 1 : 0
}

module "kube-prometheus-stack" {
  source = "./modules/kube-prometheus-stack"

  count = var.install-kube-prometheus-stack ? 1 : 0

  kube_prometheus_alert_manager_slack_webhook_url = var.kube_prometheus_alert_manager_slack_webhook_url
}

module "cert-manager" {
  source = "./modules/cert-manager"

  count = var.install-cert-manager ? 1 : 0
}

# resource "helm_release" "cert-manager-addons" {
#   name = "cert-manager-addons-release"
#   namespace = "cert-manager"
#   chart = "./charts/cert-manager-addons"

# #   values = [
# #     templatefile("./charts/cert-manager-addons/values.yaml", {
# #         cert-manager-acme-email = var.cert-manager-acme-email
# #     })
# #   ]

# set = [{
#     name = "spec.acme.email"
#     value = var.cert-manager-acme-email
# }]
# }

module "pihole-unbound" {
  source = "./modules/pihole-unbound"

  count = var.install-pihole ? 1 : 0

  pihole-admin-password = var.pihole-admin-password
  pihole-loadbalancer-ip = var.pihole-loadbalancer-ip
  pihole-hostname = var.pihole-hostname
  pihole-domainname = var.pihole-domainname
  pihole-custom-dns-entries = var.pihole-custom-dns-entries
}

module "twingate_connector" {
  source = "./modules/twingate-connector"

  count = var.install-twingate-connector ? 1 : 0

  twingate_network       = var.twingate_network
  twingate_access_token  = var.twingate_access_token
  twingate_refresh_token = var.twingate_refresh_token
}

module "kalshi_trading_bot" {
  source = "./modules/kalshi-trading-bot"

  count = var.install-kalshi-trading-bot ? 1 : 0

  anthropic_api_key  = var.anthropic_api_key
  kalshi_key_id      = var.kalshi_key_id
  kalshi_private_key = var.kalshi_private_key
  postgres_password  = var.postgres_password
  odds_api_key       = var.odds_api_key
  openrouter_api_key = var.openrouter_api_key
}