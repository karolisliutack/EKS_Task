resource "helm_release" "atlantis" {
  name       = "atlantis"
  repository = "https://runatlantis.github.io/helm-charts"
  chart      = "atlantis"
  namespace  = "default"

  set_sensitive {
    name  = "github.user"
    value = var.atlantis_github_user
  }

  set_sensitive {
    name  = "github.token"
    value = var.atlantis_github_token
  }

  set_sensitive {
    name  = "github.secret"
    value = var.atlantis_github_secret
  }

  set {
    name  = "orgWhitelist"
    value = "github.com/karolisliutack/*"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}