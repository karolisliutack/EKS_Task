#create null resource to update with 2 local exec provision commands: 
# 1 to add the context to your local kubeconfig file.
# 2 to add loadbalancer dns name to lb_dns.txt file
# grab loadbancer dns name from lb_dns.txt file

resource "null_resource" "get_lb_dns" {
  provisioner "local-exec" {
    command = "aws eks --region us-east-2 update-kubeconfig --name dev-cluster"
  }
  provisioner "local-exec" {
    command = "kubectl get service atlantis -n default -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' > lb_dns.txt"
  }
  depends_on = [
    helm_release.atlantis
  ]
}
