# ------------------------------------------------------------
# EKS Cluster Settings
# ------------------------------------------------------------
variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
  default     = "dev-cluster"
}

variable "cluster_version" {
  type        = string
  description = "The version of the EKS cluster."
  default     = "1.22"
}

variable "worker_group_name" {
  type        = string
  description = "The name of the EKS worker node group."
  default     = "dev-worker-group-1"
}

variable "worker_group_instance_type" {
  type        = list(string)
  description = "The instance type of the worker group nodes."
  default     = ["t3.medium"]
}

variable "autoscaling_group_min_size" {
  type        = number
  description = "The minimum number of nodes the worker group can scale to."
  default     = 1
}

variable "autoscaling_group_desired_capacity" {
  type        = number
  description = "The desired number of nodes the worker group should attempt to maintain."
  default     = 2
}

variable "autoscaling_group_max_size" {
  type        = number
  description = "The maximum number of nodes the worker group can scale to."
  default     = 3
}

variable "create_cluster_primary_security_group_tags" {
  description = "Indicates whether or not to tag the cluster's primary security group. This security group is created by the EKS service, not the module, and therefore tagging is handled after cluster creation"
  type        = bool
  default     = true
}
# ------------------------------------------------------------
# Networking Settings
# ------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "The AWS region for the provider to deploy resources into."
  default     = "us-east-2"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of the VPC to create."
  default     = "10.0.0.0/16"
}

variable "dev1_subnet_az" {
  type        = string
  description = "Availability Zone of the subnet 1."
  default     = "us-east-2a"
}

variable "dev2_subnet_az" {
  type        = string
  description = "Availability zone of subnet 2."
  default     = "us-east-2b"
}

variable "dev1_subnet_cidr_block" {
  type        = string
  description = "CIDR block of subnet 1 to create."
  default     = "10.0.1.0/24"
}

variable "dev2_subnet_cidr_block" {
  type        = string
  description = "CIDR block of subnet 1 to create."
  default     = "10.0.2.0/24"
}

variable "dev1_subnet_nic_private_ip" {
  type        = list(string)
  description = "CIDR block of subnet 1 to create."
  default     = ["10.0.1.50"]
}

variable "atlantis_github_user" {
  type        = string
  description = "GitHub user for Atlantis bot"
}

variable "atlantis_github_token" {
  type        = string
  description = "GitHub token for the Atlantis bot user"
}

variable "atlantis_github_secret" {
  type        = string
  description = "Webhook secret for the GitHub repository monitored by Atlantis"
}

variable "atlantis_github_repository" {
  type        = string
  description = "GitHub repository that will be monitored by Atlantis"
}

variable "atlantis_github_orgWhitelist" {
  type        = string
  description = "Atlantis github orgWhitelist"
}