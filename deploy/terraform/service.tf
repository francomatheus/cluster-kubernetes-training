resource "kubernetes_service" "mongo_service" {
  metadata {
    name = "mongo-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.mongo_deployment.spec[0].selector[0].match_labels.app
    }
    # session_affinity = "ClientIP"
    port {
      port        = 27017
      target_port = 27017
    }

    type = "ClusterIP"
  }
}
