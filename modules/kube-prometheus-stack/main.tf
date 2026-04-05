resource "helm_release" "kube-prometheus-stack" {
  name      = "kube-prometheus-stack-release"
  namespace = "prometheus"
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
  version = "77.11.0"

  values = [
    templatefile("${path.module}/values.yaml", {
      slack_api_url = var.kube_prometheus_alert_manager_slack_webhook_url
    })
  ]

  atomic = true
}