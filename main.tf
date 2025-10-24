module "argo-cd" {
  source = "./modules/argo-cd"
}

module "kube-prometheus-stack" {
  source = "./modules/kube-prometheus-stack"
}

module "cert-manager" {
  source = "./modules/cert-manager"
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

  pihole-admin-password = var.pihole-admin-password
}