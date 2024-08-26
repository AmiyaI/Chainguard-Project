# Define local variables for use throughout the configuration
locals {
  region          = "us-east-1"                     # AWS region where the resources will be created
  name            = "chainguard-cluster"            # Base name for naming resources
  vpc_cidr        = "10.123.0.0/16"                 # CIDR block for the VPC
  azs             = ["us-east-1a", "us-east-1b"]    # Availability Zones for high availability
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"] # Public subnets in each AZ
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"] # Private subnets in each AZ
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"] # Intra (internal) subnets in each AZ

  # Tags to be applied to resources for identification and organization
  tags = {
    Example = local.name
  }
}

# Configure the AWS provider
provider "aws" {
  region = local.region  # Set the AWS region for the provider
}