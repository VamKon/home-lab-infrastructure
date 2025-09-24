# namespace

resource "helm_release" "argo-cd" {
  name      = "argo-cd-release"
  namespace = "argo-cd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "8.5.6"
  values = [
    file("argo-cd-values/values.yaml")
  ]

  atomic = true
}
