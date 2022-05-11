terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.13.0"
    }
  }
}

# AWS Terraform Provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# # Create VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_support = true
#   tags = {
      
#       "Name" = "Altana"
#   }

# }

# # Internet Gateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "main"
#   }
# }

# # /24 Private Subnets for NAT Gateways
# resource "aws_nat_gateway" "nat_gateway" {
#   connectivity_type = "private"
#   subnet_id         = aws_subnet.instance.id
#     tags = {
#       "Name" = "Gateway"
#   }
# }

# # Create Subnet 1
# resource "aws_subnet" "instance" {
#   availability_zone = "us-east-1a"
#   cidr_block = "10.0.1.0/24"
#   vpc_id = aws_vpc.main.id
#   tags = {
#     "Name" = "AltanaSubnetInstance"
#   }
# }

# # Create Gateway 2
# resource "aws_nat_gateway" "nat_gateway_2" {
#   connectivity_type = "private"
#   subnet_id         = aws_subnet.instance_2.id
#   tags = {
#     "Name" = "Gateway_2"
#   }
# }

# # Create Subnet 2
# resource "aws_subnet" "instance_2" {
#   availability_zone = "us-east-1b"
#   cidr_block = "10.0.2.0/24"
#   vpc_id = aws_vpc.main.id
#   tags = {
#     "Name" = "AltanaSubnetInstance_2"
#   }
# }

# # Create NAT Gateway 3
# resource "aws_nat_gateway" "nat_gateway_3" {
#   connectivity_type = "private"
#   subnet_id         = aws_subnet.instance_3.id
#   tags = {
#     "Name" = "Gateway_3"
#   }
# }

# # Create Subnet 3
# resource "aws_subnet" "instance_3" {
#   availability_zone = "us-east-1c"
#   cidr_block = "10.0.3.0/24"
#   vpc_id = aws_vpc.main.id
#   tags = {
#     "Name" = "AltanaSubnetInstance_3"
#   }
# }

# #Create EKS Cluster
# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "17.10.0"

#   cluster_version = "1.21"

#   cluster_name = "altana-k8s-cluster"
#   vpc_id = aws_vpc.main.id

#   subnets = [aws_subnet.instance.id, aws_subnet.instance_2.id, aws_subnet.instance_3.id]

# cluster_endpoint_public_access  = "true"
# cluster_endpoint_private_access  = "true"

#   node_groups = {
#     eks_nodes = {
#       desired_capacity = 3
#       max_capacity     = 3
#       min_capaicty     = 3

#       instance_type = "t2.small"
#     }
#   }

#   tags = {
#     Cluster = "k8s"
#     "Name" = "Altana-K8s-Cluster"
#   }
# }