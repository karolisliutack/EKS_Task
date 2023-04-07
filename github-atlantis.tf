provider "github" {
  token = var.atlantis_github_token
}

resource "github_repository_webhook" "atlantis" {
  repository = var.atlantis_github_repository
  configuration {
    url = "http://${data.local_file.lb_dns.content}/events"

    content_type = "application/json"
    insecure_ssl = "0"
    secret       = var.atlantis_github_secret

  }
  events = [
    "issue_comment",
    "pull_request",
    "pull_request_review",
    "pull_request_review_comment"
  ]

  depends_on = [
    null_resource.get_lb_dns
  ]
}