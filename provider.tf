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