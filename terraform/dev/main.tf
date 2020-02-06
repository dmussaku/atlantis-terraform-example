# Configure the Kubernetes provider
provider "kubernetes" {
  host                     = "https://localhost:6443"
  config_context_auth_info = "docker-desktop"
  config_context_cluster   = "docker-desktop"
}

# Create a Deployment
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-dev-example"

    labels = {
      App = "nginx-dev"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        App = "nginx-dev"
      }
    }

    template {
      metadata {
        labels = {
          App = "nginx-dev"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "dev-example"

          port {
            container_port = 3010
          }
        }
      }
    }
  }
}
