resource "helm_release" "kube-prometheus-stack" {
  name      = "kube-prometheus-stack-release"
  namespace = "prometheus"
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
  version = "77.11.0"

  values = [
    file("modules/kube-prometheus-stack/values.yaml")
  ]

  atomic = true
}