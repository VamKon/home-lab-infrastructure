resource "helm_release" "argo-cd" {
  name      = "argo-cd-release"
  namespace = "argo-cd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "8.5.6"
  values = [
    file("modules/argo-cd/values.yaml")
  ]

  atomic = true
}