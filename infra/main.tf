terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "bash_app" {
  metadata {
     name = "bash-monitor"
     labels = { app = "monitor" }
    }

  spec {
    replicas = 2
    selector { match_labels = { app = "monitor" } }
    template {
      metadata { labels = { app = "monitor" } }
      spec {
        container {
          name = "monitor-container"
          image = "my-monitor:v1"
          image_pull_policy = "Never"
          
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "monitor_service" {
  metadata {
    name = "monitor-service"
    }
  spec {
    selector = {
      app = "monitor"
      }
    port {
      port        = 80
      target_port = 80
      }
    type = "LoadBalancer"
  }
}
