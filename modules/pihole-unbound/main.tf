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

resource "time_sleep" "wait_for_service_startup" {
  create_duration = "60s" # Wait for 60 seconds
  depends_on = [helm_release.unbound] # Wait after instance creation
}

data "kubernetes_service" "unbound_dns_service_ip" {
    metadata {
        name = "unbound-dns"
        namespace = "pihole"
    }
    depends_on = [ time_sleep.wait_for_service_startup ]
}

resource "helm_release" "pihole" {
  name = "pihole"
  namespace = helm_release.unbound.namespace

  repository = "https://mojo2600.github.io/pihole-kubernetes/"
  chart = "pihole"
  version= "2.34.0"

  values = [
    templatefile("modules/pihole-unbound/values.tftpl", {
        pihole_admin_password = var.pihole-admin-password,
        pihole_loadbalancer_ip = var.pihole-loadbalancer-ip
        pihole_hostname = var.pihole-hostname
        pihole_domainname = var.pihole-domainname
        pihole_custom_dns_entries = var.pihole-custom-dns-entries
        unbound_ip = data.kubernetes_service.unbound_dns_service_ip.spec[0].cluster_ip
    })
  ]
  atomic = true

  timeout = 300
}

