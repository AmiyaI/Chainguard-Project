# Define the VPC using the official Terraform AWS VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"   # Source of the VPC module
  version = "~> 4.0"                          # Version of the VPC module

  name = local.name                            # Name of the VPC, using the local variable

  cidr = local.vpc_cidr                        # CIDR block for the VPC, defined in provider.tf

  # Define the availability zones for the VPC
  azs = local.azs                              # List of availability zones

  # Define the subnet configurations for the VPC
  private_subnets = local.private_subnets      # Private subnets in each AZ
  public_subnets  = local.public_subnets       # Public subnets in each AZ
  intra_subnets   = local.intra_subnets        # Intra (internal) subnets in each AZ

  # Enable NAT Gateway to allow instances in private subnets to access the internet
  enable_nat_gateway = true

  # Tag the public subnets for use with Kubernetes external load balancers
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  # Tag the private subnets for use with Kubernetes internal load balancers
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}