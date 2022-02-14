resource "kubernetes_namespace" "develop_namespace" {
  metadata {
    annotations = {
      name = "develop"
    }

    labels = {
      mylabel = "develop"
    }

    name = "develop"
  }
}

resource "kubernetes_namespace" "prod_namespace" {
  metadata {
    annotations = {
      name = "prod"
    }

    labels = {
      mylabel = "prod"
    }

    name = "prod"
  }
}

resource "kubernetes_namespace" "metrics_namespace" {
  metadata {
    annotations = {
      name = "metrics"
    }

    labels = {
      mylabel = "metrics"
    }

    name = "metrics"
  }
}
