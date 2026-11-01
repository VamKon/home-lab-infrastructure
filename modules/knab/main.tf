# Namespace and Secrets only — the app itself is deployed by Argo CD from
# home-lab-deploy/charts/knab, which references these by name.
resource "kubernetes_namespace" "knab" {
  metadata {
    name = "knab"
  }
}

resource "kubernetes_secret" "knab_secrets" {
  metadata {
    name      = "knab-secrets"
    namespace = kubernetes_namespace.knab.metadata[0].name
  }
  data = {
    KNAB_MASTER_KEY = var.knab_master_key
  }
}

resource "kubernetes_secret" "ghcr" {
  count = var.ghcr_token != "" ? 1 : 0

  metadata {
    name      = "ghcr"
    namespace = kubernetes_namespace.knab.metadata[0].name
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "ghcr.io" = {
          auth = base64encode("${var.ghcr_username}:${var.ghcr_token}")
        }
      }
    })
  }
}
