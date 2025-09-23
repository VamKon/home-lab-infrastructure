# namespace

resource "kubernetes_namespace" "vamsee_namespace" {
  metadata {
    name = "vamsee"
    labels = {
      mylabel = "vamsee"
    }
  }
}
