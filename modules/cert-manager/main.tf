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