# Token for cert-manager's Let's Encrypt DNS-01 solver. The ClusterIssuers live
# in home-lab-deploy/addons/cert-manager-issuers/letsencrypt.yaml; cert-manager
# reads ClusterIssuer secrets from its own namespace.
resource "kubernetes_secret" "cloudflare_api_token" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = "cert-manager"
  }
  data = {
    api-token = var.cloudflare_api_token
  }
}
