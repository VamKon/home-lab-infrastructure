terraform {
  required_version = ">= 1.10.6"
  required_providers {
    helm = {
      source  = "opentofu/helm"
      version = "~> 3.0.2"
    }

    kubernetes = {
      source  = "opentofu/kubernetes"
      version = "~> 2.38.0"
    }
  }

  backend "local" {
    path = "../../tfstate/homelab.tfstate"
  }
}