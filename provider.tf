provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }

  registries = [
    {
      url      = "https://argoproj.github.io/argo-helm"
    }
  ]
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "default"
}