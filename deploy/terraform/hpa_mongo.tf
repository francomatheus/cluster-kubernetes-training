resource "kubernetes_horizontal_pod_autoscaler_v1" "mongo_hpa" {
  metadata {
    name = "mongo-hpa"
  }

  spec {
    min_replicas = 1
    max_replicas = 3

    scale_target_ref {
      kind = "Deployment"
      name = "${kubernetes_deployment.mongo_deployment.metadata[0].labels.app}"
    }

    target_cpu_utilization_percentage = "50"
  }
}
