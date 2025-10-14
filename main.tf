# namespace

resource "helm_release" "argo-cd" {
  name      = "argo-cd-release"
  namespace = "argo-cd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "8.5.6"
  values = [
    file("argo-cd-config/values.yaml")
  ]

  atomic = true
}

resource "helm_release" "kube-prometheus-stack" {
  name      = "kube-prometheus-stack-release"
  namespace = "prometheus"
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
  version = "77.11.0"

  values = [
    file("kube-prometheus-stack-config/values.yaml")
  ]

  atomic = true
}

resource "helm_release" "cert-manager" {
  name = "cert-manager-release"
  namespace = "cert-manager"
  create_namespace = true

  repository = "https://charts.jetstack.io"
  chart = "cert-manager"
  version = "1.18.2"

  set = [{
    name = "crds.enabled"
    value = "true"
  }]
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