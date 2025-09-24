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