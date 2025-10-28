module "argo-cd" {
  source = "./modules/argo-cd"

  count = var.install-argo-cd ? 1 : 0
}

module "kube-prometheus-stack" {
  source = "./modules/kube-prometheus-stack"

  count = var.install-kube-prometheus-stack ? 1 : 0
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