resource "kubernetes_deployment" "mongo_deployment" {
  metadata {
    name = "mongo-deployment"
    labels = {
      app = "mongo-deployment"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "mongo-container"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongo-container"
        }
      }

      spec {
        container {
          image = "mongo"
          name  = "mongo-mvc"

          env {
            name = "MONGO_INITDB_ROOT_USERNAME"
            value = "${var.user_database}"
          }

          env {
            name = "MONGO_INITDB_ROOT_PASSWORD"
            value = "${var.password_database}"
          }

          resources {
            limits = {
              cpu    = "1"
              memory = "950Mi"
            }
            requests = {
              cpu    = "1"
              memory = "950Mi"
            }
          }
        }
      }
    }
  }
}
