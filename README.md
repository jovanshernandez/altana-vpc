# altana-vpc
Altana Coding Exercise

For this project, I was tasked to build out AWS infrastructure including:
- VPC
- Internet and NAT Gateways
- Subnets
- EKS Cluster
- AWS Load Balancer
- Containers with Web Servers running NGINX

Due to time constraints, my approach for this project was to complete the minimum requirements and use as many defaults in order to get as much of this completed as possible. 

I was not able to complete the Load Balancer nor the Application container deployments. With more time I would've configured the load balancer and kubernetes manifests in order to complete the project. For the sake of timliness, I am submitting the project as is and would be happy to go over my next steps in further conversations.

In order to build out the infrastructure included in `main.tf` you will need an AWS IAM User account with an AWS Access Key.

Once you have your AWS Config set up, make sure you are in `altana-vpc` directory and run `terraform init` and `terraform apply` (assuming you have terraform installed).

Some things I would improve on the project with more time:
- As mentioned, build out the reamining portions of the project, including Load Balancer and container applications
- The EKS Cluster does not contain any nodes, so I would include the node group creation along with the IAM roles needed for the nodes
- Break out modules into individual files for more control over configuration
- Include a variables.tf file
- The EKS Cluster hangs and looks like it is not built, but actually is built if you check within the AWS Console. This is due to an issue in security group configuration and nodes not being built. 