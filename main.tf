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

module "twingate_connector" {
  source = "./modules/twingate-connector"

  count = var.install-twingate-connector ? 1 : 0

  twingate_network       = var.twingate_network
  twingate_access_token  = var.twingate_access_token
  twingate_refresh_token = var.twingate_refresh_token
}

module "knab" {
  source = "./modules/knab"

  count = var.install-knab ? 1 : 0

  knab_master_key = var.knab_master_key
  ghcr_username   = var.ghcr_username
  ghcr_token      = var.ghcr_token
}

module "cert_manager_cloudflare" {
  source = "./modules/cert-manager-cloudflare"

  count = var.install-cert-manager-cloudflare ? 1 : 0

  cloudflare_api_token = var.cloudflare_api_token
}
