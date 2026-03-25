resource "kubernetes_namespace" "trading" {
  metadata {
    name = "trading"
  }
}

resource "kubernetes_secret" "kalshi_secrets" {
  metadata {
    name      = "kalshi-secrets"
    namespace = kubernetes_namespace.trading.metadata[0].name
  }
  data = {
    ANTHROPIC_API_KEY  = var.anthropic_api_key
    KALSHI_KEY_ID      = var.kalshi_key_id
    KALSHI_PRIVATE_KEY = var.kalshi_private_key
    POSTGRES_PASSWORD  = var.postgres_password
    ODDS_API_KEY       = var.odds_api_key
  }
}

resource "helm_release" "kalshi_trading_bot" {
  name      = "kalshi-trading-bot"
  chart     = "${path.module}/../../charts/kalshi-trading"
  namespace = kubernetes_namespace.trading.metadata[0].name

  values = [
    file("${path.module}/values.yaml")
  ]

  set = [
    {
      name  = "backend.image.repository"
      value = "vkon2001/kalshi-trading-backend"
    },
    {
      name  = "streamlit.image.repository"
      value = "vkon2001/kalshi-trading-streamlit"
    }
  ]

  depends_on = [kubernetes_secret.kalshi_secrets]

  atomic  = true
  timeout = 300
}
