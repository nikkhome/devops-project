terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

variable "k8s_host" {
  type = string
}

variable "k8s_token" {
  type      = string
  sensitive = true
}

provider "kubernetes" {
  host        = var.k8s_host
  token       = var.k8s_token
 # config_path = "~/.kube/config"
  insecure    = true
}

resource "kubernetes_deployment_v1" "bash_app" {
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
          image = "nikkhome/bash-monitor:latest"
          image_pull_policy = "Always"
          
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "monitor_service" {
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
