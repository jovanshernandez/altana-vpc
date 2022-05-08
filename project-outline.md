Using Terraform Configuration Language, or one of the Terraform CDK languages, create a workspace for AWS with the following resources:

A VPC with a 10.0.0.0/16 CIDR, DNS support, an Internet Gateway, and NAT Gateways for 3 availability zones
3 /24 private subnets associated with the above NAT Gateways
A single EKS cluster in all subnets, with public endpoint access enabled
AWS Load Balancer controller with Public-facing ALB