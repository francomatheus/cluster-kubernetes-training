resource "kubernetes_horizontal_pod_autoscaler_v1" "app_hpa" {
  metadata {
    name = "app-hpa"
  }

  spec {
    min_replicas = 1
    max_replicas = 3

    scale_target_ref {
      kind = "Deployment"
      name = "${kubernetes_deployment.app_deployment.metadata[0].labels.app}"
    }

    target_cpu_utilization_percentage = "50"
  }
}
