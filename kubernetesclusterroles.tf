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

resource "kubernetes_role_binding" "admin_binding" {
  metadata {
    name = "admin-binding"
  }

  role_ref {
    kind = "ClusterRole"
    name = kubernetes_cluster_role.admin.metadata[0].name
    api_group = "rbac.authorization.k8s.io"

  }

  subject {
    kind = "User"
    name = "admin@example.com"
  }
    depends_on = [
    kubernetes_cluster_role.admin,
  ]
}

resource "kubernetes_role_binding" "readonly_binding" {
  metadata {
    name = "readonly-binding"
  }

  role_ref {
    kind = "ClusterRole"
    name = kubernetes_cluster_role.readonly.metadata[0].name
    api_group = "rbac.authorization.k8s.io"

  }

  subject {
    kind = "User"
    name = "readonly@example.com"
  }
    depends_on = [
    kubernetes_cluster_role.readonly,
  ]
}
