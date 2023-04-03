data "aws_eks_cluster" "dev-cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "dev-cluster" {
  name = module.my-cluster.cluster_id
}

data "local_file" "lb_dns" {
  filename = "lb_dns.txt"
  depends_on = [
    null_resource.get_lb_dns
  ]
}

output "lb_dns_name" {
  value = data.local_file.lb_dns.content
}
