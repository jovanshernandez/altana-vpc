# Altana VPC

Terraform exercise for provisioning AWS networking and EKS-oriented infrastructure.

## Scope

The project includes:

- VPC networking
- Internet and NAT gateways
- Public and private subnets
- EKS cluster resources
- Initial load balancer and application deployment planning

## Usage

Configure AWS credentials locally, then run:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Apply only after reviewing the plan and confirming the target AWS account and region.

## Notes

This is an exercise project, not a reusable production module. Terraform state files and local lock metadata should remain outside version control.

## Future Improvements

- Add managed node groups and required IAM roles for worker nodes.
- Split infrastructure into focused modules.
- Add `variables.tf` and environment-specific example inputs.
- Complete Kubernetes manifests and load balancer wiring.
