# DEPLOY HELM CHART - ATLANTIS AND EKS USING TERRAFORM on US-EAST-2 Region
• 1 VPC
• 2 subnets
• 1 EKS cluster
• autoscaling workers with min 1, max 3 workers,
• K8s RBAC enabled with 2 roles - eks-admin and eks-readonly

Code: https://github.com/karolisliutack/EKS_Task
Atlantis Service Testing: https://github.com/karolisliutack/Luminor_Task_Testing, Pull request open: https://github.com/karolisliutack/Luminor_Task_Testing/pull/2


To expose Atlantis Service Classic LoadBalancer was issued from EKS and dns name was fetched by using terraform null resource   provisioner "local-exec". Load balancer dns name was saved to lb_dns.txt file which was also used to create webhook for github repository so Atlantis service can monitor all of the below events:
 events = [
    "issue_comment",
    "pull_request",
    "pull_request_review",
    "pull_request_review_comment"
  ]

 In this example, I'm deploying Atlantis on EKS. It takes about 15 minutes from start to finish. 
### Pre-requisites

* Terraform CLI installed
* AWS credentials configured.
* kubectl installed.

### Deployment Instructions
* Clone this repository
* Edit ```terraform.tfvars``` to match your values.
* Run a ```terraform init``` to grab providers and modules.
* Run a ```terraform plan``` to view the plan. You will be asked to enter atlantis_github_secret, atlantis_github_user and  atlantis_github_token
* Run  ```terraform_apply``` and wait 10 - 15 minutes. 
* Terraform null_resource provisioner will automatically run  ```aws eks --region us-east-2 update-kubeconfig --name dev-cluster``` to add the cluster context to your kubeconfig so you can connect from your local environment
* Run ```kubectl get pods``` to ensure Atlantis deployed as expected.
* Run ```kubectl get svc``` to grab the AWS created DNS address for the Atlantis service. You can get DNS Address from outputs after terraform apply completion or get it from lb_dns.txt which will created after terraform apply completion. 
* Go to your browser and navigate to ```http://<dns-address>``` *** use dns address from lb.dns.txt ***


## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.2.6 |

## Providers

| Name | Version |
|------|---------|
| aws | 3.72.0 |
| helm | 2.6.0 |
| kubernetes | 2.12.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| my-cluster | terraform-aws-modules/eks/aws | 18.28.0 |