resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name = "reactive-mvc-deployment"
    labels = {
      app = "reactive-container"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "reactive-container"
      }
    }

    template {
      metadata {
        labels = {
          app = "reactive-container"
        }
      }

      spec {
        container {
          image = "francomatheus/reactive-mvc:1.4"
          name  = "reactive-mvc"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/actuator/health/liveness"
              port = 8080
            }

            initial_delay_seconds = 60
            period_seconds        = 3
          }
          readiness_probe {
            http_get {
              path = "/actuator/health/readiness"
              port = 8080
            }

            initial_delay_seconds = 60
            period_seconds        = 3
          }
        }
      }
    }
  }
}
