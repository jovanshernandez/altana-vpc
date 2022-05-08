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
  profile = "altana"
  region  = "us-east-1"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  tags = {
      
      "Name" = "Altana"
  }

}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# /24 Private Subnets for NAT Gateways
resource "aws_nat_gateway" "nat-gw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.example.id
}

resource "aws_subnet" "instance" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "AltanaSubnetInstance"
  }
}

resource "aws_subnet" "instance-2" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "AltanaSubnetInstance-2"
  }
}

resource "aws_subnet" "instance-3" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "AltanaSubnetInstance-3"
  }
}

# EKS Cluster in each subnet

# Public endpoint access enabled

# Load Balancer w/ controller (Public Facing ALB)

resource "aws_instance" "example" {
  ami           = var.ami_type
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}