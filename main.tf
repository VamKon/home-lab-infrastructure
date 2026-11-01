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

