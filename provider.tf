provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
    config_context = var.kubernetes_context
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.kubernetes_context
}