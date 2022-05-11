Using Terraform Configuration Language, or one of the Terraform CDK languages, create a workspace for AWS with the following resources:

A VPC with a 10.0.0.0/16 CIDR, DNS support, an Internet Gateway, and NAT Gateways for 3 availability zones
3 /24 private subnets associated with the above NAT Gateways
A single EKS cluster in all subnets, with public endpoint access enabled
AWS Load Balancer controller with Public-facing ALB

Additionally, we'll want to deploy an application to the EKS Cluster. Using Terraform, Helm, or another templating tool, please write a script that produces Kubernetes manifests to deploy the following:

A Deployment named search-api running a bare nginx container, a corresponding Service targeted to port 80, and a corresponding Ingress for host search.altana.ai
A Deployment named graph-api running a bare nginx container, a corresponding Service targeted to port 80, and a corresponding Ingress for host graph.altana.ai