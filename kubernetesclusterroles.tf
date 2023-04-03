resource "kubernetes_cluster_role" "admin" {
  metadata {
    name = "eks-admin"
  }

  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_cluster_role" "readonly" {
  metadata {
    name = "eks-readonly"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "configmaps", "secrets"]
    verbs      = ["get", "list", "watch"]
  }
}