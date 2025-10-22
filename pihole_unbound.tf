resource "kubernetes_persistent_volume" "persistant_volume_pihole"{
    metadata {
        name = "persistant-volume-pihole"
    }

    spec {
        capacity = {
            storage = "1G"
        }

        access_modes = ["ReadWriteOnce"]
        storage_class_name = "local-storage"
        persistent_volume_source  {
            local {
                path = "/mnt/pihole_data"
            }
        }
        volume_mode = "Filesystem"
        persistent_volume_reclaim_policy = "Delete"

        node_affinity {
            required {
                node_selector_term {
                    match_expressions {
                        key = "kubernetes.io/hostname"
                        operator = "In"
                        values = ["vamsee-lab"]
                    }
                }
            }
        }
    }
}

resource "kubernetes_persistent_volume_claim" "persistent_volume_claim_pihole"{
    metadata {
        name = "persistent-volume-claim-pihole"
        namespace = "pihole"
    }

    spec {
        access_modes = ["ReadWriteOnce"]
        storage_class_name = "local-storage"
        resources {
            requests = {
                storage = "1G"
            }
        }
        volume_name = kubernetes_persistent_volume.persistant_volume_pihole.metadata[0].name
    }
}

resource "helm_release" "unbound" {
  name = "unbound"
  namespace = "pihole"
  create_namespace = true

  repository = "https://charts.pascaliske.dev"
  chart = "unbound"
  version = "1.0.3"
}

resource "helm_release" "pihole" {
  name = "pihole"
  namespace = helm_release.unbound.namespace

  repository = "https://mojo2600.github.io/pihole-kubernetes/"
  chart = "pihole"
  version= "2.34.0"

  values = [
    templatefile("pihole-config/values.yaml", {
        pihole_admin_password = var.pihole-admin-password
    })
  ]
  atomic = true

  timeout = 300
}

