# Configure the Kubernetes provider
provider "kubernetes" {
  host                     = "https://localhost:6443"
  config_context_auth_info = "docker-desktop"
  config_context_cluster   = "docker-desktop"
}

# Create a Deployment
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-stg-example"

    labels = {
      App = "nginx-stg"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        App = "nginx-stg"
      }
    }

    template {
      metadata {
        labels = {
          App = "nginx-stg"
        }
      }

      spec {
        container {
          image = "nginx:1.7.7"
          name  = "stg-example"

          port {
            container_port = 3020
          }
        }
      }
    }
  }
}
