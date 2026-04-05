resource "kubernetes_namespace" "twingate" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_secret" "twingate_connector" {
  metadata {
    name      = "twingate-connector-secrets"
    namespace = kubernetes_namespace.twingate.metadata[0].name
  }

  data = {
    TWINGATE_ACCESS_TOKEN  = var.twingate_access_token
    TWINGATE_REFRESH_TOKEN = var.twingate_refresh_token
  }
}

resource "helm_release" "twingate_connector" {
  name             = var.connector_name
  namespace        = kubernetes_namespace.twingate.metadata[0].name
  repository       = "https://twingate.github.io/helm-charts"
  chart            = "connector"

  set = [
    {
      name  = "connector.network"
      value = var.twingate_network
    },
    {
      name  = "connector.accessToken"
      value = var.twingate_access_token
    },
    {
      name  = "connector.refreshToken"
      value = var.twingate_refresh_token
    },
    {
      name = "connector.dnsServer"
      value = "192.168.5.100"
    }
  ]

  depends_on = [kubernetes_secret.twingate_connector]

  atomic  = true
  timeout = 300
}
